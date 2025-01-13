import * as Site from "@onlyoffice/site-kit"
import {CloseIcon, MenuIcon} from "@onlyoffice/ui-icons/poor/24.js"
import {type JSX, h} from "preact"
import {Icon} from "./icon.tsx"
import {Link} from "./link.tsx"
import {Sitemap} from "./sitemap.ts"

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
  sitemapUrl: string
}

export function Menubar(p: MenubarProperties): JSX.Element {
  const s = Sitemap.shared
  const e = s.root

  return <Site.Menubar>
    <Site.MenubarToggle aria-label="Toggle Global Navigation">
      <MenuIcon width={24} height={24} />
      <CloseIcon width={24} height={24} />
    </Site.MenubarToggle>
    <Site.MenubarNavigation aria-label="Global Navigation">
      <Site.MenubarMenu>
        {e.children.map((id) => {
          const e = s.findPageById(id)

          // todo: temporary
          if (e.canonicalUrl === "/404/") {
            return null
          }

          return <Site.MenubarMenuItem>
            <Site.MenubarMenuLink
              active={p.sitemapUrl.startsWith(e.sitemapUrl)}
              href={e.canonicalUrl}
            >
              {e.title}
            </Site.MenubarMenuLink>
            <Site.MenubarSubmenu>
              {e.children.map((id) => {
                const e = s.findPageById(id)
                const d = e.menubar

                return <Site.MenubarSubmenuItem>
                  <Icon src="rich24" name={d.icon} height={24} width={24} />
                  <Site.MenubarSubmenuLink asChild>
                    <Link href={d.path}>
                      {d.title}
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
