import {type Entity} from "@onlyoffice/library-declaration/next.ts"
import c from "./typedoc.json" with {type: "json"}

export class Resource {
  static shared = new Resource(c as Entity[])

  #c: Entity[] = []

  constructor(c: Entity[]) {
    this.#c = c
  }

  list(): Entity[] {
    return this.#c
  }

  retrieve(id: number): Entity {
    return this.#c[id]
  }
}
