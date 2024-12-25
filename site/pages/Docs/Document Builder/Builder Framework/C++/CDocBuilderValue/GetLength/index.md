```yml signature
- {type: type, text: unsigned int}
- {type: text, text: " "}
- {type: entity, text: GetLength}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Returns the length if the `CDocBuilderValue` object is an array/typed array. Otherwise, returns 0.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.GetLength` method is not used.

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
CValue aCharts = oDocument.Call("GetAllCharts");
unsigned int nLength = aCharts.GetLength();
CDocBuilder::Dispose();
```
