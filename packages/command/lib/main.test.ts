import {is} from "uvu/assert"
import {test} from "uvu"
import {command, hasCommand} from "./main.ts"

test("returns empty stdout and stderr if options are empty", async () => {
  const c = await command()
  is(c.stderr, "")
  is(c.stdout, "")
})

test("returns stdout and stderr if options are not empty", async () => {
  const c = await command(["-v", "sh"])
  is(c.stderr, "")
  is(c.stdout, "/bin/sh\n")
})

test("returns true if the command exists", async () => {
  const h = await hasCommand("sh")
  is(h, true)
})

test("returns false if the command does not exist", async () => {
  const h = await hasCommand("_sh")
  is(h, false)
})

test.run()
