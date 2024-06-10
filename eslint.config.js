// The config might appear a bit restrictive since it does not use warns.
// However, the philosophy behind this is simple: you either adhere to the code
// style or you do not. This approach simplifies things, making them easier to
// manage.

// todo: add the following plugins:
// eslint-plugin-jsdoc
// eslint-plugin-jsonc
// eslint-plugin-mdx
// eslint-plugin-wc
// eslint-plugin-yml

/**
 * @typedef {import("typescript-eslint").Config} Config
 */

import eslint from "@eslint/js"
import stylistic from "@stylistic/eslint-plugin"
import gitignore from "eslint-config-flat-gitignore"
import imp from "eslint-plugin-import"
import promise from "eslint-plugin-promise"
import unicorn from "eslint-plugin-unicorn"
import globals from "globals"
import ts from "typescript-eslint"

const e = "error"
/** @type {any} */
const c = config()

export default [
  gitignore(),

  // All recommended rules are set to the error, and that is fine with us.
  eslint.configs.recommended,
  ...ts.configs.recommended,
  // jsdoc.configs["flat/recommended-error"],
  unicorn.configs["flat/recommended"],

  ...c
]

/**
 * @return {Config}
 */
function config() {
  return [
    {
      languageOptions: {
        globals: {
          ...globals.node,
          node: true,
          module: true
        }
      },

      plugins: {
        /** @type {any} */
        "@stylistic": stylistic,
        "import": imp,
        promise
      },

      rules: {
        // core: Possible Problems
        "array-callback-return": e,
        "no-constructor-return": e,
        "no-inner-declarations": e,
        "no-promise-executor-return": e,
        "no-self-compare": e,
        "no-unmodified-loop-condition": e,
        "no-unreachable-loop": e,
        // todo: This is a new rule introduced in ESLint 9.
        // VSCode ESLint extension while does not support it.
        // "no-useless-assignment": e,

        // core: Suggestions
        "camelcase": e,
        "consistent-return": e,
        "curly": [e, "all"],
        "default-case": e,
        "default-case-last": e,
        "default-param-last": e,
        "dot-notation": e,
        "eqeqeq": e,
        "func-name-matching": e,
        "func-style": [e, "declaration", {allowArrowFunctions: true}],
        "logical-assignment-operators": e,
        "no-alert": e,
        "no-array-constructor": e,
        "no-bitwise": e,
        "no-caller": e,
        "no-else-return": e,
        "no-eq-null": e,
        "no-eval": e,
        "no-extend-native": e,
        "no-extra-bind": e,
        "no-implicit-coercion": e,
        "no-lone-blocks": e,
        "no-lonely-if": e,
        "no-loop-func": e,
        "no-multi-assign": e,
        "no-multi-str": e,
        "no-nested-ternary": e,
        "no-new": e,
        "no-new-wrappers": e,
        "no-object-constructor": e,
        "no-plusplus": e,
        "no-proto": e,
        "no-return-assign": e,
        "no-sequences": e,
        "no-throw-literal": e,
        "no-undef-init": e,
        "no-unneeded-ternary": e,
        "no-unused-expressions": e,
        "no-useless-call": e,
        "no-useless-computed-key": e,
        "no-useless-concat": e,
        "no-useless-constructor": e,
        "no-useless-rename": e,
        "no-var": e,
        "object-shorthand": e,
        "one-var": [e, "never"],
        "operator-assignment": e,
        "prefer-arrow-callback": e,
        "prefer-const": e,
        "prefer-destructuring": e,
        "prefer-promise-reject-errors": e,
        "prefer-rest-params": e,
        "prefer-spread": e,
        "prefer-template": e,
        "yoda": e,

        // @stylistic
        "@stylistic/array-bracket-newline": [e, "consistent"],
        "@stylistic/array-bracket-spacing": e,
        "@stylistic/array-element-newline": [e, "consistent"],
        "@stylistic/arrow-parens": e,
        "@stylistic/arrow-spacing": e,
        "@stylistic/block-spacing": "off",
        "@stylistic/brace-style": e,
        "@stylistic/comma-dangle": e,
        "@stylistic/comma-spacing": e,
        "@stylistic/comma-style": e,
        "@stylistic/computed-property-spacing": e,
        "@stylistic/dot-location": [e, "property"],
        "@stylistic/eol-last": e,
        "@stylistic/function-call-argument-newline": [e, "consistent"],
        "@stylistic/function-call-spacing": e,
        "@stylistic/function-paren-newline": [e, "consistent"],
        "@stylistic/implicit-arrow-linebreak": e,
        "@stylistic/indent": [e, 2, {SwitchCase: 0}],
        "@stylistic/indent-binary-ops": [e, 2],
        // todo: add jsx rules.
        "@stylistic/key-spacing": e,
        "@stylistic/keyword-spacing": e,
        "@stylistic/linebreak-style": e,
        "@stylistic/max-len": [e, {
          code: 100,
          ignorePattern: "^\\s*(async)?\\s*function\\s*(\\S*)\\(.*\\):\\s*(.*)$",
          ignoreComments: true,
          ignoreTrailingComments: true,
          ignoreUrls: true,
          ignoreStrings: true,
          ignoreTemplateLiterals: true,
          ignoreRegExpLiterals: true
        }],
        "@stylistic/max-statements-per-line": e,
        "@stylistic/member-delimiter-style": [e, {
          multiline: {delimiter: "none", requireLast: false},
          singleline: {delimiter: "semi", requireLast: false},
          multilineDetection: "brackets"
        }],
        "@stylistic/multiline-ternary": e,
        "@stylistic/new-parens": e,
        "@stylistic/no-confusing-arrow": e,
        "@stylistic/no-extra-parens": e,
        "@stylistic/no-extra-semi": e,
        "@stylistic/no-floating-decimal": e,
        "@stylistic/no-mixed-spaces-and-tabs": e,
        "@stylistic/no-multi-spaces": e,
        "@stylistic/no-multiple-empty-lines": [e, {max: 1}],
        "@stylistic/no-tabs": e,
        "@stylistic/no-trailing-spaces": e,
        "@stylistic/no-whitespace-before-property": e,
        "@stylistic/nonblock-statement-body-position": e,
        "@stylistic/object-curly-newline": e,
        "@stylistic/object-curly-spacing": e,
        "@stylistic/object-property-newline": [e, {allowAllPropertiesOnSameLine: true}],
        "@stylistic/one-var-declaration-per-line": e,
        "@stylistic/operator-linebreak": e,
        "@stylistic/padded-blocks": [e, "never"],
        "@stylistic/quote-props": [e, "consistent-as-needed"],
        "@stylistic/quotes": [e, "double", {avoidEscape: true}],
        "@stylistic/rest-spread-spacing": e,
        "@stylistic/semi": [e, "never"],
        "@stylistic/semi-spacing": e,
        "@stylistic/semi-style": e,
        "@stylistic/space-before-blocks": e,
        "@stylistic/space-before-function-paren": [e, {
          anonymous: "always",
          asyncArrow: "always",
          named: "never"
        }],
        "@stylistic/space-in-parens": e,
        "@stylistic/space-infix-ops": e,
        "@stylistic/space-unary-ops": e,
        "@stylistic/spaced-comment": e,
        "@stylistic/switch-colon-spacing": e,
        "@stylistic/template-curly-spacing": e,
        "@stylistic/template-tag-spacing": e,
        "@stylistic/type-annotation-spacing": e,
        "@stylistic/type-generic-spacing": e,
        "@stylistic/type-named-tuple-spacing": e,
        "@stylistic/wrap-iife": [e, "inside"],
        "@stylistic/yield-star-spacing": e,

        // @typescript-eslint
        "@typescript-eslint/ban-ts-comment": "off",
        "@typescript-eslint/consistent-type-imports": e,
        "@typescript-eslint/explicit-function-return-type": [e, {
          allowExpressions: true,
          allowTypedFunctionExpressions: true,
          allowHigherOrderFunctions: true,
          allowDirectConstAssertionInArrowFunctions: true,
          allowConciseArrowFunctionExpressionsStartingWithVoid: false,
          allowFunctionsWithoutTypeParameters: false,
          allowIIFEs: false
        }],
        "@typescript-eslint/no-namespace": [e, {allowDeclarations: true}],
        "@typescript-eslint/no-unused-vars": [
          e,
          {
            args: "all",
            argsIgnorePattern: "^_",
            caughtErrors: "all",
            caughtErrorsIgnorePattern: "^_",
            destructuredArrayIgnorePattern: "^_",
            varsIgnorePattern: "(^_)|(^Fragment$)|(^h$)",
            ignoreRestSiblings: true
          }
        ],

        // import: Helpful warnings
        "import/export": e,

        // import: Style guide
        "import/first": e,
        "import/no-duplicates": e,
        // todo: explain
        // "import/order": [e, {
        //   "alphabetize": {order: "asc", orderImportKind: "asc"},
        //   "groups": ["builtin", "external", "parent", "sibling", "index"],
        //   "newlines-between": "never"
        // }],

        // promise
        "promise/always-return": e,
        "promise/catch-or-return": e,
        // "promise/no-callback-in-promise": e, // todo: is not compatible with ESLint version 9.
        // "promise/no-multiple-resolved": e, // todo: is not compatible with ESLint version 9.
        // "promise/no-nesting": e, // todo: is not compatible with ESLint version 9.
        "promise/no-new-statics": e,
        "promise/no-return-in-finally": e,
        // "promise/no-return-wrap": e, // todo: is not compatible with ESLint version 9.
        "promise/param-names": [e, {
          rejectPattern: "^(_+|rej|reject)$",
          resolvePattern: "^(_+|res|resolve)$"
        }],
        "promise/valid-params": e,

        // unicorn
        "unicorn/catch-error-name": "off",
        "unicorn/consistent-function-scoping": "off",
        "unicorn/explicit-length-check": [e, {"non-zero": "not-equal"}],
        "unicorn/filename-case": "off",
        "unicorn/import-style": "off",
        "unicorn/no-array-callback-reference": "off",
        "unicorn/no-negated-condition": "off",
        "unicorn/no-null": "off",
        "unicorn/prefer-at": "off",
        "unicorn/prefer-ternary": "off",
        "unicorn/prefer-type-error": "off",
        "unicorn/prevent-abbreviations": "off",
        "unicorn/switch-case-braces": "off"
      }
    },
    {
      files: ["**/*.js", "**/*.mjs"],
      rules: {
        // Does not work with JSDoc @returns directive.
        "@typescript-eslint/explicit-function-return-type": "off"
      }
    },
    {
      files: ["**/fixtures/**/*.js"],
      rules: {
        "unicorn/prefer-module": "off"
      }
    }
  ]
}
