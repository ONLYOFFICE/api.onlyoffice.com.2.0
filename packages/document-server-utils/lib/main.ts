import type {DocEditorConfig, DocEditorConfigEvents} from "@onlyoffice/document-server-types"

export function cloneConfig(cf: DocEditorConfig): DocEditorConfig {
  let cp = {...cf}
  if (cp.events) {
    cp.events = {}
  }

  cp = structuredClone(cp)
  if (cp.events && cf.events) {
    for (const [k, v] of Object.entries(cf.events)) {
      cp.events[k as keyof DocEditorConfigEvents] = v
    }
  }

  return cp
}
