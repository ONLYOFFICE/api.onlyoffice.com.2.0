```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: CloseFile}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: )}
```

## Description

Closes the file to stop working with it. You can use a single ONLYOFFICE Document Builder instance to work with all your files, but you need to close the previous file before you can start working with the next one in this case.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
builder.CloseFile()
```

### .docbuilder

``` ts
builder.CloseFile()
```
