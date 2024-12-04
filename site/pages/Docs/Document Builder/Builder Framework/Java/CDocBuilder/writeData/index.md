```yml signature
- {type: type, text: void}
- {type: text, text: " "}
- {type: entity, text: writeData}
- {type: text, text: (}
- {type: parameter, text: path}
- {type: text, text: ": "}
- {type: type, text: String}
- {type: text, text: ", "}
- {type: parameter, text: value}
- {type: text, text: ": "}
- {type: type, text: String}
- {type: text, text: ", "}
- {type: parameter, text: append}
- {type: text, text: ": "}
- {type: type, text: boolean}
- {type: text, text: )}
```

## Description

Writes data to the log file. It is used for logs in JS code.

> Please note, that for the `.docbuilder` file the `CDocBuilder.writeData` method is not used.

## Parameters

<parameters>

- path

  ```yml signature.variant="inline"
  - {type: type, text: String}
  ```

  - : The path to the file where all the logs will be written.

- value

  ```yml signature.variant="inline"
  - {type: type, text: String}
  ```

  - : The data which will be written to the log file.

- append

  ```yml signature.variant="inline"
  - {type: type, text: boolean}
  ```

  - : Specifies if the new data will be appended to the already existing log file or a new file will be created.

</parameters>

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
builder.writeData("result.log", "Alert!", false);
CDocBuilder.dispose();
```
