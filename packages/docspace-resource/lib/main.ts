import {existsSync} from "node:fs"
import {mkdir, rm} from "node:fs/promises"
import path from "node:path"
import {URL, fileURLToPath} from "node:url"
import {Console} from "@onlyoffice/console"
import {type Config, build, download} from "@onlyoffice/openapi-resource"
import pack from "../package.json" with {type: "json"}

const config: Config[] = [
  {
    name: "apisystem",
    variant: "master",
    source: {
      owner: "onlyoffice",
      repo: "docspace-declarations",
      reference: "release/v3.0.0",
      path: "asc.apisystem.swagger.json",
    },
  },
  {
    name: "data",
    variant: "master",
    source: {
      owner: "onlyoffice",
      repo: "docspace-declarations",
      reference: "release/v3.0.0",
      path: "asc.data.backup.swagger.json",
    },
  },
  {
    name: "files",
    variant: "master",
    source: {
      owner: "onlyoffice",
      repo: "docspace-declarations",
      reference: "release/v3.0.0",
      path: "asc.files.swagger.json",
    },
  },
  {
    name: "people",
    variant: "master",
    source: {
      owner: "onlyoffice",
      repo: "docspace-declarations",
      reference: "release/v3.0.0",
      path: "asc.people.swagger.json",
    },
  },
  {
    name: "web",
    variant: "master",
    source: {
      owner: "onlyoffice",
      repo: "docspace-declarations",
      reference: "release/v3.0.0",
      path: "asc.web.api.swagger.json",
    },
  },
]

const console = new Console(pack.name, process.stdout, process.stderr)

async function main(): Promise<void> {
  console.log("Start building")

  const rd = rootDir()
  const dd = distDir(rd)
  if (existsSync(dd)) {
    await rm(dd, {recursive: true})
  }

  await mkdir(dd)

  for (const c of config) {
    const rw = await download(c)
    await build(c, dd, rw)
  }

  console.log("Finish building")
}

function rootDir(): string {
  const u = new URL("..", import.meta.url)
  return fileURLToPath(u)
}

function distDir(d: string): string {
  return path.join(d, "dist")
}

await main()
