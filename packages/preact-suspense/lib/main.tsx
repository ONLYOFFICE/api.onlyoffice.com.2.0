// todo: explain what this file does.

import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import {type JSX, createContext, toChildArray} from "preact"
import {Suspense, useContext} from "preact/compat"

interface Contextual {
  register(_: Deferred): void
}

const Context = createContext<Contextual>({
  register(_: Deferred): void {
    throw new Error("Not implemented")
  },
})

export interface SuspenseResolver {
  (): void
}

export interface SuspenseProvider {
  (p: ChildrenIncludable): JSX.Element
}

export function createSuspense(): [SuspenseResolver, SuspenseProvider] {
  const s: Deferred[] = []

  return [resolve, Provider]

  function Provider(p: ChildrenIncludable): JSX.Element {
    return <Context.Provider value={{register}}>{p.children}</Context.Provider>
  }

  function register(d: Deferred): void {
    s.push(d)
  }

  function resolve(): void {
    while (s.length !== 0) {
      const d = s.pop()
      if (d) {
        d.resolve()
      }
    }
  }
}

export interface SuspenseCallback {
  (): PromiseLike<void>
}

export interface SuspenseConsumer {
  (p: ChildrenIncludable): JSX.Element
}

export function useSuspense(cb: SuspenseCallback): SuspenseConsumer {
  const c = useContext(Context)

  const d = new Deferred(cb)
  c.register(d)

  let r = false
  // eslint-disable-next-line @typescript-eslint/no-floating-promises
  d.promise
    .then(() => {
      r = true
    })
    .catch(null)

  return Consumer

  function Consumer(p: ChildrenIncludable): JSX.Element {
    return <Suspense fallback="This message should not be seen">
      <Suspender>{p.children}</Suspender>
    </Suspense>
  }

  function Suspender(p: ChildrenIncludable): JSX.Element {
    if (!r) {
      // eslint-disable-next-line @typescript-eslint/only-throw-error
      throw d.promise
    }
    return <>{toChildArray(p.children).map((ch) => {
      if (typeof ch === "function") {
        // @ts-ignore ChildrenIncludable is not quite appropriate in this case.
        return ch()
      }
      return ch
    })}</>
  }
}

interface DeferredCallback {
  (): PromiseLike<void>
}

// In the future, the Deferred class can be replaced with Promise.withResolvers.
// See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/withResolvers/
class Deferred {
  constructor(cb: DeferredCallback) {
    this.#promise = new Promise((res, rej) => {
      this.#resolve = res.bind(this, cb())
      this.#reject = rej
    })
  }

  #promise: Promise<void>

  get promise(): Promise<void> {
    return this.#promise
  }

  #resolve?: () => void

  resolve(): void {
    if (this.#resolve) {
      this.#resolve()
    }
  }

  #reject?: () => void

  reject(): void {
    if (this.#reject) {
      this.#reject()
    }
  }
}
