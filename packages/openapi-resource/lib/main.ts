import type {OpenAPIV3_1 as OpenAPI} from "openapi-types"
import Pick from "stream-json/filters/Pick.js"

export class PickPath extends Pick {
  constructor() {
    super({filter: "paths"})
  }
}

export class PickComponent extends Pick {
  constructor(key: keyof OpenAPI.ComponentsObject) {
    super({filter: `components.${key}`})
  }
}
