export function calc(s: string): number {
  let r = 0
  let n = ""
  let o = "+"

  for (let i = 0; i < s.length; i += 1) {
    const c = s[i]

    if (
      c === " " ||
      c === "c" ||
      c === "a" ||
      c === "l" ||
      c === "(" ||
      c === ")"
    ) {
      continue
    }

    if (c >= "0" && c <= "9" || c === ".") {
      n += c
    } else if (c === "p" && s.slice(i, i + 2) === "px") {
      i += 1
    } else if (c === "+" || c === "-") {
      if (n) {
        if (o === "+") {
          r += Number.parseFloat(n)
        } else if (o === "-") {
          r -= Number.parseFloat(n)
        }
      }
      n = ""
      o = c
    }
  }

  if (n) {
    if (o === "+") {
      r += Number.parseFloat(n)
    } else if (o === "-") {
      r -= Number.parseFloat(n)
    }
  }

  return r
}
