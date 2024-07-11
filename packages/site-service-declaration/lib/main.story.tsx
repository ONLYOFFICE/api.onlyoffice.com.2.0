import {type ChildrenIncludable} from "@onlyoffice/preact-types"
// todo: create resource.client.ts
import {list, resolve} from "@onlyoffice/openapi-resource-fixtures/resource.client.ts"
import {Content as UiContent} from "@onlyoffice/ui-kit"
import {type Meta} from "@storybook/preact"
import {Fragment, type JSX, h} from "preact"
import {ServiceDeclaration} from "./main.tsx"

export default {
  title: "Site/Service Declaration"
} satisfies Meta

export function Default(): JSX.Element {
  return <ServiceDeclaration
    declaration={list()[1]}
    onHighlightSyntax={Nop}
    onRenderDescription={Nop}
    onRetrieve={resolve}
  />
}

export function Content(): JSX.Element {
  return <UiContent><Default /></UiContent>
}

function Nop({children}: ChildrenIncludable): JSX.Element {
  return <>{children}</>
}
