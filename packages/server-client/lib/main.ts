import {Client} from "./client.ts"

declare global {
  interface Window {
    ServerClient: typeof Client
  }
}

function main(): void {
  if (window.ServerClient) {
    return
  }
  window.ServerClient = Client
}

main()
