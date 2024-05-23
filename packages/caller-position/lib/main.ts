export function callerPosition(off: number): [number, number] {
  // eslint-disable-next-line unicorn/error-message
  const er = new Error()
  if (!er.stack) {
    return [-1, -1]
  }

  const ls = er.stack.split("\n")
  if (ls[0].indexOf("Error") === 0) {
    ls.shift()
  }

  const cl = ls[off + 1]
  if (!cl) {
    return [-1, -1]
  }

  const pm = cl.match(/(\d*:\d*)\)?$/)
  if (!(pm && pm[1])) {
    return [-1, -1]
  }

  const [lr, cr] = pm[1].split(":")
  if (lr === undefined || cr === undefined) {
    return [-1, -1]
  }

  const ln = Number(lr)
  const cn = Number(cr)
  if (Number.isNaN(ln) || Number.isNaN(cn)) {
    return [-1, -1]
  }

  return [ln, cn]
}
