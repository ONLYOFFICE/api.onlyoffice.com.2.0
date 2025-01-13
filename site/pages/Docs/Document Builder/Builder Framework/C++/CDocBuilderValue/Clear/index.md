```yml signature
- {type: type, text: void}
- {type: text, text: " "}
- {type: entity, text: Clear}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Clears the `CDocBuilderValue` object.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.Clear` method is not used.

## Example

### C++

```cpp
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
CContext oContext = oBuilder.GetContext();
CValue oGlobal = oContext.GetGlobal();
CValue oApi = oGlobal["Api"];
CValue oDocument = oApi.Call("GetDocument");
oDocument.Clear();
CDocBuilder::Dispose();
```
