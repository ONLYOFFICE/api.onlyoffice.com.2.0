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
    options: {
      storySort: {
        order: [
          "Site",
          "Site Regions",
          "Site Composites",
          "Site Patterns",
          "UI",
          "UI Foundation",
          "UI Assets",
          "UI Primitives",
          "UI Utilities",
        ],
      },
      // todo: sort stories by [Use Cases, Default, Playground, *]
      // Do not convert it into a regular function, it will not work.
      // storySort: (a, b) => {
      //   if (a.id === b.id) {
      //     return 0
      //   }
      //   return a.id.localeCompare(b.id, undefined, {numeric: true})
      // },
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

// todo: In the future we should import data of primitives from the
// @onlyoffice/ui-primitives package.

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

export interface VariablesCallback {
  (a: Variable[]): void
}

export function useVariables(p: string, cb: VariablesCallback): void {
  useEffect(() => {
    const e = document.documentElement

    const o = new MutationObserver(() => {
      cb(variables(p))
    })

    o.observe(e, {attributes: true})

    return o.disconnect.bind(o)
  }, [cb])
}

export class Variable {
  name = ""
  originalValue = ""
  computedValue = ""
}

function variables(x: string): Variable[] {
  const a: Variable[] = []
  const s = getComputedStyle(document.documentElement)
  const t = document.documentElement.dataset.themePreference

  const o: {
    root: Record<string, string>
    light: Record<string, string>
    dark: Record<string, string>
  } = {
    root: {},
    light: {},
    dark: {},
  }

  for (const p of s) {
    if (!p.startsWith("--")) {
      continue
    }
    if (x && !p.includes(x)) {
      continue
    }

    const v = new Variable()
    v.name = p
    v.computedValue = s.getPropertyValue(v.name)

    for (const s of document.styleSheets) {
      for (const r of s.cssRules) {
        if (
          r instanceof CSSStyleRule &&
          r.selectorText === ":root"
        ) {
          o.root[v.name] = r.style.getPropertyValue(v.name)
          continue
        }

        if (
          r instanceof CSSStyleRule &&
          r.selectorText.includes('[data-theme-preference="light"]')
        ) {
          o.light[v.name] = r.style.getPropertyValue(v.name)
          continue
        }

        if (
          r instanceof CSSStyleRule &&
          r.selectorText.includes('[data-theme-preference="dark"]')
        ) {
          o.dark[v.name] = r.style.getPropertyValue(v.name)
        }
      }
    }

    if (t === "dark" && o.dark[v.name]) {
      v.originalValue = o.dark[v.name]
    } else if (t === "light" && o.dark[v.name]) {
      v.originalValue = o.light[v.name]
    } else if (o.root[v.name]) {
      v.originalValue = o.root[v.name]
    } else {
      v.originalValue = v.computedValue
    }

    a.push(v)
  }

  return a.sort((a, b) => a.name.localeCompare(b.name))
}
