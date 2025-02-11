```yml signature
- {type: type, text: HRESULT}
- {type: text, text: " "}
- {type: entity, text: ToBool}
- {type: text, text: (}
- {type: parameter, text: result}
- {type: text, text: ": [out, retval] "}
- {type: type, text: VARIANT_BOOL*}
- {type: text, text: )}
```

## Description

Converts the `CDocBuilderValue` object to a boolean value.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.ToBool` method is not used.

## Parameters

<parameters>

- result

  ```yml signature.variant="inline"
  - {type: type, text: VARIANT_BOOL*}
  ```

  - : The returned boolean value.

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
oGlobal->ToBool(&b);
oBuilder->Dispose();
```
