// todo: replace with `config/sitemap.ts`.

import type { JSX } from "preact"
import { Fragment, h } from "preact"
import { Breadcrumbs as NativeBreadcrumbs } from "../components/breadcrumbs/breadcrumbs.ts"
import { Chapter } from "../components/chapter/chapter.ts"
import { Tree } from "../components/tree/tree.ts"
import type { Eleventy } from "../config/eleventy.ts"
import { useChildren } from "../config/eleventy.ts"
import { retrieve } from "../config/sitemap.ts"

export function data() {
  return {
    layout: "page"
  }
}

export function render(ctx: Eleventy.Context): JSX.Element {
  const children = useChildren(ctx)
  const breadcrumbs = <Breadcrumbs url={ctx.page.url} />
  return (
    <Chapter>
      <Chapter.Navigation>
        <Navigation {...ctx} />
      </Chapter.Navigation>
      {breadcrumbs && (
        <Chapter.Breadcrumbs>
          {breadcrumbs}
        </Chapter.Breadcrumbs>
      )}
      <main>
        {children}
      </main>
    </Chapter>
  )
}

function Navigation(ctx: Omit<Eleventy.Context, "children">): JSX.Element | null {
  const c = ctx.collections.navigation.find((c) => {
    return ctx.page.url.startsWith(c.link)
  })
  if (c === undefined) {
    return null
  }
  // todo: check if c is undefined, in ideal case it should never be undefined.
  return (
    <Tree>
      {c.children && c.children.map((c) => (
        <Tree.Group key={c.link}>
          <Tree.Link href={c.link} active={ctx.page.url === c.link}>{c.title}</Tree.Link>
          {c.children && <SubTree {...ctx} chapter={c} />}
        </Tree.Group>
      ))}
    </Tree>
  )
}

function SubTree(
  {
    chapter: c,
    ...ctx
  }
): JSX.Element {
  return (
    <>
      {c.children && c.children.map((c) => (
        <Tree.Item expanded={ctx.page.url.startsWith(c.link)}>
          <Tree.Link href={c.link} active={ctx.page.url === c.link}>{c.title}</Tree.Link>
          {c.children && <SubTree {...ctx} chapter={c} />}
        </Tree.Item>
      ))}
    </>
  )
}

interface BreadcrumbsProperties {
  url: string
}

function Breadcrumbs({ url }: BreadcrumbsProperties): JSX.Element | null {
  const crumbs: JSX.Element[] = []

  let u = url
  while (true) {
    const p = retrieve(u)
    if (p === undefined) {
      break
    }
    crumbs.unshift(
      <NativeBreadcrumbs.Crumb
        active={p.url === url}
        href={p.url}
      >
        {p.title}
      </NativeBreadcrumbs.Crumb>
    )
    if (p.parent === undefined) {
      break
    }
    u = p.parent
  }

  if (crumbs.length === 0) {
    return null
  }

  return (
    <NativeBreadcrumbs>
      {crumbs}
    </NativeBreadcrumbs>
  )
}
