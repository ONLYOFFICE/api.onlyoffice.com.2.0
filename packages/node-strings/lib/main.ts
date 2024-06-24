export function cutPrefix(s: string, p: string): string {
  if (p !== "" && s.startsWith(p)) {
    return s.slice(p.length)
  }
  return s
}

export function cutSuffix(s: string, p: string): string {
  if (p !== "" && s.endsWith(p)) {
    return s.slice(0, -p.length)
  }
  return s
}
