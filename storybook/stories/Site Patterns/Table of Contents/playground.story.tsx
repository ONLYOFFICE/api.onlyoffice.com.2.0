import {Toc, TocHeading, TocItem, TocLink, TocList} from "@onlyoffice/site-kit"
import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"

export default {
  title: "Site Patterns / Table of Contents (TOC)",
} satisfies Meta

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
