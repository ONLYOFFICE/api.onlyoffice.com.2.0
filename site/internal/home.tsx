import {Sitemap} from "@onlyoffice/eleventy-sitemap"
import {
  HomeHero,
  HomeIn,
  HomeLink,
  HomeLinks,
  HomePart,
  type HomePartParameters,
  HomePreview,
  Home as SHome,
  SearchClear,
  SearchContainer,
  SearchField,
  SearchPlaceholder,
} from "@onlyoffice/site-kit"
import {CodePreview} from "@onlyoffice/ui-kit"
import {type JSX, h} from "preact"
import {Icon} from "./icon.tsx"
import {Image} from "./image.tsx"
import {Link} from "./link.tsx"
import {SyntaxHighlight} from "./syntax-highlight.tsx"

declare module "@onlyoffice/eleventy-types" {
  interface Data {
    home?: HomeData
  }

  interface EleventyComputed {
    home?(data: Data): HomeData | undefined
  }
}

export interface HomeData {
  image: {
    alt: string
    src: string
    width: number
    height: number
  }
  title: string
  description: string
  sample: {
    syntax: string
    code: string
  }
}

export class HomeDatum implements HomeData {
  image = {
    alt: "",
    src: "",
    width: -1,
    height: -1,
  }
  title = ""
  description = ""
  sample = {
    syntax: "",
    code: "",
  }

  static merge(a: HomeData, b: HomeData): HomeData {
    const c = new HomeDatum()

    if (b.image) {
      c.image = b.image
    } else if (a.image) {
      c.image = a.image
    }

    if (b.title) {
      c.title = b.title
    } else if (a.title) {
      c.title = a.title
    }

    if (b.description) {
      c.description = b.description
    } else if (a.description) {
      c.description = a.description
    }

    if (b.sample) {
      c.sample = b.sample
    } else if (a.sample) {
      c.sample = a.sample
    }

    return c
  }
}

export function Home(): JSX.Element {
  const s = Sitemap.shared

  const e = s.find("/", "url")
  if (!e) {
    throw new Error("Root entity not found")
  }
  if (e.type !== "page") {
    throw new Error("Root entity is not a page")
  }

  return <SHome>
    <HomeHero>
      <h1>Welcome to ONLYOFFICE API</h1>
      <SearchContainer size="large">
        <SearchPlaceholder>Search in all sections</SearchPlaceholder>
        <SearchField label="Search" />
        <SearchClear label="Clear" />
      </SearchContainer>
    </HomeHero>
    {e.children.map((id, i) => {
      const e = s.find(id, "id")
      if (!e) {
        throw new Error(`Entity not found: ${id}`)
      }
      if (e.type !== "page") {
        throw new Error(`Entity is not a page: ${id}`)
      }

      const d = e.data.home
      if (!d) {
        throw new Error(`Home data not found: ${id}`)
      }

      let v: HomePartParameters["variant"] = "default"
      if (i % 2 !== 0) {
        v = "reverse"
      }

      return <HomePart variant={v}>
        <HomeIn>
          <h2><a href={e.url}>{d.title}</a></h2>
          <p>{d.description}</p>
          <a href={e.url}>More</a>
        </HomeIn>
        <HomeLinks>
          {e.children.map((id) => {
            const e = s.find(id, "id")
            if (!e) {
              throw new Error(`Entity not found: ${id}`)
            }
            if (e.type !== "page") {
              throw new Error(`Entity is not a page: ${id}`)
            }

            const m = e.data.menubar
            if (!m) {
              throw new Error(`Menubar data not found: ${id}`)
            }

            return <HomeLink>
              <Icon src="rich32" name={m.icon} height={32} width={32} />
              <Link href={m.path}>{m.title}</Link>
            </HomeLink>
          })}
        </HomeLinks>
        <HomePreview>
          <a href={e.url} title={d.title} />
          <Image alt={d.image.alt} src={d.image.src} />
          <CodePreview>
            <pre><code><SyntaxHighlight syntax={d.sample.syntax}>
              {d.sample.code}
            </SyntaxHighlight></code></pre>
          </CodePreview>
        </HomePreview>
      </HomePart>
    })}
  </SHome>
}
