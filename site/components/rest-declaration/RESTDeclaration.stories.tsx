import kit from "@onlyoffice/documentation-ui-kit/kit.css?inline"
import kitRegular from "@onlyoffice/documentation-ui-kit/kit.regular.css?inline"
import { Content } from "@onlyoffice/documentation-ui-kit"
import { useStyles } from "@onlyoffice/documentation-ui-storybook"
import type { JSX } from "preact"
import { h } from "preact"
import { default as chapterMeta, Composition as ChapterComposition } from "../chapter/Chapter.stories.tsx"
import { RESTDeclaration } from "./rest-declaration.ts"

const styles: string[] = [
  ...chapterMeta.styles,
  kit,
  kitRegular
]

export default {
  title: "Site/RESTDeclaration",
  styles,
  decorators: [
    ...useStyles(...styles)
  ]
}

export function Composition(): JSX.Element {
  return (
    <ChapterComposition>
      <Content>
        <div>todo</div>
        {/* <RESTDeclaration
          declaration={list()[0]}
          onHighlightSyntax={({ children }) => children}
          onRenderDescription={({ children }) => children}
          onRetrieve={retrieve}
        /> */}
      </Content>
    </ChapterComposition>
  )
}
