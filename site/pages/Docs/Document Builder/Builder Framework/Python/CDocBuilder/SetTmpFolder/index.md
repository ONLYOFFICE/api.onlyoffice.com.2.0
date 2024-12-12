```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: SetTmpFolder}
- {type: text, text: (}
- {type: parameter, text: self}
- {type: text, text: ", "}
- {type: parameter, text: folder}
- {type: text, text: ": "}
- {type: type, text: str}
- {type: text, text: )}
```

## Description

Sets the path to the folder where the program will temporarily save files needed for the program correct work. After the successful document file creation, all the files will be deleted from the folder. If no temporary folder is set, the system one will be used.

## Parameters

<parameters>

- folder

  ```yml signature.variant="inline"
  - {type: type, text: str}
  ```

  - : The path to the folder where the temporary files will be saved.

</parameters>

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
builder.SetTmpFolder(L"DocBuilderTemp")
```

### .docbuilder

```ts
builder.SetTmpFolder("DocBuilderTemp")
```
