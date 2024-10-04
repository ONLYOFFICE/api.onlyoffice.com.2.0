import {HTTPSnippet} from "httpsnippet"
import {test} from "uvu"
import {equal as eq, is} from "uvu/assert"
import {ExampleGenerator, Request} from "./example.ts"
import * as Service from "./main.ts"

const c0: [Service.Property, string][] = [
  [ap(), '["a","b"]'],
  [bp(), "true"],
  [ep(), "c0"],
  [ip(), "0"],
  [lp(), "l"],
  [nlp(), "null"],
  [nmp(), "0"],
  [op(), '{"a":"a","b":"b"}'],
  [sp(), "s"],
  [uip(), "s"],
  [ukp(), "u"],
]

const c1: [Service.Property, string][] = [
  [ap(), "[%22a%22,%22b%22]"],
  [bp(), "true"],
  [ep(), "c0"],
  [ip(), "0"],
  [lp(), "l"],
  [nlp(), "null"],
  [nmp(), "0"],
  [op(), "%7B%22a%22:%22a%22,%22b%22:%22b%22%7D"],
  [sp(), "s"],
  [uip(), "s"],
  [ukp(), "u"],
]

const c2: [Service.Property, unknown][] = [
  [ap(), ["a", "b"]],
  [bp(), true],
  [ep(), "c0"],
  [ip(), 0],
  [lp(), "l"],
  [nlp(), null],
  [nmp(), 0],
  [op(), {a: "a", b: "b"}],
  [sp(), "s"],
  [uip(), "s"],
  [ukp(), "u"],
]

const c3: [Service.Property, string][] = [
  [ap(), "%5B%22a%22%2C%22b%22%5D"],
  [bp(), "true"],
  [ep(), "c0"],
  [ip(), "0"],
  [lp(), "l"],
  [nlp(), "null"],
  [nmp(), "0"],
  [op(), "%7B%22a%22%3A%22a%22%2C%22b%22%3A%22b%22%7D"],
  [sp(), "s"],
  [uip(), "s"],
  [ukp(), "u"],
]

test("Request: initializes an empty instance", () => {
  const r = new Service.Request()
  const w = Request.fromService(r)
  const k = Object.keys(w)
  eq(k, [
    "method",
    "url",
    "httpVersion",
    "cookies",
    "headers",
    "queryString",
    "postData",
    "headersSize",
    "bodySize",
  ])
  is(w.method, "")
  is(w.url, "https://example.com/")
  is(w.httpVersion, "HTTP/1.1")
  eq(w.cookies, [])
  eq(w.headers, [])
  eq(w.queryString, [])
  eq(w.postData, {mimeType: ""})
  eq(w.headersSize, -1)
  eq(w.headersSize, -1)
})

test("Request: initializes from a Service.Request with a method", () => {
  const r = new Service.Request()
  r.method = "GET"

  const a = Request.fromService(r)

  const e = new Request()
  e.method = "GET"
  e.url = "https://example.com/"

  eq(a, e)
})

test("Request: initializes from a Service.Request with a path", () => {
  const r = new Service.Request()
  r.path = "/p"

  const a = Request.fromService(r)

  const e = new Request()
  e.url = "https://example.com/p"

  eq(a, e)
})

for (const [x, y] of c0) {
  if (x.self.type === "circular") {
    throw new Error("Header parameter cannot have a circular type")
  }

  test(`Request: initializes from a Service.Request with a '${x.self.type.type}' header parameter`, () => {
    const r = new Service.Request()
    r.headerParameters = ps(x)

    const a = Request.fromService(r)

    const e = new Request()
    e.url = "https://example.com/"
    e.headers = [{name: x.identifier, value: y}]

    eq(a, e)
  })
}

test("Request: initializes from a Service.Request with a noop header parameter", () => {
  const r = new Service.Request()
  r.headerParameters = ps(npp())

  const a = Request.fromService(r)

  const e = new Request()
  e.url = "https://example.com/"

  eq(a, e)
})

for (const [x, y] of c0) {
  if (x.self.type === "circular") {
    throw new Error("Cookie parameter cannot have a circular type")
  }

  test(`Request: initializes from a Service.Request with a '${x.self.type.type}' cookie parameter`, () => {
    const r = new Service.Request()
    r.cookieParameters = ps(x)

    const a = Request.fromService(r)

    const e = new Request()
    e.url = "https://example.com/"
    e.cookies = [{name: x.identifier, value: y}]

    eq(a, e)
  })
}

test("Request: initializes from a Service.Request with a noop cookie parameter", () => {
  const r = new Service.Request()
  r.cookieParameters = ps(npp())

  const a = Request.fromService(r)

  const e = new Request()
  e.url = "https://example.com/"

  eq(a, e)
})

