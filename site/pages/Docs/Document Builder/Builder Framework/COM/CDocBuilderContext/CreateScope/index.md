```yml signature
- {type: type, text: HRESULT}
- {type: text, text: " "}
- {type: entity, text: CreateScope}
- {type: text, text: (}
- {type: parameter, text: result}
- {type: text, text: ": [out, retval] "}
- {id: ../../CDocBuilderContextScope/index.md, token: {type: type, text: I_DOCBUILDER_CONTEXT_SCOPE**}}
- {type: text, text: )}
```

## Description

Creates a [context scope](../../CDocBuilderContextScope/index.md) which sets the execution context for all operations executed within a local scope.

> Please note, that for the `.docbuilder` file the `CDocBuilderContext.CreateScope` method is not used.

## Parameters

<parameters>

- result

  ```yml signature.variant="inline"
  - {id: ../../CDocBuilderContextScope/index.md, token: {type: type, text: I_DOCBUILDER_CONTEXT_SCOPE**}}
  ```

  - : The returned context scope.

</parameters>

## Example

### COM

```cpp
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
IONLYOFFICEDocBuilderContext* oContext = NULL;
IONLYOFFICEDocBuilderContextScope* oScope = NULL;
oBuilder->Initialize();
oBuilder->GetContext(&oContext);
oContext->CreateScope(&oScope);
oBuilder->Dispose();
```
