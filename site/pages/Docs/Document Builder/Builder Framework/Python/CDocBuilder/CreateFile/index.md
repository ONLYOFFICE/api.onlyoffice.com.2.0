```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: CreateFile}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: ", "}
- {type: parameter, text: type}
- {type: text, text: ": "}
- {type: type, text: int}
- {type: text, text: " | "}
- {type: type, text: str}
- {type: text, text: )}
```

## Description

Creates a new file. The type of the file which will be created needs to be set.

## Parameters

<parameters>

- type

  ```yml signature.variant="inline"
  - {type: type, text: int}
  - {type: text, text: " | "}
  - {type: type, text: str}
  ```

  - : The type of the file to be created set as a hexadecimal integer for the Python code or `docx`, `xlsx`, `pptx`, or `pdf` for the `.docbuilder` script file (see [OFFICESTUDIO\_FILE\_XXX](../../../../Builder%20App/Overview/index.md#format-types) values).

</parameters>

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
builder.CreateFile("docx")
```

### .docbuilder

``` ts
builder.CreateFile("docx")
```
