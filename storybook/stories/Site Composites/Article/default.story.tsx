import {Join} from "@onlyoffice/preact-join"
import {
  Article,
  ArticleBreadcrumb,
  ArticleContent,
  ArticleHelp,
  ArticleSidebar,
  Help,
  Toc,
  TocHeading,
  TocItem,
  TocLink,
  TocList,
} from "@onlyoffice/site-kit"
import {GithubIcon} from "@onlyoffice/ui-icons/rich/24.js"
import {Breadcrumb, BreadcrumbCrumb, Content} from "@onlyoffice/ui-kit"
import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"

export default {
  title: "Site Composites / Article",
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
    return <Article>
      <ArticleBreadcrumb>
        <Breadcrumb aria-label="Breadcrumb">
          <BreadcrumbCrumb href="/">First</BreadcrumbCrumb>
          <BreadcrumbCrumb href="/">Second</BreadcrumbCrumb>
          <BreadcrumbCrumb href="/">Third</BreadcrumbCrumb>
          <BreadcrumbCrumb href="/">In the middle</BreadcrumbCrumb>
          <BreadcrumbCrumb href="/">Fourth</BreadcrumbCrumb>
          <BreadcrumbCrumb href="/">Fifth</BreadcrumbCrumb>
          <BreadcrumbCrumb href="/">Sixth</BreadcrumbCrumb>
        </Breadcrumb>
      </ArticleBreadcrumb>
      <ArticleSidebar>
        <Toc>
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
      </ArticleSidebar>
      <ArticleContent>
        <Content>
          <h1>Content</h1>
          <h2>Description</h2>
          <p>
            <Join separator=" ">
              Base class. A big request to programmers to write a detailed
              description, more than three sentences. A big request to
              programmers to write a detailed description, more than three
              sentences. A big request to programmers to write a detailed
              description, more than three sentences. A big request to
              programmers to write a detailed description, more than three
              sentences.
            </Join>
          </p>
        </Content>
      </ArticleContent>
      <ArticleHelp>
        <Help>
          <GithubIcon width={24} height={24} />
          <h2>Get Help</h2>
          <ul>
            <li>If you have any questions about ONLYOFFICE DocSpace, try the <a href="/">FAQ</a> section first.</li>
            <li>You can request a feature or report a bug by posting an issue on <a href="/">GitHub</a>.</li>
            <li>You can also ask our developers on <a href="/">ONLYOFFICE forum</a> (registration required).</li>
          </ul>
        </Help>
      </ArticleHelp>
    </Article>
  },
}
