import {
  Menubar,
  MenubarMenu,
  MenubarMenuItem,
  MenubarMenuLink,
  MenubarNavigation,
  MenubarSubmenu,
  MenubarSubmenuItem,
  MenubarSubmenuLink,
  MenubarToggle,
} from "@onlyoffice/site-kit"
import {CloseIcon, MenuIcon} from "@onlyoffice/ui-icons/poor/24.js"
import {JavascriptSdkIcon} from "@onlyoffice/ui-icons/rich/24.js"
import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"

export default {
  title: "Site Patterns / Menubar",
} satisfies Meta

export const Default: StoryObj = {
  parameters: {
    controls: {
      disable: true,
    },
    actions: {
      disable: true,
    },
  },
  render() {
    return <Menubar>
      <MenubarToggle>
        <MenuIcon width={24} height={24} />
        <CloseIcon width={24} height={24} />
      </MenubarToggle>
      <MenubarNavigation aria-label="Global Navigation">
        <MenubarMenu>
          {["DocSpace", "Docs", "Workspace"].map((n) => <MenubarMenuItem>
            <MenubarMenuLink href={location.href}>
              {n}
            </MenubarMenuLink>
            <MenubarSubmenu>
              <MenubarSubmenuItem>
                <JavascriptSdkIcon width={24} height={24} />
                <MenubarSubmenuLink href={location.href}>
                  JavaScript SDK
                </MenubarSubmenuLink>
              </MenubarSubmenuItem>
              <MenubarSubmenuItem>
                <JavascriptSdkIcon width={24} height={24} />
                <MenubarSubmenuLink href={location.href}>
                  JavaScript SDK
                </MenubarSubmenuLink>
              </MenubarSubmenuItem>
              <MenubarSubmenuItem>
                <JavascriptSdkIcon width={24} height={24} />
                <MenubarSubmenuLink href={location.href}>
                  JavaScript SDK
                </MenubarSubmenuLink>
              </MenubarSubmenuItem>
              <MenubarSubmenuItem>
                <JavascriptSdkIcon width={24} height={24} />
                <MenubarSubmenuLink href={location.href}>
                  JavaScript SDK
                </MenubarSubmenuLink>
              </MenubarSubmenuItem>
            </MenubarSubmenu>
          </MenubarMenuItem>)}
        </MenubarMenu>
      </MenubarNavigation>
    </Menubar>
  },
}
