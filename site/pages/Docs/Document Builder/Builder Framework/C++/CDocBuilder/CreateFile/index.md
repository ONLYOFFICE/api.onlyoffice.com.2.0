```yml signature
- {type: type, text: bool}
- {type: text, text: " "}
- {type: entity, text: CreateFile}
- {type: text, text: (}
- {type: parameter, text: sExtension}
- {type: text, text: ": "}
- {type: type, text: const wchar_t*}
- {type: text, text: )}
```

## Description

Creates a new file. The type of the file which will be created needs to be set.

## Parameters

<parameters>

- sExtension

  ```yml signature.variant="inline"
  - {type: type, text: const wchar_t*}
  ```

  - : The file extension. The following values are possible: `docx`, `xlsx`, `pptx`, or `pdf` (see [OFFICESTUDIO\_FILE\_XXX](../../../../Builder%20App/Overview/index.md#format-types) values).

</parameters>

## Example

### C++

```cpp
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
oBuilder.CreateFile("docx");
CDocBuilder::Dispose();
```

### .docbuilder

```ts
builder.CreateFile("docx")
```
