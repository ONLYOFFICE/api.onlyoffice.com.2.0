import {type Data} from "@onlyoffice/eleventy-types"
import {
  Status,
  StatusButton,
  StatusDescription,
  StatusHeading,
  StatusPicture,
} from "@onlyoffice/site-kit"
import {Picture404} from "@onlyoffice/ui-kit"
import {type JSX, h} from "preact"

export function data(): Data {
  return {
    layout: "page",
  }
}

export function render(): JSX.Element {
  return <Status>
    <StatusHeading>
      <h1>404</h1>
    </StatusHeading>
    <StatusPicture>
      <Picture404 />
    </StatusPicture>
    <StatusDescription>Oops...Page not found!</StatusDescription>
    <StatusButton asChild>
      <a href="/">Go to home page</a>
    </StatusButton>
  </Status>
}
