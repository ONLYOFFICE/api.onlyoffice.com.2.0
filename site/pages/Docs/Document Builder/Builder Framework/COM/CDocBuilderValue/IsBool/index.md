```yml signature
- {type: type, text: HRESULT}
- {type: text, text: " "}
- {type: entity, text: IsBool}
- {type: text, text: (}
- {type: parameter, text: result}
- {type: text, text: ": [out, retval] "}
- {type: type, text: VARIANT_BOOL*}
- {type: text, text: )}
```

## Description

Returns true if the `CDocBuilderValue` object is a boolean value.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.IsBool` method is not used.

## Parameters

<parameters>

- result

  ```yml signature.variant="inline"
  - {type: type, text: VARIANT_BOOL*}
  ```

  - : Specifies whether the `CDocBuilderValue` object is a boolean value.

</parameters>

## Example

### COM

```cpp
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
IONLYOFFICEDocBuilderContext* oContext = NULL;
IONLYOFFICEDocBuilderValue* oGlobal = NULL;
VARIANT_BOOL b;
oBuilder->Initialize();
oBuilder->GetContext(&oContext);
oContext->GetGlobal(&oGlobal);
oGlobal->IsBool(&b);
oBuilder->Dispose();
```
