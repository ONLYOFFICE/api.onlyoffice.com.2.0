import type {Example} from "@onlyoffice/declaration-code-example"
import {example} from "@onlyoffice/declaration-code-example"
import type {RequestDeclaration} from "./main.ts"

export function httpExample(req: RequestDeclaration): Example {
  const e = example()
  e.syntax = "http"
  if (!req.endpoint) {
    return e
  }

  const q = query(req)
  const [m, p] = req.endpoint.split(" ")
  const h = headers(req)
  e.code = code(m, p, q, h)
  return e

  function headers(req: RequestDeclaration): string {
    if (!req.headerParameters) {
      return ""
    }
    let s = ""
    for (const h of req.headerParameters) {
      if ("id" in h) {
        throw new Error("header parameter references not supported")
      }
      s += `${h.identifier}: `
      if (h.cases) {
        s += h.cases.join(", ")
      } else {
        s += `${h.identifier}`
      }
      s += "\n"
    }
    return s.slice(0, -1)
  }

  function code(m: string, p: string, q: string, h: string): string {
    let s = `${m} ${p}${q} HTTP/1.1`
    if (h !== "") {
      s += `\n${h}`
    }
    return s
  }
}

export function curlExample(req: RequestDeclaration): Example {
  const e = example()
  e.syntax = "shell"
  if (!req.endpoint) {
    return e
  }

  const q = query(req)
  const [m, p] = req.endpoint.split(" ")
  const x = method(m)
  const h = headers(req)
  e.code = code(x, p, q, h)
  return e

  function method(m: string): string {
    if (m === "GET") {
      return ""
    }
    return `-X "${m}"`
  }

  function headers(req: RequestDeclaration): string {
    if (!req.headerParameters) {
      return ""
    }
    let s = ""
    for (const h of req.headerParameters) {
      if ("id" in h) {
        throw new Error("header parameter references not supported")
      }
      s += `\t-H "${h.identifier}: `
      if (h.cases) {
        s += h.cases.join(", ")
      } else {
        s += `{${h.identifier}}`
      }
      s += '" \\\n'
    }
    return s.slice(0, -1)
  }

  function code(m: string, p: string, q: string, h: string): string {
    let s = "curl -L"
    if (m !== "") {
      s += ` ${m} \\`
    } else {
      s += " \\"
    }
    if (h !== "") {
      s += `\n${h}`
    }
    return `${s}\n\t{host}${p}${q}`
  }
}

function query(req: RequestDeclaration): string {
  let qp = "?"
  if (req.queryParameters) {
    for (const q of req.queryParameters) {
      qp += `${q.identifier}={${q.identifier}}&`
    }
  }
  return qp.slice(0, -1)
}
