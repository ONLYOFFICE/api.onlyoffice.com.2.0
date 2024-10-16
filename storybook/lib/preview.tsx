/* eslint-disable import/no-unassigned-import */

import "@onlyoffice/site-kit/client.ts"
import "@onlyoffice/ui-kit/client.ts"
import {INITIAL_VIEWPORTS, type Viewport, type ViewportMap} from "@storybook/addon-viewport"
import {type Preview} from "@storybook/preact"
import {h} from "preact"
import {useEffect} from "preact/hooks"
import "./preview.css"

export default {
  globalTypes: {
    theme: {
      name: "Theme",
      description: "Choose the theme",
      defaultValue: "regular-auto",
      toolbar: {
        icon: "contrast",
        showName: true,
        dynamicTitle: true,
        items: [
          {title: "Regular Auto", value: "regular-auto"},
          {title: "Regular Light", value: "regular-light"},
          {title: "Regular Dark", value: "regular-dark"},
        ],
      },
    },
    paddings: {
      name: "Paddings",
      description: "Choose the padding",
      defaultValue: "Medium",
      toolbar: {
        icon: "box",
        showName: true,
        dynamicTitle: true,
        items: [
          {title: "None", value: "0px"},
          {title: "Small", value: "1rem"},
          {title: "Medium", value: "2rem"},
          {title: "Large", value: "4rem"},
        ],
      },
    },
  },
  parameters: {
    viewport: {
      viewports: {
        ...breakpoints(),
        ...INITIAL_VIEWPORTS,
      },
    },
  },
  decorators: [
    (Story, ctx) => {
      const {theme, paddings} = ctx.globals

      useEffect(() => {
        const [c, t] = theme.split("-")
        document.documentElement.dataset.darkTheme = c
        document.documentElement.dataset.lightTheme = c
        document.documentElement.dataset.themePreference = t
        document.documentElement.style.padding = paddings
      }, [theme])

      return <Story />
    },
  ],
} satisfies Preview

// todo: In the future, we should import a list of breakpoints as a JSON file
// from the @onlyoffice/ui-primitives package.
function breakpoints(): ViewportMap {
  const m: ViewportMap = {}
  const s = window.getComputedStyle(document.documentElement)
  for (const k of Object.values(s)) {
    if (k.includes("breakpoint")) {
      const w = s.getPropertyValue(k)
      const v: Viewport = {
        name: k,
        styles: {
          height: "100%",
          width: w,
        },
        type: "other",
      }
      m[k] = v
    }
  }
  return m
}
