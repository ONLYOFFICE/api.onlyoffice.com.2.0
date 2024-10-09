// todo: resuscitate stories
// Add a step to generate service fixtures for the browser environment.

import {type Meta, type StoryObj} from "@storybook/preact"
import {Fragment, h} from "preact"
import {
  ServiceDeclaration,
  ServiceDeclarationDescription,
  ServiceDeclarationHeading,
  type ServiceDeclarationProperties,
  ServiceDeclarationSyntaxHighlight,
} from "./main.tsx"

export default {
  title: "Site / Service Declaration",
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
    return <ServiceDeclaration declaration={{}} />
  },
}

export const Playground: StoryObj<ServiceDeclarationProperties> = {
  parameters: {
    actions: {
      disable: true,
    },
  },
  args: {
    // todo
  },
  render(p) {
    return <ServiceDeclaration {...p}>
      <ServiceDeclarationHeading for="Authorization">
        <h3>Authorization</h3>
      </ServiceDeclarationHeading>
      <ServiceDeclarationHeading for="Body">
        <h3>Body</h3>
      </ServiceDeclarationHeading>
      <ServiceDeclarationHeading for="Cookies">
        <h3>Cookies</h3>
      </ServiceDeclarationHeading>
      <ServiceDeclarationHeading for="Examples">
        <h3>Examples</h3>
      </ServiceDeclarationHeading>
      <ServiceDeclarationHeading for="Headers">
        <h3>Headers</h3>
      </ServiceDeclarationHeading>
      <ServiceDeclarationHeading for="Path">
        <h3>Path</h3>
      </ServiceDeclarationHeading>
      <ServiceDeclarationHeading for="Query">
        <h3>Query</h3>
      </ServiceDeclarationHeading>
      <ServiceDeclarationHeading for="Request">
        <h2>Request</h2>
      </ServiceDeclarationHeading>
      <ServiceDeclarationHeading for="Responses">
        <h2>Responses</h2>
      </ServiceDeclarationHeading>
      <ServiceDeclarationDescription>
        {(p) => <p>{p.children}</p>}
      </ServiceDeclarationDescription>
      <ServiceDeclarationSyntaxHighlight>
        {(p) => <>{p.children}</>}
      </ServiceDeclarationSyntaxHighlight>
    </ServiceDeclaration>
  },
}
