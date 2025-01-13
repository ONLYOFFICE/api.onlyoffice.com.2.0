import {setTimeout} from "node:timers/promises"
import {createSuspense} from "@onlyoffice/preact-suspense"
import {createElement, isValidElement} from "preact"
import {renderToStringAsync} from "preact-render-to-string"

export async function renderToString(e: unknown): Promise<string> {
  // todo: explain. DO NOT DELETE THE HACK BELLOW!
  await setTimeout(0)

  if (!isValidElement(e)) {
    throw new Error("Invalid element")
  }

  const [r, P] = createSuspense()
  const p = createElement(P, null, e)
  const s = renderToStringAsync(p)
  r()

  return await s
}
