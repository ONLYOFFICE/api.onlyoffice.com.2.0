```yml signature
- {type: type, text: HRESULT}
- {type: text, text: " "}
- {type: entity, text: GetContext}
- {type: text, text: (}
- {type: parameter, text: result}
- {type: text, text: ": [out, retval] "}
- {id: ../../CDocBuilderContext/index.md, token: {type: type, text: I_DOCBUILDER_CONTEXT**}}
- {type: text, text: )}
```

## Description

Returns the current JS [context](../../CDocBuilderContext/index.md).

> Please note, that for the `.docbuilder` file the `CDocBuilder.GetContext` method is not used.

## Parameters

<parameters>

- result

  ```yml signature.variant="inline"
  - {id: ../../CDocBuilderContext/index.md, token: {type: type, text: I_DOCBUILDER_CONTEXT**}}
  ```

  - : The returned JS context.

</parameters>

## Example

### COM

```cpp
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
IONLYOFFICEDocBuilderContext* oContext = NULL;
oBuilder->GetContext(&oContext);
oBuilder->Dispose();
```
