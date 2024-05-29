import {is, unreachable} from "uvu/assert"
import {test} from "uvu"
import {curlExample, httpExample} from "./example.ts"
import {declarationNode, requestDeclaration} from "./main.ts"

test("creates a http example", () => {
  const d = declarationNode()
  const r = requestDeclaration(d)
  const e = httpExample(r)
  is(e.syntax, "http")
})

test("creates an empty http example for the request without entrypoint", () => {
  const d = declarationNode()
  const r = requestDeclaration(d)
  const e = httpExample(r)
  is(e.code, "")
})

test("creates a http example for the request with entrypoint", () => {
  const d = declarationNode()
  const r = requestDeclaration(d)
  r.endpoint = "GET /hi"
  const e = httpExample(r)
  is(e.code, "GET /hi HTTP/1.1")
})

test("throws an error if a header parameter is reference", () => {
  const d = declarationNode()
  const r = requestDeclaration(d)
  r.endpoint = "GET /hi"
  r.headerParameters = [
    {id: "b", identifier: "a"}
  ]
  try {
    const e = httpExample(r)
    unreachable(`Expected an error, got ${e.code}`)
  } catch (e) {
    is(e instanceof Error && e.message, "header parameter references not supported")
  }
})

test("creates a http example for the request with simple headers", () => {
  const d = declarationNode()
  const r = requestDeclaration(d)
  r.endpoint = "GET /hi"
  r.headerParameters = [
    {identifier: "a", type: "string"},
    {identifier: "b", type: "number"}
  ]
  const e = httpExample(r)
  is(e.code, "GET /hi HTTP/1.1\na: a\nb: b")
})

test("creates a http example for the request with enum headers", () => {
  const d = declarationNode()
  const r = requestDeclaration(d)
  r.endpoint = "GET /hi"
  r.headerParameters = [
    {identifier: "a", type: "string", cases: ["a", "b"]},
    {identifier: "b", type: "number"}
  ]
  const e = httpExample(r)
  is(e.code, "GET /hi HTTP/1.1\na: a, b\nb: b")
})

test("creates a http example for the request with query parameters", () => {
  const d = declarationNode()
  const r = requestDeclaration(d)
  r.endpoint = "GET /hi"
  r.queryParameters = [
    {identifier: "a", type: "string"},
    {identifier: "b", type: "number"}
  ]
  const e = httpExample(r)
  is(e.code, "GET /hi?a={a}&b={b} HTTP/1.1")
})

test("creates a curl example", () => {
  const d = declarationNode()
  const r = requestDeclaration(d)
  const e = curlExample(r)
  is(e.syntax, "shell")
})

test("creates an empty curl example for the request without entrypoint", () => {
  const d = declarationNode()
  const r = requestDeclaration(d)
  const e = curlExample(r)
  is(e.code, "")
})

test("creates a curl example for the request with entrypoint", () => {
  const d = declarationNode()
  const r = requestDeclaration(d)
  r.endpoint = "GET /hi"
  const e = curlExample(r)
  is(e.code, "curl -L \\\n\t{host}/hi")
})

test("throws an error if a header parameter is reference", () => {
  const d = declarationNode()
  const r = requestDeclaration(d)
  r.endpoint = "GET /hi"
  r.headerParameters = [
    {id: "b", identifier: "a"}
  ]
  try {
    const e = curlExample(r)
    unreachable(`Expected an error, got ${e.code}`)
  } catch (e) {
    is(e instanceof Error && e.message, "header parameter references not supported")
  }
})

test("creates a curl example for the request with simple headers", () => {
  const d = declarationNode()
  const r = requestDeclaration(d)
  r.endpoint = "GET /hi"
  r.headerParameters = [
    {identifier: "a", type: "string"},
    {identifier: "b", type: "number"}
  ]
  const e = curlExample(r)
  is(e.code, 'curl -L \\\n\t-H "a: {a}" \\\n\t-H "b: {b}" \\\n\t{host}/hi')
})

test("creates a curl example for the request with enum headers", () => {
  const d = declarationNode()
  const r = requestDeclaration(d)
  r.endpoint = "GET /hi"
  r.headerParameters = [
    {identifier: "a", type: "string", cases: ["a", "b"]},
    {identifier: "b", type: "number"}
  ]
  const e = curlExample(r)
  is(e.code, 'curl -L \\\n\t-H "a: a, b" \\\n\t-H "b: {b}" \\\n\t{host}/hi')
})

test("creates a curl example for the request with query parameters", () => {
  const d = declarationNode()
  const r = requestDeclaration(d)
  r.endpoint = "GET /hi"
  r.queryParameters = [
    {identifier: "a", type: "string"},
    {identifier: "b", type: "number"}
  ]
  const e = curlExample(r)
  is(e.code, "curl -L \\\n\t{host}/hi?a={a}&b={b}")
})

test.run()
