import {DocumentEditorService} from "./document-editor.ts"

export class Client {
  baseURL = ""
  documentEditor: DocumentEditorService

  constructor() {
    // todo?: use WeakRef
    this.documentEditor = new DocumentEditorService(this)
  }

  url(p: string): string {
    if (this.baseURL === "") {
      throw new Error("baseURL is not set")
    }
    if (!this.baseURL.endsWith("/")) {
      throw new Error(`baseURL must have a trailing slash, but '${this.baseURL}' does not`)
    }
    if (p.startsWith("/")) {
      throw new Error(`path must not start with a slash, but '${p}' does`)
    }
    const u = new URL(p, this.baseURL)
    return u.toString()
  }

  request(m: string, u: string, b?: unknown): Request {
    const h = new Headers({
      Accept: "application/json"
    })
    const o: RequestInit = {method: m, headers: h}
    if (b) {
      h.set("Content-Type", "application/json")
      o.body = JSON.stringify(b)
    }
    return new Request(u, o)
  }

  async fetch<T>(req: Request): Promise<[T, Response]> {
    const res = await fetch(req)
    Client.check(req, res)
    const t = await res.json()
    return [t, res]
  }

  static check(req: Request, res: Response): void {
    const ct = res.headers.get("Content-Type")
    if (!(ct && ct.includes("application/json"))) {
      throw new ErrorResponse(req, res, `Expected JSON response, but got '${ct}'`)
    }
    if (!(res.status >= 200 && res.status <= 299)) {
      throw new ErrorResponse(req, res, "Unknown server error")
    }
  }
}

export class ErrorResponse extends Error {
  request: Request
  response: Response
  name: string

  constructor(req: Request, res: Response, m: string) {
    super(m)
    this.request = req
    this.response = res
    this.name = this.constructor.name
    this.message = `${req.method} ${req.url}: ${res.status} ${m}`
    if ("captureStackTrace" in Error) {
      Error.captureStackTrace(this, ErrorResponse)
    }
  }
}
