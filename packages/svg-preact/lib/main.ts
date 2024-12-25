import {transformAsync} from "@babel/core"
import transformJsx from "@babel/plugin-transform-react-jsx"
import {optimize} from "svgo"

/**
 * Converts an SVG file to a JavaScript file.
 * @param n The name of the SVG component.
 * @param c The content of the SVG file.
 * @returns The content of the JavaScript file.
 * @throws An error if the name of the SVG component is missing.
 */
export async function toJsFile(n: string, c: string): Promise<string> {
  if (!n) {
    throw new Error("The name of the SVG component is required")
  }

  const o = optimize(c, {
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

  const e = `export function ${n}({title, titleId, desc, descId, ...props}) {
    return ${o.data.replace(">", "aria-labelledby={titleId} aria-describedby={descId} {...props}>{desc ? <desc id={descId}>{desc}</desc> : null}{title ? <title id={titleId}>{title}</title> : null}")}
  }`

  const t = await transformAsync(e, {
    plugins: [[transformJsx, {
      pragma: "h",
      pragmaFrag: "Fragment",
      useBuiltIns: true,
    }]],
  })

  if (!t || !t.code) {
    throw new Error("The transformation failed")
  }

  const f = `import {h} from "preact";

${t.code}
`

  return f
}

/**
 * Converts an SVG file to a TypeScript Declaration file.
 * @param n The name of the SVG component.
 * @param c The content of the SVG file.
 * @returns The content of the TypeScript Declaration file.
 * @throws An error if the name of the SVG component is missing.
 */
export function toTdsFile(n: string): string {
  if (!n) {
    throw new Error("The name of the SVG component is required")
  }

  const f = `import {type JSX} from "preact";

export interface ${n}Properties extends JSX.SVGAttributes<SVGSVGElement> {
  title?: string;
  titleId?: string;
  desc?: string;
  descId?: string;
}

export declare function ${n}(p: ${n}Properties): JSX.Element;
`

  return f
}
