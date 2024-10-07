import {existsSync} from "node:fs"
import {mkdir, readFile, rm} from "node:fs/promises"
import path from "node:path"
import {URL, fileURLToPath} from "node:url"
import {Console} from "@onlyoffice/console"
import {type Config, build} from "@onlyoffice/openapi-resource"
import {StringWritable} from "@onlyoffice/stream-string"
import {parse} from "yaml"
import pack from "../package.json" with {type: "json"}

const config: Config = {
  name: "resource",
  variant: "",
  source: {
    owner: "",
    repo: "",
    reference: "",
    path: "",
  },
}

const console = new Console(pack.name, process.stdout, process.stderr)

async function main(): Promise<void> {
  console.log("Start building")

  const rd = rootDir()
  const dd = distDir(rd)
  if (existsSync(dd)) {
    await rm(dd, {recursive: true})
  }

  await mkdir(dd)

  const fd = fixturesDir(rd)
  const rf = resourceFile(fd)
  const rw = new StringWritable()
  const rc = await readFile(rf, "utf8")
  const ro = parse(rc)
  rw.buf = JSON.stringify(ro)

  await build(config, dd, rw)

  console.log("Finish building")
}

function rootDir(): string {
  const u = new URL("..", import.meta.url)
  return fileURLToPath(u)
}

function distDir(d: string): string {
  return path.join(d, "dist")
}

function fixturesDir(d: string): string {
  return path.join(d, "fixtures")
}

function resourceFile(d: string): string {
  return path.join(d, "resource.yml")
}

await main()
