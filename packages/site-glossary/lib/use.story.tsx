import {Join} from "@onlyoffice/preact-join"
import {Signature, SignatureReference} from "@onlyoffice/site-signature"
import {Badge, BadgeCaption, BadgeGroup} from "@onlyoffice/ui-kit"
import {type Meta, type StoryObj} from "@storybook/preact"
import {Fragment, h} from "preact"
import {Glossary, GlossaryDetails, GlossaryName, GlossaryTerm} from "./main.tsx"

export default {
  title: "Site Patterns / Glossary / Use Cases",
} satisfies Meta

export const GlossaryOfMethods: StoryObj = {
  name: "Glossary of Methods",
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
      {type: "text", text: "("},
      {type: "text", text: "sImageSrc"},
      {type: "text", text: ", "},
      {type: "text", text: "nWidth"},
      {type: "text", text: ", "},
      {type: "text", text: "nHeight"},
      {type: "text", text: ", "},
      {type: "text", text: "Data"},
      {type: "text", text: ")"},
      {type: "text", text: ": "},
      {id: window.location.href, token: {type: "type", text: "ApiOleObject"}},
    ],
  },
  render(p) {
    return <Glossary>
      {Array.from({length: 20}).map(() => <>
        <GlossaryTerm>
          <GlossaryName>
            <a href={window.location.href}>CreateOleObject</a>
          </GlossaryName>
          <Signature variant="inline" signature={p.signature}>
            <SignatureReference>
              {(p) => <a href={p.reference.id}>{p.children}</a>}
            </SignatureReference>
          </Signature>
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

export const GlossaryOfParameters: StoryObj = {
  name: "Glossary of Parameters",
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
