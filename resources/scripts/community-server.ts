import { mkdir, rm, rmdir } from "node:fs/promises"
import { createReadStream, createWriteStream } from "node:fs"
import { join } from "node:path"
import { Cache, ProcessPath, ProcessRequest } from "@onlyoffice/openapi-declaration"
import StreamArray from "stream-json/streamers/StreamArray.js"
import StreamObject from "stream-json/streamers/StreamObject.js"
import Disassembler from "stream-json/Disassembler.js"
import Parser from "stream-json/Parser.js"
import Stringer from "stream-json/Stringer.js"
import { downloadFile } from "../utils/net.ts"
import { PickPath } from "../utils/openapi.ts"
import { chain, createStringStream, mergeArrays } from "../utils/stream.ts"
import { createREST, prettifyJSON, writeComponents } from "./utils.ts"

const ref = "https://raw.githubusercontent.com/onlyoffice/community-server-declarations/dist/"
const file = "community-server.json"
const resource = "community-server"

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

  await Promise.all([
    writeRequests(cache, tempDir, distDir, f),
    writeComponents(resource),
    createREST(resource)
  ])

  await rm(f)
  await rmdir(tempDir)
}

/**
 * @param {Cache} cache
 * @param {string} tempDir
 * @param {string} distDir
 * @param {string} from
 * @returns {Promise<void>}
 */
async function writeRequests(cache, tempDir, distDir, from) {
  const n = `${resource}.declarations.json`

  let to = join(tempDir, n)
  await chain(
    createReadStream(from),
    new Parser(),
    new PickPath(),
    new StreamObject(),
    new ProcessPath(cache),
    new Disassembler(),
    new Stringer({ makeArray: true }),
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
