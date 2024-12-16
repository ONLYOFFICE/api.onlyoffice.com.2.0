import {type Config} from "@onlyoffice/typedoc-resource"

export const config: Config = [
  {
    name: "main",
    source: {
      owner: "onlyoffice",
      repo: "docspace-sdk-js-declarations",
      reference: "develop",
      path: "docspace-sdk-js.json",
    },
  },
]
