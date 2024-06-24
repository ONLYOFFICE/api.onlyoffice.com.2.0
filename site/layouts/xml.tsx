import type {Context} from "@onlyoffice/eleventy-types"
import {renderToString} from "../config/preact.ts"

export async function render({content}: Context): Promise<string> {
  const c = await renderToString(content)
  return `<?xml version="1.0" encoding="utf-8"?>${c}`
}
