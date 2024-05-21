import child from "node:child_process"
import {promisify} from "node:util"

const exec = promisify(child.exec)

export async function hasCommand(n: string): Promise<boolean> {
  try {
    const c = await command(["-v", n])
    if (c.stderr !== "" || c.stdout === "") {
      return false
    }
    return true
  } catch {
    return false
  }
}

export async function command(opts: string[] = []): Promise<Awaited<ReturnType<typeof exec>>> {
  return await exec(`command ${opts.join(" ")}`)
}
