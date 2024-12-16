// This package is inspired by the [errors] package of Go.
//
// [errors]: https://pkg.go.dev/errors@go1.23.3/

// I agree that this message is correct, but in this case, it slightly conflicts
// with the idea of the package.
// eslint-disable-next-line unicorn/custom-error-definition
class Errors extends Error {
  c: Error[] = []

  constructor() {
    super()
    this.name = "Errors"
  }
}

/**
 * Joins multiple errors into a single error.
 *
 * @param a Errors to join.
 * @returns A single error.
 */
export function join(...c: (Error | undefined)[]): Error {
  const err = new Errors()

  collect(err, c)

  if (err.message.endsWith("\n")) {
    err.message = err.message.slice(0, -1)
  }

  return err
}

function collect(err: Errors, c: (Error | undefined)[]): void {
  for (const e of c) {
    if (!e) {
      continue
    }

    if (e instanceof Errors) {
      collect(err, e.c)
      continue
    }

    err.message += `${e.message}\n`
    err.c.push(e)
  }
}

/**
 * Splits an error into multiple errors.
 *
 * @param e Error to split.
 * @returns Multiple errors.
 */
export function split(e: Error | undefined): Error[] {
  if (!e) {
    return []
  }
  if (!(e instanceof Errors)) {
    return [e]
  }
  return e.c
}
