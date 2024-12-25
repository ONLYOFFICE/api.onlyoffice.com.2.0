import {Signature, SignatureReference} from "@onlyoffice/site-kit"
import {type Meta, type StoryObj} from "@storybook/preact"
import {Fragment, h} from "preact"
import {Playground} from "./playground.story.tsx"

export default {
  title: "Site Patterns / Signature",
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
    return <>
      {Playground.args && Playground.args.signature &&
        <Signature signature={Playground.args.signature}>
          <SignatureReference>
            {(p) => <a href={p.reference.id}>{p.children}</a>}
          </SignatureReference>
        </Signature>}
    </>
  },
}