for (const [x, y] of c1) {
  if (x.self.type === "circular") {
    throw new Error("Path parameter cannot have a circular type")
  }

  test(`Request: initializes from a Service.Request with a '${x.self.type.type}' path parameter`, () => {
    const r = new Service.Request()
    r.path = `https://example.com/{${x.identifier}}`
    r.pathParameters = ps(x)

    const a = Request.fromService(r)

    const e = new Request()
    e.url = `https://example.com/${y}`

    eq(a, e)
  })
}

test("Request: initializes from a Service.Request with a noop path parameter", () => {
  const r = new Service.Request()
  r.path = `https://example.com/{${npp().identifier}}`
  r.pathParameters = ps(npp())

  const a = Request.fromService(r)

  const e = new Request()
  e.url = `https://example.com/%7B${npp().identifier}%7D`

  eq(a, e)
})

for (const [x, y] of c0) {
  if (x.self.type === "circular") {
    throw new Error("Query parameter cannot have a circular type")
  }

  test(`Request: initializes from a Service.Request with a '${x.self.type.type}' query parameter`, () => {
    const r = new Service.Request()
    r.queryParameters = ps(x)

    const a = Request.fromService(r)

    const e = new Request()
    e.url = "https://example.com/"
    e.queryString = [{name: x.identifier, value: y}]

    eq(a, e)
  })
}

test("Request: initializes from a Service.Request with a noop query parameter", () => {
  const r = new Service.Request()
  r.queryParameters = ps(npp())

  const a = Request.fromService(r)

  const e = new Request()
  e.url = "https://example.com/"

  eq(a, e)
})

for (const [x, y] of c2) {
  if (x.self.type === "circular") {
    throw new Error("Body parameter cannot have a circular type")
  }

  test(`Request: initializes from a Service.Request with a '${x.self.type.type}' body parameter and application/json content type`, () => {
    const r = new Service.Request()
    r.headerParameters = ps(ct(aj()))
    r.bodyParameters = ps(x)

    const a = Request.fromService(r)

    const e = new Request()
    e.url = "https://example.com/"
    e.headers = [{
      name: "Content-Type",
      value: "application/json",
    }]
    e.postData = {
      mimeType: "application/json",
      text: JSON.stringify({[x.identifier]: y}, null, 2),
    }

    eq(a, e)
  })
}

test("Request: initializes from a Service.Request with a noop body parameter and application/json content type", () => {
  const r = new Service.Request()
  r.headerParameters = ps(ct(aj()))
  r.bodyParameters = ps(npp())

  const a = Request.fromService(r)

  const e = new Request()
  e.url = "https://example.com/"
  e.headers = [{name: "Content-Type", value: "application/json"}]

  eq(a, e)
})

for (const [x, y] of c0) {
  if (x.self.type === "circular") {
    throw new Error("Body parameter cannot have a circular type")
  }

  test(`Request: initializes from a Service.Request with a '${x.self.type.type}' body parameter and multipart/form-data content type`, () => {
    const r = new Service.Request()
    r.headerParameters = ps(ct(mf()))
    r.bodyParameters = ps(x)

    const a = Request.fromService(r)

    const e = new Request()
    e.url = "https://example.com/"
    e.headers = [{
      name: "Content-Type",
      value: "multipart/form-data",
    }]
    e.postData = {
      mimeType: "multipart/form-data",
      params: [{name: x.identifier, value: y}],
    }

    eq(a, e)
  })
}

test("Request: initializes from a Service.Request with a noop body parameter and multipart/form-data content type", () => {
  const r = new Service.Request()
  r.headerParameters = ps(ct(mf()))
  r.bodyParameters = ps(npp())

  const a = Request.fromService(r)

  const e = new Request()
  e.url = "https://example.com/"
  e.headers = [{name: "Content-Type", value: "multipart/form-data"}]

  eq(a, e)
})

test("ExampleGenerator: initializes an empty instance", () => {
  const r = new Service.Request()
  const e = new ExampleGenerator(r)
  const k = Object.keys(e)
  eq(k, ["s"])
  eq(e.s instanceof HTTPSnippet, true)
})

test("ExampleGenerator: creates an HTTP example with an empty request", () => {
  const r = new Service.Request()
  const g = new ExampleGenerator(r)
  const a = g.http()

  const e = new Service.Example()
  e.syntax = "http"
  e.code = crlf(
    " / HTTP/1.1",
    "Host: example.com",
  )

  eq(a, e)
})

test("ExampleGenerator: creates an HTTP example with a method", () => {
  const r = new Service.Request()
  r.method = "GET"

  const g = new ExampleGenerator(r)
  const a = g.http()

  const e = new Service.Example()
  e.syntax = "http"
  e.code = crlf(
    "GET / HTTP/1.1",
    "Host: example.com",
  )

  eq(a, e)
})

