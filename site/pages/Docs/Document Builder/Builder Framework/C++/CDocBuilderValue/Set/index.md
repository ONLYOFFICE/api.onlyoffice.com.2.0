```yml signature
- {type: type, text: void}
- {type: text, text: " "}
- {type: entity, text: Set}
- {type: text, text: (}
- {type: parameter, text: nIndex}
- {type: text, text: ": "}
- {type: type, text: const int&}
- {type: text, text: ", "}
- {type: parameter, text: sValue}
- {type: text, text: ": "}
- {id: ../../CDocBuilderValue/index.md, token: {type: type, text: CDocBuilderValue}}
- {type: text, text: )}
```

## Description

Sets an array value by its index.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.Set` method is not used.

## Parameters

<parameters>

- nIndex

  ```yml signature.variant="inline"
  - {type: type, text: const int&}
  ```

  - : The index of the array value.

- sValue

  ```yml signature.variant="inline"
  - {id: ../../CDocBuilderValue/index.md, token: {type: keyword, text: CDocBuilderValue}}
  ```

  - : The array value to be set.

</parameters>

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
CValue aCharts = oDocument.GetAllCharts(); 
CValue oChart =  Api.CreateChart("bar3D", [
  [200, 240, 280],
  [250, 260, 280]
], ["Projected Revenue", "Estimated Costs"], [2014, 2015, 2016], 4051300, 2347595, 24);
aCharts.Set(1, oChart);
CDocBuilder::Dispose();
```
