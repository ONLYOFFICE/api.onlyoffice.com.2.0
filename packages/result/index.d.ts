export type Result<S0, S1> =
  [S0, S1] extends [infer A, infer B] ? [A, B?] :
    never
