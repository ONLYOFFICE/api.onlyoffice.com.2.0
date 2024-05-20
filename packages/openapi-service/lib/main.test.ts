import type * as REST from "@onlyoffice/service-declaration"
import {test} from "uvu"
import {is, unreachable} from "uvu/assert"
import {
  createCURLExample,
  createHTTPExample,
  declarationNode,
  example,
  httpExample,
  shellExample,
  populateRequestExamples,
  queryParametersToString,
  requestDeclaration
} from "./main.ts"

test("declarationNode() creates an empty REST.DeclarationNode object", () => {
  const n = declarationNode()
  is(n.kind, "")
  is(n.slug, "")
  is(n.title, "")
})

test("requestDeclaration() creates a default REST.RequestDeclaration object", () => {
  const n = declarationNode()
  const r = requestDeclaration(n)
  is(r.kind, "request")
})

test("example() creates a REST example object with parameters as empty stings", () => {
  const e = example()
  is("", e.code)
  is("", e.syntax)
})

test("httpExample() assigns 'http' to as syntax parameter of REST.Example", () => {
  const e = example()
  const h = httpExample(e)
  is("", e.syntax)
  is("http", h.syntax)
})

test("shellExample() assigns 'shell' to as syntax parameter of REST.Example", () => {
  const e = example()
  const s = shellExample(e)
  is("", e.syntax)
  is("shell", s.syntax)
})

test("queryParametersToString() creates an empty string if query parameters don't exist", () => {
  const n = declarationNode()
  const r = requestDeclaration(n)
  const a = queryParametersToString(r)
  is("", a)
})

test("queryParametersToString() creates a query parameters string if parameters exist", () => {
  const n = declarationNode()
  const r = requestDeclaration(n)
  addQueryToTestRequets(r)
  const e = "?document={document}&version={version}&view={view}"
  const a = queryParametersToString(r)
  is(e, a)
})

test("createHTTPExample() creates an HTTP example", () => {
  const r = postRequestDeclaration()
  const qp = queryParametersToString(r)
  const e = "POST /api/2.0/files/file/referencedata HTTP/1.1"
  const {code} = createHTTPExample(r, qp)
  is(e, code)
})

test("createHTTPExample() creates an HTTP example with query parameters if exist", () => {
  const r = postRequestDeclaration()
  addQueryToTestRequets(r)
  const qp = queryParametersToString(r)
  const e = "" +
    "POST /api/2.0/files/file/referencedata" +
    "?document={document}&version={version}&view={view} HTTP/1.1"
  const {code} = createHTTPExample(r, qp)
  is(e, code)
})

test("createHTTPExample() creates an HTTP example with headers if exist", () => {
  const r = postRequestDeclaration()
  addHeadersToTestRequets(r)

  const expect = "POST /api/2.0/files/file/referencedata HTTP/1.1\n" +
    "Accept: text/plain, application/json, text/json\n" +
    "Content-Type: application/json, text/json, application/*+json\n" +
    "Auth: Auth"
  const actual = createHTTPExample(r, "")
  is(expect, actual.code)
})

test("createCURLExample() creates a CURL GET example", () => {
  const r = getRequestDeclaration()
  const qp = queryParametersToString(r)

  const expect = `curl -L \\\n\t{host}/api/2.0/files/file/referencedata`
  const actual = createCURLExample(r, qp)
  is(expect, actual.code)
})

test("createCURLExample() creates a CURL POST example", () => {
  const r = postRequestDeclaration()
  const qp = queryParametersToString(r)

  const expect = `curl -L -X "POST" \\\n\t{host}/api/2.0/files/file/referencedata`
  const actual = createCURLExample(r, qp)
  is(expect, actual.code)
})

test("createCURLExample() creates a CURL example with query parameters if exist", () => {
  const r = postRequestDeclaration()
  addQueryToTestRequets(r)
  const qp = queryParametersToString(r)

  const expect = `curl -L -X "POST" \\\n` +
    "\t{host}/api/2.0/files/file/referencedata?document={document}&version={version}&view={view}"
  const actual = createCURLExample(r, qp)
  is(expect, actual.code)
})

