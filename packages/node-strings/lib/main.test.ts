import {is} from "uvu/assert"
import {test} from "uvu"
import {cutPrefix, cutSuffix} from "./main.ts"

test("cutPrefix(): returns an empty string when both strings are empty", () => {
  const s = cutPrefix("", "")
  is(s, "")
})

test("cutPrefix(): does not cut when a prefix is empty", () => {
  const s = cutPrefix("ab", "")
  is(s, "ab")
})

test("cutPrefix(): does not cut when the string does not start with a prefix", () => {
  const s = cutPrefix("ab", "c")
  is(s, "ab")
})

test("cutPrefix(): cuts when the string starts with a prefix", () => {
  const s = cutPrefix("ab", "a")
  is(s, "b")
})

test("cutPrefix(): cuts the length of the prefix when the string starts with a prefix", () => {
  const s = cutPrefix("aab", "a")
  is(s, "ab")
})

test("cutSuffix(): returns an empty string when both strings are empty", () => {
  const s = cutSuffix("", "")
  is(s, "")
})

test("cutSuffix(): does not cut when a suffix is empty", () => {
  const s = cutSuffix("ab", "")
  is(s, "ab")
})

test("cutSuffix(): does not cut when the string does not end with a suffix", () => {
  const s = cutSuffix("ab", "c")
  is(s, "ab")
})

test("cutSuffix(): cuts when the string ends with a suffix", () => {
  const s = cutSuffix("ab", "b")
  is(s, "a")
})

test("cutSuffix(): cuts the length of the suffix when the string ends with a suffix", () => {
  const s = cutSuffix("abb", "b")
  is(s, "ab")
})

test.run()
