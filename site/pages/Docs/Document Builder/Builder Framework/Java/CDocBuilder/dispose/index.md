```yml signature
- {type: type, text: void}
- {type: text, text: " "}
- {type: entity, text: dispose}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Unloads the ONLYOFFICE Document Builder from the application memory when it is no longer needed. Generally, there is no need to dispose JS before exiting the process, it should happen automatically. It should only be used if the process needs the resources taken up by JS.

> Please note, that for the `.docbuilder` file the `CDocBuilder.dispose` method is not used.

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilder.dispose();
```
