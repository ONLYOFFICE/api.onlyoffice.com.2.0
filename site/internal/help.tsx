import {Help as SHelp} from "@onlyoffice/site-kit"
import {GithubIcon} from "@onlyoffice/ui-icons/rich/24.js"
import {type JSX, h} from "preact"
import {Link} from "./link.tsx"
import {Sitemap} from "./sitemap.ts"

declare module "@onlyoffice/eleventy-types" {
  interface Data {
    help?: HelpData
  }

  interface EleventyComputed {
    help?(data: Data): HelpData | undefined
  }
}

export interface HelpData {
  title: string
  faq: string
  forum: string
  issues: string
}

export class HelpDatum implements HelpData {
  title = ""
  faq = ""
  forum = ""
  issues = ""

  static merge(a: HelpData, b: HelpData): HelpData {
    const c = new HelpDatum()

    if (b.title) {
      c.title = b.title
    } else if (a.title) {
      c.title = a.title
    }

    if (b.faq) {
      c.faq = b.faq
    } else if (a.faq) {
      c.faq = a.faq
    }

    if (b.forum) {
      c.forum = b.forum
    } else if (a.forum) {
      c.forum = a.forum
    }

    if (b.issues) {
      c.issues = b.issues
    } else if (a.issues) {
      c.issues = a.issues
    }

    return c
  }
}

export interface HelpProperties {
  sitemapUrl: string
}

export function Help(p: HelpProperties): JSX.Element {
  const s = Sitemap.shared
  const e = s.findPageByUrl(p.sitemapUrl)

  let f = e.data.path
  let c = e

  for (const id of s.trailOf(e).reverse()) {
    try {
      const e = s.findPageById(id)
      const _ = e.help
      f = e.data.path
      c = e
      break
    } catch {
      continue
    }
  }

  const d = c.help

  return <SHelp>
    <GithubIcon height={24} width={24} />
    <h2>Get Help</h2>
    <ul>
      <li>
        If you have any questions about ONLYOFFICE {d.title}, try the{" "}
        <Link file={f} href={d.faq}>FAQ</Link> section first.
      </li>
      <li>
        You can request a feature or report a bug by posting an issue on{" "}
        <Link file={f} href={d.issues}>GitHub</Link>.
      </li>
      <li>
        You can also ask our developers on{" "}
        <Link file={f} href={d.forum}>ONLYOFFICE forum</Link> (registration required).
      </li>
    </ul>
  </SHelp>
}
