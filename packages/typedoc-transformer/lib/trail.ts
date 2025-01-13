export type NestedTrail = (number | NestedTrail)[]

export type FlatTrail = number[]

export function trailDepth(t: NestedTrail): number {
  let d = 0

  for (const s of t) {
    if (Array.isArray(s)) {
      d = Math.max(d, trailDepth(s) + 1)
    }
  }

  return d
}

export function flatTrail(t: NestedTrail): FlatTrail {
  const f: FlatTrail = []

  for (const s of t) {
    if (Array.isArray(s)) {
      f.push(...flatTrail(s))
    } else {
      f.push(s)
    }
  }

  return f
}
