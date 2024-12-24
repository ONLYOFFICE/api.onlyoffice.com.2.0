import {Join} from "@onlyoffice/preact-join"
import {
  Glossary,
  GlossaryDetails,
  GlossaryTerm,
  Signature,
} from "@onlyoffice/site-kit"
import {Badge, BadgeCaption, BadgeGroup} from "@onlyoffice/ui-kit"
import {type Meta, type StoryObj} from "@storybook/preact"
import {Fragment, h} from "preact"

export default {
  title: "Site Patterns / Glossary",
} satisfies Meta

export const OfParameters: StoryObj = {
  name: "Of Parameters",
  parameters: {
    controls: {
      disable: true,
    },
    actions: {
      disable: true,
    },
  },
  args: {
    variant: "default",
    signature: [
      {type: "string", text: '"markdown"'},
      {type: "text", text: " | "},
      {type: "string", text: '"html"'},
    ],
  },
  render(p) {
    return <Glossary>
      {Array.from({length: 20}).map(() => <>
        <GlossaryTerm>
          <BadgeGroup>
            <Badge variant="calm">sConvertType</Badge>
            <Badge variant="transparent">
              <Signature variant="inline" signature={p.signature} />
            </Badge>
            <Badge variant="neutral">
              <BadgeCaption>
                default
              </BadgeCaption>
              markdown
            </Badge>
          </BadgeGroup>
        </GlossaryTerm>
        <GlossaryDetails>
          <Join separator=" ">
            Defines if the HTML headings and IDs will be generated when the
            Markdown renderer of your target platform does not handle
            Markdown-style IDs.
          </Join>
        </GlossaryDetails>
      </>)}
    </Glossary>
  },
}
