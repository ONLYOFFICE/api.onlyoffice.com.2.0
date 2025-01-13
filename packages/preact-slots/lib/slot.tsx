// This file is a simplified version of the [@radix-ui/react-slot] package.
//
// [@radix-ui/react-slot]: https://github.com/radix-ui/primitives/blob/74b182b401c8ca0fa5b66a5a9a47f507bb3d5adc/packages/react/slot/src/Slot.tsx

import {merge} from "@onlyoffice/preact-merge"
import {
  type ComponentChild,
  type ComponentChildren,
  type JSX,
  type VNode,
  cloneElement,
  isValidElement,
  toChildArray,
} from "preact"

export interface SlotProperties extends JSX.HTMLAttributes<HTMLElement> {
  children?: ComponentChildren
}

export function Slot(p: SlotProperties): JSX.Element {
  const {children, ...ob} = p
  const ca = toChildArray(children)
  const cc: ComponentChildren[] = []
  let sl: VNode | undefined
  let ne: ComponentChildren | undefined
  let ch = children

  for (const c of ca) {
    if (!sl && isSlottable(c)) {
      sl = c
      ne = sl.props.children

      const a = toChildArray(ne)
      if (a.length <= 1 && isValidElement(ne)) {
        cc.push(ne.props.children)
      }

      continue
    }

    if (c !== sl) {
      cc.push(c)
    }
  }

  if (sl && isValidElement(ne)) {
    ch = cloneElement(ne, undefined, cc)
  }

  return <SlotClone {...ob}>{ch}</SlotClone>
}

function isSlottable(c: ComponentChild): c is VNode {
  return isValidElement(c) && c.type === Slottable
}

interface SlottableProperties {
  children: ComponentChildren
}

function Slottable(p: SlottableProperties): JSX.Element {
  return <>{p.children}</>
}

interface SlotCloneProperties {
  children: preact.ComponentChildren
}

function SlotClone(p: SlotCloneProperties): VNode | null {
  const {children, ...o} = p
  if (isValidElement(children)) {
    const p = merge(o, children.props)
    return cloneElement(children, p)
  }
  return null
}
