import {existsSync} from "node:fs"
import {mkdir, rm} from "node:fs/promises"
import path from "node:path"
import {URL, fileURLToPath} from "node:url"
import {Console} from "@onlyoffice/console"
import {type Config, build, download} from "@onlyoffice/openapi-resource"
import pack from "../package.json" with {type: "json"}

const config: Config = {
  name: "community-server",
  variant: "master",
  source: {
    owner: "onlyoffice",
    repo: "community-server-declarations",
    reference: "dist",
    path: "community-server.json",
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

  const rw = await download(config)
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

await main()
