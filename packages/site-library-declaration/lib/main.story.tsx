// todo: resuscitate stories

import {type Meta, type StoryObj} from "@storybook/preact"
import {Fragment, h} from "preact"
import {
  LibraryDeclaration,
  LibraryDeclarationDescription,
  LibraryDeclarationHeading,
  type LibraryDeclarationProperties,
  LibraryDeclarationSyntaxHighlight,
} from "./main.tsx"

export default {
  title: "Site / Library Declaration",
} satisfies Meta

export const Default: StoryObj = {
  parameters: {
    controls: {
      disable: true,
    },
    actions: {
      disable: true,
    },
  },
  render() {
    // @ts-ignore todo
    return <LibraryDeclaration declaration={{}} />
  },
}

export const Playground: StoryObj<LibraryDeclarationProperties> = {
  parameters: {
    actions: {
      disable: true,
    },
  },
  args: {
    // todo
  },
  render(p) {
    return <LibraryDeclaration {...p}>
      <LibraryDeclarationHeading for="Constructors">
        <h2>Constructors</h2>
      </LibraryDeclarationHeading>
      <LibraryDeclarationHeading for="Description">
        <h2>Description</h2>
      </LibraryDeclarationHeading>
      <LibraryDeclarationHeading for="Events">
        <h2>Events</h2>
      </LibraryDeclarationHeading>
      <LibraryDeclarationHeading for="Examples">
        <h2>Examples</h2>
      </LibraryDeclarationHeading>
      <LibraryDeclarationHeading for="Extends By">
        <h2>Extends By</h2>
      </LibraryDeclarationHeading>
      <LibraryDeclarationHeading for="Extends">
        <h2>Extends</h2>
      </LibraryDeclarationHeading>
      <LibraryDeclarationHeading for="Instance Methods">
        <h2>Instance Methods</h2>
      </LibraryDeclarationHeading>
      <LibraryDeclarationHeading for="Instance Properties">
        <h2>Instance Properties</h2>
      </LibraryDeclarationHeading>
      <LibraryDeclarationHeading for="Overloads By">
        <h2>Overloads By</h2>
      </LibraryDeclarationHeading>
      <LibraryDeclarationHeading for="Overloads">
        <h2>Overloads</h2>
      </LibraryDeclarationHeading>
      <LibraryDeclarationHeading for="Parameters">
        <h2>Parameters</h2>
      </LibraryDeclarationHeading>
      <LibraryDeclarationHeading for="Properties">
        <h2>Properties</h2>
      </LibraryDeclarationHeading>
      <LibraryDeclarationHeading for="Returns">
        <h2>Returns</h2>
      </LibraryDeclarationHeading>
      <LibraryDeclarationHeading for="Try It">
        <h2>Try It</h2>
      </LibraryDeclarationHeading>
      <LibraryDeclarationDescription>
        {(p) => <p>{p.children}</p>}
      </LibraryDeclarationDescription>
      <LibraryDeclarationSyntaxHighlight>
        {(p) => <>{p.children}</>}
      </LibraryDeclarationSyntaxHighlight>
    </LibraryDeclaration>
  },
}
