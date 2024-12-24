import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"
import {useState} from "preact/hooks"
import {type Variable, useVariables} from "../../config/preview.tsx"

export default {
  title: "UI Primitives / Colors",
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
    const [colors, setColors] = useState<Variable[]>([])

    useVariables("color", (a) => {
      setColors(a)
    })

    return <table
      style={{
        width: "100%",
        fontSize: "16px",
        textAlign: "left",
        borderCollapse: "collapse",
      }}
    >
      <thead>
        <tr>
          <th>Name</th>
          <th>Original Value</th>
          <th>Computed Value</th>
          <th style={{minWidth: "30%"}}>Preview</th>
        </tr>
      </thead>
      <tbody>
        {colors.map((v) => <tr key={v.name}>
          <td>{v.name}</td>
          <td>{v.originalValue}</td>
          <td>{v.computedValue}</td>
          <td style={{backgroundColor: v.computedValue}} />
        </tr>)}
      </tbody>
    </table>
  },
}
