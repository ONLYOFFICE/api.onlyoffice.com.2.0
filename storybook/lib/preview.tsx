import "./preview.css"
import type {Preview, StoryContext} from "@storybook/preact"
import {useEffect} from "preact/hooks"
import {Fragment, h} from "preact"

declare module "@storybook/preact" {
  interface Parameters {
    styles?: string[]
  }
}

export default preview()

function preview(): Preview {
  return {
    globalTypes: {
      theme: {
        name: "Theme",
        description: "Choose the theme",
        defaultValue: "regular-auto",
        toolbar: {
          icon: "contrast",
          showName: true,
          dynamicTitle: true,
          items: [
            {title: "Regular Auto", value: "regular-auto"},
            {title: "Regular Light", value: "regular-light"},
            {title: "Regular Dark", value: "regular-dark"}
          ]
        }
      }
    },
    parameters: {
      // todo: https://github.com/rbardini/storybook-addon-paddings/issues/42
      layout: "fullscreen",
      paddings: {
        defaultValue: "Medium",
        values: [
          {name: "Small", value: "1rem"},
          {name: "Medium", value: "2rem"},
          {name: "None", value: "0px"}
        ]
      }
    },
    decorators: [
      (Story, ctx) => {
        const {theme} = ctx.globals

        useEffect(() => {
          const [c, t] = theme.split("-")
          document.documentElement.dataset.darkTheme = c
          document.documentElement.dataset.lightTheme = c
          document.documentElement.dataset.themePreference = t
        }, [theme])

        return <>
          <Styles ctx={ctx} />
          <Story />
        </>
      }
    ]
  }
}

function Styles({ctx}: {ctx: StoryContext}): JSX.Element {
  const p = ctx.parameters
  if (!(p && p.styles)) {
    return <></>
  }
  return <>
    {p.styles.map((s, i) => <style key={i} dangerouslySetInnerHTML={{__html: s}} />)}
  </>
}
