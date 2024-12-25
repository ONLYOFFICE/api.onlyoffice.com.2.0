```yml signature
- {type: type, text: HRESULT}
- {type: text, text: " "}
- {type: entity, text: CreateArray}
- {type: text, text: (}
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

Creates an array value, an analogue of `new Array (length)` in JS.

> Please note, that for the `.docbuilder` file the `CDocBuilderContext.CreateArray` method is not used.

## Parameters

<parameters>

- length

  ```yml signature.variant="inline"
  - {type: type, text: long}
  ```

  - : The array length.

- result

  ```yml signature.variant="inline"
  - {id: ../../CDocBuilderValue/index.md, token: {type: type, text: I_DOCBUILDER_VALUE**}}
  ```

  - : The returned array.

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
oContext->CreateArray(1, &oContent);
oBuilder->Dispose();
```
