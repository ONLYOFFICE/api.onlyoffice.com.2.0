#!/bin/sh

set -e

file=$(realpath "$0")
dir=$(dirname "$file")

"$dir/../node_modules/.bin/tsx" "$dir/../lib/main.ts" "$@"
