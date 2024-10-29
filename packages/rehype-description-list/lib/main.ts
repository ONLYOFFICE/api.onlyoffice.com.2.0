// Markdown (not CommonMark or even GFM) does not have standardized syntax for
// the description list (also known as dl, dt, dd HTML elements). One of the
// ready-to-use remark packages is [remark-definition-list], but unfortunately,
// this package is not compatible with many remark lint rules due to syntax
// conflicts. To avoid reinventing the wheel, the [MDN syntax] was chosen since
// it is compatible with everything else.
//
// This package implements definition list elements on top of hast structures.
// This is not the ideal place for such transformations. It would be
// significantly better to do them on top of mdast structures to be similar to
// the [remark-definition-list] package. However, this would require many hours
// of work, and the result is not necessarily worth it.
//
// [MDN syntax]: https://github.com/mdn/yari/blob/v2.65.0/markdown/m2h/handlers/dl.ts/
// [remark-definition-list]: https://github.com/wataru-chocola/remark-definition-list/

import {
  isLiElement,
  isPElement,
  isUlElement,
} from "@onlyoffice/hast-util-is-element"
import {isNewlineText, isText} from "@onlyoffice/hast-util-is-text"
import {type Element, type Root, type Text} from "hast"
import {h} from "hastscript"
import {CONTINUE, visit} from "unist-util-visit"

export interface RehypeDescriptionListTransform {
  (tree: Root): void
}

export function rehypeDescriptionList(): RehypeDescriptionListTransform {
  return function transform(t) {
    visit(t, "element", (n, i, p) => {
      if (!p || i === undefined) {
        return
      }

      const dl = convert(n)
      if (dl.children.length === 0) {
        return
      }

      p.children[i] = dl
      return [CONTINUE, i]
    })
  }
}

