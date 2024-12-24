import {readFile} from "node:fs/promises"
import {get} from "node:https"
import path from "node:path"
import {cwd} from "node:process"
import {type Writable} from "node:stream"
import {StringWritable} from "@onlyoffice/stream-string"
import yaml from "yaml"
import {Console} from "./console.ts"

const console = Console.shared

export type InputConfig = InputConfigEntity[]

export class Config extends Array<ConfigEntity> {
  static async read(): Promise<Config> {
    const c = new Config()

    const p = path.join(cwd(), "config.yml")
    const d = await readFile(p, "utf8")
    const m = yaml.parse(d)

    for (const r of m) {
      const e = ConfigEntity.fromObject(r)
      c.push(e)
    }

    return c
  }
}

export interface InputConfigEntity {
  name: string
  source: InputConfigEntitySource
}

export class ConfigEntity {
  name = ""
  source = new ConfigEntitySource()

  static fromObject(o: InputConfigEntity): ConfigEntity {
    const c = new ConfigEntity()
    c.name = o.name
    c.source = ConfigEntitySource.fromObject(o.source)
    return c
  }

  async download(): Promise<StringWritable> {
    console.log(`Start downloading the config entity '${this.name}'`)

    const s = new StringWritable()
    await this.source.download(s)

    console.log(`Finish downloading the config entity '${this.name}'`)
    return s
  }
}

export interface InputConfigEntitySource {
  owner?: string
  repo?: string
  reference?: string
  path?: string
}

export class ConfigEntitySource {
  owner = ""
  repo = ""
  reference = ""
  path = ""

  static fromObject(o: InputConfigEntitySource): ConfigEntitySource {
    const c = new ConfigEntitySource()

    if (o.owner) {
      c.owner = o.owner
    }

    if (o.repo) {
      c.repo = o.repo
    }

    if (o.reference) {
      c.reference = o.reference
    }

    if (o.path) {
      c.path = o.path
    }

    return c
  }

  get url(): URL {
    const p = `${this.owner}/${this.repo}/${this.reference}/${this.path}`
    return new URL(p, "https://raw.githubusercontent.com/")
  }

  async download(w: Writable): Promise<void> {
    if (this.#isLocal) {
      console.log(`Start reading the content of the config entity source from '${this.path}'`)
      const f = path.join(cwd(), this.path)
      const d = await readFile(f, "utf8")
      w.write(d)
      console.log(`Finish reading the content of the config entity source from '${this.path}'`)
      return
    }

    const u = this.url
    console.log(`Start downloading the config entity source from '${u.pathname}'`)

    await new Promise((res, rej) => {
      get(u, (r) => {
        if (r.statusCode !== 200) {
          r.destroy()
          rej(new Error(`Bad status code: ${r.statusCode} ${r.statusMessage}`))
          return
        }
        r.pipe(w)
        w.on("error", rej)
        w.on("finish", res)
      })
    })

    console.log(`Finish downloading the config entity source from '${u.pathname}'`)
  }

  get #isLocal(): boolean {
    return this.owner === "" &&
      this.repo === "" &&
      this.reference === "" &&
      this.path !== ""
  }
}
