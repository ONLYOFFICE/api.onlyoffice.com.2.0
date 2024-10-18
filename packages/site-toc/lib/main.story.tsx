import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"
import {Toc, TocHeading, TocItem, TocLink, TocList} from "./main.tsx"

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

export interface PlaygroundProperties {
  heading: string
  links: string[]
  paragraphs: number
}

export const Playground: StoryObj<PlaygroundProperties> = {
  parameters: {
    actions: {
      disable: true,
    },
  },
  args: {
    heading: "In this article",
    links: ["Introduction", "Installation", "Usage", "Conclusion"],
    paragraphs: 20,
  },
  render(p) {
    return <div style={{display: "grid", gridTemplateColumns: "1fr min-content"}}>
      <main>
        <h1>Playground</h1>
        <p>Scroll down to view the changes in the table of contents component.</p>
        {Array.from({length: p.paragraphs}, (_, i) => <p key={i}>...</p>)}
        <h2 id="introduction">Introduction</h2>
        {Array.from({length: p.paragraphs}, (_, i) => <p key={i}>...</p>)}
        <h2 id="installation">Installation</h2>
        {Array.from({length: p.paragraphs}, (_, i) => <p key={i}>...</p>)}
        <h2 id="usage">Usage</h2>
        {Array.from({length: p.paragraphs}, (_, i) => <p key={i}>...</p>)}
        <h2 id="conclusion">Conclusion</h2>
        {Array.from({length: p.paragraphs}, (_, i) => <p key={i}>...</p>)}
      </main>
      <aside>
        <div style={{position: "sticky", top: 0}}>
          <Toc>
            <TocHeading>{p.heading}</TocHeading>
            <TocList>
              {p.links.map((s) => <TocItem>
                <TocLink href={`#${s.toLocaleLowerCase()}`}>{s}</TocLink>
              </TocItem>)}
            </TocList>
          </Toc>
        </div>
      </aside>
    </div>
  },
}
