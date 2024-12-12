```yml signature
- {type: type, text: HRESULT}
- {type: text, text: " "}
- {type: entity, text: ToInt}
- {type: text, text: (}
- {type: parameter, text: result}
- {type: text, text: ": [out, retval] "}
- {type: type, text: long*}
- {type: text, text: )}
```

## Description

Converts the `CDocBuilderValue` object to an integer.

> Please note, that for the `.docbuilder` file the `CDocBuilderValue.ToInt` method is not used.

## Parameters

<parameters>

- result

  ```yml signature.variant="inline"
  - {type: type, text: long*}
  ```

  - : The returned integer value.

</parameters>

## Example

### COM

```cpp
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
IONLYOFFICEDocBuilderContext* oContext = NULL;
IONLYOFFICEDocBuilderValue* oGlobal = NULL;
long l;
oBuilder->Initialize();
oBuilder->GetContext(&oContext);
oContext->GetGlobal(&oGlobal);
oGlobal->ToInt(&l);
oBuilder->Dispose();
```
