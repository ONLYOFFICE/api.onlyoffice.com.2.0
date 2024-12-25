```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: GetVersion}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: )}
```

## Description

Returns the ONLYOFFICE Document Builder engine version.

> Please note, that for the `.docbuilder` file the `CDocBuilder.GetVersion` method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
version = builder.GetVersion()
```
