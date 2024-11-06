// todo: restrict the usage of html in markdown
// allow details, summary, img, video, br only
// https://github.com/remarkjs/remark-lint/issues/80
// https://github.com/remarkjs/remark-lint/tree/10.0.0/packages/remark-lint-no-html

import {remarkLintEslint} from "@onlyoffice/remark-lint-eslint"
import remarkLint from "remark-lint"
import remarkLintBlockquoteIndentation from "remark-lint-blockquote-indentation"
import remarkLintCheckboxCharacterStyle from "remark-lint-checkbox-character-style"
import remarkLintCheckboxContentIndent from "remark-lint-checkbox-content-indent"
import remarkLintCodeBlockStyle from "remark-lint-code-block-style"
import remarkLintDefinitionCase from "remark-lint-definition-case"
import remarkLintDefinitionSpacing from "remark-lint-definition-spacing"
import remarkLintEmphasisMarker from "remark-lint-emphasis-marker"
import remarkLintFencedCodeFlag from "remark-lint-fenced-code-flag"
import remarkLintFencedCodeMarker from "remark-lint-fenced-code-marker"
import remarkLintFileExtension from "remark-lint-file-extension"
import remarkLintFinalDefinition from "remark-lint-final-definition"
import remarkLintFinalNewline from "remark-lint-final-newline"
import remarkLintFirstHeadingLevel from "remark-lint-first-heading-level"
import remarkLintHardBreakSpaces from "remark-lint-hard-break-spaces"
import remarkLintHeadingIncrement from "remark-lint-heading-increment"
import remarkLintHeadingStyle from "remark-lint-heading-style"
import remarkLintLinebreakStyle from "remark-lint-linebreak-style"
import remarkLintLinkTitleStyle from "remark-lint-link-title-style"
import remarkLintListItemBulletIndent from "remark-lint-list-item-bullet-indent"
import remarkLintListItemContentIndent from "remark-lint-list-item-content-indent"
import remarkLintListItemIndent from "remark-lint-list-item-indent"
import remarkLintListItemSpacing from "remark-lint-list-item-spacing"
import remarkLintNoBlockquoteWithoutMarker from "remark-lint-no-blockquote-without-marker"
import remarkLintNoConsecutiveBlankLines from "remark-lint-no-consecutive-blank-lines"
import remarkLintNoDuplicateDefinedUrls from "remark-lint-no-duplicate-defined-urls"
import remarkLintNoDuplicateDefinitions from "remark-lint-no-duplicate-definitions"
import remarkLintNoEmphasisAsHeading from "remark-lint-no-emphasis-as-heading"
import remarkLintNoEmptyUrl from "remark-lint-no-empty-url"
import remarkLintNoFileNameIrregularCharacters from "remark-lint-no-file-name-irregular-characters"
import remarkLintNoHeadingContentIndent from "remark-lint-no-heading-content-indent"
import remarkLintNoHeadingIndent from "remark-lint-no-heading-indent"
import remarkLintNoHeadingLikeParagraph from "remark-lint-no-heading-like-paragraph"
import remarkLintNoLiteralUrls from "remark-lint-no-literal-urls"
import remarkLintNoMissingBlankLines from "remark-lint-no-missing-blank-lines"
import remarkLintNoParagraphContentIndent from "remark-lint-no-paragraph-content-indent"
import remarkLintNoReferenceLikeUrl from "remark-lint-no-reference-like-url"
import remarkLintNoShortcutReferenceImage from "remark-lint-no-shortcut-reference-image"
import remarkLintNoShortcutReferenceLink from "remark-lint-no-shortcut-reference-link"
import remarkLintNoTableIndentation from "remark-lint-no-table-indentation"
import remarkLintNoTabs from "remark-lint-no-tabs"
import remarkLintNoUndefinedReferences from "remark-lint-no-undefined-references"
import remarkLintNoUnusedDefinitions from "remark-lint-no-unused-definitions"
import remarkLintOrderedListMarkerStyle from "remark-lint-ordered-list-marker-style"
import remarkLintOrderedListMarkerValue from "remark-lint-ordered-list-marker-value"
import remarkLintRuleStyle from "remark-lint-rule-style"
import remarkLintStrikethroughMarker from "remark-lint-strikethrough-marker"
import remarkLintStrongMarker from "remark-lint-strong-marker"
import remarkLintTableCellPadding from "remark-lint-table-cell-padding"
import remarkLintTablePipeAlignment from "remark-lint-table-pipe-alignment"
import remarkLintTablePipes from "remark-lint-table-pipes"
import remarkLintUnorderedListMarkerStyle, {type Style} from "remark-lint-unordered-list-marker-style"
import {type Preset} from "unified"

