// The current global navigation relies on css, which is not the optimal
// solution. Creating a dedicated web component that implements the menubar
// pattern for global navigation would be beneficial.
//
// https://www.w3.org/WAI/ARIA/apg/patterns/menubar/

import {Sitemap} from "@onlyoffice/eleventy-sitemap"
import {CloseIcon, MenuIcon} from "@onlyoffice/ui-icons/poor/24.tsx"
import {type JSX, h} from "preact"
import {Icon} from "./icon.tsx"
import {Link} from "./link.tsx"

declare module "@onlyoffice/eleventy-types" {
  interface Data {
    globalNavigation?: GlobalNavigationData
  }

  interface EleventyComputed {
    globalNavigation?(data: Data): GlobalNavigationData | undefined
  }
}

export interface GlobalNavigationData {
  icon: string
  title: string
  path: string
}

export class GlobalNavigationDatum implements GlobalNavigationData {
  icon = ""
  title = ""
  path = ""

  static merge(a: GlobalNavigationData, b: GlobalNavigationData): GlobalNavigationData {
    const c = new GlobalNavigationDatum()

    if (b.icon) {
      c.icon = b.icon
    } else if (a.icon) {
      c.icon = a.icon
    }

    if (b.title) {
      c.title = b.title
    } else if (a.title) {
      c.title = a.title
    }

    if (b.path) {
      c.path = b.path
    } else if (a.path) {
      c.path = a.path
    }

    return c
  }
}

export interface GlobalNavigationProperties {
  current: string
}

export function GlobalNavigation(p: GlobalNavigationProperties): JSX.Element {
  const s = Sitemap.shared

  const e = s.find("/", "url")
  if (!e || e.type !== "page") {
    throw new Error("Root page not found")
  }

  return <global-navigation-container class="global-navigation">
    <button class="global-navigation__toggle" type="button">
      <MenuIcon width={24} height={24} />
      <CloseIcon width={24} height={24} />
    </button>
    <nav class="global-navigation__nav" aria-label="Global Navigation">
      <ul class="global-navigation__menu">
        {e.children.map((id) => {
          const e = s.find(id, "id")
          if (!e) {
            throw new Error(`Entity not found: ${id}`)
          }
          if (e.type !== "page") {
            throw new Error(`Entity is not a page: ${id}`)
          }

          let c = "global-navigation__menu-link"
          if (p.current.startsWith(e.url)) {
            c += " global-navigation__menu-link_active"
          }

          return <li class="global-navigation__menu-item">
            <a class={c} href={e.url}>{e.title}</a>
            <ul class="global-navigation__submenu">
              {e.children.map((id) => {
                const e = s.find(id, "id")
                if (!e) {
                  throw new Error(`Entity not found: ${id}`)
                }
                if (e.type !== "page") {
                  throw new Error(`Entity is not a page: ${id}`)
                }

                const n = e.data.globalNavigation
                if (!n) {
                  throw new Error(`Global navigation data not found: ${id}`)
                }

                return <li class="global-navigation__submenu-item">
                  <Icon src="rich24" name={n.icon} height={24} width={24} />
                  <Link class="global-navigation__submenu-link" href={n.path}>{n.title}</Link>
                </li>
              })}
            </ul>
          </li>
        })}
      </ul>
    </nav>
  </global-navigation-container>
}
