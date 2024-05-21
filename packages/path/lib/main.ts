import path from "node:path"

export function relative(a: string, b: string): string {
  let r = path.relative(a, b)
  if (r.slice(0, 3) !== "../") {
    r = `./${r}`
  }
  return r
}
