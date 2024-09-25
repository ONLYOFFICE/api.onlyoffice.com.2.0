import {transformAsync} from "@babel/core"
import {optimize} from "svgo"

/**
 * Converts an SVG file to a JSX component.
 *
 * @param n The name of the SVG component.
 * @param c The content of the SVG file.
 *
 * @returns The content of the JSX file.
 *
 * @throws An error if the name of the SVG component is missing.
 * @throws An error if the content of the SVG file is missing.
 */
export async function toJsxFile(n: string, c: string): Promise<string> {
  if (!n) {
    throw new Error("The name of the SVG component is required")
  }
  if (!c) {
    throw new Error("The content of the SVG file is required")
  }

  const s = optimize(c, {
    plugins: [
      "removeDimensions",
      "sortAttrs",
      {
        name: "addAttributesToSVGElement",
        params: {
          attributes: [{
            "aria-hidden": "true",
          }],
        },
      },
    ],
  })

  c = `export function ${n}({title, titleId, desc, descId, ...props}) {
return ${s.data.replace(">", "aria-labelledby={titleId} aria-describedby={descId} {...props}>{desc ? <desc id={descId}>{desc}</desc> : null}{title ? <title id={titleId}>{title}</title> : null}")}
}`

  const b = await transformAsync(c, {
    plugins: [["@babel/plugin-transform-react-jsx", {
      pragma: "h",
      pragmaFrag: "Fragment",
      useBuiltIns: true,
    }]],
  })
  if (!b || !b.code) {
    throw new Error("Failed to transform")
  }

  c = `import {type JSX, h} from "preact";\n\n${b.code
    .replace("}) {", "}: JSX.SVGAttributes<SVGSVGElement> & {title?: string, titleId?: string, desc?: string, descId?: string}): JSX.Element {")
    .replace('return h("svg", Object.assign({', '// @ts-ignore i have no idea how to fix this properly\n  return h("svg", Object.assign({')
    .replace(`const ${n}`, `export const ${n}`)
    .replace(`export default ${n};`, "")}\n`

  return c
}
