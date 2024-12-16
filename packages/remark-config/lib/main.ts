// todo: restrict the usage of html in markdown
// allow details, summary, img, video, br only
// https://github.com/remarkjs/remark-lint/issues/80
// https://github.com/remarkjs/remark-lint/tree/10.0.0/packages/remark-lint-no-html

import {remarkLintEslint} from "@onlyoffice/remark-lint-eslint"
import {remarkLintNoUnicode} from "@onlyoffice/remark-lint-no-unicode"
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
      [remarkLintNoUnicode, {
        hints: [
          ["0060", "Grave Accent", "0027", "Apostrophe"],
          ["00A0", "No-Break Space", "0020", "Space"],
          ["2013", "En Dash", "002D", "Hyphen-Minus"],
          ["2019", "Right Single Quotation Mark", "0027", "Apostrophe"],
        ],
        codes: [
          // Basic Latin
          "000A",    // \n
          "0020",    // EMPTY SPACE
          "0021",    // !
          "0022",    // "
          "0023",    // #
          "0024",    // $
          "0025",    // %
          "0026",    // &
          "0027",    // '
          "0028",    // (
          "0029",    // )
          "002A",    // *
          "002B",    // +
          "002C",    // ,
          "002D",    // -
          "002E",    // .
          "002F",    // /
          "0030",    // 0
          "0031",    // 1
          "0032",    // 2
          "0033",    // 3
          "0034",    // 4
          "0035",    // 5
          "0036",    // 6
          "0037",    // 7
          "0038",    // 8
          "0039",    // 9
          "003A",    // :
          "003B",    // ;
          "003C",    // <
          "003D",    // =
          "003E",    // >
          "003F",    // ?
          "0040",    // @
          "0041",    // A
          "0042",    // B
          "0043",    // C
          "0044",    // D
          "0045",    // E
          "0046",    // F
          "0047",    // G
          "0048",    // H
          "0049",    // I
          "004A",    // J
          "004B",    // K
          "004C",    // L
          "004D",    // M
          "004E",    // N
          "004F",    // O
          "0050",    // P
          "0051",    // Q
          "0052",    // R
          "0053",    // S
          "0054",    // T
          "0055",    // U
          "0056",    // V
          "0057",    // W
          "0058",    // X
          "0059",    // Y
          "005A",    // Z
          "005B",    // [
          "005C",    // \
          "005D",    // ]
          "005E",    // ^
          "005F",    // _
          "0061",    // a
          "0062",    // b
          "0063",    // c
          "0064",    // d
          "0065",    // e
          "0066",    // f
          "0067",    // g
          "0068",    // h
          "0069",    // i
          "006A",    // j
          "006B",    // k
          "006C",    // l
          "006D",    // m
          "006E",    // n
          "006F",    // o
          "0070",    // p
          "0071",    // q
          "0072",    // r
          "0073",    // s
          "0074",    // t
          "0075",    // u
          "0076",    // v
          "0077",    // w
          "0078",    // x
          "0079",    // y
          "007A",    // z
          "007B",    // {
          "007C",    // |
          "007D",    // }
          "007E",    // ~

          // Latin-1 Supplement
          "00E4",    // ä
          "00F6",    // ö
          "00FC",    // ü

          // General Punctuation
          "2014",    // —

          // Mathematical Operators
          "22EE",    // ⋮
        ],
      }],
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
