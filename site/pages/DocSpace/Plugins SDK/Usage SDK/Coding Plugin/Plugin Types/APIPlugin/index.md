---
order: -7
---

The plugin that is provided with the origin, proxy, and prefix to make requests to the portal server.

**Interface**: IApiPlugin.

## Variables

### origin

Stores the origin parameter of the DocSpace portal.

Type: string

Example: `https://example.com`

### proxy

Stores the proxy parameter of the DocSpace portal.

Type: string

Example: `https://proxy-example`

### prefix

Stores the prefix parameter of the DocSpace portal to access the server side.

Type: string

Example: "prefix"

## Methods and their description

### setOrigin

Update the origin parameter of the DocSpace portal.

Parameters:

| Name   | Type   | Example               | Description                                          |
| ------ | ------ | --------------------- | ---------------------------------------------------- |
| origin | string | `https://example.com` | Defines the origin parameter of the DocSpace portal. |

### getOrigin

Get the origin parameter of the DocSpace portal.

### setProxy

Update the proxy parameter of the DocSpace portal.

Parameters:

| Name  | Type   | Example                 | Description                                         |
| ----- | ------ | ----------------------- | --------------------------------------------------- |
| proxy | string | `https://proxy-example` | Defines the proxy parameter of the DocSpace portal. |

### getProxy

Get the proxy parameter of the DocSpace portal.

### setPrefix

Update the prefix parameter of the DocSpace portal.

Parameters:

| Name   | Type   | Example  | Description                                          |
| ------ | ------ | -------- | ---------------------------------------------------- |
| prefix | string | "prefix" | Defines the prefix parameter of the DocSpace portal. |

### getPrefix

Get the prefix parameter of the DocSpace portal.

### setAPI

Update all the API parameters of the DocSpace portal in one request.

Parameters:

| Name   | Type   | Example                 | Description                                                                   |
| ------ | ------ | ----------------------- | ----------------------------------------------------------------------------- |
| origin | string | `https://example.com`   | Stores the origin parameter of the DocSpace portal.                           |
| proxy  | string | `https://proxy-example` | Stores the proxy parameter of the DocSpace portal.                            |
| prefix | string | "prefix"                | Stores the prefix parameter of the DocSpace portal to access the server side. |

### getAPI

Get all the API parameters of the DocSpace portal in one request. Returns an object with the origin, proxy, and prefix parameters.

## Example

``` ts
import {type IApiPlugin} from "@onlyoffice/docspace-plugin-sdk"

class Plugin implements IApiPlugin {
  origin = ""
  proxy = ""
  prefix = ""

  setOrigin = (origin: string): void => {
    this.origin = origin
  }

  getOrigin = (): string => {
    return this.origin
  }

  setProxy = (proxy: string): void => {
    this.proxy = proxy
  }

  getProxy = (): string => {
    return this.proxy
  }

  setPrefix = (prefix: string): void => {
    this.prefix = prefix
  }

  getPrefix = (): string => {
    return this.prefix
  }

  setAPI = (origin: string, proxy: string, prefix: string): void => {
    this.origin = origin
    this.proxy = proxy
    this.prefix = prefix
  }

  getAPI = (): {origin: string; proxy: string; prefix: string} => {
    return {origin: this.origin, proxy: this.proxy, prefix: this.prefix}
  }
}
```
