import {Toc, TocHeading, TocItem, TocLink, TocList} from "@onlyoffice/site-kit"
import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"

export default {
  title: "Site Patterns / Table of Contents (TOC)",
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
    return <Toc>
      <TocHeading>In this article</TocHeading>
      <TocList>
        <TocItem>
          <TocLink href="#introduction">Introduction</TocLink>
        </TocItem>
        <TocItem>
          <TocLink href="#installation">Installation</TocLink>
        </TocItem>
        <TocItem>
          <TocLink href="#usage">Usage</TocLink>
        </TocItem>
        <TocItem>
          <TocLink href="#conclusion">Conclusion</TocLink>
        </TocItem>
      </TocList>
    </Toc>
  },
}
