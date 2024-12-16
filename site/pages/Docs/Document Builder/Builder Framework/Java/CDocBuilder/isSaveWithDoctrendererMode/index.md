```yml signature
- {type: type, text: boolean}
- {type: text, text: " "}
- {type: entity, text: isSaveWithDoctrendererMode}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Specifies if the doctrenderer mode is used when building a document or getting content from the editor when saving a file.

> Please note, that for the `.docbuilder` file the `CDocBuilder.isSaveWithDoctrendererMode` method is not used.

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
boolean doctrendererMode = builder.isSaveWithDoctrendererMode();
CDocBuilder.dispose();
```
