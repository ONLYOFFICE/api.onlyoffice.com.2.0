```yml signature
- {type: type, text: HRESULT}
- {type: text, text: " "}
- {type: entity, text: CreateTypedArray}
- {type: text, text: (}
- {type: parameter, text: buffer}
- {type: text, text: ": [in] "}
- {type: type, text: VARIANT}
- {type: text, text: ", "}
- {type: parameter, text: length}
- {type: text, text: ": [in] "}
- {type: type, text: long}
- {type: text, text: ", "}
- {type: parameter, text: result}
- {type: text, text: ": [out, retval] "}
- {id: ../../CDocBuilderValue/index.md, token: {type: type, text: I_DOCBUILDER_VALUE**}}
- {type: text, text: )}
```

## Description

Creates a Uint8Array value, an analogue of `Uint8Array` in JS.

> Please note, that for the `.docbuilder` file the `CDocBuilderContext.CreateTypedArray` method is not used.

## Parameters

<parameters>

- buffer

  ```yml signature.variant="inline"
  - {type: type, text: VARIANT}
  ```

  - : The array buffer.

- length

  ```yml signature.variant="inline"
  - {type: type, text: long}
  ```

  - : The array length.

- result

  ```yml signature.variant="inline"
  - {id: ../../CDocBuilderValue/index.md, token: {type: type, text: I_DOCBUILDER_VALUE**}}
  ```

  - : The returned typed array.

</parameters>

## Example

### COM

```cpp
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
IONLYOFFICEDocBuilderContext* oContext = NULL;
IONLYOFFICEDocBuilderValue* oArr = NULL;
CComSafeArray<BYTE> arr;
arr.Add(1);
oBuilder->Initialize();
oBuilder->GetContext(&oContext);
oContext->CreateTypedArray(ATL::CComVariant(arr), 1, &oArr);
oBuilder->Dispose();
```
