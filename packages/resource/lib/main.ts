import {get} from "node:https"
import type {Writable} from "node:stream"

export function rawURL(o: string, rp: string, rf: string, p: string): string {
  const u = new URL(`/${o}/${rp}/${rf}/${p}`, "https://raw.githubusercontent.com/")
  return u.toString()
}

export function readURL(w: Writable, u: string): Promise<void> {
  return new Promise((res, rej) => {
    get(u, (r) => {
      if (r.statusCode !== 200) {
        r.destroy()
        const e = new Error(`Bad status code: ${r.statusCode} ${r.statusMessage}`)
        rej(e)
        return
      }
      r.pipe(w)
      w.on("error", rej)
      w.on("finish", res)
    })
  })
}

export function declarationBasename(n: string): string {
  return `${n}.declaration.json`
}

export function indexBasename(n: string): string {
  return `${n}.index.json`
}

export function componentBasename(n: string): string {
  return `${n}.component.json`
}

// todo: rename to entrypointBasename
export function resourceBasename(n: string): string {
  return `${n}.ts`
}
