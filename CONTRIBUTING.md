<!--lint disable first-heading-level no-file-name-irregular-characters-->

# Contributing

Welcome to the contribution guidelines for the ONLYOFFICE API Documentation project. This document might be useful for individuals who contribute to the project, whether through code or articles and for those who provide data from external sources.

## Contents

- [Direct Contribution](#direct-contribution)
  - [Preparation](#preparation)
- [Indirect Contribution](#indirect-contribution)
  - [TypeScript Codebase](#typescript-codebase)
    - [Package Configuration](#package-configuration)
    - [TypeDoc Configuration](#typedoc-configuration)
    - [Limitations of TypeDoc Configuration](#limitations-of-typedoc-configuration)
    - [The @summary and @remarks Tags' Behavior](#the-summary-and-remarks-tags-behavior)
    - [The @category and @group Tags' Behavior](#the-category-and-group-tags-behavior)
    - [The @expand Tag's Behavior](#the-expand-tags-behavior)
    - [Markdown Support](#markdown-support)
    - [Get Help](#get-help)

## Direct Contribution

The Direct Contribution section is for those who contribute with the goal of improving the platform's existing codebase or enhancing the articles in the documentation.

### Preparation

Before pursuing specific contribution goals, please ensure you have the necessary tools:

- [Node.js] version 21 or higher.
- [pnpm] version 9 or higher.

The project uses [mise], a polyglot tool version manager, which is the recommended one to install. If you already have experience with tools like [asdf], [nvm], [nodenv], or similar ones, you will find it very familiar.

For Visual Studio Code users, the following extensions are recommended:

- [Code Spell Checker] for spell checking.
- [ESLint] for linting scripts and configurations.
- [Markdown All in One] for adding support for Markdown files.
- [remark] for linting Markdown content.
- [Stylelint] for linting stylesheets.
- [YAML] for adding support for YAML files.

Once you have everything installed, clone the Git repository from the company's Git server:

```sh
git clone git@git.onlyoffice.com:ONLYOFFICE/api.onlyoffice.com.git
```

... or from the GitHub mirror:

```sh
git clone git@github.com:ONLYOFFICE/api.onlyoffice.com.git
```

... install the dependencies:

```sh
pnpm install
```

... optionally, but recommended, install the git hooks:

```sh
pnpm exec lefthook install
```

... build the project packages:

```sh
pnpm build
```

For Visual Studio Code users, it is recommended to set the TypeScript version to the workspace version:

1. Navigate to any JavaScript or TypeScript file, for example, [`makefile.ts`][makefile.ts].
2. Open the [Command Palette].
3. Type "TypeScript: Select TypeScript Version...".
4. Select "Use Workspace Version".

Now, we are ready to move on.

## Indirect Contribution

The Indirect Contribution section is for those who contribute by providing data from external sources, also known as [x-declarations] repositories.

### TypeScript Codebase

To work with a codebase written in TypeScript, we use [TypeDoc], and you should consider doing so as well. This section describes how to configure TypeDoc to generate data correctly, which features the documentation supports, and what limitations exist. The following discussions will be based on the example of [TypeDoc Fixture], a small internal package specifically created to demonstrate the integration of TypeDoc into the documentation project.

#### Package Configuration

The following is an example of how to configure TypeDoc in a [`package.json`][package.json] file:

```json
{
  "scripts": {
    "build-docs": "typedoc"
  },
  "devDependencies": {
    "typedoc": "0.27.5"
  }
}
```

The documentation project is sensitive to the versions of the tools it utilizes. Therefore, it is strongly recommended to use TypeDoc version 0.27.5. The documentation cannot guarantee correctness if a different version of TypeDoc is used. However, if there is a need for a newer version of TypeDoc, please contact the team behind the documentation.

#### TypeDoc Configuration

The following is an example of how to configure TypeDoc in a [`typedoc.json`][typedoc.json] file:

```jsonc
{
  "$schema": "https://typedoc.org/schema.json",
  "entryPoints": ["lib/*.ts"],
  "excludeReferences": true,
  "includeVersion": true,
  "outputs": [
    {
      "name": "json",
      "path": "dist/docs.json"
    },
    {
      "name": "html",
      "path": "dist/docs",
      "options": {
        "navigation": {
          "includeCategories": true,
          "includeGroups": true
        }
      }
    }
  ],
  "treatValidationWarningsAsErrors": true,
  "treatWarningsAsErrors": true,
  "validation": true
}
```

Let us consider the configuration of TypeDoc itself in more detail.

```jsonc
{
  "$schema": "https://typedoc.org/schema.json"
}
```

The [`$schema`][\$schema] property is an optional field that specifies the URL of the JSON schema that the configuration file uses. Your editor should automatically identify the correct schema. However, if it does not, the `$schema` property will guide your editor.

```jsonc
{
  "entryPoints": ["lib/*.ts"]
}
```

The [`entryPoints`][entryPoints] property is a required field that specifies the entry points of the TypeDoc documentation. The value of this property can vary greatly from project to project. The TypeDoc Fixtures uses a glob pattern; however, in different scenarios, you may prefer the direct mention of each entry point.

```jsonc
{
  "excludeReferences": true
}
```

The [`excludeReferences`][excludeReferences] property is a required field that excludes references from the generated documentation. This property helps avoid creating duplicate web pages later.

```jsonc
{
  "includeVersion": true
}
```

The [`includeVersion`][includeVersion] property is a required field that includes the version according to `package.json` in the generated documentation. This property helps users understand the version of the documentation they are viewing.

```jsonc
{
  "outputs": [
    {
      "name": "json",
      "path": "dist/docs.json"
    }
  ]
}
```

The [`output`][outputs] in JSON format is a required configuration. It is the result of generation in JSON format that must be published in the corresponding x-declaration repository. From this data, web pages will be created later in the documentation project.

```jsonc
{
  "outputs": [
    {
      "name": "html",
      "path": "dist/docs",
      "options": {
        "navigation": {
          "includeCategories": true,
          "includeGroups": true
        }
      }
    }
  ]
}
```

The `output` in HTML format is an optional configuration. The generated HTML output may serve as a preview of future web pages created in the documentation project. However, the documentation project does not utilize this data format, and it does not aim to create web pages exactly as TypeDoc does.

```jsonc
{
  "treatValidationWarningsAsErrors": true,
  "treatWarningsAsErrors": true,
  "validation": true
}
```

The [`treatValidationWarningsAsErrors`][treatValidationWarningsAsErrors], [`treatWarningsAsErrors`][treatWarningsAsErrors], and [`validation`][validation] properties are optional fields that are recommended to be enabled. These properties help ensure the correctness of the generated documentation.

#### Limitations of TypeDoc Configuration

The documentation project has some limitations in the configuration of TypeDoc.

```jsonc
{
  "defaultCategory": "Other"
}
```

The [`defaultCategory`][defaultCategory] is used when a module employs custom categories, but there are still entities that have not been assigned to any category. For the documentation project, it needs to be able to filter out the default category in order to group ungrouped entities by their types. Therefore, the name of the default category should not be changed. This limitation may be removed in the future.

```jsonc
{
  "plugin": []
}
```

The [`plugin`][plugin] allows for extending the functionality of TypeDoc. At this time, the documentation project recommends not using any plugins due to the uncertainty of potential changes in exported data. This limitation may be removed in the future.

#### The @summary and @remarks Tags' Behavior

The [`@summary`][@summary] and [`@remarks`][@remarks] tags are used to describe the entity:

```ts
/**
 * Head is a description that does not have a specific tag.
 * @summary Summary is a brief description of the entity.
 * @remarks Remarks is a detailed description of the entity.
 */
```

The documentation project utilizes fewer options to describe the entity and uses different terms. For a better understanding of how the documentation processes the TypeDoc descriptions, the following table is provided below:

| Head | @summary | @remarks | Result Summary                   | Result Description                                      |
| :--- | :------- | :------- | :------------------------------- | :------------------------------------------------------ |
| -    | -        | -        | No summary                       | No description                                          |
| +    | -        | -        | First sentence of the head       | Everything in the head                                  |
| -    | +        | -        | Everything in the `@summary`     | No description                                          |
| -    | -        | +        | First sentence of the `@remarks` | Everything in the `@remarks`                            |
| +    | +        | -        | Everything in the `@summary`     | Everything in the head                                  |
| -    | +        | +        | Everything in the `@summary`     | Everything in the `@remarks`                            |
| +    | -        | +        | First sentence of the head       | Everything in the head and everything in the `@remarks` |
| +    | +        | +        | Everything in the `@summary`     | Everything in the head and everything in the `@remarks` |

#### The @category and @group Tags' Behavior

The [`@category`][@category] and [`@group`][@group] tags allow for grouping related entities together. For the documentation project, these tags are synonyms since the documentation has only one type of grouping for web pages. Both of these tags can be used; just note that the documentation does not recognize any differences between category and group.

#### The @expand Tag's Behavior

The [`@expand`][@expand] tag allows the type declaration to be included inline wherever it is referenced. The documentation project does not support this feature and recommends avoiding the use of this tag. The problem is that these expanded types are harder to read and harder to make references to.

**Do**

```ts
/**
 * Describes the properties of a button.
 */
interface ButtonProperties {
  size: "small" | "medium" | "large"
}

/**
 * Represents a button.
 * @param props The properties of the button.
 */
function Button(props: ButtonProperties) {
  // ...
}
```

**Do not**

```ts
/**
 * Describes the properties of a button.
 * @expand
 */
interface ButtonProperties {
  size: "small" | "medium" | "large"
}

/**
 * Represents a button.
 */
function Button(props: ButtonProperties) {
  // ...
}
```

#### Markdown Support

The documentation project utilizes the Markdown process for text everywhere, which means that Markdown syntax can be used almost universally. However, you should be aware that the documentation does not allow the use of HTML syntax. Additionally, the documentation does not provide extended Markdown syntax, such as [GitHub Alerts], but this will change soon.

#### Get Help

If you have any questions or need help with the configuration of TypeDoc, feel free to explore the [x-declarations] for possible configuration options, or contact the documentation project team.

<!--lint disable no-missing-blank-lines -->

<!-- Tooling Related Footnotes -->

[asdf]: https://asdf-vm.com/
[mise]: https://mise.jdx.dev/
[Node.js]: https://nodejs.org/
[nodenv]: https://github.com/nodenv/nodenv/
[nvm]: https://github.com/nvm-sh/nvm/
[pnpm]: https://pnpm.io/

<!-- Visual Studio Code Related Footnotes -->

[Command Palette]: https://code.visualstudio.com/docs/getstarted/userinterface/#_command-palette
[Code Spell Checker]: https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker
[ESLint]: https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint
[Markdown All in One]: https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one
[remark]: https://marketplace.visualstudio.com/items?itemName=unifiedjs.vscode-remark
[Stylelint]: https://marketplace.visualstudio.com/items?itemName=stylelint.vscode-stylelint
[YAML]: https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml

<!-- TypeDoc Related Footnotes -->

[TypeDoc]: https://typedoc.org/
[TypeDoc Fixture]: ./packages/fixture-resource/fixtures/typedoc/README.md
[package.json]: ./packages/fixture-resource/fixtures/typedoc/package.json
[typedoc.json]: ./packages/fixture-resource/fixtures/typedoc/typedoc.json
[\$schema]: https://typedoc.org/documents/Options.Configuration.html#json-files
[plugin]: https://typedoc.org/documents/Options.Configuration.html#plugin
[entryPoints]: https://typedoc.org/documents/Options.Input.html#entrypoints
[excludeReferences]: https://typedoc.org/documents/Options.Input.html#excludereferences
[includeVersion]: https://typedoc.org/documents/Options.Input.html#includeversion
[outputs]: https://typedoc.org/documents/Options.Output.html#outputs
[defaultCategory]: https://typedoc.org/documents/Options.Organization.html#defaultcategory
[treatValidationWarningsAsErrors]: https://typedoc.org/documents/Options.Validation.html#treatvalidationwarningsaserrors
[treatWarningsAsErrors]: https://typedoc.org/documents/Options.Validation.html#treatwarningsaserrors
[validation]: https://typedoc.org/documents/Options.Validation.html#validation
[@category]: https://typedoc.org/documents/Tags._category.html
[@expand]: https://typedoc.org/documents/Tags._expand.html
[@group]: https://typedoc.org/documents/Tags._group.html
[@remarks]: https://typedoc.org/documents/Tags._remarks.html
[@summary]: https://typedoc.org/documents/Tags._summary.html

<!-- Markdown Related Footnotes -->

[GitHub Alerts]: https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax/#alerts

<!-- Other Footnotes -->

[makefile.ts]: ./makefile.ts
[x-declarations]: https://git.onlyoffice.com/ONLYOFFICE/?q=-declarations&sort=recentupdate
