import {get} from "node:https"
import path from "node:path"
import {cwd} from "node:process"
import {type Writable} from "node:stream"
import {StringWritable} from "@onlyoffice/stream-string"
import {Console} from "./console.ts"

const console = Console.shared

export type InputConfig = InputConfigEntity[]

export class Config extends Array<ConfigEntity> {
  static async read(): Promise<Config> {
    const c = new Config()

    const p = winCompatibility(path.join(cwd(), "config.ts"))
    const m = await import(p)

    for (const r of m.config) {
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
  content?: string
}

export class ConfigEntitySource {
  owner = ""
  repo = ""
  reference = ""
  path = ""
  content = ""

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

    if (o.content) {
      c.content = o.content
    }

    return c
  }

  get url(): URL {
    const p = `${this.owner}/${this.repo}/${this.reference}/${this.path}`
    return new URL(p, "https://raw.githubusercontent.com/")
  }

  async download(w: Writable): Promise<void> {
    if (this.content) {
      console.log("Start writing the content of the config entity source")
      w.write(this.content)
      console.log("Finish writing the content of the config entity source")
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
}

// todo: move to a separate package
function winCompatibility(p: string): string {
  p = p.replaceAll("\\", "/")
  return `file:///${p}`
}
