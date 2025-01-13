```yml signature
- {type: type, text: HRESULT}
- {type: text, text: " "}
- {type: entity, text: Initialize}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Initializes the ONLYOFFICE Document Builder as a library for the application to be able to work with it. This method just sets the directory to the main Document Builder resources (icu files, etc). If this method is not called, the Document Builder will find resources from the current process directory.

> Please note, that for the `.docbuilder` file the `CDocBuilder.Initialize` method is not used.

## Example

### COM

```cpp
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
oBuilder->Initialize();
oBuilder->Dispose();
```
