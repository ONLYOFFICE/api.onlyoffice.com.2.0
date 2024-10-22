import {Picture404} from "@onlyoffice/ui-kit"
import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"
import {
  Status,
  StatusButton,
  StatusDescription,
  StatusHeading,
  StatusPicture,
  type StatusProperties,
} from "./main.tsx"

export default {
  title: "Site Regions / Status",
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
    return <Status>
      <StatusHeading>
        <h1>404</h1>
      </StatusHeading>
      <StatusPicture>
        <Picture404 />
      </StatusPicture>
      <StatusDescription>Oops...Page not found!</StatusDescription>
      <StatusButton asChild>
        <a href={window.location.href}>Go to home page</a>
      </StatusButton>
    </Status>
  },
}

export interface PlaygroundProperties extends StatusProperties {
  heading: string
  description: string
  button: string
}

export const Playground: StoryObj<PlaygroundProperties> = {
  parameters: {
    actions: {
      disable: true,
    },
  },
  argTypes: {
    size: {
      control: "select",
      options: ["default", "small", "medium", "large"],
    },
  },
  args: {
    size: "default",
    heading: "404",
    description: "Oops...Page not found!",
    button: "Go to home page",
  },
  render(p) {
    return <Status size={p.size}>
      <StatusHeading>
        <h1>{p.heading}</h1>
      </StatusHeading>
      <StatusPicture>
        <Picture404 />
      </StatusPicture>
      <StatusDescription>{p.description}</StatusDescription>
      <StatusButton asChild>
        <a href={window.location.href}>{p.button}</a>
      </StatusButton>
    </Status>
  },
}
