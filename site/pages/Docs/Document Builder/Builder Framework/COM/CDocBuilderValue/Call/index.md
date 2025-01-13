```yml signature
- {type: type, text: HRESULT}
- {type: text, text: " "}
- {type: entity, text: Call}
- {type: text, text: (}
- {type: parameter, text: name}
- {type: text, text: ": [in] "}
- {type: type, text: BSTR}
- {type: text, text: ", "}
- {type: parameter, text: val1}
- {type: text, text: ": [in, optional] "}
- {type: type, text: VARIANT}
- {type: text, text: ", "}
- {type: parameter, text: val2}
- {type: text, text: ": [in, optional] "}
- {type: type, text: VARIANT}
- {type: text, text: ", "}
- {type: parameter, text: val3}
- {type: text, text: ": [in, optional] "}
- {type: type, text: VARIANT}
- {type: text, text: ", "}
- {type: parameter, text: val4}
- {type: text, text: ": [in, optional] "}
- {type: type, text: VARIANT}
- {type: text, text: ", "}
- {type: parameter, text: val5}
- {type: text, text: ": [in, optional] "}
- {type: type, text: VARIANT}
- {type: text, text: ", "}
- {type: parameter, text: val6}
- {type: text, text: ": [in, optional] "}
- {type: type, text: VARIANT}
- {type: text, text: ", "}
- {type: parameter, text: result}
- {type: text, text: ": [out, retval] "}
- {id: ../../CDocBuilderValue/index.md, token: {type: type, text: I_DOCBUILDER_VALUE**}}
- {type: text, text: )}
```

## Description

Calls the specified Document Builder method. See the [Text document API](../../../../../Office%20API/Usage%20API/Text%20Document%20API/index.md), [Spreadsheet API](../../../../../Office%20API/Usage%20API/Spreadsheet%20API/index.md), [Presentation API](../../../../../Office%20API/Usage%20API/Presentation%20API/index.md), or [Form API](../../../../../Office%20API/Usage%20API/Form%20API/index.md) sections for more information which methods are available for various document types.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.Call` method is not used explicitly. The method itself is used instead. See the example below.

## Parameters

<parameters>

- name

  ```yml signature.variant="inline"
  - {type: type, text: BSTR}
  ```

  - : The name of the Document Builder method.

- val1-val6

  ```yml signature.variant="inline"
  - {type: type, text: VARIANT}
  ```

  - : The parameters that the Document Builder method takes as arguments.

- result

  ```yml signature.variant="inline"
  - {id: ../../CDocBuilderValue/index.md, token: {type: type, text: I_DOCBUILDER_VALUE**}}
  ```

  - : The returned method value.

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
oBuilder->Dispose();
```

### .docbuilder

```ts
const oDocument = Api.GetDocument()
```
