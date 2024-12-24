// todo: resuscitate stories

import {
  Library,
  LibraryDescription,
  LibraryHeading,
  type LibraryProperties,
  LibrarySyntaxHighlight,
} from "@onlyoffice/site-kit"
import {type Meta, type StoryObj} from "@storybook/preact"
import {Fragment, h} from "preact"

export default {
  title: "Site Composites / Library",
} satisfies Meta

export const Playground: StoryObj<LibraryProperties> = {
  parameters: {
    actions: {
      disable: true,
    },
  },
  args: {
    // todo
  },
  render(p) {
    return <Library {...p}>
      <LibraryHeading for="Constructors">
        <h2>Constructors</h2>
      </LibraryHeading>
      <LibraryHeading for="Description">
        <h2>Description</h2>
      </LibraryHeading>
      <LibraryHeading for="Events">
        <h2>Events</h2>
      </LibraryHeading>
      <LibraryHeading for="Examples">
        <h2>Examples</h2>
      </LibraryHeading>
      <LibraryHeading for="Extends By">
        <h2>Extends By</h2>
      </LibraryHeading>
      <LibraryHeading for="Extends">
        <h2>Extends</h2>
      </LibraryHeading>
      <LibraryHeading for="Instance Methods">
        <h2>Instance Methods</h2>
      </LibraryHeading>
      <LibraryHeading for="Instance Properties">
        <h2>Instance Properties</h2>
      </LibraryHeading>
      <LibraryHeading for="Overloads By">
        <h2>Overloads By</h2>
      </LibraryHeading>
      <LibraryHeading for="Overloads">
        <h2>Overloads</h2>
      </LibraryHeading>
      <LibraryHeading for="Parameters">
        <h2>Parameters</h2>
      </LibraryHeading>
      <LibraryHeading for="Properties">
        <h2>Properties</h2>
      </LibraryHeading>
      <LibraryHeading for="Returns">
        <h2>Returns</h2>
      </LibraryHeading>
      <LibraryHeading for="Try It">
        <h2>Try It</h2>
      </LibraryHeading>
      <LibraryDescription>
        {(p) => <p>{p.children}</p>}
      </LibraryDescription>
      <LibrarySyntaxHighlight>
        {(p) => <>{p.children}</>}
      </LibrarySyntaxHighlight>
    </Library>
  },
}
