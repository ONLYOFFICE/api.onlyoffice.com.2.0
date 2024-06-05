export function camelToDash(s: string): string {
  return s.replaceAll(/([A-Za-z])(?=[A-Z])/g, "$1-").toLowerCase()
}
