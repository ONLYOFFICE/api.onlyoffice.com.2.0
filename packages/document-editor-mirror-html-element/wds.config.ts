import {type DevServerConfig} from "@web/dev-server"
import {esbuildPlugin} from "@web/dev-server-esbuild"

const config: DevServerConfig = {
  nodeResolve: true,
  plugins: [esbuildPlugin({ts: true})],
  watch: true,
}

export default config
