import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import {ChevronRightIcon} from "@onlyoffice/ui-icons/poor/12.tsx"
import {Fragment, type JSX, cloneElement, h, toChildArray} from "preact"
import {type HTMLAttributes} from "preact/compat"

/**
 * {@link https://www.w3.org/WAI/ARIA/apg/patterns/breadcrumb/ W3C Reference}
 */
export function Breadcrumb(p: HTMLAttributes<HTMLElement>): JSX.Element {
  const {children, ...props} = p
  const crumbs = toChildArray(children)

  return <nav class="breadcrumb" {...props}>
    {crumbs.map((c, i) => <C index={i}>{c}</C>)}
  </nav>

  function C(p: ChildrenIncludable & {index: number}): JSX.Element {
    if (p.index === crumbs.length - 1) {
      return cloneElement(p.children, {"aria-current": "page"})
    }
    return <>{p.children}<ChevronRightIcon width={11} class="breadcrumb__separator" /></>
  }
}

export function BreadcrumbCrumb(p: HTMLAttributes<HTMLAnchorElement>): JSX.Element {
  const {children, ...props} = p
  if (props.href === undefined) {
    return <span>{children}</span>
  }
  return <a class="breadcrumb__crumb" {...props}>{children}</a>
}
