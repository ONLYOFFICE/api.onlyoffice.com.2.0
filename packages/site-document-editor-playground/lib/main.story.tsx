// todo: resuscitate stories
// Separate the node logic with the common one in the config fixtures package.

// import {Client} from "@onlyoffice/server-client"
// import {ConfigFixture} from "@onlyoffice/site-config-fixtures"
import {type Meta} from "@storybook/preact"
// import {useEffect} from "preact/hooks"
import {type JSX, h} from "preact"
// import {DocumentEditorPlayground} from "./main.tsx"

export default {
  title: "Site Regions / Document Editor Playground",
  tags: ["!dev"],
} satisfies Meta

export function Default(): JSX.Element {
  // document.addEventListener("documentbuildererror", console.error)
  // document.addEventListener("documenteditorerror", console.error)
  // document.addEventListener("documenteditorplaygrounderror", console.error)

  // useEffect(() => {
  //   setup()
  // }, [])

  // const c = new ConfigFixture()
  // return <DocumentEditorPlayground config={c.playground} />
  return <div />
}

// async function setup(): Promise<void> {
//   const c = new Client()
//   c.baseURL = "http://0.0.0.0:4000/"

//   const sp = document.querySelector("document-editor-playground")
//   if (sp) {
//     sp.client = c
//     await sp.connectedCallback()
//   }
// }
