import {mkdir, rm} from "node:fs/promises"
import {createWriteStream, existsSync} from "node:fs"
import {join} from "node:path"
import {URL, fileURLToPath} from "node:url"
import {Console} from "@onlyoffice/console"
import {Cache} from "@onlyoffice/openapi-declaration"
import {writeComponent, writeDeclaration, writeEntrypoint} from "@onlyoffice/openapi-resource"
import {componentBasename, declarationBasename, rawURL, readURL, resourceBasename} from "@onlyoffice/resource"
import {StringWritable} from "@onlyoffice/stream-string"
import pack from "../package.json" with {type: "json"}

const config = [
  {
    name: "docspace-hosted-solutions",
    variant: "master",
    source: {
      owner: "onlyoffice",
      repo: "docspace-hosted-solutions-declarations",
      reference: "dist",
      path: "hosted-solutions.json"
    }
  }
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

  for (const cfg of config) {
    const m = JSON.stringify({name: cfg.name, variant: cfg.variant})
    console.log(`Start building '${m}'`)

    const rw = new StringWritable()
    const ru = rawURL(cfg.source.owner, cfg.source.repo, cfg.source.reference, cfg.source.path)
    await readURL(rw, ru)

    const ch = new Cache()

    const dn = declarationBasename(cfg.name)
    const df = join(dd, dn)
    const dw = createWriteStream(df)
    await writeDeclaration(ch, rw, dw)
    dw.close()

    const cn = componentBasename(cfg.name)
    const cf = join(dd, cn)
    const cw = createWriteStream(cf)
    await writeComponent(ch, rw, cw)
    cw.close()

    const en = resourceBasename(cfg.name)
    const ef = join(dd, en)
    const ew = createWriteStream(ef)
    await writeEntrypoint(ew, df, cf)
    ew.close()

    console.log(`Finish building '${m}'`)
  }

  console.log("Finish building")
}

function rootDir(): string {
  const u = new URL("..", import.meta.url)
  return fileURLToPath(u)
}

function distDir(d: string): string {
  return join(d, "dist")
}

await main()
