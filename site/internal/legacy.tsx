import {Button} from "@onlyoffice/ui-kit"
import {type JSX, h} from "preact"

export function Legacy(): JSX.Element {
  return <legacy-container class="legacy">
    <Button asChild variant="accent">
      <a>Old version</a>
    </Button>
  </legacy-container>
}