test("createCURLExample() creates a CURL example with headers if exist", () => {
  const r = postRequestDeclaration()
  const hreq = addHeadersToTestRequets(r)
  const qp = queryParametersToString(hreq)

  const expect = `curl -L -X "POST" \\\n` +
    `\t-H "Accept": text/plain, application/json, text/json \\\n` +
    `\t-H "Content-Type": application/json, text/json, application/*+json \\\n` +
    `\t-H "Auth": Auth \\\n` +
    `\t{host}/api/2.0/files/file/referencedata`
  const actual = createCURLExample(hreq, qp)
  is(expect, actual.code)
})

test("populateRequestExamples() populates RequestDeclaration with request examples", () => {
  const r = postRequestDeclaration()

  populateRequestExamples(r)
  const expect = [
    "POST /api/2.0/files/file/referencedata HTTP/1.1",
    `curl -L -X "POST" \\\n\t{host}/api/2.0/files/file/referencedata`
  ]
  const actual = r.examples
  if (actual) {
    is(actual[0].code, expect[0])
    is(actual[1].code, expect[1])
  } else {
    unreachable("Examples do not exist")
  }
})

test.run()

function addHeadersToTestRequets(req: REST.RequestDeclaration): REST.RequestDeclaration {
  req.headerParameters = [
    acceptHeaderParameter(),
    contentTypeHeaderParameter(),
    authHeaderParameter()
  ]
  return req
}

function addQueryToTestRequets(req: REST.RequestDeclaration): REST.RequestDeclaration {
  req.queryParameters = [
    documentQueryParameter(),
    versionQueryParameter(),
    viewQueryParameter()
  ]
  return req
}

function getRequestDeclaration(): REST.RequestDeclaration {
  const n = declarationNode()
  const r = requestDeclaration(n)
  r.endpoint = "GET /api/2.0/files/file/referencedata"
  return r
}

function postRequestDeclaration(): REST.RequestDeclaration {
  const n = declarationNode()
  const r = requestDeclaration(n)
  r.endpoint = "POST /api/2.0/files/file/referencedata"
  return r
}

function acceptHeaderParameter(): REST.Property {
  const n = typeNode()
  const t = stringType(n)
  const p = property(t)
  p.identifier = "Accept"
  p.cases = ["text/plain", "application/json", "text/json"]
  return p
}

function authHeaderParameter(): REST.Property {
  const n = typeNode()
  const t = stringType(n)
  const p = property(t)
  p.identifier = "Auth"
  return p
}

function contentTypeHeaderParameter(): REST.Property {
  const n = typeNode()
  const t = stringType(n)
  const p = property(t)
  p.identifier = "Content-Type"
  p.cases = ["application/json", "text/json", "application/*+json"]
  return p
}

function documentQueryParameter(): REST.Property {
  const n = typeNode()
  const t = stringType(n)
  const p = property(t)
  p.identifier = "document"
  return p
}

function versionQueryParameter(): REST.Property {
  const n = typeNode()
  const t = integerType(n)
  const p = property(t)
  p.identifier = "version"
  p.format = "int32"
  return p
}

function viewQueryParameter(): REST.Property {
  const n = typeNode()
  const t = booleanType(n)
  const p = property(t)
  p.identifier = "view"
  return p
}

function property(t: Exclude<REST.Type, REST.Reference>): Exclude<REST.Property, REST.PropertyReference> {
  return {...t, identifier: ""}
}

function booleanType(t: REST.TypeNode): REST.BooleanType {
  return {...t, type: "boolean"}
}

function stringType(t: REST.TypeNode): REST.StringType {
  return {...t, type: "string"}
}

function integerType(t: REST.TypeNode): REST.IntegerType {
  return {...t, type: "integer"}
}

function typeNode(): REST.TypeNode {
  return {type: ""}
}
