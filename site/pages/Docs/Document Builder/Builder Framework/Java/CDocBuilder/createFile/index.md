```yml signature
- {type: type, text: boolean}
- {type: text, text: " "}
- {type: entity, text: createFile}
- {type: text, text: (}
- {type: parameter, text: type}
- {type: text, text: ": "}
- {type: type, text: int}
- {type: text, text: " | "}
- {type: type, text: String}
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
  - {type: type, text: String}
  ```

  - : The type of the file to be created set as a hexadecimal integer for the Java code or `docx`, `xlsx`, `pptx`, or `pdf` for the `.docbuilder` script file (see [OFFICESTUDIO\_FILE\_XXX](../../../../Builder%20App/Overview/index.md#format-types) values).

</parameters>

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
builder.createFile(FileTypes.Document.DOCX);
CDocBuilder.dispose();
```

### .docbuilder

```ts
builder.CreateFile("docx")
```
