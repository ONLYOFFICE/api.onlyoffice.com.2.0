import {isValidElement, toChildArray} from "preact"

// todo: refactor it.
// https://github.com/primer/react/blob/ea44386e4d7afae7bfd07a679604baaecca55965/packages/react/src/hooks/useSlots.ts#L35
export function useSlots<C extends Record<string, any>>(children: any, config: C): [C, any] {
  const n = {}
  const f = []

  const ks = Object.keys(config)
  const vs = Object.values(config)

  for (const c of toChildArray(children)) {
    if (!isValidElement(c)) {
      f.push(c)
      continue
    }
    const i = vs.indexOf(c.type)
    if (i === -1) {
      f.push(c)
      continue
    }
    const k = ks[i]
    if (n[k]) {
      continue
    }
    n[k] = c
  }

  return [n, f]
}
