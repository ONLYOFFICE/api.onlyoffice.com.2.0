export type AnyProperties = Record<string, unknown>

export function merge(a: AnyProperties, b: AnyProperties): AnyProperties {
  b = {...b}

  for (const n in b) {
    const x = a[n]
    const y = b[n]

    if (isHandler(n) && typeof x === "function" && typeof y === "function") {
      b[n] = (...a: unknown[]) => {
        x(...a)
        y(...a)
      }
      continue
    }

    if (isHandler(n) && typeof x === "function") {
      b[n] = x
      continue
    }

    if (n === "style" && typeof x === "object" && typeof y === "object") {
      b[n] = {...x, ...y}
      continue
    }

    if (n === "class") {
      b[n] = [x, y].filter(Boolean).join(" ")
    }
  }

  return {...a, ...b}
}

function isHandler(s: string): boolean {
  return /^on[A-Z]/.test(s)
}
