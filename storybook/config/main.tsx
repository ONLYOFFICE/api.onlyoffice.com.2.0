import {FontsPreload} from "@onlyoffice/ui-kit"
import {type StorybookConfig} from "@storybook/preact-vite"
import browserslist from "browserslist"
import {browserslistToTargets} from "lightningcss"
import {h} from "preact"
import {renderToString} from "preact-render-to-string"

// https://storybook.js.org/docs/8.5/api/main-config/main-config-indexers

const config: StorybookConfig = {
  framework: "@storybook/preact-vite",
  addons: [
    "@storybook/addon-essentials",
    "@storybook/addon-storysource",
    "@storybook/addon-a11y",
    "@storybook/addon-viewport",
  ],
  stories: [
    "../stories/**/*.story.tsx",
  ],
  staticDirs: [
    {from: "../../packages/pagefind-fixtures/dist/pagefind", to: "pagefind"},
    "../../site/assets/images",
    "../../site/static",
    "../node_modules/@onlyoffice/ui-kit/node_modules/@onlyoffice/ui-fonts/dist",
  ],
  previewHead(head) {
    return head + renderToString(<FontsPreload />)
  },
  async viteFinal(d) {
    const {defineConfig, mergeConfig} = await import("vite")
    const l = browserslist("> 0.2% and not dead")
    const t = browserslistToTargets(l)
    const c = defineConfig({
      css: {
        transformer: "lightningcss",
        lightningcss: {
          drafts: {
            customMedia: true,
          },
          targets: t,
        },
      },
    })
    return mergeConfig(d, c)
  },
}

export default config
