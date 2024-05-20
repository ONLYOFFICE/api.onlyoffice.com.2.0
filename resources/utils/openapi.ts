import type {OpenAPIComponentsKey} from "@onlyoffice/openapi-service"
import Pick from "stream-json/filters/Pick.js"

export class PickPath extends Pick {
  constructor() {
    super({filter: "paths"})
  }
}

export class PickComponent extends Pick {
  constructor(key: OpenAPIComponentsKey) {
    super({filter: `components.${key}`})
  }
}
