```yml signature
- {type: type, text: bool}
- {type: text, text: " "}
- {type: entity, text: IsTypedArray}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Returns true if the `CDocBuilderValue` object is a typed array.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.IsTypedArray` method is not used.

## Example

### C++

```cpp
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
CContext oContext = oBuilder.GetContext();
CValue oGlobal = oContext.GetGlobal();
bool bTypedArray = oGlobal.IsTypedArray();
CDocBuilder::Dispose();
```
