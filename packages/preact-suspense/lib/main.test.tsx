// todo: complete test cases

import {setTimeout} from "node:timers/promises"
import {type JSX} from "preact"
import {renderToStringAsync as render} from "preact-render-to-string"
import {test} from "uvu"
import {is} from "uvu/assert"
import {createSuspense, useSuspense} from "./main.tsx"

test("", async () => {
  const [r, P] = createSuspense()
  const p = render(<P><C /></P>)
  r()
  const s = await p
  is(s, "1")
})

function C(): JSX.Element {
  let r = 0
  const Suspense = useSuspense(async () => {
    await setTimeout(100)
    r = 1
  })
  return <Suspense>{() => r}</Suspense>
}

test.run()
