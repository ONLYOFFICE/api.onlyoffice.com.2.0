// todo: replace with `config/sitemap.ts`.

import type {Data, Context} from "@onlyoffice/eleventy-types"
import {Chapter, ChapterContent, ChapterNavigation, Help} from "@onlyoffice/site-kit"
import {GithubIcon} from "@onlyoffice/ui-icons/rich/24.tsx"
import {Breadcrumb, BreadcrumbCrumb, Content} from "@onlyoffice/ui-kit"
import {type JSX, Fragment, h} from "preact"
import {Tree} from "../components/tree/tree.ts"
import {retrieve} from "../config/sitemap.ts"

export function data(): Data {
  return {
    layout: "page"
  }
}

export function render({content, ...ctx}: Context): JSX.Element {
  return <Chapter>
    <ChapterNavigation>
      <Navigation {...ctx} />
    </ChapterNavigation>
    <ChapterContent>
      <B url={ctx.page.url} />
      <Content>
        {ctx.title && <h1>{ctx.title}</h1>}
        {content}
      </Content>
      {/* todo */}
      {/* <Help>
        <GithubIcon width={24} height={24} />
        <h2>Get Help</h2>
        <ul>
          <li>If you have any questions about ONLYOFFICE DocSpace, try the <a href="/">FAQ</a> section first.</li>
          <li>You can request a feature or report a bug by posting an issue on <a href="/">GitHub</a>.</li>
          <li>You can also ask our developers on <a href="/">ONLYOFFICE forum</a> (registration required).</li>
        </ul>
      </Help> */}
    </ChapterContent>
  </Chapter>
}

function Navigation(ctx): JSX.Element {
  const c = ctx.collections.navigation.find((c) => {
    return ctx.page.url.startsWith(c.link)
  })
  if (c === undefined) {
    return <></>
  }
  // todo: check if c is undefined, in ideal case it should never be undefined.
  return <Tree>
    {c.children && c.children.map((c) => (
      <Tree.Group key={c.link}>
        <Tree.Link href={c.link} active={ctx.page.url === c.link}>{c.title}</Tree.Link>
        {c.children && <SubTree {...ctx} chapter={c} />}
      </Tree.Group>
    ))}
  </Tree>
}

function SubTree({chapter: c, ...ctx}): JSX.Element {
  return <>{c.children && c.children.map((c) => (
    <Tree.Item expanded={ctx.page.url.startsWith(c.link)}>
      <Tree.Link href={c.link} active={ctx.page.url === c.link}>{c.title}</Tree.Link>
      {c.children && <SubTree {...ctx} chapter={c} />}
    </Tree.Item>
  ))}</>
}

interface BProperties {
  url: string
}

function B({url}: BProperties): JSX.Element | null {
  const a: JSX.Element[] = []

  let u = url
  while (true) {
    const p = retrieve(u)
    if (p === undefined) {
      break
    }
    a.unshift(<BreadcrumbCrumb href={p.url}>{p.title}</BreadcrumbCrumb>)
    if (p.parent === undefined) {
      break
    }
    u = p.parent
  }

  if (a.length === 0) {
    return null
  }

  return <Breadcrumb>{a}</Breadcrumb>
}
