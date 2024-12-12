```yml signature
- {id: ../../CDocBuilderValue/index.md, token: {type: type, text: CDocBuilderValue}}
- {type: text, text: " "}
- {type: entity, text: GetGlobal}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Returns the global object for the current context.

> Please note, that for the `.docbuilder` file the `CDocBuilderContext.GetGlobal` method is not used.

## Example

### C++

```cpp
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
CContext oContext = oBuilder.GetContext();
CValue oGlobal = oContext.GetGlobal();
CDocBuilder::Dispose();
```
