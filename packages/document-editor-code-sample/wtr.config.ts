import {esbuildPlugin} from "@web/dev-server-esbuild"
import {type TestRunnerConfig} from "@web/test-runner"
import {playwrightLauncher} from "@web/test-runner-playwright"
import c8 from "../../c8.config.json" with {type: "json"}

const config: TestRunnerConfig = {
  nodeResolve: true,
  plugins: [esbuildPlugin({ts: true})],
  files: ["lib/*.test.ts"],
  browsers: [
    playwrightLauncher({product: "chromium"}),
    playwrightLauncher({product: "firefox"}),
    playwrightLauncher({product: "webkit"}),
  ],
  coverage: true,
  coverageConfig: {
    include: ["lib/*.ts"],
    report: true,
    threshold: {
      statements: c8.statements,
      branches: c8.branches,
      functions: c8.functions,
      lines: c8.lines,
    },
  },
}

export default config
