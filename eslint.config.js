import config from "@onlyoffice/eslint-config"
import gitignore from "eslint-config-flat-gitignore"

export default [
  gitignore(),

  {
    // Many developers frequently store files in their local repository that
    // assist with development, but these files should not be published to the
    // remote repository. These might include editor settings or a directory of
    // notes, which are typically ignored by the global git configuration.
    // However, ESLint does not respect either the local or global gitignore by
    // default (as well as eslint-config-flat-gitignore). To prevent any
    // confusion, it is worth to explicitly specify the target files for the
    // linter.
    ignores: [
      "*",
      "**/fixtures",
      "!.github",
      "!packages",
      "!site",
      "!storybook",
      "!.remarkrc.js",
      "!c8.config.json",
      "!eslint.config.js",
      "!lefthook.yml",
      "!makefile.ts",
      "!package.json",
      "!stylelint.config.js",
      "!tsconfig.base.json",
      "!tsconfig.build.json",
      "!tsconfig.json",
    ],
  },

  // @ts-ignore i am sure of it
  // eslint-disable-next-line @typescript-eslint/no-misused-promises
  ...config,
]
