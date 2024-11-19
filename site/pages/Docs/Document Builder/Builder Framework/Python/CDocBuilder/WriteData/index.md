```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: WriteData}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: ", "}
- {type: parameter, text: path}
- {type: text, text: ": "}
- {type: type, text: str}
- {type: text, text: ", "}
- {type: parameter, text: value}
- {type: text, text: ": "}
- {type: type, text: str}
- {type: text, text: ", "}
- {type: parameter, text: append}
- {type: text, text: ": "}
- {type: type, text: bool}
- {type: text, text: )}
```

## Description

Writes data to the log file. It is used for logs in JS code.

> Please note, that for the `.docbuilder` file the `CDocBuilder.WriteData` method is not used.

## Parameters

<parameters>

- path

  ```yml signature.variant="inline"
  - {type: type, text: str}
  ```

  - : The path to the file where all the logs will be written.

- value

  ```yml signature.variant="inline"
  - {type: type, text: str}
  ```

  - : The data which will be written to the log file.

- append

  ```yml signature.variant="inline"
  - {type: type, text: bool}
  ```

  - : Specifies if the new data will be appended to the already existing log file or a new file will be created.

</parameters>

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
builder.WriteData("result.log", "Alert!", false)
```
