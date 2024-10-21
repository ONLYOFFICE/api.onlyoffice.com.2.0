import {type Data} from "@onlyoffice/eleventy-types"
import {Config} from "@onlyoffice/site-config"

export function data(): Data {
  const c = Config.shared
  return {
    layout: null,
    order: -2,
    url: c.storybookUrl,
    blank: true,
  }
}

export function render(): string {
  return ""
}