function convert(e: Element): Element {
  // If the list is tight:
  //
  // > | <ul>
  //     ^^^^
  //   | <li>term
  //   | <ul>
  //   | <li>: details</li>
  //   | </ul>
  //   | </li>
  //   | </ul>
  //
  // If the list is loose:
  //
  // > | <ul>
  //     ^^^^
  //   | <li>
  //   | <p>term</p>
  //   | <ul>
  //   | <li>
  //   | <p>: details</p>
  //   | </li>
  //   | </ul>
  //   | </li>
  //   | </ul>

  if (!isUlElement(e)) {
    return h("dl")
  }

  const dl = h("dl")

  for (const c0 of e.children) {
    // If the list is tight:
    //
    // > | <ul>
    //         ^
    //   | <li>term
    //   | <ul>
    //   | <li>: details</li>
    //   | </ul>
    // > | </li>
    //          ^
    //   | </ul>
    //
    // If the list is loose:
    //
    // > | <ul>
    //         ^
    //   | <li>
    //   | <p>term</p>
    //   | <ul>
    //   | <li>
    //   | <p>: details</p>
    //   | </li>
    //   | </ul>
    // > | </li>
    //          ^
    //   | </ul>

    if (isNewlineText(c0)) {
      dl.children.push(c0)
      continue
    }

    // If the list is tight:
    //
    //   | <ul>
    // > | <li>term
    //     ^^^^
    //   | <ul>
    //   | <li>: details</li>
    //   | </ul>
    //   | </li>
    //   | </ul>
    //
    // If the list is loose:
    //
    //   | <ul>
    // > | <li>
    //     ^^^^
    //   | <p>term</p>
    //   | <ul>
    //   | <li>
    //   | <p>: details</p>
    //   | </li>
    //   | </ul>
    //   | </li>
    //   | </ul>

    if (isLiElement(c0)) {
      const dt = h("dt")
      const dd = h("dd")

      for (const c1 of c0.children) {
        // If the list is tight:
        //
        //   | <ul>
        // > | <li>term
        //             ^
        //   | <ul>
        //   | <li>: details</li>
        // > | </ul>
        //          ^
        //   | </li>
        //   | </ul>
        //
        // If the list is loose:
        //
        //   | <ul>
        // > | <li>
        //         ^
        //   | <p>term</p>
        // >              ^
        //   | <ul>
        //   | <li>
        //   | <p>: details</p>
        //   | </li>
        // > | </ul>
        //          ^
        //   | </li>
        //   | </ul>

        if (isNewlineText(c1)) {
          dt.children.push(c1)
          continue
        }

        // Look at the details first.

        // If the list is tight:
        //
        //   | <ul>
        //   | <li>term
        // > | <ul>
        //     ^^^^
        //   | <li>: details</li>
        //   | </ul>
        //   | </li>
        //   | </ul>
        //
        // If the list is loose:
        //
        //   | <ul>
        //   | <li>
        //   | <p>term</p>
        // > | <ul>
        //     ^^^^
        //   | <li>
        //   | <p>: details</p>
        //   | </li>
        //   | </ul>
        //   | </li>
        //   | </ul>

        if (isUlElement(c1)) {
          for (const c2 of c1.children) {
            // If the list is tight:
            //
            //   | <ul>
            //   | <li>term
            // > | <ul>
            //         ^
            // > | <li>: details</li>
            //                       ^
            //   | </ul>
            //   | </li>
            //   | </ul>
            //
            // If the list is loose:
            //
            //   | <ul>
            //   | <li>
            //   | <p>term</p>
            // > | <ul>
            //         ^
            //   | <li>
            //   | <p>: details</p>
            // > | </li>
            //         ^
            //   | </ul>
            //   | </li>
            //   | </ul>

            if (isNewlineText(c2)) {
              continue
            }

            // If the list is tight:
            //
            //   | <ul>
            //   | <li>term
            //   | <ul>
            // > | <li>: details</li>
            //     ^^^^
            //   | </ul>
            //   | </li>
            //   | </ul>
            //
            // If the list is loose:
            //
            //   | <ul>
            //   | <li>
            //   | <p>term</p>
            //   | <ul>
            // > | <li>
            //     ^^^^
            //   | <p>: details</p>
            //   | </li>
            //   | </ul>
            //   | </li>
            //   | </ul>

            if (isLiElement(c2)) {
              for (const c3 of c2.children) {
                // If the list is loose:
                //
                //   | <ul>
                //   | <li>
                //   | <p>term</p>
                //   | <ul>
                // > | <li>
                //         ^
                // > | <p>: details</p>
                //                     ^
                //   | </li>
                //   | </ul>
                //   | </li>
                //   | </ul>

                if (isNewlineText(c3)) {
                  dd.children.push(c3)
                  continue
                }

                // Everything else.

                if (!isEmpty(dd)) {
                  dd.children.push(c3)
                  continue
                }

                // If the list is tight:
                //
                //   | <ul>
                //   | <li>term
                //   | <ul>
                // > | <li>: details</li>
                //         ^^^^^^^^^
                //   | </ul>
                //   | </li>
                //   | </ul>
                //
                // If the list is loose:
                //
                //   | <ul>
                //   | <li>
                //   | <p>term</p>
                //   | <ul>
                //   | <li>
                // > | <p>: details</p>
                //     ^^^^^^^^^^^^^^^^
                //   | </li>
                //   | </ul>
                //   | </li>
                //   | </ul>

                if (isText(c3) && c3.value === ":") {
                  dd.children.push(noopText())
                  continue
                }

                if (isText(c3) && c3.value.startsWith(": ")) {
                  const m = structuredClone(c3)
                  m.value = m.value.slice(2)
                  dd.children.push(m)
                  continue
                }

                if (isPElement(c3) && c3.children.length !== 0) {
                  const [c4] = c3.children

                  if (isText(c4) && c4.value === ":") {
                    dd.children.push(noopText())
                    continue
                  }

                  if (isText(c4) && c4.value.startsWith(": ")) {
                    const m = structuredClone(c4)
                    m.value = m.value.slice(2)

                    const p = structuredClone(c3)
                    p.children[0] = m

                    dd.children.push(p)
                    continue
                  }
                }

                return h("dl")
              }
            }
          }

          if (!isEmpty(dd) && isEmpty(dt)) {
            return h("dl")
          }

          if (!isEmpty(dd)) {
            continue
          }
        }

        // If the list is tight:
        //
        //   | <ul>
        // > | <li>term
        //         ^^^^
        //   | <ul>
        //   | <li>: details</li>
        //   | </ul>
        //   | </li>
        //   | </ul>
        //
        // If the list is loose:
        //
        //   | <ul>
        //   | <li>
        // > | <p>term</p>
        //     ^^^^^^^^^^^
        //   | <ul>
        //   | <li>
        //   | <p>: details</p>
        //   | </li>
        //   | </ul>
        //   | </li>
        //   | </ul>

        dt.children.push(c1)
      }

      if (isEmpty(dt) || isEmpty(dd)) {
        return h("dl")
      }

      if (c0.children.length !== 0) {
        let [c] = c0.children
        if (isText(c) && !isNewlineText(c) && c.value.endsWith("\n")) {
          const s = structuredClone(c)
          s.value = s.value.slice(0, -1)
          dt.children[0] = s
        }

        c = c0.children[c0.children.length - 1]
        if (isNewlineText(c)) {
          dt.children.pop()
        }
      }

      for (let i = dd.children.length - 1; i >= 0; i -= 1) {
        const c = dd.children[i]
        if (isNoopText(c)) {
          dd.children.splice(i, 1)
        }
      }

      dl.children.push(dt, {type: "text", value: "\n"}, dd)

      continue
    }

    return h("dl")
  }

  return dl
}

function isEmpty(e: Element): boolean {
  for (let i = e.children.length - 1; i >= 0; i -= 1) {
    const c = e.children[i]
    if (!isNewlineText(c)) {
      return false
    }
  }
  return true
}

// todo: In this case, noop text is a hack that allows the tracking of empty
// details. The algorithm needs to be revised to eliminate it.

function isNoopText(u: unknown): u is Text {
  return isText(u) && u.value === "" && "__noop" in u
}

function noopText(): Text {
  // @ts-ignore read above
  return {type: "text", value: "", __noop: true}
}
