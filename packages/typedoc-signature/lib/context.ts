/* c8 ignore start */
// Interfaces are not tested as they only define data structure, not logic or behavior
import {type Formatter} from "./formatter.ts"
import {type State} from "./state.ts"
import {type Transport} from "./transport.ts"

export interface Context {
  s: State
  f: Formatter
  t: Transport
}
/* c8 ignore stop */
