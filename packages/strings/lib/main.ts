export function cutPrefix(s: string, p: string): [string, boolean] {
  if (p !== "" && s.startsWith(p)) {
    return [s.slice(p.length), true]
  }
  return [s, false]
}

export function cutSuffix(s: string, p: string): [string, boolean] {
  if (p !== "" && s.endsWith(p)) {
    return [s.slice(0, -p.length), true]
  }
  return [s, false]
}

export function isStringLiteral(u: unknown): u is string {
  return typeof u === "string" &&
    (u.startsWith('"') && u.endsWith('"') ||
      u.startsWith("'") && u.endsWith("'"))
}

export function substringPosition(a: string, b: string): [number, number] {
  const i = a.indexOf(b)
  if (i === -1) {
    return [-1, -1]
  }
  const l = a.slice(0, i).split("\n").length
  const c = i - a.lastIndexOf("\n", i) - 1
  return [l, c]
}

/**
 * Creates a unique, but not cryptographically secure, string by merging a
 * time-based component with a random one.
 *
 * The time-based component comes from the current time in milliseconds, which
 * is then converted into a base-36 string. As JavaScript measures time in
 * milliseconds since January 1, 1970, this number is quite large and always
 * growing. It uses the last 6 characters of this base-36 string, which gives a
 * nice balance of recency (the last characters change often) and compactness.
 *
 * The random component is derived from a random number, which is also converted
 * into a base-36 string. It takes 6 characters from this to add more
 * variability.
 *
 * In a base-36 system, each digit can have 36 different values (0-9, A-Z). So,
 * for a 12-character string (6 from each component), there are 36^12 possible
 * combinations, which is over 4 billion. This should be unique enough for
 * simple non-cryptographic use cases.
 */
export function uniqueString(): string {
  const d = new Date()
  const t = d.getTime().toString(36).slice(-6)
  const r = Math.random().toString(36).slice(2, 8)
  return `${t}${r}`
}

/**
 * Converts a string to pascal case.
 * @param s The string to convert to pascal case.
 * @returns The string in pascal case.
 */
export function pascalCase(s: string): string {
  // todo: complete the implementation which should be inspired by
  // https://github.com/gobeam/stringy/blob/v0.0.7/stringy.go#L143
  let t = ""
  for (const w of s.split("-")) {
    t += w.charAt(0).toUpperCase() + w.slice(1)
  }
  return t
}
