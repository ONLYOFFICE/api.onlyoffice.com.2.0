// todo: resuscitate stories
// Add a step to generate service fixtures for the browser environment.

import {type Meta, type StoryObj} from "@storybook/preact"
import {Fragment, h} from "preact"
import {
  Service,
  ServiceDescription,
  ServiceHeading,
  type ServiceProperties,
  ServiceSyntaxHighlight,
} from "./main.tsx"

export default {
  title: "Site Composites / Service",
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
    return <Service declaration={{}} />
  },
}

export const Playground: StoryObj<ServiceProperties> = {
  parameters: {
    actions: {
      disable: true,
    },
  },
  args: {
    // todo
  },
  render(p) {
    return <Service {...p}>
      <ServiceHeading for="Authorization">
        <h3>Authorization</h3>
      </ServiceHeading>
      <ServiceHeading for="Body">
        <h3>Body</h3>
      </ServiceHeading>
      <ServiceHeading for="Cookies">
        <h3>Cookies</h3>
      </ServiceHeading>
      <ServiceHeading for="Examples">
        <h3>Examples</h3>
      </ServiceHeading>
      <ServiceHeading for="Headers">
        <h3>Headers</h3>
      </ServiceHeading>
      <ServiceHeading for="Path">
        <h3>Path</h3>
      </ServiceHeading>
      <ServiceHeading for="Query">
        <h3>Query</h3>
      </ServiceHeading>
      <ServiceHeading for="Request">
        <h2>Request</h2>
      </ServiceHeading>
      <ServiceHeading for="Responses">
        <h2>Responses</h2>
      </ServiceHeading>
      <ServiceDescription>
        {(p) => <p>{p.children}</p>}
      </ServiceDescription>
      <ServiceSyntaxHighlight>
        {(p) => <>{p.children}</>}
      </ServiceSyntaxHighlight>
    </Service>
  },
}
