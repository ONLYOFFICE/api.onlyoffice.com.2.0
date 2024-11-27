```yml signature
- {type: type, text: void}
- {type: text, text: " "}
- {type: entity, text: CloseFile}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Closes the file to stop working with it. You can use a single ONLYOFFICE Document Builder instance to work with all your files, but you need to close the previous file before you can start working with the next one in this case.

## Example

### C++

```cpp
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
oBuilder.CloseFile();
CDocBuilder::Dispose();
```

### .docbuilder

```ts
builder.CloseFile()
```
