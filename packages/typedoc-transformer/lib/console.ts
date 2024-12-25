import process from "node:process"
import {Console as NodeConsole} from "@onlyoffice/console"
import pack from "../package.json" with {type: "json"}

export class Console extends NodeConsole {
  static shared = new Console()

  constructor() {
    super(pack.name, process.stdout, process.stderr)
  }
}
