import {body} from "@onlyoffice/node-http"
import {equal as eq, is, unreachable as un} from "uvu/assert"
import {suite} from "uvu"
import {DocumentEditorService} from "./document-editor.ts"
import {ErrorResponse, Client} from "./client.ts"
import type {Teardown} from "./shared.ts"
import {setup} from "./shared.ts"

interface Context {
  t: Teardown
}

const test = suite<Context>("", {t() {}})

test.after.each((ctx) => {
  ctx.t()
})

test("creates an empty error response", () => {
  const req = new Request("http://localhost/")
  const res = new Response()
  const e = new ErrorResponse(req, res, "")
  eq(e.request, req)
  eq(e.response, res)
  eq(e.name, "ErrorResponse")
  eq(e.message, "GET http://localhost/: 200 ")
})

test("creates an error response with a message", () => {
  const req = new Request("http://localhost/")
  const res = new Response()
  const e = new ErrorResponse(req, res, "hi")
  eq(e.message, "GET http://localhost/: 200 hi")
})

test("allows to throw an error response", () => {
  const req = new Request("http://localhost/")
  const res = new Response()
  try {
    throw new ErrorResponse(req, res, "hi")
  } catch (e) {
    eq(e instanceof ErrorResponse && e.message, "GET http://localhost/: 200 hi")
  }
})

test("creates an empty client", () => {
  const c = new Client()
  is(c.baseURL, "")
  is(c.documentEditor instanceof DocumentEditorService, true)
})

test("allows to set the base url", () => {
  const c = new Client()
  c.baseURL = "http://localhost/"
  is(c.baseURL, "http://localhost/")
  is(c.documentEditor instanceof DocumentEditorService, true)
})

test("creates a url with an empty path", () => {
  const c = new Client()
  c.baseURL = "http://localhost/"
  const u = c.url("")
  is(u, "http://localhost/")
})

test("creates a url with a path", () => {
  const c = new Client()
  c.baseURL = "http://localhost/"
  const u = c.url("hi")
  is(u, "http://localhost/hi")
})

test("throws an error when the base url is not set", () => {
  const c = new Client()
  try {
    const u = c.url("hi")
    un(`Expected an error, but got '${u}'`)
  } catch (e) {
    is(e instanceof Error && e.message, "baseURL is not set")
  }
})

test("throws an error when the base url does not have a trailing slash", () => {
  const c = new Client()
  c.baseURL = "http://localhost"
  try {
    const u = c.url("hi")
    un(`Expected an error, but got '${u}'`)
  } catch (e) {
    is(e instanceof Error && e.message, "baseURL must have a trailing slash, but 'http://localhost' does not")
  }
})

test("throws an error when the path starts with a slash", () => {
  const c = new Client()
  c.baseURL = "http://localhost/"
  try {
    const u = c.url("/hi")
    un(`Expected an error, but got '${u}'`)
  } catch (e) {
    is(e instanceof Error && e.message, "path must not start with a slash, but '/hi' does")
  }
})

test("creates a request without a body", () => {
  const c = new Client()
  const r = c.request("GET", "http://localhost/")
  is(r.method, "GET")
  is(r.url, "http://localhost/")
  is(r.headers.get("Accept"), "application/json")
  is(r.headers.get("Content-Type"), null)
  is(r.body, null)
})

test("creates a request with a body", async () => {
  const c = new Client()
  const r = c.request("POST", "http://localhost/", {a: 1})
  is(r.method, "POST")
  is(r.url, "http://localhost/")
  is(r.headers.get("Accept"), "application/json")
  is(r.headers.get("Content-Type"), "application/json")
  is(await r.text(), '{"a":1}')
})

test("does not throw an error when the response is JSON", () => {
  for (let i = 200; i < 300; i += 1) {
    const req = new Request("http://localhost/")
    let res: Response
    try {
      res = new Response('{"a":1}', {
        headers: {"Content-Type": "application/json"},
        status: i
      })
    } catch (e) {
      if (
        e instanceof Error &&
        e.message === `Response constructor: Invalid response status code ${i}`
      ) {
        continue
      }
      throw e
    }
    Client.check(req, res)
  }
})

test("throws an error when the response is not JSON", () => {
  const req = new Request("http://localhost/")
  const res = new Response("")
  try {
    Client.check(req, res)
    un("Expected an error, but got none")
  } catch (e) {
    is(e instanceof Error && e.message, "GET http://localhost/: 200 Expected JSON response, but got 'text/plain;charset=UTF-8'")
  }
})

