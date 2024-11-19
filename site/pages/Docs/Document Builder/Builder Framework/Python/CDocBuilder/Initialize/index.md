```yml signature
- {type: keyword, text: def}
- {type: text, text: " "}
- {type: entity, text: Initialize}
- {type: text, text: (}
- {type: parameter, text: cls}
- {type: text, text: ", "}
- {type: parameter, text: directory}
- {type: text, text: ": "}
- {type: type, text: str}
- {type: text, text: " | "}
- {type: type, text: None}
- {type: text, text: " = "}
- {type: type, text: None}
- {type: text, text: )}
```

## Description

Initializes the ONLYOFFICE Document Builder as a library for the application to be able to work with it. This method just sets the directory to the main Document Builder resources (icu files, etc). If this method is not called, the Document Builder will find resources from the current process directory.

> Please note, that for the `.docbuilder` file the `CDocBuilder.Initialize` method is not used.

## Parameters

<parameters>

- directory, default: None

  ```yml signature.variant="inline"
  - {type: type, text: str}
  - {type: text, text: " | "}
  - {type: type, text: None}
  ```

  - : The path to the main Document Builder resources.

</parameters>

## Example

### Python

``` py
docbuilder.CDocBuilder.Initialize("C:/Program Files/ONLYOFFICE/DocumentBuilder");
builder = docbuilder.CDocBuilder()
docbuilder.CDocBuilder.Dispose()
```
