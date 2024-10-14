import {Join} from "@onlyoffice/preact-join"
import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"
import {Glossary, GlossaryDetails, GlossaryName, GlossaryTerm} from "./main.tsx"

export default {
  title: "Site Patterns / Glossary",
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
    return <Glossary>
      <GlossaryTerm>
        <GlossaryName>Alpaca</GlossaryName>
      </GlossaryTerm>
      <GlossaryDetails>
        <Join separator=" ">
          The alpaca (Lama pacos) is a species of South American camelid mammal.
          Traditionally, alpacas are kept in herds that graze on the level
          heights of the Andes of Southern Peru, Western Bolivia, Ecuador, and
          Northern Chile. Today, alpacas may be found on farms and ranches
          worldwide, with thousands of animals born and raised annually. Alpacas
          are especially popular in North America, Europe, and Australia.
        </Join>
      </GlossaryDetails>
      <GlossaryTerm>
        <GlossaryName>
          <a href={window.location.href}>Llama</a>
        </GlossaryName>
      </GlossaryTerm>
      <GlossaryDetails>
        <Join separator=" ">
          The llama (Lama glama) is a domesticated South American camelid,
          widely used as a meat and pack animal by Andean cultures since the
          pre-Columbian era.
        </Join>
      </GlossaryDetails>
    </Glossary>
  },
}
