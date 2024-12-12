```yml signature
- {type: type, text: void}
- {type: text, text: " "}
- {type: entity, text: SetProperty}
- {type: text, text: (}
- {type: parameter, text: sName}
- {type: text, text: ": "}
- {type: type, text: const wchar_t*}
- {type: text, text: ", "}
- {type: parameter, text: sValue}
- {type: text, text: ": "}
- {type: type, text: const wchar_t*}
- {type: text, text: )}
```

## Description

Sets a property to the `CDocBuilderValue` object.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.SetProperty` method is not used.

## Parameters

<parameters>

- sName

  ```yml signature.variant="inline"
  - {type: type, text: const wchar_t*}
  ```

  - : The name of the `CDocBuilderValue` object property.

- sValue

  ```yml signature.variant="inline"
  - {type: type, text: const wchar_t*}
  ```

  - : The value of the `CDocBuilderValue` object property.

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
oDocument.SetProperty("color", {"zX":{"red":112,"green":173,"blue":71,"alpha":255},"type":"srgb","Zvf":null,"type":"uniColor"});
CDocBuilder::Dispose();
```

The `Set` method can be also used to set a property to the `CDocBuilderValue` object. The object property can be specified with its name in the Unicode format:

```cpp
void Set(const wchar_t* name, CDocBuilderValue value);
```

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
oDocument.Set("color", {"zX":{"red":112,"green":173,"blue":71,"alpha":255},"type":"srgb","Zvf":null,"type":"uniColor"});
CDocBuilder::Dispose();
```
