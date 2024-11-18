```yml signature
- {type: type, text: CString}
- {type: text, text: " "}
- {type: entity, text: ToString}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Converts the `CDocBuilderValue` object to a string.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.ToString` method is not used.

## Example

### C++

```cpp
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
CValue oGlobal = oContext.GetGlobal();
CValue oGlobal = oContext.GetGlobal();
CString sGlobal = oGlobal.ToString();
CDocBuilder::Dispose();
```
