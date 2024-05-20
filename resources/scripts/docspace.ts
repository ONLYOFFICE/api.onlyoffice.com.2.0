import { mkdir, rm, rmdir } from "node:fs/promises"
import { createReadStream, createWriteStream } from "node:fs"
import { join } from "node:path"
import {
  Cache,
  ProcessComponent,
  ProcessPath as OpenAPIProcessPath,
  ProcessRequest
} from "@onlyoffice/openapi-service"
import StreamArray from "stream-json/streamers/StreamArray.js"
import StreamObject from "stream-json/streamers/StreamObject.js"
import Disassembler from "stream-json/Disassembler.js"
import Parser from "stream-json/Parser.js"
import Stringer from "stream-json/Stringer.js"
import { downloadFile } from "../utils/net.ts"
import { PickComponent, PickPath } from "../utils/openapi.ts"
import {
  UnStreamObject,
  chain,
  createIndexes,
  createStringStream,
  makeObject,
  mergeArrays,
  mergeObjects
} from "../utils/stream.ts"
import { appendPathPostfix, capitalizeTitle, prettifyJSON, createREST } from "./utils.ts"

const ref = "https://raw.githubusercontent.com/onlyoffice/docspace-declarations/dist/"
const files = [
  "asc.data.backup.swagger.json",
  "asc.files.swagger.json",
  "asc.people.swagger.json",
  "asc.web.api.swagger.json"
]
const resource = "docspace"

/**
 * @param {string} tempDir
 * @param {string} distDir
 * @returns {Promise<void>}
 */
export async function build(tempDir, distDir) {
  tempDir = join(tempDir, resource)
  await mkdir(tempDir)

  const components: string[] = []
  const requests: string[] = []

  await Promise.all(files.map(async (file) => {
    const f = join(tempDir, file)
    const u = `${ref}${file}`
    await downloadFile(u, f)

    const cache = new Cache()

    let to = await writeTempComponents(tempDir, f, file, cache)
    components.push(to)

    to = await writeTempRequests(tempDir, f, file, cache)
    requests.push(to)

    await rm(f)
  }))

  await Promise.all([
    writeComponents(tempDir, distDir, components),
    writeRequests(tempDir, distDir, requests),
    createREST(resource)
  ])
  await rmdir(tempDir)
}

/**
 * @param {string} tempDir
 * @param {string} from
 * @param {string} file
 * @param {Cache} cache
 * @returns {Promise<string>}
 */
async function writeTempComponents(tempDir, from, file, cache) {
  let n = appendPathPostfix(file, "components")

  const k = "schemas"
  n = appendPathPostfix(n, k)
  const to = join(tempDir, n)
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

  return to
}

/**
 * @param {string} tempDir
 * @param {string} distDir
 * @param {string[]} components
 * @returns {Promise<void>}
 */
async function writeComponents(tempDir, distDir, components) {
  const n = `${resource}.components.json`

  let to = join(tempDir, n)
  await mergeObjects(components.map((f) => createReadStream(f)), to)
  await Promise.all(components.map(async (f) => {
    await rm(f)
  }))

  const from = to
  to = join(distDir, n)
  await prettifyJSON(from, to)
  await rm(from)
}

/**
 * @param {string} tempDir
 * @param {string} from
 * @param {string} file
 * @param {Cache} cache
 * @returns {Promise<string>}
 */
async function writeTempRequests(tempDir, from, file, cache) {
  let to = appendPathPostfix(file, "requests")
  to = join(tempDir, to)
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
  to = appendPathPostfix(file, "requests2")
  to = join(tempDir, to)
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
  to = appendPathPostfix(file, "declarations")
  to = join(tempDir, to)
  await mergeArrays([createStringStream(JSON.stringify(Object.values(cache.groups))), createReadStream(from)], to)
  await rm(from)

  return to
}

/**
 * @param {string} tempDir
 * @param {string} distDir
 * @param {string[]} requests
 * @returns {Promise<void>}
 */
async function writeRequests(tempDir, distDir, requests) {
  const n = `${resource}.declarations.json`

  let to = join(tempDir, n)
  await mergeArrays(requests.map((f) => createReadStream(f)), to)
  await Promise.all(requests.map(async (f) => {
    await rm(f)
  }))

  let from = to
  to = join(distDir, n)
  await prettifyJSON(from, to)
  await rm(from)

  from = to
  to = join(tempDir, `${resource}.indexes.json`)
  await createIndexes(from, to, "slug")

  from = to
  to = join(distDir, `${resource}.indexes.json`)
  await prettifyJSON(from, to)
  await rm(from)
}

class ProcessPath extends OpenAPIProcessPath {
  _transform(ch, _, cb) {
    // todo: it is not good that we do this on our side.

    // https://github.com/ONLYOFFICE/DocSpace-server/blob/v2.0.2-server/web/ASC.Web.Api/Api/CapabilitiesController.cs#L33
    if (ch.key.endsWith("{.format}")) {
      cb(null)
      return
    }

    const ss = []
    const vs = ["delete", "get", "head", "options", "patch", "post", "put", "trace"]

    vs.forEach((v) => {
      const o = ch.value[v]
      if (o === undefined) {
        return
      }
      // if (o.tags === undefined) {
      //   o.tags = [this._pack]
      // }
      o.tags = o.tags.map(capitalizeTitle)
      if (o.description !== undefined) {
        o.description = `**Note**: ${o.description}`
      }
      if (o.summary !== undefined) {
        if (o.description === undefined) {
          o.description = o.summary
        } else {
          o.description = `${o.summary}\n\n${o.description}`
        }
      }
      if (o["x-shortName"] !== undefined) {
        o.summary = o["x-shortName"]
        ss.push(o.summary)
      }
      // https://github.com/ONLYOFFICE/DocSpace-server/blob/v2.0.2-server/products/ASC.People/Server/Api/UserController.cs#L2028
      if (o.summary === undefined) {
        delete ch.value[v]
      }
    })

    // // https://github.com/ONLYOFFICE/DocSpace-server/blob/v2.0.2-server/web/ASC.Web.Api/Api/AuthenticationController.cs#L359-L360
    // vs.forEach((v) => {
    //   const o = ch.value[v]
    //   if (o === undefined) {
    //     return
    //   }
    //   const count = ss.filter((s) => o.summary === s).length
    //   if (count > 1) {
    //     o.summary = `${o.summary} (${v.toUpperCase()})`
    //   }
    // })

    super._transform(ch, _, cb)
  }
}
