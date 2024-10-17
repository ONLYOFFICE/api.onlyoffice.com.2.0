`boolean createFile(int type);`

Creates a new file. The type of the file which will be created needs to be set.

## Parameters

| Name   | Type         | Description                                                                                                                                                                                                                                                       |
| ------ | ------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| *type* | int / String | The type of the file to be created set as a hexadecimal integer for the Java code or **docx**, **xlsx**, **pptx**, or **pdf** for the *.docbuilder* script file (see [OFFICESTUDIO\_FILE\_XXX](../../../../Builder%20App/Overview/index.md#format-types) values). |

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
