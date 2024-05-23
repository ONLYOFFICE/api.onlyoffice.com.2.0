export function substringPosition(a: string, b: string): [number, number] {
  const i = a.indexOf(b)
  if (i === -1) {
    return [-1, -1]
  }

  const ln = a.slice(0, i).split("\n").length
  const cn = i - a.lastIndexOf("\n", i) - 1
  return [ln, cn]
}
