/**
 * @typedef {import("@web/test-runner").TestRunnerConfig} TestRunnerConfig
 */

import {esbuildPlugin} from "@web/dev-server-esbuild"
import {playwrightLauncher} from "@web/test-runner-playwright"

export default config()

/**
 * @returns {TestRunnerConfig}
 */
function config() {
  return {
    nodeResolve: true,
    plugins: [
      esbuildPlugin({ts: true})
    ],
    files: ["lib/*.test.ts"],
    browsers: [
      playwrightLauncher({product: "chromium"}),
      playwrightLauncher({product: "firefox"}),
      playwrightLauncher({product: "webkit"})
    ],
    coverage: true,
    coverageConfig: {
      include: ["lib/*.ts"],
      report: true,
      threshold: 80
    }
  }
}
