```yml signature
- {type: type, text: HRESULT}
- {type: text, text: " "}
- {type: entity, text: Get}
- {type: text, text: (}
- {type: parameter, text: index}
- {type: text, text: ": [in] "}
- {type: type, text: long}
- {type: text, text: ", "}
- {type: parameter, text: result}
- {type: text, text: ": [out, retval] "}
- {id: ../../CDocBuilderValue/index.md, token: {type: type, text: I_DOCBUILDER_VALUE**}}
- {type: text, text: )}
```

## Description

Returns an array value by its index.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.Get` method is not used.

## Parameters

<parameters>

- index

  ```yml signature.variant="inline"
  - {type: type, text: long}
  ```

  - : The index of the array value.

- result

  ```yml signature.variant="inline"
  - {id: ../../CDocBuilderValue/index.md, token: {type: type, text: I_DOCBUILDER_VALUE**}}
  ```

  - : The returned array value.

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
IONLYOFFICEDocBuilderValue* aCharts = NULL;
IONLYOFFICEDocBuilderValue* oChart = NULL;
oBuilder->Initialize();
oBuilder->GetContext(&oContext);
oContext->GetGlobal(&oGlobal);
oGlobal->GetProperty(_bstr_t("Api"), &oApi);
oApi->Call(_bstr_t("GetDocument"), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), &oDocument);
oDocument->Call(_bstr_t("GetAllCharts"), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), &aCharts);
aCharts->Get(1, &oChart);
oBuilder->Dispose();
```

### .docbuilder

```ts
const oDocument = Api.GetDocument()
const aCharts = oDocument.GetAllCharts()
const oChart = aCharts[1]
```
