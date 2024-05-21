import {createWriteStream} from "node:fs"
import {finished} from "node:stream/promises"
import {Readable} from "node:stream"

/**
 * Downloads a file.
 * @param u The URL of the file to download.
 * @param p The path of the file to save.
 */
export async function downloadFile(u: string, p: string): Promise<void> {
  const res = await fetch(u)
  if (res.body === null) {
    throw new Error("No body")
  }
  // Uses two distinct types of ReadableStream: one from the DOM API and another
  // from NodeJS API. It functions well, so no need to worry.
  // @ts-ignore
  const r = Readable.fromWeb(res.body)
  const s = createWriteStream(p)
  const w = r.pipe(s)
  await finished(w)
}
