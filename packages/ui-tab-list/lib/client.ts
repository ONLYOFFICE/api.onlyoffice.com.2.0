/* eslint-disable import/no-unassigned-import */
import "@github/tab-container-element"
import {define} from "./client/define.ts"

export * from "./client/element.ts"
export * from "./client/global.ts"

define(window)

