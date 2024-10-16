import {isValidElement, toChildArray} from "preact"

// todo: refactor it.
// https://github.com/primer/react/blob/ea44386e4d7afae7bfd07a679604baaecca55965/packages/react/src/hooks/useSlots.ts#L35
// eslint-disable-next-line @typescript-eslint/no-explicit-any, @typescript-eslint/explicit-module-boundary-types
export function useSlots<C extends Record<string, any>>(children: any, config: C): [C, any] {
  const sl = {}
  const ou = []

  const ks = Object.keys(config)
  const vs = Object.values(config)
  const cs = toChildArray(children)

  for (const ch of cs) {
    if (!isValidElement(ch)) {
      ou.push(ch)
      continue
    }

    let ci = -1

    for (const ta of vs) {
      let co = ta
      if (Array.isArray(ta)) {
        [co] = ta
      }
      if (ch.type === co || ch.type === co.type) {
        ci = vs.indexOf(ta)
        break
      }
    }

    if (ci === -1) {
      ou.push(ch)
      continue
    }

    const sk = ks[ci]

    if (sl[sk]) {
      if (!Array.isArray(sl[sk])) {
        sl[sk] = [sl[sk]]
      }
      sl[sk].push(ch)
      continue
    }

    sl[sk] = ch
  }

  return [sl, ou]
}