test("throws an error when the response is not 2xx", () => {
  const req = new Request("http://localhost/")
  const res = new Response("", {
    headers: {"Content-Type": "application/json"},
    status: 400
  })
  try {
    Client.check(req, res)
    un("Expected an error, but got none")
  } catch (e) {
    is(e instanceof Error && e.message, "GET http://localhost/: 400 Unknown server error")
  }
})

test("makes a fetch request", async (ctx) => {
  const [c, s, t] = setup()
  ctx.t = t

  s.on("request", (req, res) => {
    // eslint-disable-next-line dot-notation
    is(req.headers["accept"], "application/json")
    is(req.headers["content-type"], undefined)
    is(req.method, "GET")
    is(req.url, "/")
    is(req.read(), null)

    res.statusCode = 200
    res.setHeader("Content-Type", "application/json")
    res.write("{}")
    res.end()
  })

  const u = c.url("")
  const req = c.request("GET", u)
  const [_, res] = await c.fetch(req)

  is(res.status, 200)
  is(res.headers.get("Content-Type"), "application/json")
})

test("makes a fetch request with a method", async (ctx) => {
  const [c, s, t] = setup()
  ctx.t = t

  s.on("request", (req, res) => {
    is(req.method, "POST")

    res.statusCode = 200
    res.setHeader("Content-Type", "application/json")
    res.write("{}")
    res.end()
  })

  const u = c.url("")
  const req = c.request("POST", u)
  const [_, res] = await c.fetch(req)

  is(res.status, 200)
})

test("makes a fetch request with a path", async (ctx) => {
  const [c, s, t] = setup()
  ctx.t = t

  s.on("request", (req, res) => {
    is(req.url, "/hi")

    res.statusCode = 200
    res.setHeader("Content-Type", "application/json")
    res.write("{}")
    res.end()
  })

  const u = c.url("hi")
  const req = c.request("GET", u)
  const [_, res] = await c.fetch(req)

  is(res.status, 200)
})

test("makes a fetch request with a body", async (ctx) => {
  const [c, s, t] = setup()
  ctx.t = t

  s.on("request", async (req, res) => {
    is(req.headers["content-type"], "application/json")

    const b = await body(req)
    is(b, '{"a":1}')

    res.statusCode = 200
    res.setHeader("Content-Type", "application/json")
    res.write("{}")
    res.end()
  })

  const u = c.url("")
  const req = c.request("POST", u, {a: 1})
  const [_, res] = await c.fetch(req)

  is(res.status, 200)
})

test("receives a json response", async (ctx) => {
  const [c, s, t] = setup()
  ctx.t = t

  s.on("request", (_, res) => {
    res.statusCode = 200
    res.setHeader("Content-Type", "application/json")
    res.write('{"a":1}')
    res.end()
  })

  const u = c.url("")
  const req = c.request("GET", u)
  const [j, res] = await c.fetch(req)

  is(res.status, 200)
  eq(j, {a: 1})
})

test("leaves unusable body of a response", async (ctx) => {
  const [c, s, t] = setup()
  ctx.t = t

  s.on("request", (_, res) => {
    res.statusCode = 200
    res.setHeader("Content-Type", "application/json")
    res.write("{}")
    res.end()
  })

  const u = c.url("")
  const req = c.request("GET", u)
  const [_, res] = await c.fetch(req)

  is(res.status, 200)
  is(res.bodyUsed, true)

  try {
    const t = await res.text()
    un(`Expected an error, but got '${t}'`)
  } catch (e) {
    is(e instanceof Error && e.message, "Body is unusable")
  }
})

test("throws an error when the response is not json", async (ctx) => {
  const [c, s, t] = setup()
  ctx.t = t

  s.on("request", (_, res) => {
    res.statusCode = 200
    res.setHeader("Content-Type", "text/plain")
    res.write("")
    res.end()
  })

  const u = c.url("")
  const req = c.request("GET", u)
  try {
    const [_, res] = await c.fetch(req)
    un(`Expected an error, but got '${res}'`)
  } catch (e) {
    is(e instanceof Error && e.message, `GET ${u}: 200 Expected JSON response, but got 'text/plain'`)
  }
})

test("throws an error when the response is not 2xx", async (ctx) => {
  const [c, s, t] = setup()
  ctx.t = t

  s.on("request", (_, res) => {
    res.statusCode = 400
    res.setHeader("Content-Type", "application/json")
    res.write("")
    res.end()
  })

  const u = c.url("")
  const req = c.request("GET", u)
  try {
    const [_, res] = await c.fetch(req)
    un(`Expected an error, but got '${res}'`)
  } catch (e) {
    is(e instanceof Error && e.message, `GET ${u}: 400 Unknown server error`)
  }
})

test.run()
