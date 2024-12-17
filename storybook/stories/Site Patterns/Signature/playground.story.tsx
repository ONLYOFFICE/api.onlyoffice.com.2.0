import {
  Signature,
  type SignatureProperties,
  SignatureReference,
} from "@onlyoffice/site-kit"
import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"

export default {
  title: "Site Patterns / Signature",
} satisfies Meta

export const Playground: StoryObj<SignatureProperties> = {
  parameters: {
    actions: {
      disable: true,
    },
  },
  argTypes: {
    variant: {
      control: "select",
      options: ["default", "block", "inline"],
    },
  },
  args: {
    variant: "default",
    signature: [
      {type: "keyword", text: "function"},
      {type: "text", text: " "},
      {type: "entity", text: "ConvertDocument"},
      {type: "text", text: "("},
      {type: "text", text: "\n"},
      {type: "text", text: "  "},
      {type: "parameter", text: "sConvertType"},
      {type: "text", text: ": "},
      {type: "string", text: '"markdown"'},
      {type: "text", text: " | "},
      {type: "string", text: '"html"'},
      {type: "text", text: " = "},
      {type: "string", text: '"markdown"'},
      {type: "text", text: ","},
      {type: "text", text: "\n"},
      {type: "text", text: "  "},
      {type: "parameter", text: "bHtmlHeadings"},
      {type: "text", text: ": "},
      {type: "type", text: "boolean"},
      {type: "text", text: " = "},
      {type: "text", text: "false"},
      {type: "text", text: ","},
      {type: "text", text: "\n"},
      {type: "text", text: "  "},
      {type: "parameter", text: "bBase64img"},
      {type: "text", text: ": "},
      {type: "type", text: "boolean"},
      {type: "text", text: " = "},
      {type: "text", text: "false"},
      {type: "text", text: ","},
      {type: "text", text: "\n"},
      {type: "text", text: "  "},
      {type: "parameter", text: "bDemoteHeadings"},
      {type: "text", text: ": "},
      {type: "type", text: "boolean"},
      {type: "text", text: " = "},
      {type: "text", text: "false"},
      {type: "text", text: ","},
      {type: "text", text: "\n"},
      {type: "text", text: "  "},
      {type: "parameter", text: "bRenderHTMLTags"},
      {type: "text", text: ": "},
      {type: "type", text: "boolean"},
      {type: "text", text: " = "},
      {type: "text", text: "false"},
      {type: "text", text: ","},
      {type: "text", text: "\n"},
      {type: "text", text: "  "},
      {id: "#", token: {type: "parameter", text: "iAmReferenceOnPage"}},
      {type: "text", text: ": "},
      {id: window.location.href, token: {type: "type", text: "iAmReferenceOnExternalPage"}},
      {type: "text", text: ","},
      {type: "text", text: "\n"},
      {type: "text", text: "): "},
      {type: "type", text: "string"},
    ],
  },
  render(p) {
    return <Signature {...p}>
      <SignatureReference>
        {(p) => <a href={p.reference.id}>{p.children}</a>}
      </SignatureReference>
    </Signature>
  },
}
