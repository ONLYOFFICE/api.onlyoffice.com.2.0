import {HTTPSnippet, type HarRequest} from "httpsnippet"
import * as Service from "./main.ts"

export interface Parameter {
  name: string
  value: string
}

export class ExampleGenerator {
  s: HTTPSnippet

  constructor(r: Service.Request) {
    const w = Request.fromService(r)
    this.s = new HTTPSnippet(w)
  }

  all(): Service.Example[] {
    return [
      this.http(),
      this.curl(),
    ]
  }

  http(): Service.Example {
    const e = new Service.Example()
    e.syntax = "http"
    e.code = this.s.convert("http", "http1.1").toString()

    // HTTPSnippet does not remove a newline before an empty body.
    e.code = e.code.trimEnd()

    // HTTPSnippet adds additional headers in a non-alphabetical order.
    const [m, b] = e.code.split("\r\n\r\n")
    const [p, ...h] = m.split("\r\n")
    const r = h.sort((a, b) => {
      const [x] = a.split(":")
      const [y] = b.split(":")
      return x.localeCompare(y)
    })
    r.unshift(p)
    if (b) {
      r.push("", b)
    }
    e.code = r.join("\r\n")

    return e
  }

  curl(): Service.Example {
    const e = new Service.Example()
    e.syntax = "shell"
    e.code = this.s.convert("shell").toString()
    return e
  }
}

export class Request implements HarRequest {
  method = ""
  url = ""
  httpVersion = "HTTP/1.1"
  cookies: Parameter[] = []
  headers: Parameter[] = []
  queryString: Parameter[] = []
  postData: HarRequest["postData"] = {mimeType: ""}
  headersSize = -1
  bodySize = -1

  static fromService(r: Service.Request): Request {
    const h = this.parameters(r.headerParameters)
    const c = this.parameters(r.cookieParameters)
    const p = this.parameters(r.pathParameters)
    const q = this.parameters(r.queryParameters)
    const u = this.url(r.path, p)
    const t = this.contentType(h)
    const d = this.postData(r.bodyParameters, t)
    const w = new Request()
    w.method = r.method
    w.url = u
    w.cookies = c
    w.headers = h
    w.queryString = q
    w.postData = d
    return w
  }

  static url(p: string, a: Parameter[]): string {
    for (const o of a) {
      p = p.replace(`{${o.name}}`, o.value)
    }
    const u = new URL(p, "https://example.com/")
    return u.toString()
  }

  static contentType(a: Parameter[]): string {
    for (const h of a) {
      if (h.name === "Content-Type") {
        return h.value
      }
    }
    return ""
  }

  static postData(e: Service.Entity, c: string): HarRequest["postData"] {
    if (
      e.example instanceof Service.PassthroughConst &&
      c === "application/json"
    ) {
      return {mimeType: c, text: JSON.stringify(e.example.value, null, 2)}
    }

    if (
      e.example instanceof Service.PassthroughConst &&
      c === "multipart/form-data"
    ) {
      const p = this.parameters(e)
      if (p.length !== 0) {
        return {mimeType: c, params: p}
      }
    }

    return {mimeType: ""}
  }

  static parameters(e: Service.Entity): Parameter[] {
    const a: Parameter[] = []

    if (
      e.type instanceof Service.ObjectType &&
      e.example instanceof Service.PassthroughConst &&
      typeof e.example.value === "object" &&
      e.example.value !== null
    ) {
      for (const [n, v] of Object.entries(e.example.value)) {
        const p: Parameter = {name: n, value: ""}

        if (Array.isArray(v) || typeof v === "object" && v !== null) {
          p.value = JSON.stringify(v)
        } else {
          p.value = String(v)
        }

        a.push(p)
      }
    }

    return a
  }
}
