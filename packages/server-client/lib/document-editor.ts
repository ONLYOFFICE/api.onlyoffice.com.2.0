import type {DocEditorConfigurableOptions} from "@onlyoffice/document-server-types"
import type {Client} from "./client.ts"

interface InternalAssignResponse {
  jsonConfig: string
}

export type AssignResponse = DocEditorConfigurableOptions

export class DocumentEditorService {
  #c: Client

  constructor(c: Client) {
    this.#c = c
  }

  async assign(config: DocEditorConfigurableOptions): Promise<[AssignResponse, Request, Response]> {
    const u = this.#c.url("editors/configcreate")
    const b = {jsonConfig: JSON.stringify(config)}
    const req = this.#c.request("POST", u, b)
    const [i, res] = await this.#c.fetch<InternalAssignResponse>(req)
    const r = JSON.parse(i.jsonConfig)
    return [r, req, res]
  }
}
