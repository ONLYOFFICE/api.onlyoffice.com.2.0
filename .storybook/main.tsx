import type { StorybookConfig } from "@storybook/preact-vite"
import { h } from "preact"
import { renderToString } from "preact-render-to-string"
import { Font } from "../ui/font/lib/font.server.ts"

const config: StorybookConfig = {
  framework: "@storybook/preact-vite",
  addons: [
    "@storybook/addon-essentials",
    "storybook-addon-paddings"
  ],
  stories: [
    "../ui/*/lib/*.stories.tsx",
    "../site/src/components/*/*.stories.tsx",
    "./*.stories.tsx"
  ],
  staticDirs: [
    "../ui/font/static"
  ],
  previewHead(head) {
    return head + renderToString(<Font.Links />)
  }
}

export default config
