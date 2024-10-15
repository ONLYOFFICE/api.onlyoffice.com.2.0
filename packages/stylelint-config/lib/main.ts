// For the same reason as eslint-config package, the default severity is set to
// error.
//
// The sorting method was chosen alphabetically, you can read about this choice
// here: https://jerrylowm.medium.com/alphabetize-your-css-properties-for-crying-out-loud-780eb1852153/
//
// CSS nesting is allowed but with restrictions. Please use it only to describe
// the state of the current element, not its children.

// todo: add integration with markdown.
// todo: add custom plugins to describe our ui-kit (see primer design system).

import {type Config} from "stylelint"

const c: Config = {
  defaultSeverity: "error",

  plugins: [
    "@double-great/stylelint-a11y",
    "@stylistic/stylelint-plugin",
    "stylelint-at-rule-no-children",
    "stylelint-declaration-block-no-ignored-properties",
    "stylelint-high-performance-animation",
    "stylelint-media-use-custom-media",
    "stylelint-order",
    "stylelint-plugin-logical-css",
  ],

  rules: {
    "alpha-value-notation": "percentage",
    "annotation-no-unknown": true,
    "at-rule-empty-line-before": ["always", {
      except: ["blockless-after-same-name-blockless", "first-nested"],
      ignore: ["after-comment"],
    }],
    "at-rule-no-unknown": true,
    "at-rule-no-vendor-prefix": true,
    "block-no-empty": true,
    "color-function-notation": "modern",
    "color-hex-length": "short",
    "color-named": "never",
    "color-no-invalid-hex": true,
    "comment-empty-line-before": ["always", {
      except: ["first-nested"],
      ignore: ["after-comment", "stylelint-commands"],
    }],
    "comment-no-empty": true,
    "comment-whitespace-inside": "always",
    "custom-property-no-missing-var-function": true,
    "declaration-block-no-duplicate-custom-properties": true,
    "declaration-block-no-duplicate-properties": true,
    "declaration-block-no-shorthand-property-overrides": true,
    "declaration-block-single-line-max-declarations": 0,
    "declaration-empty-line-before": ["always", {
      except: ["after-declaration", "first-nested"],
      ignore: ["after-comment"],
    }],
    "declaration-no-important": true,
    "declaration-property-value-no-unknown": true,
    "font-family-name-quotes": "always-unless-keyword",
    "font-family-no-duplicate-names": true,
    "font-family-no-missing-generic-family-keyword": true,
    "font-weight-notation": "numeric",
    "function-calc-no-unspaced-operator": true,
    "function-linear-gradient-no-nonstandard-direction": true,
    "function-name-case": "lower",
    "function-no-unknown": true,
    "function-url-no-scheme-relative": true,
    "function-url-quotes": "always",
    "hue-degree-notation": "number",
    "import-notation": "string",
    "keyframe-block-no-duplicate-selectors": true,
    "keyframe-declaration-no-important": true,
    "keyframe-selector-notation": "percentage",
    "length-zero-no-unit": [true, {ignore: ["custom-properties"]}],
    "lightness-notation": "percentage",
    "max-nesting-depth": 2,
    "media-feature-name-no-unknown": true,
    "media-feature-name-no-vendor-prefix": true,
    "media-feature-name-value-no-unknown": true,
    "media-feature-range-notation": "context",
    "media-query-no-invalid": true,
    "named-grid-areas-no-invalid": true,
    "no-duplicate-at-import-rules": true,
    "no-duplicate-selectors": true,
    "no-empty-source": true,
    "no-invalid-double-slash-comments": true,
    "no-invalid-position-at-import-rule": true,
    "no-irregular-whitespace": true,
    "number-max-precision": 2,
    "property-no-unknown": true,
    "property-no-vendor-prefix": true,
    "rule-empty-line-before": ["always", {
      except: ["first-nested"],
      ignore: ["after-comment"],
    }],
    "selector-anb-no-unmatchable": true,
    "selector-attribute-quotes": "always",
    "selector-nested-pattern": [selectorNestedPattern(), {splitList: true}],
    "selector-no-vendor-prefix": true,
    "selector-not-notation": "complex",
    "selector-pseudo-class-no-unknown": true,
    "selector-pseudo-element-colon-notation": "double",
    "selector-pseudo-element-no-unknown": true,
    "selector-type-case": "lower",
    "string-no-newline": true,
    "unit-no-unknown": true,
    "value-keyword-case": "lower",
    "value-no-vendor-prefix": true,

    "a11y/content-property-no-static-value": true,
    "a11y/media-prefers-reduced-motion": true,
    "a11y/no-outline-none": true,
    "a11y/no-text-align-justify": true,

    "@stylistic/at-rule-name-case": "lower",
    "@stylistic/at-rule-name-newline-after": "always-multi-line",
    "@stylistic/at-rule-name-space-after": "always-single-line",
    "@stylistic/at-rule-semicolon-newline-after": "always",
    "@stylistic/at-rule-semicolon-space-before": "never",
    "@stylistic/block-closing-brace-empty-line-before": "never",
    "@stylistic/block-closing-brace-newline-after": "always",
    "@stylistic/block-closing-brace-newline-before": "always",
    "@stylistic/block-closing-brace-space-after": "always-single-line",
    "@stylistic/block-closing-brace-space-before": "always-single-line",
    "@stylistic/block-opening-brace-newline-after": "always",
    "@stylistic/block-opening-brace-space-before": "always",
    "@stylistic/color-hex-case": "lower",
    "@stylistic/declaration-bang-space-after": "never",
    "@stylistic/declaration-bang-space-before": "always",
    "@stylistic/declaration-block-semicolon-newline-after": "always-multi-line",
    "@stylistic/declaration-block-semicolon-newline-before": "never-multi-line",
    "@stylistic/declaration-block-semicolon-space-after": "always-single-line",
    "@stylistic/declaration-block-semicolon-space-before": "never",
    "@stylistic/declaration-block-trailing-semicolon": "always",
    "@stylistic/declaration-colon-newline-after": "always-multi-line",
    "@stylistic/declaration-colon-space-after": "always-single-line",
    "@stylistic/declaration-colon-space-before": "never",
    "@stylistic/function-comma-newline-after": "always-multi-line",
    "@stylistic/function-comma-newline-before": "never-multi-line",
    "@stylistic/function-comma-space-after": "always-single-line",
    "@stylistic/function-comma-space-before": "never",
    "@stylistic/function-max-empty-lines": 0,
    "@stylistic/function-parentheses-newline-inside": "always-multi-line",
    "@stylistic/function-parentheses-space-inside": "never-single-line",
    "@stylistic/function-whitespace-after": "always",
    "@stylistic/indentation": [2, {baseIndentLevel: 0}],
    "@stylistic/linebreaks": "unix",
    "@stylistic/max-empty-lines": 1,
    "@stylistic/max-line-length": [100, {
      ignorePattern: /(?:^@import.*;$)|(?:^\s*--.*;$)/,
    }],
    "@stylistic/media-feature-colon-space-after": "always",
    "@stylistic/media-feature-colon-space-before": "never",
    "@stylistic/media-feature-name-case": "lower",
    "@stylistic/media-feature-parentheses-space-inside": "never",
    "@stylistic/media-feature-range-operator-space-after": "always",
    "@stylistic/media-feature-range-operator-space-before": "always",
    "@stylistic/media-query-list-comma-newline-after": "always-multi-line",
    "@stylistic/media-query-list-comma-newline-before": "never-multi-line",
    "@stylistic/media-query-list-comma-space-after": "always-single-line",
    "@stylistic/media-query-list-comma-space-before": "never",
    "@stylistic/named-grid-areas-alignment": true,
    "@stylistic/no-empty-first-line": true,
    "@stylistic/no-eol-whitespace": true,
    "@stylistic/no-extra-semicolons": true,
    "@stylistic/no-missing-end-of-source-newline": true,
    "@stylistic/number-leading-zero": "always",
    "@stylistic/number-no-trailing-zeros": true,
    "@stylistic/property-case": "lower",
    "@stylistic/selector-attribute-brackets-space-inside": "never",
    "@stylistic/selector-attribute-operator-space-after": "never",
    "@stylistic/selector-attribute-operator-space-before": "never",
    "@stylistic/selector-combinator-space-after": "always",
    "@stylistic/selector-combinator-space-before": "always",
    "@stylistic/selector-list-comma-newline-after": "always",
    "@stylistic/selector-list-comma-newline-before": "never-multi-line",
    "@stylistic/selector-list-comma-space-after": "always-single-line",
    "@stylistic/selector-list-comma-space-before": "never",
    "@stylistic/selector-max-empty-lines": 0,
    "@stylistic/selector-pseudo-class-case": "lower",
    "@stylistic/selector-pseudo-class-parentheses-space-inside": "never",
    "@stylistic/selector-pseudo-element-case": "lower",
    "@stylistic/string-quotes": "double",
    "@stylistic/unicode-bom": "never",
    "@stylistic/unit-case": "lower",
    "@stylistic/value-list-comma-newline-after": "always-multi-line",
    "@stylistic/value-list-comma-newline-before": "never-multi-line",
    "@stylistic/value-list-comma-space-after": "always-single-line",
    "@stylistic/value-list-comma-space-before": "never",
    "@stylistic/value-list-max-empty-lines": 0,

    "aditayvm/at-rule-no-children": true,

    "plugin/declaration-block-no-ignored-properties": true,

    "plugin/no-low-performance-animation-properties": true,

    // todo: configure the importFrom option.
    // "csstools/media-use-custom-media": ["known", {importFrom: []}],

    "order/order": ["custom-properties", "declarations", "at-rules", "rules"],
    "order/properties-alphabetical-order": true,

    "plugin/use-logical-properties-and-values": [true, {
      // The overflow-block and overflow-inline properties are poorly supported.
      // https://developer.mozilla.org/en-US/docs/Web/CSS/overflow-block/
      // https://developer.mozilla.org/en-US/docs/Web/CSS/overflow-inline/
      ignore: ["overflow-x", "overflow-y"],
    }],
  },
}

function selectorNestedPattern(): string {
  let s = ""
  const a = [
    ":empty",
    ":first-child",
    ":first-of-type",
    ":focus-visible",
    ":focus",
    ":hover",
    ":last-child",
    ":last-of-type",
    ":nth-of-type",
    String.raw`:has\(.*\)`,
    String.raw`:state\(.*\)`,
    String.raw`\[aria-.*]`,
    String.raw`\[state-.*]`,
  ]
  for (const e of a) {
    s += `${e}|`
  }
  if (s.length !== 0) {
    s = s.slice(0, -1)
  }
  return `^&(?:${s})$`
}

export default c
