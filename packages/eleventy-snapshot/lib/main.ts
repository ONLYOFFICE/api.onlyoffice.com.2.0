import {type UserConfig} from "@onlyoffice/eleventy-types"
import * as errors from "@onlyoffice/errors"
import {Snapshot} from "@onlyoffice/snapshot"
import pack from "../package.json" with {type: "json"}

export let snapshot: Snapshot

export function eleventySnapshot(uc: UserConfig): void {
  uc.on("eleventy.before", async () => {
    let err: Error | undefined
    [snapshot, err] = await Snapshot.capture()
    for (const e of errors.split(err)) {
      uc.logger.message(e.message, "error", "red", false, pack.name)
    }
  })
}
