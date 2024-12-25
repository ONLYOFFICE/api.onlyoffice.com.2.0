import * as Elements from "@onlyoffice/preact-elements"
import {SidebarIcon} from "@onlyoffice/ui-icons/poor/24.js"
import {clsx} from "clsx"
import {type JSX} from "preact"

export function Page(p: Elements.DivProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("page", o.class)

  return <page-container>
    <Elements.Div {...o} />
  </page-container>
}

export function PageHeader(p: Elements.DivProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("page__header", o.class)
  return <Elements.Div {...o} />
}

export function PageContent(p: Elements.DivProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("page__content", o.class)
  return <Elements.Div {...o} />
}

export function PageFooter(p: Elements.DivProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("page__footer", o.class)
  return <Elements.Div {...o} />
}

// todo: remove it

export interface PageHeaderNavTogglerProperties {
  label?: string
}

export function PageHeaderNavToggler(p: PageHeaderNavTogglerProperties): JSX.Element {
  return <button class="page-header-nav-toggler" aria-label={p.label} data-page-container-chapter-navigation-toggler>
    <SidebarIcon height={24} width={24} />
  </button>
}
