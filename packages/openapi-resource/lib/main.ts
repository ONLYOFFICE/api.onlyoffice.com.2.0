import {mkdtemp, rm, rmdir, writeFile} from "node:fs/promises"
import type {WriteStream} from "node:fs"
import {tmpdir} from "node:os"
import {dirname, join} from "node:path"
import type {Transform, Writable} from "node:stream"
import {hasJQ, jq} from "@onlyoffice/jq"
import type {Cache} from "@onlyoffice/openapi-declaration"
import {ProcessComponent, ProcessPath, ProcessRequest} from "@onlyoffice/openapi-declaration"
import {relative} from "@onlyoffice/node-path"
import {resource} from "@onlyoffice/service-resource"
import {UnstreamObject, makeObject} from "@onlyoffice/stream-json"
import {StringReadable, StringWritable} from "@onlyoffice/stream-string"
import MultiStream from "multistream"
import type {OpenAPIV3_1 as OpenAPI} from "openapi-types"
import Chain from "stream-chain"
import Pick from "stream-json/filters/Pick.js"
import StreamArray from "stream-json/streamers/StreamArray.js"
import StreamObject from "stream-json/streamers/StreamObject.js"
import Disassembler from "stream-json/Disassembler.js"
import Parser from "stream-json/Parser.js"
import Stringer from "stream-json/Stringer.js"
import pack from "../package.json" with {type: "json"}

export async function writeDeclaration(
  ch: Cache,
  rw: StringWritable,
  dw: Writable,
  ts: Transform[] = []
): Promise<void> {
  let from: StringWritable
  let to = new StringWritable()
  await new Promise((res, rej) => {
    const c = new Chain([
      rw.toReadable(),
      new Parser(),
      new Pick({filter: "paths"}),
      new StreamObject(),
      ts[0] ?? [],
      new ProcessPath(ch),
      new Disassembler(),
      new Stringer({makeArray: true}),
      to
    ])
    c.on("close", res)
    c.on("error", rej)
  })

  from = to
  to = new StringWritable()
  await new Promise((res, rej) => {
    const c = new Chain([
      from.toReadable(),
      new Parser(),
      new StreamArray(),
      new ProcessRequest(ch),
      new Disassembler(),
      new Stringer({makeArray: true}),
      to
    ])
    c.on("close", res)
    c.on("error", rej)
  })

  from = to
  to = new StringWritable()
  await new Promise((res, rej) => {
    const c = new Chain([
      new MultiStream([
        // todo: see how it handles in the jsdoc
        new StringReadable(JSON.stringify(Object.values(ch.groups))),
        from.toReadable()
      ]),
      new Parser({jsonStreaming: true}),
      new StreamArray(),
      (ch: {value: unknown}): unknown => {
        return ch.value
      },
      new Disassembler(),
      new Stringer({makeArray: true}),
      to
    ])
    c.on("close", res)
    c.on("error", rej)
  })

  if (!await hasJQ()) {
    dw.write(to.buf)
  } else {
    const td = await mkdtemp(`${tempDir()}-`)
    const tf = join(td, "d")
    await writeFile(tf, to.buf)
    await jq(dw, [".", tf])
    await rm(tf)
    await rmdir(td)
  }
}

export async function writeComponent(ch: Cache, rw: StringWritable, cw: Writable): Promise<void> {
  let from: StringWritable
  let to = new StringWritable()

  const ks: (keyof OpenAPI.ComponentsObject)[] = ["schemas", "responses"]
  for (const k of ks) {
    // eslint-disable-next-line no-loop-func
    await new Promise((res, rej) => {
      const c = new Chain([
        rw.toReadable(),
        new Parser(),
        new Pick({filter: `components.${k}`}),
        new StreamObject(),
        new ProcessComponent(ch, k),
        new UnstreamObject(),
        makeObject(),
        new Stringer(),
        to
      ])
      c.on("close", res)
      c.on("error", rej)
    })
    to = new StringWritable(to.buf)
  }

  // eslint-disable-next-line prefer-const
  from = to
  to = new StringWritable()
  await new Promise((res, rej) => {
    const c = new Chain([
      from.toReadable(),
      new Parser({jsonStreaming: true}),
      new StreamObject(),
      new UnstreamObject(),
      makeObject(),
      new Stringer(),
      to
    ])
    c.on("close", res)
    c.on("error", rej)
  })

  if (to.buf === "") {
    to.buf = "{}"
  }

  if (!await hasJQ()) {
    cw.write(to.buf)
  } else {
    const td = await mkdtemp(`${tempDir()}-`)
    const tf = join(td, "c")
    await writeFile(tf, to.buf)
    await jq(cw, [".", tf])
    await rm(tf)
    await rmdir(td)
  }
}

export async function writeEntrypoint(ew: WriteStream, df: string, cf: string): Promise<void> {
  const ef = String(ew.path)
  const ed = dirname(ef)
  df = relative(ed, df)
  cf = relative(ed, cf)
  const c = await resource(df, cf)
  ew.write(c)
}

function tempDir(): string {
  const n = pack.name.replace("/", "+")
  return join(tmpdir(), n)
}
