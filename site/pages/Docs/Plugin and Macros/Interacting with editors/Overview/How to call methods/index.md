---
order: -3
---

To execute certain editor methods using the plugin, define the **executeMethod** method.

The *callback* is the result that the method returns. It is an optional parameter. In case it is missing, the *window.Asc.plugin.onMethodReturn* function will be used to return the result of the method execution.

## executeMethod

### Parameters

#### name

The name of the specific method that must be executed.

Type: string

#### params

The arguments that the method in use has (if it has any).

Type: array

#### callback

The result that the method returns.

Type: function

### Returns:

Type boolean

### Example:

``` ts
Asc.plugin.executeMethod("methodName", [param1, param2], (returnValue) => {
  console.log(returnValue)
})
```
