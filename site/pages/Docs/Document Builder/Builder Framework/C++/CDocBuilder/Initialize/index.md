```yml signature
- {type: keyword, text: static}
- {type: text, text: " "}
- {type: type, text: void}
- {type: text, text: " "}
- {type: entity, text: Initialize}
- {type: text, text: (}
- {type: parameter, text: sDirectory}
- {type: text, text: ": "}
- {type: type, text: const wchar_t*}
- {type: text, text: " = "}
- {type: text, text: 0}
- {type: text, text: )}
```

## Description

Initializes the ONLYOFFICE Document Builder as a library for the application to be able to work with it. This method just sets the directory to the main Document Builder resources (icu files, etc). If this method is not called, the Document Builder will find resources from the current process directory.

> Please note, that for the `.docbuilder` file the `CDocBuilder.Initialize` method is not used.

## Parameters

<parameters>

- sDirectory, default: 0

  ```yml signature.variant="inline"
  - {type: type, text: const wchar_t*}
  ```

  - : The path to the main Document Builder resources.

</parameters>

## Example

### C++

```cpp
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
CDocBuilder::Dispose();
```
