```yml signature
- {type: type, text: bool}
- {type: text, text: " "}
- {type: entity, text: Run}
- {type: text, text: (}
- {type: parameter, text: sPath}
- {type: text, text: ": "}
- {type: type, text: String^}
- {type: text, text: )}
```

## Description

Runs the ONLYOFFICE Document Builder executable. If you do not want to write a .Net application, you can simply use the `docbuilder.exe` executable file and run it with the `.docbuilder` file as an argument, where all the code for the document file creation will be written. For .Net, create the `CDocBuilder` object and call the `Run` method with the path to the executable file from the `sPath` parameter.

## Parameters

<parameters>

- sPath

  ```yml signature.variant="inline"
  - {type: type, text: String^}
  ```

  - : The path to the ONLYOFFICE Document Builder executable.

</parameters>

## Example

### .Net

```cs
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
oBuilder.Run("path-to-script.docbuilder");
CDocBuilder.Destroy();
```

### .docbuilder

```sh
docbuilder.exe mydocument.docbuilder
```
