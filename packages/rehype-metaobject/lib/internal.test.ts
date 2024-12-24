import {test} from "uvu"
import {equal as eq} from "uvu/assert"
import {parse} from "./internal.ts"

const cases: [string, object][] = [
  ["", {}],

  // Group of empty values
  ["a", {a: ""}],
  ["a b", {a: "", b: ""}],
  ["a=", {a: ""}],

  // Group of primitive values
  ["a=0", {a: 0}],
  ["a=''", {a: ""}],
  ['a=""', {a: ""}],
  ["a=true", {a: true}],
  ["a=false", {a: false}],
  ["a=null", {a: null}],

  // Group of array values
  ["a=[]", {a: []}],
  ["a=[0]", {a: [0]}],
  ["a=['']", {a: [""]}],
  ['a=[""]', {a: [""]}],
  ["a=[true]", {a: [true]}],
  ["a=[false]", {a: [false]}],
  ["a=[null]", {a: [null]}],

  // Group of object values
  ["a={}", {a: {}}],
  ["a={v: 0}", {a: {v: 0}}],
  ["a={v: ''}", {a: {v: ""}}],
  ['a={v: ""}', {a: {v: ""}}],
  ["a={v: true}", {a: {v: true}}],
  ["a={v: false}", {a: {v: false}}],
  ["a={v: null}", {a: {v: null}}],
  ["a={v: []}", {a: {v: []}}],
  ["a={v: {}}", {a: {v: {}}}],

  // Group of dot values
  ["a.v=0", {a: {v: 0}}],
  ["a.v=''", {a: {v: ""}}],
  ['a.v=""', {a: {v: ""}}],
  ["a.v=true", {a: {v: true}}],
  ["a.v=false", {a: {v: false}}],
  ["a.v=null", {a: {v: null}}],
  ["a.v=[]", {a: {v: []}}],
  ["a.v={}", {a: {v: {}}}],

  // Group of multiple values
  ["a=0 b=1", {a: 0, b: 1}],
  ["a={v: 0} b={v: 1}", {a: {v: 0}, b: {v: 1}}],
  ["a.v=0 b.v=1", {a: {v: 0}, b: {v: 1}}],
  ["a.x=0 a.y=1", {a: {x: 0, y: 1}}],
]

for (const [s, e] of cases) {
  test(s, () => {
    const a = parse(s)
    eq(a, e)
  })
}

test.run()
