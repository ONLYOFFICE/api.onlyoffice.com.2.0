import {
  type ComponentChildren,
  Fragment,
  type JSX,
  h,
  toChildArray,
} from "preact"

export interface JoinProperties {
  children?: ComponentChildren
  separator?: string
}

export function Join(p: JoinProperties): JSX.Element {
  return <>{join(p.children, p.separator)}</>
}

export type ChildArray = ReturnType<typeof toChildArray>

export function join(c: ComponentChildren, s = ""): ChildArray {
  const a = toChildArray(c)
  const r: ChildArray = []

  for (const e of a) {
    r.push(e, <>{s}</>)
  }

  if (r.length !== 0) {
    r.pop()
  }

  return r
}
