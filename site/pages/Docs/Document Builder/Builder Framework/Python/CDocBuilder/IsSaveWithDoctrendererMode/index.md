```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: IsSaveWithDoctrendererMode}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: )}
```

## Description

Specifies if the doctrenderer mode is used when building a document or getting content from the editor when saving a file.

> Please note, that for the `.docbuilder` file the `CDocBuilder.IsSaveWithDoctrendererMode` method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
doctrendererMode = builder.IsSaveWithDoctrendererMode()
```
