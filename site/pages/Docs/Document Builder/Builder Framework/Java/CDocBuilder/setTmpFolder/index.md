```yml signature
- {type: type, text: void}
- {type: text, text: " "}
- {type: entity, text: setTmpFolder}
- {type: text, text: (}
- {type: parameter, text: folder}
- {type: text, text: ": "}
- {type: type, text: String}
- {type: text, text: )}
```

## Description

Sets the path to the folder where the program will temporarily save files needed for the program correct work. After the successful document file creation, all the files will be deleted from the folder. If no temporary folder is set, the system one will be used.

## Parameters

<parameters>

- folder

  ```yml signature.variant="inline"
  - {type: type, text: String}
  ```

  - : The path to the folder where the temporary files will be saved.

</parameters>

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
builder.setTmpFolder(L"DocBuilderTemp");
CDocBuilder.dispose();
```

### .docbuilder

```ts
builder.SetTmpFolder("DocBuilderTemp")
```
