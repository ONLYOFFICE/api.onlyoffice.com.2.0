```yml signature
- {id: ../../CDocBuilderContext/index.md, token: {type: type, text: CDocBuilderContext}}
- {type: text, text: " "}
- {type: entity, text: GetContext}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Returns the current JS [context](../../CDocBuilderContext/index.md).

> Please note, that for the `.docbuilder` file the `CDocBuilder.GetContext` method is not used.

## Example

### C++

```cpp
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
CDocBuilderContext oContext = oBuilder.GetContext();
CDocBuilder::Dispose();
```
