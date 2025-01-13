import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import {type JSX} from "preact"

export interface TextInputProperties extends ChildrenIncludable {
  size?: "small" | "medium" | "large" | "xlarge" | "default"
}

export function TextInput(p: TextInputProperties): JSX.Element {
  let c = "text-input"
  if (p.size !== undefined) {
    c += ` text-input_size_${p.size}`
  }
  return <text-input-container class={c}>{p.children}</text-input-container>
}

export function TextInputLeading(p: ChildrenIncludable): JSX.Element {
  return <div class="text-input__leading">{p.children}</div>
}

export function TextInputPlaceholder(p: ChildrenIncludable): JSX.Element {
  return <div class="text-input__placeholder">{p.children}</div>
}

export function TextInputControl(p: ChildrenIncludable): JSX.Element {
  return <div class="text-input__control" data-text-input-control-container>{p.children}</div>
}

export function TextInputTrailing(p: ChildrenIncludable): JSX.Element {
  return <div class="text-input__trailing">{p.children}</div>
}

export function TextInputAction(p: ChildrenIncludable): JSX.Element {
  return <div class="text-input__action">{p.children}</div>
}
