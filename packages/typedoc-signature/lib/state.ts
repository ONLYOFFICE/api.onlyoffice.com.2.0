import {IndentToken, NewlineToken} from "./tokens.ts"

export class State {
  m = 2
  i = 0

  nt(): NewlineToken {
    return new NewlineToken()
  }

  it(): IndentToken {
    return new IndentToken(this.i)
  }

  in(): void {
    this.i += this.m
  }

  out(): void {
    this.i -= this.m
  }
}
