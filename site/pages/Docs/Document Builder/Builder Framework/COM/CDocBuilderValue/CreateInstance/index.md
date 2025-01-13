```yml signature
- {type: type, text: HRESULT}
- {type: text, text: " "}
- {type: entity, text: CreateInstance}
- {type: text, text: (}
- {type: parameter, text: value}
- {type: text, text: ": [in, optional] "}
- {type: type, text: VARIANT}
- {type: text, text: )}
```

## Description

Creates an instance of the `CDocBuilderValue` class.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.CreateInstance` method is not used.

## Parameters

<parameters>

- value

  ```yml signature.variant="inline"
  - {type: type, text: VARIANT}
  ```

  - : A value from which an instance will be created.

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
IONLYOFFICEDocBuilderValue* oParagraph = NULL;
I_DOCBUILDER_VALUE* p1 = NULL;
p1->CreateInstance(1000);
oBuilder->Initialize();
oBuilder->GetContext(&oContext);
oContext->GetGlobal(&oGlobal);
oGlobal->GetProperty(_bstr_t("Api"), &oApi);
oApi->Call(_bstr_t("GetDocument"), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), &oDocument);
oApi->Call(_bstr_t("CreateParagraph"), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), &oParagraph);
oParagraph->Call(_bstr_t("SetSpacingAfter"), p1, ATL::CComVariant(VARIANT_FALSE), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), NULL);
oBuilder->Dispose();
```

### .docbuilder

```ts
const oDocument = Api.GetDocument()
const oParagraph = Api.CreateParagraph()
oParagraph.SetSpacingAfter(1000, false)
```
