import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"
import {useState} from "preact/hooks"
import {type Variable, useVariables} from "../../../storybook/lib/preview.tsx"

export default {
  title: "UI Primitives / Sizes",
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
    const [sizes, setSizes] = useState<Variable[]>([])

    useVariables("size", (a) => {
      setSizes(a)
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
        </tr>
      </thead>
      <tbody>
        {sizes.map((v) => <tr key={v.name}>
          <td>{v.name}</td>
          <td>{v.originalValue}</td>
          <td>{v.computedValue}</td>
        </tr>)}
      </tbody>
    </table>
  },
}
