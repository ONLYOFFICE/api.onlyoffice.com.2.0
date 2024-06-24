import type {ChildrenIncludable} from "@onlyoffice/preact-types"
import {ChevronRightIcon} from "@onlyoffice/ui-icons/poor/12.tsx"
import {type JSX, Fragment, h, toChildArray, cloneElement} from "preact"
import type {HTMLAttributes} from "preact/compat"

/**
 * {@link https://www.w3.org/WAI/ARIA/apg/patterns/breadcrumb/ W3C Reference}
 */
export function Breadcrumb({children, ...props}: HTMLAttributes<HTMLElement>): JSX.Element {
  const crumbs = toChildArray(children)

  return <nav class="breadcrumb" {...props}>
    {crumbs.map((c, i) => <C key={i} index={i}>{c}</C>)}
  </nav>

  function C({index, children}: ChildrenIncludable & {index: number}): JSX.Element {
    if (index === crumbs.length - 1) {
      return cloneElement(children, {"aria-current": "page"})
    }
    return <>{children}<ChevronRightIcon class="breadcrumb__separator" /></>
  }
}

export function BreadcrumbCrumb(
  {children, ...props}: HTMLAttributes<HTMLAnchorElement>
): JSX.Element {
  if (props.href === undefined) {
    return <span>{children}</span>
  }
  return <a class="breadcrumb__crumb" {...props}>{children}</a>
}
