import type {StorybookConfig} from "@storybook/preact-vite"
import {h} from "preact"
import {renderToString} from "preact-render-to-string"
import {Font} from "../../ui/font/lib/font.server.ts"

export default config()

function config(): StorybookConfig {
  return {
    framework: "@storybook/preact-vite",
    addons: [
      "@storybook/addon-essentials",
      "storybook-addon-paddings"
    ],
    stories: [
      "../../packages/site-*/lib/*.story.tsx",
      "../../packages/ui-*/lib/*.story.tsx"
    ],
    staticDirs: [
      "../../ui/font/static",
      "../../site/pages/_static"
    ],
    previewHead(head) {
      return head + renderToString(<Font.Links />)
    }
  }
}
