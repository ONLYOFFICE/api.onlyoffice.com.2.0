```yml signature
- {type: type, text: void}
- {type: text, text: " "}
- {type: entity, text: SetTmpFolder}
- {type: text, text: (}
- {type: parameter, text: sFolder}
- {type: text, text: ": "}
- {type: type, text: String^}
- {type: text, text: )}
```

## Description

Sets the path to the folder where the program will temporarily save files needed for the program correct work. After the successful document file creation, all the files will be deleted from the folder. If no temporary folder is set, the system one will be used.

## Parameters

<parameters>

- sFolder

  ```yml signature.variant="inline"
  - {type: type, text: String^}
  ```

  - : The path to the folder where the temporary files will be saved.

</parameters>

## Example

### .Net

```cs
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
oBuilder.SetTmpFolder(L"DocBuilderTemp");
CDocBuilder.Destroy();
```

### .docbuilder

```ts
builder.SetTmpFolder("DocBuilderTemp")
```
