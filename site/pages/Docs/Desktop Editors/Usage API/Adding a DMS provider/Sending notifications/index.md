---
order: -7
---

The desktop app can send text messages to be displayed to the user. To do so, declare the function:

``` ts
window.onSystemMessage = function onSystemMessage(e) {}
```

## e

Defines the message parameters.

Type: object

Example:

``` json
{
  "type": "operation",
  "opMessage": "Loading...",
  "opType": 1
}
```

### e.type

Checks if the message type is *operation*. If not, then no messages are displayed to the user.

Type: string

Example: "operation"

### e.opMessage

Defines the message that will be displayed to the user.

Type: string

Example: "Loading..."

### e.opType

Defines the message by the operation type if the *opMessage* parameter is undefined. Set it to **0** to inform the user about file upload, or to **1** to inform about file encryption.

Type: integer

Example: 1

## Example

``` ts
window.onSystemMessage({type: "operation", opType: 1})
```

## Updating file status

The desktop app can send notifications about file editing completion.

Declare the following global function:

``` ts
window.DesktopUpdateFile = function DesktopUpdateFile() {}
```
