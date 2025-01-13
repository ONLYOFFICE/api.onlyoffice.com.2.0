```yml signature
- {type: type, text: HRESULT}
- {type: text, text: " "}
- {type: entity, text: CreateNull}
- {type: text, text: (}
- {type: parameter, text: result}
- {type: text, text: ": [out, retval] "}
- {id: ../../CDocBuilderValue/index.md, token: {type: type, text: I_DOCBUILDER_VALUE**}}
- {type: text, text: )}
```

## Description

Creates a null value, an analogue of `null` in JS.

> Please note, that for the `.docbuilder` file the `CDocBuilderContext.CreateNull` method is not used.

## Parameters

<parameters>

- result

  ```yml signature.variant="inline"
  - {id: ../../CDocBuilderValue/index.md, token: {type: type, text: I_DOCBUILDER_VALUE**}}
  ```

  - : The returned null value.

</parameters>

## Example

### COM

```cpp
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
IONLYOFFICEDocBuilderContext* oContext = NULL;
IONLYOFFICEDocBuilderValue* oContent = NULL;
oBuilder->Initialize();
oBuilder->GetContext(&oContext);
oContext->CreateNull(&oContent);
oBuilder->Dispose();
```
