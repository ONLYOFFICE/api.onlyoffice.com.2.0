import {mkdir, readFile, readdir, rm, writeFile} from "node:fs/promises"
import {existsSync} from "node:fs"
import {basename, extname, join} from "node:path"
import {argv} from "node:process"
import {URL, fileURLToPath} from "node:url"
import {default as babel} from "@babel/core"
import sade from "sade"
import {optimize as svgo} from "svgo"

function main(): void {
  sade("ui-colors", true)
    .action(build)
    .parse(argv)
}

async function build(): Promise<void> {
  const rd = rootDir()

  const dd = distDir(rd)
  if (existsSync(dd)) {
    await rm(dd, {recursive: true})
  }

  await mkdir(dd)

  const sd = staticDir(rd)

  for (const vn of ["poor", "rich"]) {
    const dv = join(dd, vn)
    if (!existsSync(dv)) {
      await mkdir(dv)
    }

    const vd = join(sd, vn)
    const ls = await readdir(vd)

    for (const sn of ls) {
      const ds = join(dv, sn)
      if (!existsSync(ds)) {
        await mkdir(ds)
      }

      const se: string[] = []

      const sd = join(vd, sn)
      const lh = await readdir(sd)

      for (const hn of lh) {
        const he = extname(hn)
        let n = basename(hn, he)
        n = rename(n)

        let f = join(sd, hn)
        let c = await readFile(f, "utf8")
        c = await transform(n, c)

        f = join(ds, `${n}.tsx`)
        await writeFile(f, c)

        se.push(n)
      }

      let c = ""
      for (const n of se) {
        c += `export {${n}} from "./${sn}/${n}.tsx";\n`
      }

      const f = join(dv, `${sn}.tsx`)
      await writeFile(f, c)
    }
  }
}

function rename(n: string): string {
  let s = ""
  for (const w of n.split("-")) {
    s += w.charAt(0).toUpperCase() + w.slice(1)
  }
  return `${s}Icon`
}

async function transform(n: string, c: string): Promise<string> {
  // todo: Finalize the svgo configuration for each style separately.
  const s = svgo(c, {
    plugins: [
      // "preset-default",
      "removeDimensions",
      "sortAttrs",
      // {
      //   name: "removeAttrs",
      //   params: {
      //     attrs: ["fill"]
      //   }
      // },
      {
        name: "addAttributesToSVGElement",
        params: {
          attributes: [{
            // "fill": "currentColor",
            "aria-hidden": "true"
          }]
        }
      }
    ]
  })

  c = `export function ${n}({title, titleId, desc, descId, ...props}) {
return ${s.data.replace(">", "aria-labelledby={titleId} aria-describedby={descId} {...props}>{desc ? <desc id={descId}>{desc}</desc> : null}{title ? <title id={titleId}>{title}</title> : null}")}
}`

  const b = await babel.transformAsync(c, {
    plugins: [["@babel/plugin-transform-react-jsx", {
      pragma: "h",
      pragmaFrag: "Fragment",
      useBuiltIns: true
    }]]
  })
  if (!b || !b.code) {
    throw new Error("Failed to transform")
  }

  c = `import {type JSX, h} from "preact";\n${b.code
    .replace("}) {", "}: JSX.SVGAttributes<SVGSVGElement> & {title?: string, titleId?: string, desc?: string, descId?: string}): JSX.Element {")
    .replace(`const ${n}`, `export const ${n}`)
    .replace(`export default ${n};`, "")}`

  return c
}

function rootDir(): string {
  const u = new URL("..", import.meta.url)
  return fileURLToPath(u)
}

function distDir(d: string): string {
  return join(d, "dist")
}

function staticDir(d: string): string {
  return join(d, "static")
}

main()