test("ExampleGenerator: creates an HTTP example with a path", () => {
  const r = new Service.Request()
  r.path = "/p"

  const g = new ExampleGenerator(r)
  const a = g.http()

  const e = new Service.Example()
  e.syntax = "http"
  e.code = crlf(
    " /p HTTP/1.1",
    "Host: example.com",
  )

  eq(a, e)
})

for (const [x, y] of c0) {
  if (x.self.type === "circular") {
    throw new Error("Header parameter cannot have a circular type")
  }

  test(`ExampleGenerator: creates an HTTP example with a '${x.identifier}' header parameter`, () => {
    const r = new Service.Request()
    r.headerParameters = ps(x)

    const g = new ExampleGenerator(r)
    const a = g.http()

    const e = new Service.Example()
    e.syntax = "http"
    e.code = crlf(
      " / HTTP/1.1",
      ...[
        `${x.identifier}: ${y}`,
        "Host: example.com",
      ].sort(),
    )

    eq(a, e)
  })
}

for (const [x, y] of c3) {
  if (x.self.type === "circular") {
    throw new Error("Cookie parameter cannot have a circular type")
  }

  test(`ExampleGenerator: creates an HTTP example with a '${x.identifier}' cookie parameter`, () => {
    const r = new Service.Request()
    r.cookieParameters = ps(x)

    const g = new ExampleGenerator(r)
    const a = g.http()

    const e = new Service.Example()
    e.syntax = "http"
    e.code = crlf(
      " / HTTP/1.1",
      `Cookie: ${x.identifier}=${y}`,
      "Host: example.com",
    )

    eq(a, e)
  })
}

for (const [x, y] of c1) {
  if (x.self.type === "circular") {
    throw new Error("Path parameter cannot have a circular type")
  }

  test(`ExampleGenerator: creates an HTTP example with a '${x.identifier}' path parameter`, () => {
    const r = new Service.Request()
    r.path = `https://example.com/{${x.identifier}}`
    r.pathParameters = ps(x)

    const g = new ExampleGenerator(r)
    const a = g.http()

    const e = new Service.Example()
    e.syntax = "http"
    e.code = crlf(
      ` /${y} HTTP/1.1`,
      "Host: example.com",
    )

    eq(a, e)
  })
}

for (const [x, y] of c3) {
  if (x.self.type === "circular") {
    throw new Error("Query parameter cannot have a circular type")
  }

  test(`ExampleGenerator: creates an HTTP example with a '${x.identifier}' query parameter`, () => {
    const r = new Service.Request()
    r.queryParameters = ps(x)

    const g = new ExampleGenerator(r)
    const a = g.http()

    const e = new Service.Example()
    e.syntax = "http"
    e.code = crlf(
      ` /?${x.identifier}=${y} HTTP/1.1`,
      "Host: example.com",
    )

    eq(a, e)
  })
}

for (const [x, y] of c2) {
  if (x.self.type === "circular") {
    throw new Error("Body parameter cannot have a circular type")
  }

  test(`ExampleGenerator: creates an HTTP example with a '${x.identifier}' body parameter and application/json content type`, () => {
    const r = new Service.Request()
    r.headerParameters = ps(ct(aj()))
    r.bodyParameters = ps(x)

    const g = new ExampleGenerator(r)
    const a = g.http()

    const o = JSON.stringify({[x.identifier]: y}, null, 2)

    const e = new Service.Example()
    e.syntax = "http"
    e.code = crlf(
      " / HTTP/1.1",
      `Content-Length: ${o.length}`,
      "Content-Type: application/json",
      "Host: example.com",
      "",
      o,
    )

    eq(a, e)
  })
}

test.run()

function ps(...a: Service.Property[]): Service.Entity {
  const y = new Service.Entity()
  y.type = new Service.ObjectType()
  y.type.properties = a

  if (a.length !== 0) {
    const e: Record<string, unknown> = {}

    for (const p of a) {
      if (
        p.self instanceof Service.Entity &&
        p.self.example instanceof Service.PassthroughConst
      ) {
        e[p.identifier] = p.self.example.value
      }
    }

    if (Object.keys(e).length !== 0) {
      y.example = new Service.PassthroughConst()
      y.example.value = e
    }
  }

  return y
}

function ap(): Service.Property {
  const p = new Service.Property()
  p.identifier = "A"
  p.self = new Service.Entity()
  p.self.type = new Service.ArrayType()
  p.self.type.items = new Service.Entity()
  p.self.type.items.type = new Service.StringType()
  p.self.example = new Service.PassthroughConst()
  p.self.example.value = ["a", "b"]
  return p
}

