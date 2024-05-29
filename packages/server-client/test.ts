import {spawn} from "node:child_process"
import {exit} from "node:process"
import {setTimeout} from "node:timers/promises"

async function main(): Promise<void> {
  const s = spawnServer()

  const r = await waitServer()
  if (!r) {
    s.kill()
    throw new Error("Server not ready")
  }

  const t = spawnTest()

  return new Promise((res, rej) => {
    t.on("close", (code) => {
      s.kill()
      if (code === 0) {
        res()
        return
      }
      const err = new Error("Test process failed")
      rej(err)
    })
    t.on("error", (err) => {
      s.kill()
      rej(err)
    })
  })
}

function spawnServer(): ReturnType<typeof spawn> {
  return spawn("pnpm", ["run", "demo:server"], {stdio: ["pipe", "pipe", "pipe"]})
}

async function waitServer(): Promise<boolean> {
  const ret = 10
  const del = 300
  for (let i = 0; i < ret; i += 1) {
    try {
      await fetch("http://localhost:4000/")
      return true
    } catch {
      await setTimeout(del)
    }
  }
  return false
}

function spawnTest(): ReturnType<typeof spawn> {
  return spawn("pnpm", ["run", "test:all"], {stdio: "inherit"})
}

let c = 0
try {
  await main()
} catch (err) {
  console.error(err)
  c = 1
}

exit(c)
