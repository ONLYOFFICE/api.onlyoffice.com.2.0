import { mkdir, rm, rmdir } from "node:fs/promises"
import { createReadStream, createWriteStream } from "node:fs"
import { join } from "node:path"
import { Cache, ProcessComponent, ProcessRequest, ProcessPath } from "@onlyoffice/openapi-service"
import StreamArray from "stream-json/streamers/StreamArray.js"
import StreamObject from "stream-json/streamers/StreamObject.js"
import Disassembler from "stream-json/Disassembler.js"
import Parser from "stream-json/Parser.js"
import Stringer from "stream-json/Stringer.js"
import { downloadFile  } from "../utils/net.ts"
import { PickComponent, PickPath } from "../utils/openapi.ts"
import { UnStreamObject, chain, createStringStream, makeObject, mergeArrays, mergeObjects } from "../utils/stream.ts"
import { appendPathPostfix, createREST, prettifyJSON } from "./utils.ts"

const resource = "hosted-solutions"
const ref = "https://raw.githubusercontent.com/onlyoffice/docspace-hosted-solutions-declarations/dist/"
const file = "hosted-solutions.json"

/**
 * @param {string} tempDir
 * @param {string} distDir
 * @returns {Promise<void>}
 */
export async function build(tempDir, distDir) {
  tempDir = join(tempDir, resource)
  await mkdir(tempDir)

  const u = `${ref}${file}`
  const f = join(tempDir, file)
  await downloadFile(u, f)

  const cache = new Cache()

  await writeComponents(tempDir, distDir, f, cache),
  await writeRequests(tempDir, distDir, f, cache),
  await createREST(resource),

  await rm(f)
  await rmdir(tempDir)
}

/**
 * @param {string} tempDir
 * @param {string} distDir
 * @param {string} from
 * @param {Cache} cache
 * @returns {Promise<void>}
 */
async function writeComponents(tempDir, distDir, from, cache) {
  const n = `${resource}.components.json`

  /** @type {string[]} */
  const components = []

  /** @type {OpenAPIComponentsKey[]} */
  const l = ["schemas", "responses"]
  await Promise.all(l.map(async (k) => {
    const nk = appendPathPostfix(n, k)
    const to = join(tempDir, nk)
    await chain(
      createReadStream(from),
      new Parser(),
      new PickComponent(k),
      new StreamObject(),
      new ProcessComponent(cache, k),
      new UnStreamObject(),
      makeObject(),
      new Stringer(),
      createWriteStream(to)
    )
    components.push(to)
  }))

  let to = join(tempDir, n)
  await mergeObjects(components.map((f) => createReadStream(f)), to)
  await Promise.all(components.map(async (f) => {
    await rm(f)
  }))

  from = to
  to = join(distDir, n)
  await prettifyJSON(from, to)
  await rm(from)
}

/**
 * @param {string} tempDir
 * @param {string} distDir
 * @param {string} from
 * @param {Cache} cache
 * @returns {Promise<void>}
 */
async function writeRequests(tempDir, distDir, from, cache) {
  const n = `${resource}.declarations.json`

  let to = join(tempDir, n)
  await chain(
    createReadStream(from),
    new Parser(),
    new PickPath(),
    new StreamObject(),
    new ProcessPath(cache),
    new Disassembler(),
    new Stringer({makeArray: true}),
    createWriteStream(to)
  )

  from = to
  to = join(tempDir, `${n}0`)
  await chain(
    createReadStream(from),
    new Parser(),
    new StreamArray(),
    new ProcessRequest(cache),
    new Disassembler(),
    new Stringer({makeArray: true}),
    createWriteStream(to)
  )
  await rm(from)

  from = to
  to = join(tempDir, `${n}1`)
  await mergeArrays([createStringStream(JSON.stringify(Object.values(cache.groups))), createReadStream(from)], to)
  await rm(from)

  from = to
  to = join(distDir, n)
  await prettifyJSON(from, to)
  await rm(from)
}
