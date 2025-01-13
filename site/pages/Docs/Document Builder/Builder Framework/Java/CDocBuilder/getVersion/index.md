```yml signature
- {type: type, text: String}
- {type: text, text: " "}
- {type: entity, text: getVersion}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Returns the ONLYOFFICE Document Builder engine version.

> Please note, that for the `.docbuilder` file the `CDocBuilder.getVersion` method is not used.

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
String version = builder.getVersion();
CDocBuilder.dispose();
```
