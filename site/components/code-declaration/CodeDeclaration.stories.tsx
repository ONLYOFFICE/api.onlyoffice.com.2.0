import kit from "@onlyoffice/documentation-ui-kit/kit.css?inline"
import kitRegular from "@onlyoffice/documentation-ui-kit/kit.regular.css?inline"
import { Theme as StorybookTheme } from "@onlyoffice/documentation-ui-storybook"
import type { JSX } from "preact"
import { Fragment, h } from "preact"
import codeDeclaration from "./code-declaration.css?inline"
import codeDeclarationRegular from "./code-declaration.regular.css?inline"
import { CodeDeclaration } from "./code-declaration.ts"

const styles: string[] = [
  kit,
  kitRegular,
  codeDeclaration,
  codeDeclarationRegular
]

export default {
  title: "Site/CodeDeclaration",
  decorators: [
    (Story: any): JSX.Element => (
      <>
        {styles.map((s) => (
          <style key={s} dangerouslySetInnerHTML={{ __html: s }} />
        ))}
        <Story />
      </>
    )
  ]
}

export function Composition(): JSX.Element {
  return (
    <div>todo</div>
    // <CodeDeclaration
    //   declaration={list()[0]}
    //   onProcessMarkdown={({ children }) => children }
    //   onHighlightSyntax={({ children }) => children}
    //   onLink={() => "https://example.com/"}
    //   onRetrieve={retrieve}
    // />
  )
}

const colors: string[] = [
  "code-declaration-decoration-foreground-color",
  "code-declaration-identifier-foreground-color",
  "code-declaration-keyword-foreground-color",
  "code-declaration-reference-foreground-color",
  "code-declaration-text-foreground-color"
]

export function Theme(): JSX.Element {
  return (
    <StorybookTheme>
      <StorybookTheme.Color>
        {colors.map((c) => (
          <StorybookTheme.Scale key={c} scale={c} />
        ))}
      </StorybookTheme.Color>
    </StorybookTheme>
  )
}
