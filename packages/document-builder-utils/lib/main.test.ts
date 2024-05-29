import {is} from "uvu/assert"
import {test} from "uvu"
import {builder, fileType} from "./main.ts"

declare global {
  // eslint-disable-next-line no-var
  var UVU_VALUE: number | undefined
}

test.before.each(() => {
  globalThis.UVU_VALUE = undefined
})

test("builder methods do nothing by default", () => {
  const b = builder()
  is(b.CloseFile(), undefined)
  is(b.CreateFile(""), undefined)
  is(b.SaveFile("", ""), undefined)
})

test("allows to mock builder methods", () => {
  const b = builder()
  b.CloseFile = () => "a"
  b.CreateFile = () => "b"
  b.SaveFile = () => "c"
  is(b.CloseFile(), "a")
  is(b.CreateFile(""), "b")
  is(b.SaveFile("", ""), "c")
})

test("extracts an empty file type if no file is created", () => {
  const t = fileType("")
  is(t, "")
})

test("extracts a file type from a file creation", () => {
  const t = fileType('builder.CreateFile("docx")')
  is(t, "docx")
})

test("extracts a file type from a first file creation", () => {
  const t = fileType('builder.CreateFile("docx");builder.CreateFile("pdf")')
  is(t, "docx")
})

test("executes the code before a file creation", () => {
  globalThis.UVU_VALUE = 1
  fileType('globalThis.UVU_VALUE = 2;builder.CreateFile("docx")')
  is(globalThis.UVU_VALUE, 2)
})

test("does not continue execution after a file creation", () => {
  globalThis.UVU_VALUE = 1
  fileType('builder.CreateFile("docx");globalThis.UVU_VALUE = 2')
  is(globalThis.UVU_VALUE, 1)
})

test("does not throw an error if the code is invalid", () => {
  const t = fileType('builder.CreateFile("docx')
  is(t, "")
})

test.run()
