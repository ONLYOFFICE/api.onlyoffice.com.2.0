import {camelToDash} from "@onlyoffice/camel-to-dash"

export interface Datasettable {
  dataset?: Dataset
}

export interface Dataset {
  [k: string]: unknown
}

export function useDataset(props: Datasettable): Dataset {
  if (!props.dataset) {
    return {}
  }

  const d: Dataset = {}

  for (let k in props.dataset) {
    const v = props.dataset[k]
    k = k.charAt(0).toUpperCase() + k.slice(1)
    k = camelToDash(`data${k}`)
    d[k] = v
  }

  return d
}
