import {argv} from "node:process"
import sade from "sade"
import * as typedoc from "./typedoc.ts"

export {type InputConfig as Config} from "./shared.ts"

export function main(): void {
  sade("resource")
    .command("typedoc")
    .action(typedoc.run)
    .parse(argv)
}
