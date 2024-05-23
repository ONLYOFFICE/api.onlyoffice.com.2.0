export function callerPosition(err: Error, off: number = 0): [number, number] {
  if (!err.stack) {
    return [-1, -1]
  }

  const ls = err.stack.split("\n")
  if (ls[0].indexOf("Error") === 0) {
    ls.shift()
  }

  const cl = ls[off]
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
