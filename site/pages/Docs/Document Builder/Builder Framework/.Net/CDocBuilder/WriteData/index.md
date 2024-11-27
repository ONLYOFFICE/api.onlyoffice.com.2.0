```yml signature
- {type: type, text: void}
- {type: text, text: " "}
- {type: entity, text: WriteData}
- {type: text, text: (}
- {type: parameter, text: sPath}
- {type: text, text: ": "}
- {type: type, text: String^}
- {type: text, text: ", "}
- {type: parameter, text: sValue}
- {type: text, text: ": "}
- {type: type, text: String^}
- {type: text, text: ", "}
- {type: parameter, text: bAppend}
- {type: text, text: ": "}
- {type: type, text: bool}
- {type: text, text: )}
```

## Description

Writes data to the log file. It is used for logs in JS code.

> Please note, that for the `.docbuilder` file the `CDocBuilder.WriteData` method is not used.

## Parameters

<parameters>

- sPath

  ```yml signature.variant="inline"
  - {type: type, text: String^}
  ```

  - : The path to the file where all the logs will be written.

- sValue

  ```yml signature.variant="inline"
  - {type: type, text: String^}
  ```

  - : The data which will be written to the log file.

- bAppend

  ```yml signature.variant="inline"
  - {type: type, text: bool}
  ```

  - : Specifies if the new data will be appended to the already existing log file or a new file will be created.

</parameters>

## Example

### .Net

```cs
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
oBuilder.WriteData("result.log", "Alert!", false);
CDocBuilder.Destroy();
```
