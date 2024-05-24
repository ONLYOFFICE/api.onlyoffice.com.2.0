/**
 * @typedef {import("@web/dev-server").DevServerConfig} DevServerConfig
 */

import {esbuildPlugin} from "@web/dev-server-esbuild"

export default config()

/**
 * @returns {DevServerConfig}
 */
function config() {
  return {
    nodeResolve: true,
    plugins: [esbuildPlugin({ts: true})],
    watch: true
  }
}
