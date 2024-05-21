import {mkdir, readFile, rm} from "node:fs/promises"
import {createWriteStream, existsSync} from "node:fs"
import {join} from "node:path"
import {URL, fileURLToPath} from "node:url"
import {Console} from "@onlyoffice/console"
import {Cache} from "@onlyoffice/openapi-declaration"
import {writeComponent, writeDeclaration, writeEntrypoint} from "@onlyoffice/openapi-resource"
import {componentBasename, declarationBasename, resourceBasename} from "@onlyoffice/resource"
import {StringWritable} from "@onlyoffice/stream-string"
import {parse} from "yaml"
import pack from "../package.json" with {type: "json"}

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

  const ch = new Cache()

  const dn = declarationBasename("resource")
  const df = join(dd, dn)
  const dw = createWriteStream(df)
  await writeDeclaration(ch, rw, dw)
  dw.close()

  const cn = componentBasename("resource")
  const cf = join(dd, cn)
  const cw = createWriteStream(cf)
  await writeComponent(ch, rw, cw)
  cw.close()

  const en = resourceBasename("resource")
  const ef = join(dd, en)
  const ew = createWriteStream(ef)
  await writeEntrypoint(ew, df, cf)
  ew.close()

  console.log("Finish building")
}

function rootDir(): string {
  const u = new URL("..", import.meta.url)
  return fileURLToPath(u)
}

function distDir(d: string): string {
  return join(d, "dist")
}

function fixturesDir(d: string): string {
  return join(d, "fixtures")
}

function resourceFile(d: string): string {
  return join(d, "resource.yml")
}

await main()
