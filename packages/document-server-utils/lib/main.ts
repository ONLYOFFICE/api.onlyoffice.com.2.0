// todo: complete implementations.

import {
  type DocEditorConfig,
  type DocEditorConfigDocument,
  type DocEditorConfigEditorConfig,
  type DocEditorConfigEditorConfigCustomization,
  type DocEditorConfigEvents,
} from "@onlyoffice/document-server-types"

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

export function mergeConfig(
  a: DocEditorConfig,
  b: DocEditorConfig,
): DocEditorConfig {
  const c = {...a}

  if (a.document && b.document) {
    c.document = mergeConfigDocument(a.document, b.document)
  } else if (a.document) {
    c.document = a.document
  } else if (b.document) {
    c.document = b.document
  }

  if (a.editorConfig && b.editorConfig) {
    c.editorConfig = mergeConfigEditorConfig(a.editorConfig, b.editorConfig)
  } else if (a.editorConfig) {
    c.editorConfig = a.editorConfig
  } else if (b.editorConfig) {
    c.editorConfig = b.editorConfig
  }

  return c
}

function mergeConfigDocument(
  a: DocEditorConfigDocument,
  b: DocEditorConfigDocument,
): DocEditorConfigDocument {
  const c = {...a}

  if (a.fileType && b.fileType) {
    c.fileType = b.fileType
  } else if (a.fileType) {
    c.fileType = a.fileType
  } else if (b.fileType) {
    c.fileType = b.fileType
  }

  return c
}

function mergeConfigEditorConfig(
  a: DocEditorConfigEditorConfig,
  b: DocEditorConfigEditorConfig,
): DocEditorConfigEditorConfig {
  const c = {...a}

  if (a.customization && b.customization) {
    c.customization = mergeConfigEditorConfigCustomization(
      a.customization,
      b.customization,
    )
  } else if (a.customization) {
    c.customization = a.customization
  } else if (b.customization) {
    c.customization = b.customization
  }

  return c
}

function mergeConfigEditorConfigCustomization(
  a: DocEditorConfigEditorConfigCustomization,
  b: DocEditorConfigEditorConfigCustomization,
): DocEditorConfigEditorConfig["customization"] {
  const c = {...a}

  if (a.zoom && b.zoom) {
    c.zoom = b.zoom
  } else if (a.zoom) {
    c.zoom = a.zoom
  } else if (b.zoom) {
    c.zoom = b.zoom
  }

  return c
}

export function normalizeConfig(c: DocEditorConfig): DocEditorConfig {
  c = {...c}

  if (c.documentType) {
    let d = c.document
    if (!d) {
      d = {
        fileType: "",
        key: "",
        title: "",
        url: "",
      }
      c.document = d
    }

    if (!d.fileType) {
      switch (c.documentType) {
      case "cell":
        d.fileType = "xlsx"
        break
      case "pdf":
        d.fileType = "pdf"
        break
      case "slide":
        d.fileType = "pptx"
        break
      case "word":
        d.fileType = "docx"
        break
      }
    }
  }

  return c
}
