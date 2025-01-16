import {spawn} from "node:child_process"
import path from "node:path/posix"
import {env} from "node:process"
import {type Writable} from "node:stream"
import * as errors from "@onlyoffice/errors"
import {type Result} from "@onlyoffice/result"
import {StringWritable} from "@onlyoffice/stream-string"
import {type Static, Type} from "@sinclair/typebox"

declare global {
  namespace NodeJS {
    interface ProcessEnv {
      PKG_SNAPSHOT_SERVER_URL?: string
      PKG_SNAPSHOT_GITHUB_SERVER_URL?: string
      PKG_SNAPSHOT_GITEA_SERVER_URL?: string
      PKG_SNAPSHOT_REPOSITORY?: string
      PKG_SNAPSHOT_RUN_ID?: string
    }
  }
}

export class Snapshot {
  static get serverUrl(): string {
    const e = env.PKG_SNAPSHOT_SERVER_URL
    if (!e) {
      return ""
    }
    return new URL(e).toString()
  }

  static get githubServerUrl(): string {
    const e = env.PKG_SNAPSHOT_GITHUB_SERVER_URL
    if (!e) {
      return ""
    }
    return new URL(e).toString()
  }

  static get giteaServerUrl(): string {
    const e = env.PKG_SNAPSHOT_GITEA_SERVER_URL
    if (!e) {
      return ""
    }
    return new URL(e).toString()
  }

  static get repository(): string {
    return env.PKG_SNAPSHOT_REPOSITORY || ""
  }

  static get runId(): string {
    return env.PKG_SNAPSHOT_RUN_ID || ""
  }

  static get isGithubServer(): boolean {
    return Snapshot.serverUrl !== "" &&
      Snapshot.githubServerUrl !== "" &&
      Snapshot.serverUrl === Snapshot.githubServerUrl
  }

  static get isGiteaServer(): boolean {
    return Snapshot.serverUrl !== "" &&
      Snapshot.giteaServerUrl !== "" &&
      Snapshot.serverUrl === Snapshot.giteaServerUrl
  }

  /* eslint-disable @typescript-eslint/explicit-function-return-type */
  /* eslint-disable @typescript-eslint/explicit-module-boundary-types */
  /* eslint-disable camelcase */
  /* eslint-disable new-cap */
  static get schema() {
    return Type.Object({
      git_tag: Type.Optional(Type.String({description: "The Git tag"})),
      git_branch: Type.Optional(Type.String({description: "The Git branch"})),
      git_commit: Type.Optional(Type.String({description: "The Git commit"})),
      github_tag_url: Type.Optional(Type.String({description: "The URL to the GitHub tag"})),
      github_branch_url: Type.Optional(Type.String({description: "The URL to the GitHub branch"})),
      github_commit_url: Type.Optional(Type.String({description: "The URL to the GitHub commit"})),
      github_run_url: Type.Optional(Type.String({description: "The URL to the GitHub run"})),
      gitea_tag_url: Type.Optional(Type.String({description: "The URL to the Gitea tag"})),
      gitea_branch_url: Type.Optional(Type.String({description: "The URL to the Gitea branch"})),
      gitea_commit_url: Type.Optional(Type.String({description: "The URL to the Gitea commit"})),
      gitea_run_url: Type.Optional(Type.String({description: "The URL to the Gitea run"})),
      captured_at: Type.Optional(Type.String({description: "The time when the snapshot was captured"})),
    })
  }
  /* eslint-enable new-cap */
  /* eslint-enable camelcase */
  /* eslint-enable @typescript-eslint/explicit-module-boundary-types */
  /* eslint-enable @typescript-eslint/explicit-function-return-type */

  gitTag = ""
  gitBranch = ""
  gitCommit = ""
  githubTagUrl = ""
  githubBranchUrl = ""
  githubCommitUrl = ""
  githubRunUrl = ""
  giteaTagUrl = ""
  giteaBranchUrl = ""
  giteaCommitUrl = ""
  giteaRunUrl = ""
  capturedAt = ""

