// todo: The web-component should be makeover to ensure it aligns with the other
// element containers. Also, needs to separate the tree pattern.
// https://www.w3.org/WAI/ARIA/apg/patterns/treeview/

import {useSlots} from "@onlyoffice/preact-slots"
import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import {ArrowDropdownIcon} from "@onlyoffice/ui-icons/poor/24.tsx"
import {clsx} from "clsx"
import {type JSX, cloneElement, h} from "preact"
import {type HTMLAttributes} from "preact/compat"

export function Tree(p: ChildrenIncludable): JSX.Element {
  return <chapter-navigation class="tree">
    <ul class="tree__limb tree__limb_bole">
      {p.children}
    </ul>
  </chapter-navigation>
}

export function TreeGroup(p: ChildrenIncludable): JSX.Element {
  const [slots, outer] = useSlots(p.children, {
    link: TreeLink,
  })
  return <li class="tree__branch tree__branch_bole">
    <div class="tree__twig">
      {/* @ts-ignore The useSlots hooks are the source of the type issue. */}
      {cloneElement(slots.link, {class: "tree__leaf_bole"})}
    </div>
    <ul class="tree__limb">
      {outer}
    </ul>
  </li>
}

export interface TreeItemProperties extends ChildrenIncludable {
  expanded?: boolean
}

export function TreeItem(p: TreeItemProperties): JSX.Element {
  const [slots, outer] = useSlots(p.children, {
    link: TreeLink,
  })

  if (outer.length === 0) {
    return <li class="tree__branch">
      <div class="tree__twig">
        {slots.link}
      </div>
    </li>
  }

  return <li class="tree__branch">
    <div class={clsx("tree__twig", !p.expanded && "tree__twig_closed")}>
      <button class="tree__fruit" type="button"><ArrowDropdownIcon width={24} height={24} /></button>{slots.link}
    </div>
    <ul class="tree__limb">
      {outer}
    </ul>
  </li>
}

export interface TreeLinkProperties extends ChildrenIncludable {
  active?: boolean
  blank?: boolean
  class?: string
  href?: string
}

export function TreeLink(p: TreeLinkProperties): JSX.Element {
  const c = clsx(p.class, "tree__leaf", p.active && "tree__leaf_current")
  if (!p.href) {
    return <span class={c}>{p.children}</span>
  }
  const o: HTMLAttributes<HTMLAnchorElement> = {
    class: c,
    href: p.href,
    children: p.children,
  }
  if (p.blank) {
    o.target = "_blank"
  }
  return <a {...o} />
}