declare module "unified" {
  interface Settings {
    bullet: Style
  }
}

export function remarkConfig(): Preset {
  return {
    settings: {
      bullet: "-",
    },
    plugins: [
      remarkLint,
      [remarkLintBlockquoteIndentation, 2],
      [remarkLintCheckboxCharacterStyle, {checked: "x", unchecked: " "}],
      remarkLintCheckboxContentIndent,
      [remarkLintCodeBlockStyle, "fenced"],
      remarkLintDefinitionCase,
      remarkLintDefinitionSpacing,
      [remarkLintEmphasisMarker, "*"],
      remarkLintEslint,
      [remarkLintFencedCodeFlag, {
        allowEmpty: false,
        flags: [
          // Allowed    // Disallowed
          "cpp",        // c++,
          "cs",         // c#, csharp,
          "css",
          "go",
          "groovy",
          "html",
          "http",
          "ini",
          "java",
          "json",
          "json5",
          "kt",         // kotlin,
          "php",
          "ps1",        // powershell,
          "py",         // python,
          "rb",         // ruby,
          "sh",         // bash, shell,
          "swift",
          "ts",         // javascript, js, typescript,
          "tsx",        // jsx,
          "txt",
          "vb",
          "vue",
          "xml",
          "yml",        // yaml,
        ],
      }],
      [remarkLintFencedCodeMarker, "`"],
      [remarkLintFileExtension, {allowExtensionless: false, extensions: ["md"]}],
      remarkLintFinalDefinition,
      remarkLintFinalNewline,
      [remarkLintFirstHeadingLevel, 2],
      remarkLintHardBreakSpaces,
      remarkLintHeadingIncrement,
      [remarkLintHeadingStyle, "atx"],
      [remarkLintLinebreakStyle, "unix"],
      [remarkLintLinkTitleStyle, '"'],
      remarkLintListItemBulletIndent,
      remarkLintListItemContentIndent,
      [remarkLintListItemIndent, "one"],
      [remarkLintListItemSpacing, {checkBlanks: true}],
      remarkLintNoBlockquoteWithoutMarker,
      remarkLintNoConsecutiveBlankLines,
      remarkLintNoDuplicateDefinedUrls,
      remarkLintNoDuplicateDefinitions,
      remarkLintNoEmphasisAsHeading,
      remarkLintNoEmptyUrl,
      [remarkLintNoFileNameIrregularCharacters, /^(?!index).*/],
      remarkLintNoHeadingContentIndent,
      remarkLintNoHeadingIndent,
      remarkLintNoHeadingLikeParagraph,
      remarkLintNoLiteralUrls,
      [remarkLintNoMissingBlankLines, {exceptTightLists: true}],
      remarkLintNoParagraphContentIndent,
      remarkLintNoReferenceLikeUrl,
      remarkLintNoShortcutReferenceImage,
      remarkLintNoShortcutReferenceLink,
      remarkLintNoTableIndentation,
      remarkLintNoTabs,
      remarkLintNoUndefinedReferences,
      remarkLintNoUnusedDefinitions,
      [remarkLintOrderedListMarkerStyle, "."],
      [remarkLintOrderedListMarkerValue, "ordered"],
      [remarkLintRuleStyle, "---"],
      [remarkLintStrikethroughMarker, "~~"],
      [remarkLintStrongMarker, "*"],
      [remarkLintTableCellPadding, "padded"],
      remarkLintTablePipeAlignment,
      remarkLintTablePipes,
      [remarkLintUnorderedListMarkerStyle, "-"],
    ],
  }
}
