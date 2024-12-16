```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: IsError}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: )}
```

## Description

Checks for errors in JS. The error message and call stack will be written to `std::cerr`.

> Please note, that for the `.docbuilder` file the `CDocBuilderContext.IsError` method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
bError = context.IsError()
```
