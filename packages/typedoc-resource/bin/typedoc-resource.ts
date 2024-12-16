#!/usr/bin/env -S pnpm tsx

const m = await import("../lib/main.ts")
m.main()
