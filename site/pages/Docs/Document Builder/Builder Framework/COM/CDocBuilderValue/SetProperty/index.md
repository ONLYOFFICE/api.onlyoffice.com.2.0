```yml signature
- {type: type, text: HRESULT}
- {type: text, text: " "}
- {type: entity, text: SetProperty}
- {type: text, text: (}
- {type: parameter, text: name}
- {type: text, text: ": [in] "}
- {type: type, text: BSTR}
- {type: text, text: ", "}
- {type: parameter, text: value}
- {type: text, text: ": [in] "}
- {id: ../../CDocBuilderValue/index.md, token: {type: type, text: I_DOCBUILDER_VALUE**}}
- {type: text, text: )}
```

## Description

Sets a property to the `CDocBuilderValue` object.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.SetProperty` method is not used.

## Parameters

<parameters>

- name

  ```yml signature.variant="inline"
  - {type: type, text: BSTR}
  ```

  - : The name of the `CDocBuilderValue` object property.

- value

  ```yml signature.variant="inline"
  - {id: ../../CDocBuilderValue/index.md, token: {type: type, text: I_DOCBUILDER_VALUE**}}
  ```

  - : The value of the `CDocBuilderValue` object property.

</parameters>

## Example

### COM

```cpp
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
IONLYOFFICEDocBuilderContext* oContext = NULL;
IONLYOFFICEDocBuilderValue* oGlobal = NULL;
IONLYOFFICEDocBuilderValue* oApi = NULL;
IONLYOFFICEDocBuilderValue* oDocument = NULL;
oBuilder->Initialize();
oBuilder->GetContext(&oContext);
oContext->GetGlobal(&oGlobal);
oGlobal->GetProperty(_bstr_t("Api"), &oApi);
oApi->Call(_bstr_t("GetDocument"), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), &oDocument);
oDocument->SetProperty("color", {"zX":{"red":112,"green":173,"blue":71,"alpha":255},"type":"srgb","Zvf":null,"type":"uniColor"});
oBuilder->Dispose();
```
