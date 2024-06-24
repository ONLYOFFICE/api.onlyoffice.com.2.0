import {CodePreview} from "@onlyoffice/ui-kit"
import {JavascriptSdkIcon} from "@onlyoffice/ui-icons/rich/32.tsx"
import type {Meta} from "@storybook/preact"
import {type JSX, h} from "preact"
import {
  Home,
  HomeHero,
  HomeIn,
  HomeLink,
  HomeLinks,
  HomePart,
  HomePreview
} from "./main.tsx"

const meta: Meta = {
  title: "Site/Home"
}

export function Default(): JSX.Element {
  return <Home>
    <HomeHero>
      <h1>Welcome to ONLYOFFICE API</h1>
    </HomeHero>
    <HomePart>
      <HomeIn>
        <h2><a href="/">DocSpace</a></h2>
        <p>{"In this section, you will learn how to integrate ONLYOFFICE DocSpace into your own application and interact with its backend using the DocSpace API Backend. You will also find the information on how to embed DocSpace using JavaScript SDK, create your own plugins with our Plugins SDK, and host a portal on your own servers using our methods for hosting providers."}</p>
        <a href="/">More</a>
        <HomeLinks>
          <HomeLink>
            <JavascriptSdkIcon height={32} width={32} />
            <a href="/">JavaScript SDK</a>
          </HomeLink>
          <HomeLink>
            <JavascriptSdkIcon height={32} width={32} />
            <a href="/">JavaScript SDK</a>
          </HomeLink>
          <HomeLink>
            <JavascriptSdkIcon height={32} width={32} />
            <a href="/">JavaScript SDK</a>
          </HomeLink>
          <HomeLink>
            <JavascriptSdkIcon height={32} width={32} />
            <a href="/">JavaScript SDK</a>
          </HomeLink>
          <HomeLink>
            <JavascriptSdkIcon height={32} width={32} />
            <a href="/">JavaScript SDK</a>
          </HomeLink>
          <HomeLink>
            <JavascriptSdkIcon height={32} width={32} />
            <a href="/">JavaScript SDK</a>
          </HomeLink>
        </HomeLinks>
      </HomeIn>
      <HomePreview>
        <a href="/"></a>
        <picture>
          <img src="/docspace-preview.svg" alt="" loading="lazy" decoding="async" height="430px" />
        </picture>
        <CodePreview>
          <pre><code>{code()}</code></pre>
        </CodePreview>
      </HomePreview>
    </HomePart>
    <HomePart variant="reverse">
      <HomeIn>
        <h2><a href="/">Docs</a></h2>
        <p>{"In this section, you will learn how to integrate ONLYOFFICE DocSpace into your own application and interact with its backend using the DocSpace API Backend. You will also find the information on how to embed DocSpace using JavaScript SDK, create your own plugins with our Plugins SDK, and host a portal on your own servers using our methods for hosting providers."}</p>
        <a href="/">More</a>
        <HomeLinks>
          <HomeLink>
            <JavascriptSdkIcon height={32} width={32} />
            <a href="/">JavaScript SDK</a>
          </HomeLink>
          <HomeLink>
            <JavascriptSdkIcon height={32} width={32} />
            <a href="/">JavaScript SDK</a>
          </HomeLink>
          <HomeLink>
            <JavascriptSdkIcon height={32} width={32} />
            <a href="/">JavaScript SDK</a>
          </HomeLink>
          <HomeLink>
            <JavascriptSdkIcon height={32} width={32} />
            <a href="/">JavaScript SDK</a>
          </HomeLink>
        </HomeLinks>
      </HomeIn>
      <HomePreview>
        <a href="/"></a>
        <picture>
          <img src="/docs-preview.png" alt="" loading="lazy" decoding="async" height="540px" />
        </picture>
        <CodePreview>
          <pre><code>{code()}</code></pre>
        </CodePreview>
      </HomePreview>
    </HomePart>
    <HomePart>
      <HomeIn>
        <h2><a href="/">Workspace</a></h2>
        <p>{"In this section, you will learn how to integrate ONLYOFFICE DocSpace into your own application and interact with its backend using the DocSpace API Backend. You will also find the information on how to embed DocSpace using JavaScript SDK, create your own plugins with our Plugins SDK, and host a portal on your own servers using our methods for hosting providers."}</p>
        <a href="/">More</a>
        <HomeLinks>
          <HomeLink>
            <JavascriptSdkIcon height={32} width={32} />
            <a href="/">JavaScript SDK</a>
          </HomeLink>
          <HomeLink>
            <JavascriptSdkIcon height={32} width={32} />
            <a href="/">JavaScript SDK</a>
          </HomeLink>
        </HomeLinks>
      </HomeIn>
      <HomePreview>
        <a href="/"></a>
        <picture>
          <img src="/workspace-preview.png" alt="" loading="lazy" decoding="async" height="500px" />
        </picture>
        <CodePreview>
          <pre><code>{code()}</code></pre>
        </CodePreview>
      </HomePreview>
    </HomePart>
  </Home>
}

function code(): string {
  return `<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>DocSpace JavaScript SDK</title>
    <script src="{PORTAL_SRC}/static/scripts/api.js"></script>
  </head>
  <body>
    <div id="ds-frame"></div>
  </body>
</html>`
}

export default meta
