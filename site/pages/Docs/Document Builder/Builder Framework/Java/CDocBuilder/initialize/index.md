```yml signature
- {type: keyword, text: static}
- {type: text, text: " "}
- {type: type, text: void}
- {type: text, text: " "}
- {type: entity, text: initialize}
- {type: text, text: (}
- {type: parameter, text: directory}
- {type: text, text: ": "}
- {type: type, text: String}
- {type: text, text: " = "}
- {type: text, text: 0}
- {type: text, text: )}
```

## Description

Initializes the ONLYOFFICE Document Builder as a library for the application to be able to work with it. This method just sets the directory to the main Document Builder resources (icu files, etc). If this method is not called, the Document Builder will find resources from the current process directory.

> Please note, that for the `.docbuilder` file the `CDocBuilder.initialize` method is not used.

## Parameters

<parameters>

- directory, default: 0

  ```yml signature.variant="inline"
  - {type: type, text: String}
  ```

  - : The path to the main Document Builder resources.

</parameters>

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilder.dispose();
```
