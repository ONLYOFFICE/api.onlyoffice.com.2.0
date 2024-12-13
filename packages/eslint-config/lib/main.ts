// The config might appear a bit restrictive since it does not use warns.
// However, the philosophy behind this is simple: you either adhere to the code
// style or you do not. This approach simplifies things, making them easier to
// manage.

import eslintOnlyoffice from "@onlyoffice/eslint-plugin"
import eslintStylistic from "@stylistic/eslint-plugin"
import {ESLint as ES} from "eslint"
import eslintImport from "eslint-plugin-import"
import eslintJsonc from "eslint-plugin-jsonc"
import eslintMarkdown from "eslint-plugin-markdown"
import eslintPromise from "eslint-plugin-promise"
import eslintUnicorn from "eslint-plugin-unicorn"
import eslintWc from "eslint-plugin-wc"
import eslintYaml from "eslint-plugin-yml"
import globals from "globals"
import jsoncParser from "jsonc-eslint-parser"
import eslintTypescript, {type Config} from "typescript-eslint"
import yamlParser from "yaml-eslint-parser"

const e = "error"

const c: Config = [
  {
    // Based on https://github.com/typescript-eslint/typescript-eslint/blob/v8.0.1/packages/eslint-plugin/src/configs/base.ts
    name: "typescript",

    files: [
      "*.cjs",
      "*.cts",
      "*.js",
      "*.jsx",
      "*.mjs",
      "*.mts",
      "*.ts",
      "*.tsx",
      "**/*.cjs",
      "**/*.cts",
      "**/*.js",
      "**/*.jsx",
      "**/*.mjs",
      "**/*.mts",
      "**/*.ts",
      "**/*.tsx",
    ],

    languageOptions: {
      globals: {
        ...globals.browser,
        ...globals.node,
      },
      parser: eslintTypescript.parser,
      parserOptions: {
        projectService: true,
      },
      sourceType: "module",
    },

    plugins: {
      "@onlyoffice": eslintOnlyoffice,
      // @ts-ignore probably typescript-eslint types are wrong
      "@stylistic": eslintStylistic,
      "@typescript-eslint": eslintTypescript.plugin,
      "import": eslintImport,
      "promise": eslintPromise,
      "unicorn": eslintUnicorn,
      "wc": eslintWc,
    },

    rules: {
      "array-callback-return": e,
      "camelcase": e,
      "constructor-super": e,
      "curly": [e, "all"],
      "default-case-last": e,
      "eqeqeq": e,
      "for-direction": e,
      "func-name-matching": e,
      "func-names": e,
      "func-style": [e, "declaration", {allowArrowFunctions: true}],
      "getter-return": e,
      "grouped-accessor-pairs": e,
      "logical-assignment-operators": e,
      "new-cap": e,
      "no-alert": e,
      "no-async-promise-executor": e,
      "no-bitwise": e,
      "no-caller": e,
      "no-class-assign": e,
      "no-compare-neg-zero": e,
      "no-cond-assign": e,
      "no-const-assign": e,
      "no-constant-binary-expression": e,
      "no-constant-condition": e,
      "no-constructor-return": e,
      "no-control-regex": e,
      "no-debugger": e,
      "no-delete-var": e,
      "no-dupe-args": e,
      "no-dupe-else-if": e,
      "no-dupe-keys": e,
      "no-duplicate-case": e,
      "no-duplicate-imports": e,
      "no-else-return": e,
      "no-empty-character-class": e,
      "no-empty-pattern": e,
      "no-empty-static-block": e,
      "no-empty": e,
      "no-eq-null": e,
      "no-eval": e,
      "no-ex-assign": e,
      "no-extend-native": e,
      "no-extra-bind": e,
      "no-extra-boolean-cast": e,
      "no-extra-label": e,
      "no-fallthrough": e,
      "no-func-assign": e,
      "no-global-assign": e,
      "no-implicit-coercion": e,
      "no-implicit-globals": e,
      "no-import-assign": e,
      "no-inner-declarations": e,
      "no-invalid-regexp": e,
      "no-irregular-whitespace": e,
      "no-iterator": e,
      "no-label-var": e,
      "no-labels": e,
      "no-lone-blocks": e,
      "no-lonely-if": e,
      "no-loss-of-precision": e,
      "no-misleading-character-class": e,
      "no-multi-assign": e,
      "no-multi-str": e,
      "no-nested-ternary": e,
      "no-new-func": e,
      "no-new-native-nonconstructor": e,
      "no-new-wrappers": e,
      "no-new": e,
      "no-nonoctal-decimal-escape": e,
      "no-obj-calls": e,
      "no-object-constructor": e,
      "no-octal": e,
      "no-plusplus": e,
      "no-promise-executor-return": e,
      "no-proto": e,
      "no-prototype-builtins": e,
      "no-regex-spaces": e,
      "no-return-assign": e,
      "no-script-url": e,
      "no-self-assign": e,
      "no-self-compare": e,
      "no-sequences": e,
      "no-setter-return": e,
      "no-shadow-restricted-names": e,
      "no-sparse-arrays": e,
      "no-ternary": e,
      "no-this-before-super": e,
      "no-undef-init": e,
      "no-underscore-dangle": [e, {allow: ["_atransform", "_transform"]}],
      "no-unexpected-multiline": e,
      "no-unmodified-loop-condition": e,
      "no-unneeded-ternary": e,
      "no-unreachable-loop": e,
      "no-unreachable": e,
      "no-unsafe-finally": e,
      "no-unsafe-negation": e,
      "no-unsafe-optional-chaining": e,
      "no-unused-labels": e,
      "no-unused-private-class-members": e,
      "no-useless-backreference": e,
      "no-useless-call": e,
      "no-useless-catch": e,
      "no-useless-computed-key": e,
      "no-useless-concat": e,
      "no-useless-escape": e,
      "no-useless-rename": e,
      "no-useless-return": e,
      "no-var": e,
      "no-void": e,
      "no-with": e,
      "object-shorthand": e,
      "one-var": [e, "never"],
      "operator-assignment": e,
      "prefer-arrow-callback": e,
      "prefer-const": e,
      "prefer-exponentiation-operator": e,
      "prefer-numeric-literals": e,
      "prefer-object-has-own": e,
      "prefer-object-spread": e,
      "prefer-promise-reject-errors": e,
      "prefer-regex-literals": e,
      "prefer-rest-params": e,
      "prefer-spread": e,
      "prefer-template": e,
      "radix": [e, "as-needed"],
      "require-yield": e,
      "sort-imports": [e, {ignoreDeclarationSort: true}],
      "strict": [e, "never"],
      "symbol-description": e,
      "unicode-bom": e,
      "use-isnan": e,
      "valid-typeof": e,
      "yoda": e,

      "@onlyoffice/no-optional-chaining": e,

      "@stylistic/array-bracket-newline": [e, "consistent"],
      "@stylistic/array-bracket-spacing": e,
      "@stylistic/array-element-newline": [e, "consistent"],
      "@stylistic/arrow-parens": e,
      "@stylistic/arrow-spacing": e,
      "@stylistic/block-spacing": "off",
      "@stylistic/brace-style": [e, "1tbs", {allowSingleLine: true}],
      "@stylistic/comma-dangle": [e, "always-multiline"],
      "@stylistic/comma-spacing": e,
      "@stylistic/comma-style": e,
      "@stylistic/computed-property-spacing": e,
      "@stylistic/dot-location": [e, "property"],
      "@stylistic/eol-last": e,
      "@stylistic/function-call-argument-newline": [e, "consistent"],
      "@stylistic/function-call-spacing": e,
      "@stylistic/function-paren-newline": [e, "consistent"],
      "@stylistic/implicit-arrow-linebreak": e,
      "@stylistic/indent-binary-ops": [e, 2],
      "@stylistic/indent": [e, 2, {SwitchCase: 0}],
      "@stylistic/jsx-child-element-spacing": e,
      "@stylistic/jsx-closing-bracket-location": [e, "line-aligned"],
      "@stylistic/jsx-curly-brace-presence": [e, {
        props: "never",
        children: "never",
        propElementValues: "always",
      }],
      "@stylistic/jsx-curly-newline": e,
      "@stylistic/jsx-curly-spacing": e,
      "@stylistic/jsx-equals-spacing": e,
      "@stylistic/jsx-first-prop-new-line": e,
      "@stylistic/jsx-indent": [e, 2],
      "@stylistic/jsx-indent-props": [e, 2],
      "@stylistic/jsx-newline": [e, {prevent: true}],
      "@stylistic/jsx-pascal-case": e,
      "@stylistic/jsx-props-no-multi-spaces": e,
      "@stylistic/jsx-quotes": e,
      "@stylistic/jsx-self-closing-comp": e,
      "@stylistic/jsx-tag-spacing": e,
      "@stylistic/key-spacing": e,
      "@stylistic/keyword-spacing": e,
      "@stylistic/linebreak-style": e,
      "@stylistic/max-len": [e, {
        code: 100,
        ignorePattern: String.raw`^\s*(async)?\s*function\s*(\S*)\(.*\):\s*(.*)$`,
        ignoreComments: true,
        ignoreTrailingComments: true,
        ignoreUrls: true,
        ignoreStrings: true,
        ignoreTemplateLiterals: true,
        ignoreRegExpLiterals: true,
      }],
      "@stylistic/max-statements-per-line": e,
      "@stylistic/member-delimiter-style": [e, {
        multiline: {delimiter: "none", requireLast: false},
        singleline: {delimiter: "semi", requireLast: false},
        multilineDetection: "brackets",
      }],
      "@stylistic/multiline-ternary": e,
      "@stylistic/new-parens": e,
      "@stylistic/no-confusing-arrow": e,
      "@stylistic/no-extra-parens": e,
      "@stylistic/no-extra-semi": e,
      "@stylistic/no-floating-decimal": e,
      "@stylistic/no-mixed-spaces-and-tabs": e,
      "@stylistic/no-multi-spaces": [e, {ignoreEOLComments: true}],
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
      "@stylistic/semi-style": [e, "first"],
      "@stylistic/space-before-blocks": e,
      "@stylistic/space-before-function-paren": [e, {
        anonymous: "always",
        asyncArrow: "always",
        named: "never",
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

      "@typescript-eslint/adjacent-overload-signatures": e,
      "@typescript-eslint/array-type": e,
      "@typescript-eslint/await-thenable": e,
      "@typescript-eslint/ban-ts-comment": [e, {
        "ts-expect-error": false,
        "ts-ignore": "allow-with-description",
        "ts-nocheck": "allow-with-description",
        "ts-check": true,
        "minimumDescriptionLength": 3,
      }],
      "@typescript-eslint/ban-tslint-comment": e,
      "@typescript-eslint/consistent-generic-constructors": e,
      "@typescript-eslint/consistent-indexed-object-style": e,
      "@typescript-eslint/consistent-type-definitions": e,
      "@typescript-eslint/consistent-type-imports": [e, {
        disallowTypeAnnotations: true,
        fixStyle: "inline-type-imports",
        prefer: "type-imports",
      }],
      "@typescript-eslint/default-param-last": e,
      "@typescript-eslint/dot-notation": e,
      "@typescript-eslint/explicit-function-return-type": [e, {
        allowExpressions: true,
        allowTypedFunctionExpressions: true,
        allowHigherOrderFunctions: true,
        allowDirectConstAssertionInArrowFunctions: true,
        allowConciseArrowFunctionExpressionsStartingWithVoid: false,
        allowFunctionsWithoutTypeParameters: false,
        allowIIFEs: false,
      }],
      "@typescript-eslint/explicit-module-boundary-types": e,
      "@typescript-eslint/method-signature-style": [e, "method"],
      "@typescript-eslint/no-array-constructor": e,
      "@typescript-eslint/no-array-delete": e,
      "@typescript-eslint/no-base-to-string": e,
      "@typescript-eslint/no-confusing-non-null-assertion": e,
      "@typescript-eslint/no-confusing-void-expression": e,
      "@typescript-eslint/no-dupe-class-members": e,
      "@typescript-eslint/no-duplicate-enum-values": e,
      "@typescript-eslint/no-duplicate-type-constituents": e,
      "@typescript-eslint/no-empty-object-type": [e, {allowInterfaces: "always"}],
      "@typescript-eslint/no-explicit-any": e,
      "@typescript-eslint/no-extra-non-null-assertion": e,
      "@typescript-eslint/no-floating-promises": e,
      "@typescript-eslint/no-for-in-array": e,
      "@typescript-eslint/no-implied-eval": e,
      "@typescript-eslint/no-inferrable-types": e,
      "@typescript-eslint/no-invalid-this": e,
      "@typescript-eslint/no-invalid-void-type": [e, {
        allowAsThisParameter: true,
        allowInGenericTypeArguments: true,
      }],
      "@typescript-eslint/no-loop-func": e,
      "@typescript-eslint/no-meaningless-void-operator": e,
      "@typescript-eslint/no-misused-new": e,
      "@typescript-eslint/no-misused-promises": e,
      "@typescript-eslint/no-mixed-enums": e,
      "@typescript-eslint/no-namespace": [e, {allowDeclarations: true}],
      "@typescript-eslint/no-non-null-asserted-nullish-coalescing": e,
      "@typescript-eslint/no-non-null-asserted-optional-chain": e,
      "@typescript-eslint/no-non-null-assertion": e,
      "@typescript-eslint/no-redeclare": e,
      "@typescript-eslint/no-redundant-type-constituents": e,
      "@typescript-eslint/no-require-imports": e,
      "@typescript-eslint/no-this-alias": e,
      "@typescript-eslint/no-unnecessary-boolean-literal-compare": e,
      "@typescript-eslint/no-unnecessary-qualifier": e,
      "@typescript-eslint/no-unnecessary-template-expression": e,
      "@typescript-eslint/no-unnecessary-type-arguments": e,
      "@typescript-eslint/no-unnecessary-type-assertion": e,
      "@typescript-eslint/no-unnecessary-type-constraint": e,
      // "@typescript-eslint/no-unsafe-argument": e,
      "@typescript-eslint/no-unsafe-declaration-merging": e,
      "@typescript-eslint/no-unsafe-enum-comparison": e,
      "@typescript-eslint/no-unsafe-function-type": e,
      "@typescript-eslint/no-unsafe-unary-minus": e,
      "@typescript-eslint/no-unused-expressions": e,
      "@typescript-eslint/no-unused-vars": [e, {
        args: "all",
        argsIgnorePattern: "^_+$",
        caughtErrors: "all",
        caughtErrorsIgnorePattern: "^_+$",
        destructuredArrayIgnorePattern: "^_+$",
        varsIgnorePattern: "(^_+$)|(^Fragment$)|(^h$)",
        ignoreRestSiblings: true,
      }],
      "@typescript-eslint/no-useless-constructor": e,
      "@typescript-eslint/no-useless-empty-export": e,
      "@typescript-eslint/no-wrapper-object-types": e,
      "@typescript-eslint/non-nullable-type-assertion-style": e,
      "@typescript-eslint/only-throw-error": e,
      "@typescript-eslint/parameter-properties": e,
      "@typescript-eslint/prefer-as-const": e,
      "@typescript-eslint/prefer-destructuring": e,
      "@typescript-eslint/prefer-find": e,
      "@typescript-eslint/prefer-for-of": e,
      "@typescript-eslint/prefer-includes": e,
      "@typescript-eslint/prefer-literal-enum-member": e,
      "@typescript-eslint/prefer-namespace-keyword": e,
      "@typescript-eslint/prefer-promise-reject-errors": e,
      "@typescript-eslint/prefer-reduce-type-parameter": e,
      "@typescript-eslint/prefer-regexp-exec": e,
      "@typescript-eslint/prefer-string-starts-ends-with": e,
      "@typescript-eslint/promise-function-async": e,
      "@typescript-eslint/require-array-sort-compare": e,
      "@typescript-eslint/require-await": e,
      "@typescript-eslint/restrict-plus-operands": e,
      "@typescript-eslint/return-await": [e, "always"],
      "@typescript-eslint/triple-slash-reference": e,
      "@typescript-eslint/unbound-method": e,
      "@typescript-eslint/unified-signatures": e,

      // todo: is not compatible with ESLint version 9.
      // "import/default": e,
      // "import/first": e,
      // "import/namespace": e,
      // "import/newline-after-import": e,
      // "import/no-amd": e,
      // "import/no-deprecated": e,
      // "import/no-mutable-exports": e,
      // "import/no-named-as-default-member": e,
      // "import/no-named-as-default": e,
      // "import/no-unresolved": e,

      "import/consistent-type-specifier-style": [e, "prefer-inline"],
      "import/export": e,
      "import/extensions": [e, "always", {ignorePackages: true}],
      "import/named": e,
      "import/no-absolute-path": e,
      "import/no-cycle": e,
      "import/no-default-export": e,
      "import/no-duplicates": e,
      "import/no-empty-named-blocks": e,
      "import/no-extraneous-dependencies": e,
      "import/no-import-module-exports": e,
      "import/no-named-default": e,
      "import/no-self-import": e,
      "import/no-unassigned-import": e,
      "import/no-unused-modules": e,
      "import/no-webpack-loader-syntax": e,
      "import/order": [e, {
        "alphabetize": {order: "asc", orderImportKind: "asc"},
        "groups": ["builtin", "external", "internal", "parent", "sibling"],
        "newlines-between": "never",
        "pathGroups": [{pattern: "@/**", group: "internal"}],
        "warnOnUnassignedImports": true,
      }],
      "import/unambiguous": e,

      // todo: is not compatible with ESLint version 9.
      // "promise/no-callback-in-promise": e,
      // "promise/no-multiple-resolved": e,
      // "promise/no-nesting": e,
      // "promise/no-return-wrap": e,

      "promise/catch-or-return": e,
      "promise/no-new-statics": e,
      "promise/no-return-in-finally": e,
      "promise/param-names": [e, {
        rejectPattern: "^(_+|rej|reject)$",
        resolvePattern: "^(_+|res|resolve)$",
      }],
      "promise/valid-params": e,

      // These rules does not understand custom array-like methods.
      // "unicorn/no-array-callback-reference": e,
      // "unicorn/no-array-method-this-argument": e,

      "unicorn/better-regex": e,
      "unicorn/catch-error-name": [e, {ignore: ["^e$", "^err$"]}],
      "unicorn/consistent-empty-array-spread": e,
      "unicorn/custom-error-definition": e,
      "unicorn/empty-brace-spaces": e,
      "unicorn/error-message": e,
      "unicorn/escape-case": e,
      "unicorn/expiring-todo-comments": e,
      "unicorn/explicit-length-check": [e, {"non-zero": "not-equal"}],
      "unicorn/filename-case": e,
      "unicorn/import-style": e,
      "unicorn/new-for-builtins": e,
      "unicorn/no-anonymous-default-export": e,
      "unicorn/no-array-for-each": e,
      "unicorn/no-array-push-push": e,
      "unicorn/no-array-reduce": e,
      "unicorn/no-await-expression-member": e,
      "unicorn/no-await-in-promise-methods": e,
      "unicorn/no-console-spaces": e,
      "unicorn/no-document-cookie": e,
      "unicorn/no-empty-file": e,
      "unicorn/no-for-loop": e,
      "unicorn/no-hex-escape": e,
      "unicorn/no-instanceof-array": e,
      "unicorn/no-invalid-fetch-options": e,
      "unicorn/no-invalid-remove-event-listener": e,
      "unicorn/no-length-as-slice-end": e,
      "unicorn/no-lonely-if": e,
      "unicorn/no-negation-in-equality-check": e,
      "unicorn/no-nested-ternary": e,
      "unicorn/no-new-array": e,
      "unicorn/no-new-buffer": e,
      "unicorn/no-object-as-default-parameter": e,
      "unicorn/no-process-exit": e,
      "unicorn/no-single-promise-in-promise-methods": e,
      "unicorn/no-static-only-class": e,
      "unicorn/no-thenable": e,
      "unicorn/no-this-assignment": e,
      "unicorn/no-typeof-undefined": e,
      "unicorn/no-unnecessary-await": e,
      "unicorn/no-unnecessary-polyfills": e,
      "unicorn/no-unreadable-array-destructuring": e,
      "unicorn/no-unreadable-iife": e,
      "unicorn/no-useless-fallback-in-spread": e,
      "unicorn/no-useless-length-check": e,
      "unicorn/no-useless-promise-resolve-reject": e,
      "unicorn/no-useless-spread": e,
      "unicorn/no-useless-switch-case": e,
      "unicorn/no-useless-undefined": e,
      "unicorn/no-zero-fractions": e,
      "unicorn/number-literal-case": e,
      "unicorn/prefer-add-event-listener": e,
      "unicorn/prefer-array-find": e,
      "unicorn/prefer-array-flat-map": e,
      "unicorn/prefer-array-flat": e,
      "unicorn/prefer-array-index-of": e,
      "unicorn/prefer-array-some": e,
      "unicorn/prefer-blob-reading-methods": e,
      "unicorn/prefer-code-point": e,
      "unicorn/prefer-date-now": e,
      "unicorn/prefer-default-parameters": e,
      "unicorn/prefer-dom-node-append": e,
      "unicorn/prefer-dom-node-dataset": e,
      "unicorn/prefer-dom-node-remove": e,
      "unicorn/prefer-dom-node-text-content": e,
      "unicorn/prefer-event-target": e,
      "unicorn/prefer-export-from": e,
      "unicorn/prefer-includes": e,
      "unicorn/prefer-keyboard-event-key": e,
      "unicorn/prefer-logical-operator-over-ternary": e,
      "unicorn/prefer-math-trunc": e,
      "unicorn/prefer-modern-dom-apis": e,
      "unicorn/prefer-modern-math-apis": e,
      "unicorn/prefer-module": e,
      "unicorn/prefer-native-coercion-functions": e,
      "unicorn/prefer-negative-index": e,
      "unicorn/prefer-node-protocol": e,
      "unicorn/prefer-number-properties": e,
      "unicorn/prefer-object-from-entries": e,
      "unicorn/prefer-optional-catch-binding": e,
      "unicorn/prefer-prototype-methods": e,
      "unicorn/prefer-query-selector": e,
      "unicorn/prefer-reflect-apply": e,
      "unicorn/prefer-regexp-test": e,
      "unicorn/prefer-set-has": e,
      "unicorn/prefer-set-size": e,
      "unicorn/prefer-spread": e,
      "unicorn/prefer-string-raw": e,
      "unicorn/prefer-string-replace-all": e,
      "unicorn/prefer-string-slice": e,
      "unicorn/prefer-string-starts-ends-with": e,
      "unicorn/prefer-string-trim-start-end": e,
      "unicorn/prefer-structured-clone": e,
      "unicorn/prefer-top-level-await": e,
      "unicorn/relative-url-style": e,
      "unicorn/require-array-join-separator": e,
      "unicorn/require-number-to-fixed-digits-argument": e,
      "unicorn/switch-case-braces": [e, "avoid"],
      "unicorn/template-indent": e,
      "unicorn/text-encoding-identifier-case": e,
      "unicorn/throw-new-error": e,

      // todo: is not compatible with ESLint version 9.
      // "wc/guard-define-call": e,
      // "wc/no-child-traversal-in-connectedcallback": e,

      "wc/attach-shadow-constructor": e,
      "wc/guard-super-call": e,
      "wc/no-child-traversal-in-attributechangedcallback": e,
      "wc/no-closed-shadow-root": e,
      "wc/no-constructor-attributes": e,
      "wc/no-constructor-params": e,
      "wc/no-customized-built-in-elements": e,
      "wc/no-invalid-element-name": e,
      "wc/no-invalid-extends": e,
      "wc/no-self-class": e,
      "wc/no-typos": e,
      "wc/require-listener-teardown": e,
      "wc/tag-name-matches-class": e,
    },
  },

  {
    name: "javascript/exceptions",

    files: [
      "*.cjs",
      "*.js",
      "*.mjs",
      "**/*.cjs",
      "**/*.js",
      "**/*.mjs",
    ],

    rules: {
      "@typescript-eslint/explicit-function-return-type": "off",
      "@typescript-eslint/explicit-module-boundary-types": "off",
    },
  },

  // @ts-ignore the source configs are not typed
  eslintOnlyoffice.configs["sort-package-json"],
  // @ts-ignore the source configs are not typed
  eslintOnlyoffice.configs["sort-tsconfig-json"],

  {
    // Based on https://github.com/ota-meshi/eslint-plugin-jsonc/blob/v2.16.0/lib/configs/base.ts
    name: "jsonc",

    files: [
      "*.json",
      "*.json5",
      "*.jsonc",
      "**/*.json",
      "**/*.json5",
      "**/*.jsonc",
    ],

    languageOptions: {
      parser: jsoncParser,
    },

    plugins: {
      jsonc: eslintJsonc,
    },

    rules: {
      "jsonc/array-bracket-newline": e,
      "jsonc/array-bracket-spacing": e,
      "jsonc/comma-dangle": e,
      "jsonc/comma-style": e,
      "jsonc/indent": [e, 2],
      "jsonc/key-spacing": e,
      "jsonc/no-bigint-literals": e,
      "jsonc/no-binary-expression": e,
      "jsonc/no-binary-numeric-literals": e,
      "jsonc/no-comments": e,
      "jsonc/no-dupe-keys": e,
      "jsonc/no-escape-sequence-in-identifier": e,
      "jsonc/no-floating-decimal": e,
      "jsonc/no-hexadecimal-numeric-literals": e,
      "jsonc/no-infinity": e,
      "jsonc/no-irregular-whitespace": e,
      "jsonc/no-multi-str": e,
      "jsonc/no-nan": e,
      "jsonc/no-number-props": e,
      "jsonc/no-numeric-separators": e,
      "jsonc/no-octal-escape": e,
      "jsonc/no-octal-numeric-literals": e,
      "jsonc/no-octal": e,
      "jsonc/no-parenthesized": e,
      "jsonc/no-plus-sign": e,
      "jsonc/no-regexp-literals": e,
      "jsonc/no-sparse-arrays": e,
      "jsonc/no-template-literals": e,
      "jsonc/no-undefined-value": e,
      "jsonc/no-unicode-codepoint-escapes": e,
      "jsonc/no-useless-escape": e,
      "jsonc/object-curly-newline": e,
      "jsonc/object-curly-spacing": e,
      "jsonc/object-property-newline": e,
      "jsonc/quote-props": e,
      "jsonc/quotes": e,
      "jsonc/space-unary-ops": e,
      "jsonc/valid-json-number": e,
    },
  },

  {
    name: "json5",

    files: [
      "*.json5",
      "**/*.json5",
    ],

    rules: {
      "jsonc/comma-dangle": [e, "always-multiline"],
      "jsonc/quote-props": [e, "consistent"],
    },
  },

  {
    // Based on https://github.com/ota-meshi/eslint-plugin-yml/blob/v1.14.0/src/configs/base.ts
    name: "yaml",

    files: [
      "*.yaml",
      "*.yml",
      "**/*.yaml",
      "**/*.yml",
    ],

    languageOptions: {
      parser: yamlParser,
    },

    plugins: {
      yml: eslintYaml,
    },

    rules: {
      "yml/block-mapping-colon-indicator-newline": e,
      "yml/block-mapping-question-indicator-newline": e,
      "yml/block-mapping": e,
      "yml/block-sequence-hyphen-indicator-newline": e,
      "yml/block-sequence": e,
      "yml/file-extension": [e, {extension: "yml", caseSensitive: true}],
      "yml/flow-mapping-curly-newline": e,
      "yml/flow-mapping-curly-spacing": e,
      "yml/flow-sequence-bracket-newline": e,
      "yml/flow-sequence-bracket-spacing": e,
      "yml/indent": [e, 2, {indentBlockSequences: false, indicatorValueIndent: 2}],
      "yml/key-spacing": e,
      "yml/no-empty-document": e,
      "yml/no-empty-key": e,
      "yml/no-empty-sequence-entry": e,
      "yml/no-irregular-whitespace": e,
      "yml/no-multiple-empty-lines": e,
      "yml/no-tab-indent": e,
      "yml/no-trailing-zeros": e,
      "yml/plain-scalar": e,
      "yml/quotes": e,
      "yml/require-string-key": e,
      "yml/spaced-comment": e,
    },
  },

  {
    // Based on https://github.com/eslint/markdown/blob/v5.1.0/README.md
    name: "markdown",

    files: [
      "*.md",
      "**/*.md",
    ],

    processor: eslintMarkdown.processors.markdown,

    plugins: {
      markdown: eslintMarkdown,
    },
  },

  {
    // Based on https://github.com/typescript-eslint/typescript-eslint/blob/v8.0.1/packages/eslint-plugin/src/configs/disable-type-checked.ts
    name: "markdown/typescript",

    files: [
      "*.md/*.cjs",
      "*.md/*.cts",
      "*.md/*.js",
      "*.md/*.jsx",
      "*.md/*.mjs",
      "*.md/*.mts",
      "*.md/*.ts",
      "*.md/*.tsx",
      "**/*.md/*.cjs",
      "**/*.md/*.cts",
      "**/*.md/*.js",
      "**/*.md/*.jsx",
      "**/*.md/*.mjs",
      "**/*.md/*.mts",
      "**/*.md/*.ts",
      "**/*.md/*.tsx",
    ],

    languageOptions: {
      parserOptions: {
        ecmaFeatures: {
          impliedStrict: true,
        },
        program: null,
        project: false,
        projectService: false,
      },
    },

    rules: {
      "camelcase": "off",
      "new-cap": "off",
      "no-debugger": "off",

      "@typescript-eslint/await-thenable": "off",
      "@typescript-eslint/dot-notation": "off",
      "@typescript-eslint/explicit-function-return-type": "off",
      "@typescript-eslint/explicit-module-boundary-types": "off",
      "@typescript-eslint/no-array-delete": "off",
      "@typescript-eslint/no-base-to-string": "off",
      "@typescript-eslint/no-confusing-void-expression": "off",
      "@typescript-eslint/no-duplicate-type-constituents": "off",
      "@typescript-eslint/no-explicit-any": "off",
      "@typescript-eslint/no-floating-promises": "off",
      "@typescript-eslint/no-for-in-array": "off",
      "@typescript-eslint/no-implied-eval": "off",
      "@typescript-eslint/no-invalid-this": "off",
      "@typescript-eslint/no-meaningless-void-operator": "off",
      "@typescript-eslint/no-misused-promises": "off",
      "@typescript-eslint/no-mixed-enums": "off",
      "@typescript-eslint/no-redundant-type-constituents": "off",
      "@typescript-eslint/no-unnecessary-boolean-literal-compare": "off",
      "@typescript-eslint/no-unnecessary-qualifier": "off",
      "@typescript-eslint/no-unnecessary-template-expression": "off",
      "@typescript-eslint/no-unnecessary-type-arguments": "off",
      "@typescript-eslint/no-unnecessary-type-assertion": "off",
      "@typescript-eslint/no-unsafe-argument": "off",
      "@typescript-eslint/no-unsafe-enum-comparison": "off",
      "@typescript-eslint/no-unsafe-unary-minus": "off",
      "@typescript-eslint/no-unused-expressions": "off",
      "@typescript-eslint/no-unused-vars": "off",
      "@typescript-eslint/non-nullable-type-assertion-style": "off",
      "@typescript-eslint/only-throw-error": "off",
      "@typescript-eslint/prefer-destructuring": "off",
      "@typescript-eslint/prefer-find": "off",
      "@typescript-eslint/prefer-includes": "off",
      "@typescript-eslint/prefer-promise-reject-errors": "off",
      "@typescript-eslint/prefer-reduce-type-parameter": "off",
      "@typescript-eslint/prefer-regexp-exec": "off",
      "@typescript-eslint/prefer-string-starts-ends-with": "off",
      "@typescript-eslint/promise-function-async": "off",
      "@typescript-eslint/require-array-sort-compare": "off",
      "@typescript-eslint/require-await": "off",
      "@typescript-eslint/restrict-plus-operands": "off",
      "@typescript-eslint/return-await": "off",
      "@typescript-eslint/unbound-method": "off",

      "import/extensions": "off",

      "unicorn/filename-case": "off",
    },
  },

  {
    name: "markdown/jsonc",

    files: [
      "*.md/*.json",
      "*.md/*.json5",
      "*.md/*.jsonc",
      "**/*.md/*.json",
      "**/*.md/*.json5",
      "**/*.md/*.jsonc",
    ],

    rules: {
      "jsonc/object-property-newline": "off",
    },
  },
]

export class ESLint extends ES {
  constructor(o: ES.Options = {}) {
    let f = import.meta.filename
    if (!f) {
      // Eleventy does not support esm, so we have to fall back to cjs.
      // eslint-disable-next-line unicorn/prefer-module
      f = __filename
    }

    // It is not very clear how to correctly define a flat config object,
    // so it is easier to use a flat config file.
    super({overrideConfigFile: import.meta.filename, ...o})
  }
}

export default c
