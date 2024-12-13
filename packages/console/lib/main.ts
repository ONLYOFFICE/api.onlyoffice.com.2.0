import {Console as NodeConsole} from "node:console"
import {red, yellow} from "kleur/colors"

export class Console extends NodeConsole {
  #name: string
  #stdout: NodeJS.WritableStream
  #stderr: NodeJS.WritableStream

  constructor(
    name: string,
    stdout: NodeJS.WritableStream,
    stderr: NodeJS.WritableStream,
  ) {
    super(stdout, stderr)
    this.#name = name
    this.#stdout = stdout
    this.#stderr = stderr
  }

  copy(): Console {
    const c = new Console(this.#name, this.#stdout, this.#stderr)
    c.log = this.log.bind(c)
    c.warn = this.warn.bind(c)
    c.error = this.error.bind(c)
    return c
  }

  mute(): void {
    this.log = () => {}
    this.warn = () => {}
    this.error = () => {}
  }

  unmute(): void {
    this.log = this.#log.bind(this)
    this.warn = this.#warn.bind(this)
    this.error = this.#error.bind(this)
  }

  restore(c: Console): void {
    this.log = c.log.bind(c)
    this.warn = c.warn.bind(c)
    this.error = c.error.bind(c)
  }

  log(...data: Parameters<typeof NodeConsole["prototype"]["log"]>): void {
    this.#log(...data)
  }

  warn(...data: Parameters<typeof NodeConsole["prototype"]["warn"]>): void {
    this.#warn(...data)
  }

  error(...data: Parameters<typeof NodeConsole["prototype"]["error"]>): void {
    this.#error(...data)
  }

  #log(...data: Parameters<typeof NodeConsole["prototype"]["log"]>): void {
    const p = `${this.#prefix()} info:`
    super.log(p, ...data)
  }

  #warn(...data: Parameters<typeof NodeConsole["prototype"]["warn"]>): void {
    const p = yellow(`${this.#prefix()} warn:`)
    super.warn(p, ...data)
  }

  #error(...data: Parameters<typeof NodeConsole["prototype"]["error"]>): void {
    const p = red(`${this.#prefix()} error:`)
    super.error(p, ...data)
  }

  #prefix(): string {
    const d = new Date().toISOString()
    const n = this.#name.replace("@onlyoffice/", "")
    return `${d} ${n}`
  }
}
