import {Sitemap} from "@onlyoffice/eleventy-sitemap"
import * as Site from "@onlyoffice/site-kit"
import {CloseIcon, MenuIcon} from "@onlyoffice/ui-icons/poor/24.tsx"
import {type JSX, h} from "preact"
import {Icon} from "./icon.tsx"
import {Link} from "./link.tsx"

declare module "@onlyoffice/eleventy-types" {
  interface Data {
    menubar?: MenubarData
  }

  interface EleventyComputed {
    menubar?(data: Data): MenubarData | undefined
  }
}

export interface MenubarData {
  icon: string
  title: string
  path: string
}

export class MenubarDatum implements MenubarData {
  icon = ""
  title = ""
  path = ""

  static merge(a: MenubarData, b: MenubarData): MenubarData {
    const c = new MenubarDatum()

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

export {MenubarAccessor} from "@onlyoffice/site-kit"

export interface MenubarProperties {
  current: string
}

export function Menubar(p: MenubarProperties): JSX.Element {
  const s = Sitemap.shared

  const e = s.find("/", "url")
  if (!e || e.type !== "page") {
    throw new Error("Root page not found")
  }

  return <Site.Menubar>
    <Site.MenubarToggle aria-label="Toggle Global Navigation">
      <MenuIcon width={24} height={24} />
      <CloseIcon width={24} height={24} />
    </Site.MenubarToggle>
    <Site.MenubarNavigation aria-label="Global Navigation">
      <Site.MenubarMenu>
        {e.children.map((id) => {
          const e = s.find(id, "id")
          if (!e) {
            throw new Error(`Entity not found: ${id}`)
          }
          if (e.type !== "page") {
            throw new Error(`Entity is not a page: ${id}`)
          }
          return <Site.MenubarMenuItem>
            <Site.MenubarMenuLink
              active={p.current.startsWith(e.url)}
              href={e.url}
            >
              {e.title}
            </Site.MenubarMenuLink>
            <Site.MenubarSubmenu>
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
                return <Site.MenubarSubmenuItem>
                  <Icon src="rich24" name={m.icon} height={24} width={24} />
                  <Site.MenubarSubmenuLink asChild>
                    <Link href={m.path}>
                      {m.title}
                    </Link>
                  </Site.MenubarSubmenuLink>
                </Site.MenubarSubmenuItem>
              })}
            </Site.MenubarSubmenu>
          </Site.MenubarMenuItem>
        })}
      </Site.MenubarMenu>
    </Site.MenubarNavigation>
  </Site.Menubar>
}
