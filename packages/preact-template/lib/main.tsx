import * as Elements from "@onlyoffice/preact-elements"
import {type JSX} from "preact"
import {renderToString} from "preact-render-to-string"

export interface TemplateProperties extends Elements.TemplateProperties {
  render?: typeof renderToString
}

export function Template(p: TemplateProperties): JSX.Element {
  const {children, render = renderToString, ...o} = p
  // @ts-ignore children will be resolved inside render function
  o.dangerouslySetInnerHTML = {__html: render(children)}
  return <Elements.Template {...o} />
}