function bp(): Service.Property {
  const p = new Service.Property()
  p.identifier = "B"
  p.self = new Service.Entity()
  p.self.type = new Service.BooleanType()
  p.self.example = new Service.PassthroughConst()
  p.self.example.value = true
  return p
}

function ep(): Service.Property {
  const p = new Service.Property()
  p.identifier = "E"
  p.self = new Service.Entity()
  p.self.type = new Service.EnumType()
  p.self.type.cases = []
  p.self.type.cases[0] = new Service.Entity()
  p.self.type.cases[0].type = new Service.LiteralType()
  p.self.type.cases[0].type.base = new Service.StringType()
  p.self.type.cases[0].type.const = new Service.PassthroughConst()
  p.self.type.cases[0].type.const.value = "c0"
  p.self.type.cases[1] = new Service.Entity()
  p.self.type.cases[1].type = new Service.LiteralType()
  p.self.type.cases[1].type.base = new Service.StringType()
  p.self.type.cases[1].type.const = new Service.PassthroughConst()
  p.self.type.cases[1].type.const.value = "c1"
  p.self.example = new Service.PassthroughConst()
  p.self.example.value = "c0"
  return p
}

function ip(): Service.Property {
  const p = new Service.Property()
  p.identifier = "I"
  p.self = new Service.Entity()
  p.self.type = new Service.IntegerType()
  p.self.example = new Service.PassthroughConst()
  p.self.example.value = 0
  return p
}

function lp(): Service.Property {
  const p = new Service.Property()
  p.identifier = "L"
  p.self = new Service.Entity()
  p.self.type = new Service.LiteralType()
  p.self.type.base = new Service.StringType()
  p.self.example = new Service.PassthroughConst()
  p.self.example.value = "l"
  return p
}

function npp(): Service.Property {
  const p = new Service.Property()
  p.identifier = "N"
  p.self = new Service.Entity()
  return p
}

function nlp(): Service.Property {
  const p = new Service.Property()
  p.identifier = "N"
  p.self = new Service.Entity()
  p.self.type = new Service.NullType()
  p.self.example = new Service.PassthroughConst()
  p.self.example.value = null
  return p
}

function nmp(): Service.Property {
  const p = new Service.Property()
  p.identifier = "N"
  p.self = new Service.Entity()
  p.self.type = new Service.NumberType()
  p.self.example = new Service.PassthroughConst()
  p.self.example.value = 0
  return p
}

function op(): Service.Property {
  const p = new Service.Property()
  p.identifier = "O"
  p.self = new Service.Entity()
  p.self.type = new Service.ObjectType()
  p.self.example = new Service.PassthroughConst()
  p.self.example.value = {a: "a", b: "b"}
  return p
}

function sp(): Service.Property {
  const p = new Service.Property()
  p.identifier = "S"
  p.self = new Service.Entity()
  p.self.type = new Service.StringType()
  p.self.example = new Service.PassthroughConst()
  p.self.example.value = "s"
  return p
}

function uip(): Service.Property {
  const p = new Service.Property()
  p.identifier = "U"
  p.self = new Service.Entity()
  p.self.type = new Service.UnionType()
  p.self.type.types = []
  p.self.type.types[0] = new Service.StringType()
  p.self.type.types[1] = new Service.IntegerType()
  p.self.example = new Service.PassthroughConst()
  p.self.example.value = "s"
  return p
}

function ukp(): Service.Property {
  const p = new Service.Property()
  p.identifier = "U"
  p.self = new Service.Entity()
  p.self.type = new Service.UnknownType()
  p.self.example = new Service.PassthroughConst()
  p.self.example.value = "u"
  return p
}

function ct(...c: Service.Entity[]): Service.Property {
  const p = new Service.Property()
  p.identifier = "Content-Type"
  p.self = new Service.Entity()
  p.self.type = new Service.EnumType()
  p.self.type.cases = c
  p.self.example = c[0].example
  return p
}

function aj(): Service.Entity {
  const y = new Service.Entity()
  y.type = new Service.LiteralType()
  y.type.base = new Service.StringType()
  y.type.const = new Service.PassthroughConst()
  y.type.const.value = "application/json"
  y.example = new Service.PassthroughConst()
  y.example.value = "application/json"
  return y
}

function mf(): Service.Entity {
  const y = new Service.Entity()
  y.type = new Service.LiteralType()
  y.type.base = new Service.StringType()
  y.type.const = new Service.PassthroughConst()
  y.type.const.value = "multipart/form-data"
  y.example = new Service.PassthroughConst()
  y.example.value = "multipart/form-data"
  return y
}

function crlf(...a: string[]): string {
  return a.join("\r\n")
}
