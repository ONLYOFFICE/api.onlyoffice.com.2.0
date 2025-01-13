import {type WriteStream, createWriteStream} from "node:fs"
import path from "node:path"
import {Readable, type Transform} from "node:stream"
import {pipeline as chain} from "node:stream/promises"
import {Console} from "@onlyoffice/console"
import {throughJq} from "@onlyoffice/jq/next.js"
import {relative} from "@onlyoffice/node-path"
import {ProcessComponent, ProcessPath, ProcessTag, Transfer} from "@onlyoffice/openapi-declaration"
import {declarationBasename, indexBasename, rawURL, readURL, resourceBasename} from "@onlyoffice/resource"
import {resource} from "@onlyoffice/service-resource"
import {StringWritable} from "@onlyoffice/stream-string"
import {type OpenAPIV3_1 as OpenApi} from "openapi-types"
import Disassembler from "stream-json/Disassembler.js"
import Parser from "stream-json/Parser.js"
import Stringer from "stream-json/Stringer.js"
import Pick from "stream-json/filters/Pick.js"
import StreamArray from "stream-json/streamers/StreamArray.js"
import StreamObject from "stream-json/streamers/StreamObject.js"
import pack from "../package.json" with {type: "json"}

const console = new Console(pack.name, process.stdout, process.stderr)

export interface Config {
  name: string
  variant: string
  source: ConfigSource
}

export interface ConfigSource {
  owner: string
  repo: string
  reference: string
  path: string
}

export async function download(cf: Config): Promise<StringWritable> {
  const cm = JSON.stringify({name: cf.name, variant: cf.variant})
  console.log(`Start downloading '${cm}'`)

  const rw = new StringWritable()
  const ru = rawURL(cf.source.owner, cf.source.repo, cf.source.reference, cf.source.path)
  await readURL(rw, ru)

  console.log(`Finish downloading '${cm}'`)
  return rw
}

export interface BuildPatches {
  tag?: Transform[]
  component?: Transform[]
  path?: Transform[]
}

export async function build(
  cf: Config,
  dd: string,
  rw: StringWritable,
  pa?: BuildPatches,
): Promise<void> {
  const cm = JSON.stringify({name: cf.name, variant: cf.variant})
  console.log(`Start building '${cm}'`)

  if (!pa) {
    pa = {}
  }
  if (!pa.tag) {
    pa.tag = []
  }
  if (!pa.component) {
    pa.component = []
  }
  if (!pa.path) {
    pa.path = []
  }

  const tr = new Transfer()

  await chain(
    rw.toReadable(),
    new Parser(),
    new Pick({filter: "tags"}),
    new StreamArray(),
    ...pa.tag,
    new ProcessTag(),
    tr.tags.toWritable(),
  )

  const ks: (keyof OpenApi.ComponentsObject)[] = [
    "responses",
    "schemas",
    "securitySchemes",
  ]

  for (const k of ks) {
    await chain(
      rw.toReadable(),
      new Parser(),
      new Pick({filter: `components.${k}`}),
      new StreamObject(),
      ...pa.component,
      new ProcessComponent(k),
      tr.components.toWritable(),
    )
  }

  await chain(
    rw.toReadable(),
    new Parser(),
    new Pick({filter: "paths"}),
    new StreamObject(),
    ...pa.path,
    new ProcessPath(tr),
    tr.declarations.toWritable(),
  )

  const mn = indexBasename(cf.name)
  const mf = path.join(dd, mn)
  const mw = createWriteStream(mf)
  const mj = await throughJq(mw)
  await chain(
    Readable.from([tr.declarations.cache.indexes]),
    new Disassembler(),
    new Stringer(),
    mj.w,
  )
  await mj.beautify()
  mw.close()

  const dn = declarationBasename(cf.name)
  const df = path.join(dd, dn)
  const dw = createWriteStream(df)
  const dj = await throughJq(dw)
  await chain(
    Readable.from(tr.declarations.cache.list),
    new Disassembler(),
    new Stringer({makeArray: true}),
    dj.w,
  )
  await dj.beautify()
  dw.close()

  const en = resourceBasename(cf.name)
  const ef = path.join(dd, en)
  const ew = createWriteStream(ef)
  await writeEntrypoint(ew, df, mf)
  ew.close()

  console.log(`Finish building '${cm}'`)
}

async function writeEntrypoint(ew: WriteStream, df: string, mf: string): Promise<void> {
  const ef = String(ew.path)
  const ed = path.dirname(ef)
  df = relative(ed, df)
  mf = relative(ed, mf)
  const c = await resource(df, mf)
  ew.write(c)
}
