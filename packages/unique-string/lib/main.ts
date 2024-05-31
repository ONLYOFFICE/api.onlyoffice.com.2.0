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
 * combinations, which is over 4 billion. This should be unique enough simple
 * most non-cryptographic use cases.
 */
export function uniqueString(): string {
  const d = new Date()
  const t = d.getTime().toString(36).slice(-6)
  const r = Math.random().toString(36).slice(2, 8)
  return `${t}${r}`
}