  static async capture(): Promise<Result<Snapshot, Error>> {
    const s = new Snapshot()
    let err: Error | undefined

    if (!Snapshot.serverUrl) {
      const e = new Error("The PKG_SNAPSHOT_SERVER_URL environment variable is not set")
      err = errors.join(err, e)
    }

    if (!Snapshot.githubServerUrl) {
      const e = new Error("The PKG_SNAPSHOT_GITHUB_SERVER_URL environment variable is not set")
      err = errors.join(err, e)
    }

    if (!Snapshot.giteaServerUrl) {
      const e = new Error("The PKG_SNAPSHOT_GITEA_SERVER_URL environment variable is not set")
      err = errors.join(err, e)
    }

    if (!Snapshot.repository) {
      const e = new Error("The PKG_SNAPSHOT_REPOSITORY environment variable is not set")
      err = errors.join(err, e)
    }

    if (!Snapshot.runId) {
      const e = new Error("The PKG_SNAPSHOT_RUN_ID environment variable is not set")
      err = errors.join(err, e)
    }

    try {
      const w = new StringWritable()
      await git(w, "describe", "--exact-match", "--tags")
      s.gitTag = w.buf.trimEnd()
    } catch (e) {
      const c = new Error(`Failed to capture the Git tag: ${e}`)
      err = errors.join(err, c)
    }

    try {
      const w = new StringWritable()
      await git(w, "branch", "--show-current")
      s.gitBranch = w.buf.trimEnd()
    } catch (e) {
      const c = new Error(`Failed to capture the Git branch: ${e}`)
      err = errors.join(err, c)
    }

    try {
      const w = new StringWritable()
      await git(w, "rev-parse", "HEAD")
      s.gitCommit = w.buf.trimEnd()
    } catch (e) {
      const c = new Error(`Failed to capture the Git commit: ${e}`)
      err = errors.join(err, c)
    }

    if (Snapshot.githubServerUrl && Snapshot.repository && s.gitTag) {
      const p = path.join(Snapshot.repository, "tree", s.gitTag, "/")
      const u = new URL(p, Snapshot.githubServerUrl)
      s.githubTagUrl = u.toString()
    }

    if (Snapshot.githubServerUrl && Snapshot.repository && s.gitBranch) {
      const p = path.join(Snapshot.repository, "tree", s.gitBranch, "/")
      const u = new URL(p, Snapshot.githubServerUrl)
      s.githubBranchUrl = u.toString()
    }

    if (Snapshot.githubServerUrl && Snapshot.repository && s.gitCommit) {
      const p = path.join(Snapshot.repository, "commit", s.gitCommit, "/")
      const u = new URL(p, Snapshot.githubServerUrl)
      s.githubCommitUrl = u.toString()
    }

    if (Snapshot.isGithubServer && Snapshot.repository && Snapshot.runId) {
      const p = path.join("actions", "runs", Snapshot.runId, "/")
      const u = new URL(p, Snapshot.githubServerUrl)
      s.githubRunUrl = u.toString()
    }

    if (Snapshot.giteaServerUrl && Snapshot.repository && s.gitTag) {
      const p = path.join(Snapshot.repository, "src", "tag", s.gitTag, "/")
      const u = new URL(p, Snapshot.giteaServerUrl)
      s.giteaTagUrl = u.toString()
    }

    if (Snapshot.giteaServerUrl && Snapshot.repository && s.gitBranch) {
      const p = path.join(Snapshot.repository, "src", "branch", s.gitBranch, "/")
      const u = new URL(p, Snapshot.giteaServerUrl)
      s.giteaBranchUrl = u.toString()
    }

    if (Snapshot.giteaServerUrl && Snapshot.repository && s.gitCommit) {
      const p = path.join(Snapshot.repository, "commit", s.gitCommit, "/")
      const u = new URL(p, Snapshot.giteaServerUrl)
      s.giteaCommitUrl = u.toString()
    }

    if (Snapshot.isGiteaServer && Snapshot.repository && Snapshot.runId) {
      const p = path.join("actions", "runs", Snapshot.runId, "/")
      const u = new URL(p, Snapshot.giteaServerUrl)
      s.giteaRunUrl = u.toString()
    }

    s.capturedAt = new Date().toISOString()

    return [s, err]
  }

  /* eslint-disable camelcase */
  toObject(): Static<typeof Snapshot.schema> {
    const o: Static<typeof Snapshot.schema> = {}

    if (this.gitTag) {
      o.git_tag = this.gitTag
    }

    if (this.gitBranch) {
      o.git_branch = this.gitBranch
    }

    if (this.gitCommit) {
      o.git_commit = this.gitCommit
    }

    if (this.githubTagUrl) {
      o.github_tag_url = this.githubTagUrl
    }

    if (this.githubBranchUrl) {
      o.github_branch_url = this.githubBranchUrl
    }

    if (this.githubCommitUrl) {
      o.github_commit_url = this.githubCommitUrl
    }

    if (this.githubRunUrl) {
      o.github_run_url = this.githubRunUrl
    }

    if (this.giteaTagUrl) {
      o.gitea_tag_url = this.giteaTagUrl
    }

    if (this.giteaBranchUrl) {
      o.gitea_branch_url = this.giteaBranchUrl
    }

    if (this.giteaCommitUrl) {
      o.gitea_commit_url = this.giteaCommitUrl
    }

    if (this.giteaRunUrl) {
      o.gitea_run_url = this.giteaRunUrl
    }

    if (this.capturedAt) {
      o.captured_at = this.capturedAt
    }

    return o
  }
  /* eslint-enable camelcase */
}

async function git(w: Writable, ...opts: string[]): Promise<void> {
  await new Promise((res, rej) => {
    const s = spawn("git", opts, {shell: true})

    s.on("error", rej)

    s.on("close", (c) => {
      if (c !== 0) {
        rej(new Error(`Git exited with code ${c}`))
      } else {
        res(null)
      }
    })

    s.stdout.on("data", (ch) => {
      w.write(ch)
    })
  })
}
