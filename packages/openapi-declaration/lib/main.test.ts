// todo: complete tests.

import {pipeline as pipe} from "node:stream/promises"
import {test} from "uvu"
import {equal as eq} from "uvu/assert"
import {Console} from "./console.ts"
import {EntityComponent, StringType} from "./internal.ts"
import {
  type ComponentChunk,
  type PathChunk,
  ProcessComponent,
  ProcessPath,
  Transfer,
} from "./main.ts"

const sg = g<ComponentChunk<"schemas">>
const pg = g<PathChunk>

const console = Console.shared.copy()

test.before(() => {
  Console.shared.mute()
})

test.after(() => {
  Console.shared.restore(console)
})

test("todo", async () => {
  const a = new Transfer()

  await pipe(
    sg({
      key: "s",
      value: {
        description: "d",
        type: "string",
      },
    }),
    new ProcessComponent("schemas"),
    a.components.toWritable(),
  )

  const e = new Transfer()
  const y = new EntityComponent()
  y.id = "#/components/schemas/s"
  y.self.description = "d"
  y.self.type = new StringType()
  e.components.cache.add(y)

  eq(a, e)
})

test("todo", async () => {
  const a = new Transfer()
  const y = new EntityComponent()
  y.id = "#/components/schemas/s"
  y.self.description = "d"
  y.self.type = new StringType()
  a.components.cache.add(y)

  await pipe(
    pg({
      key: "s",
      value: {
        get: {
          tags: ["t"],
          summary: "s",
          responses: {
            200: {
              description: "d",
              content: {
                "application/json": {schema: {type: "string"}},
              },
            },
          },
        },
      },
    }),
    new ProcessPath(a),
    a.declarations.toWritable(),
  )
})

test.run()

function* g<E>(...a: E[]): Generator<E> {
  for (const e of a) {
    yield e
  }
}
