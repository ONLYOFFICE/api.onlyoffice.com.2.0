// @ts-check

/**
 * @typedef {import("@onlyoffice/documentation-declarations").Declaration} Declaration
 * @typedef {import("@onlyoffice/documentation-declarations").DeclarationType} DeclarationType
 * @typedef {import("@onlyoffice/documentation-declarations").DeclarationValue} DeclarationValue
 * @typedef {import("@onlyoffice/documentation-ui-reflection-webc").ReflectionValue} ReflectionValue
 * @typedef {import("@onlyoffice/documentation-ui-reflection-webc").ReflectionType} ReflectionType
 */

const { basename } = require("node:path")
// const { isBuiltin } = require // todo: cjs
const builtin = require("@onlyoffice/documentation-declarations/builtin.js")
const { list, retrieve } = require("@onlyoffice/documentation-resources/document-builder.cjs")
const reflection = require("@onlyoffice/documentation-ui-reflection-webc/reflection.cjs")

const items = list().slice(0, 201)

/**
 * @param {DeclarationValue} dv
 * @returns {ReflectionValue}
 */
function resolveValue(dv) {
  /** @type {ReflectionValue} */
  const rv = {
    name: dv.name,
    // todo: permalink
    type: resolveType(dv.type)
  }

  if (dv.description !== undefined) {
    rv.description = {
      text: dv.description.text,
      render: reflection.renderTextContent
    }
  }

  if (dv.default !== undefined) {
    rv.default = dv.default
  }

  return rv
}

/**
 * @param {DeclarationType} dt
 * @returns {ReflectionType}
 */
function resolveType(dt) {
  /** @type {ReflectionType} */
  const rt = {
    name: "",
    render: reflection.renderLiteralType
  }

  if (dt.value !== undefined) {
    rt.value = dt.value
  }

  switch (dt.id) {
    case builtin.Array.id:
      rt.render = reflection.renderArrayType
      break
    case builtin.Literal.id:
    case builtin.Object.id:
      rt.render = reflection.renderLiteralType
      break
    case builtin.Optional.id:
      rt.render = reflection.renderOptionalType
      break
    case builtin.Readonly.id:
      rt.name = "Readonly"
      rt.render = reflection.renderGenericType
      break
    case builtin.Record.id:
      rt.name = "Record"
      rt.render = reflection.renderGenericType
      break
    case builtin.Setonly.id:
      rt.name = "Setonly"
      rt.render = reflection.renderGenericType
      break
    case builtin.Union.id:
      rt.render = reflection.renderUnionType
      break
    default:
      // todo: huh?
      const d = retrieve(dt.id)
      if (d === undefined) {
        break
      }
      rt.permalink = resolveLink(d)
      if (dt.children === undefined) {
        rt.value = d.name
      } else {
        rt.name = d.name
        rt.render = reflection.renderGenericType
      }
      break
  }

  if (dt.children !== undefined) {
    rt.children = dt.children.flatMap((dt) => {
      const rt = resolveType(dt)
      if (rt === undefined) {
        return []
      }
      return rt
    })
  }

  return rt
}

/**
 * @param {Declaration} d
 * @returns {string}
 */
function resolveLink(d) {
  let p = d.meta.package
  switch (d.meta.package) {
    case "word":
      p = "text"
      break
    case "cell":
      p = "spreadsheet"
      break
    case "slide":
      p = "presentation"
      break
    case "forms":
      p = "form"
      break
  }
  let u = "/document-builder/javascript-sdk/"
  switch (d.kind) {
    case "class":
      u += `${p}/${d.name}/`
      break
    case "event":
      u += `${p}/_e/${d.name}/`
      break
    case "function":
      u += `${p}/${d.memberof}/${d.name}/`
      break
    case "typedef":
      u += `${p}/_t/${d.name}/`
      break
    default:
      throw new Error(`Unknown kind: ${d.kind}`)
  }
  u += "index.html"
  return u
}

function data() {
  const data = {
    layout: "class/class.webc",
    pagination: {
      data: "items",
      size: 1,
      addAllPagesToCollections: true,
      before(/** @type {Declaration[]} */ data) {
        // https://github.com/11ty/eleventy/issues/2260
        return data.flatMap((d) => {
          // d.order = 0
          if (d.kind === "builtin") {
            return []
          }
          if (d.parameters !== undefined) {
            d._parameters = d.parameters.map(resolveValue)
          }
          if (d.properties !== undefined) {
            d._properties = d.properties.map(resolveValue)
          }
          if (d.returns !== undefined) {
            d._returns = resolveValue(d.returns)
          }
          return d
        })
      }
    },
    items,
    permalink(data) {
      /** @type {Declaration} */
      const d = data.pagination.items[0]
      if (d.kind === "builtin") {
        return false
      }
      return resolveLink(d)
    },
    eleventyComputed: {
      title(data) {
        return basename(data.page.url)
      },
      currentName(data) {
        return basename(data.page.url)
      },
      eleventyExcludeFromCollections(data) {
        /** @type {Declaration} */
        const d = data.pagination.items[0]
        return d.kind === "builtin"
      }
    }
  }

  return data
}

function render() {
  return ""
}

module.exports = { data, render }
