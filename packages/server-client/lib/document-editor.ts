import {type DocEditorConfigurableOptions} from "@onlyoffice/document-server-types"
import {type Client} from "./client.ts"

export interface SignSearchOptions {
  empty: boolean
}

export class DocumentEditorService {
  #c: Client

  constructor(c: Client) {
    this.#c = c
  }

  async sign(
    options: SignSearchOptions,
    config: DocEditorConfigurableOptions,
  ): Promise<[DocEditorConfigurableOptions, Request, Response]> {
    // If we send a payload to the server without including the required keys,
    // the server will respond without headers and body. While this is a
    // server-side issue, it is easier to "fix" it on our end for now.
    // https://github.com/ONLYOFFICE/api.onlyoffice.com/blob/v5.1.0/web/Helpers/Config.cs/

    const c = structuredClone(config)
    if (!c.document) {
      c.document = {fileType: "", key: "", title: "", url: ""}
    }
    if (c.document && !c.document.fileType) {
      c.document.fileType = ""
    }
    if (c.document && !c.document.key) {
      c.document.key = ""
    }
    if (c.document && !c.document.title) {
      c.document.title = ""
    }
    if (c.document && !c.document.url) {
      c.document.url = ""
    }
    if (c.document && c.document.info && c.document.info.sharingSettings) {
      for (const s of c.document.info.sharingSettings) {
        if (!s.permissions) {
          // @ts-ignore I hope this will be resolved somehow on the server.
          s.permissions = ""
        }
        if (!s.user) {
          s.user = ""
        }
      }
    }
    if (!c.documentType) {
      // @ts-ignore I hope this will be resolved somehow on the server.
      c.documentType = ""
    }
    if (c.editorConfig && c.editorConfig.recent) {
      for (const i of c.editorConfig.recent) {
        if (!i.title) {
          i.title = ""
        }
        if (!i.url) {
          i.url = ""
        }
      }
    }
    if (c.editorConfig && c.editorConfig.templates) {
      for (const t of c.editorConfig.templates) {
        if (!t.title) {
          t.title = ""
        }
        if (!t.url) {
          t.url = ""
        }
      }
    }
    if (c.editorConfig && c.editorConfig.plugins && !c.editorConfig.plugins.pluginsData) {
      c.editorConfig.plugins.pluginsData = []
    }

    const u = this.#c.url("editors/configcreate", options)
    const req = this.#c.request("POST", u, c)
    const [r, res] = await this.#c.fetch<DocEditorConfigurableOptions>(req)
    return [r, req, res]
  }
}
