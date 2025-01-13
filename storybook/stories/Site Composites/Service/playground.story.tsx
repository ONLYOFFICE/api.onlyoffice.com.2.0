// todo: resuscitate stories
// Add a step to generate service fixtures for the browser environment.

import {
  Service,
  ServiceDescription,
  ServiceHeading,
  type ServiceProperties,
  ServiceSyntaxHighlight,
} from "@onlyoffice/site-kit"
import {type Meta, type StoryObj} from "@storybook/preact"
import {Fragment, h} from "preact"

export default {
  title: "Site Composites / Service",
} satisfies Meta

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
