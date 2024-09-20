`HRESULT CreateNull([out, retval] I_DOCBUILDER_VALUE** result);`

Creates a null value, an analogue of *null* in JS.

> Please note, that for the *.docbuilder* file the *CDocBuilderContext.CreateNull* method is not used.

## Parameters

| Name     | Type                     | Description              |
| -------- | ------------------------ | ------------------------ |
| *result* | I\_DOCBUILDER\_VALUE\*\* | The returned null value. |

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
