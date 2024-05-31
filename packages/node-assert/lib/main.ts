import {AssertionError, deepStrictEqual} from "node:assert"

export function deepStrictEqualStructure(a: unknown, e: unknown): void {
  try {
    deepStrictEqual(a, e)
    throw new Error("Expected deepStrictEqual to throw")
  } catch (e) {
    if (!(e instanceof AssertionError)) {
      throw e
    }
    const m = e.message.split("\n")
    if (m[0] !== "Values have same structure but are not reference-equal:") {
      throw e
    }
  }
}
