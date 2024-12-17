import {Join} from "@onlyoffice/preact-join"
import {
  Glossary,
  GlossaryDetails,
  GlossaryName,
  GlossaryTerm,
  Signature,
  SignatureReference,
} from "@onlyoffice/site-kit"
import {type Meta, type StoryObj} from "@storybook/preact"
import {Fragment, h} from "preact"

export default {
  title: "Site Patterns / Glossary",
} satisfies Meta

export const OfMethods: StoryObj = {
  name: "Of Methods",
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
