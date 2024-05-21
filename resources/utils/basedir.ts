import {mkdir, mkdtemp} from "node:fs/promises"
import {existsSync} from "node:fs"
import {tmpdir} from "node:os"
import {join} from "node:path"
import {URL, fileURLToPath} from "node:url"
import pack from "../package.json" with {type: "json"}

/**
 * Creates a temporary directory.
 * @returns The path of the temporary directory.
 */
export async function createTempDir(): Promise<string> {
  const d = join(tmpdir(), pack.name.replace("/", "+"))
  return await mkdtemp(`${d}-`)
}

/**
 * Prepares the library directory.
 * @returns The path of the library directory.
 */
export async function prepareLibDir(): Promise<string> {
  const d = libDir()
  if (!existsSync(d)) {
    await mkdir(d)
  }
  return d
}

/**
 * @returns The path of the library directory.
 */
export function libDir(): string {
  return join(rootDir(), "lib")
}

/**
 * @returns The path of the root directory.
 */
export function rootDir(): string {
  const u = new URL("..", import.meta.url)
  return fileURLToPath(u)
}
