`HRESULT CreateUndefined([out, retval] I_DOCBUILDER_VALUE** result);`

Creates an undefined value, an analogue of *undefined* in JS.

> Please note, that for the *.docbuilder* file the *CDocBuilderContext.CreateUndefined* method is not used.

## Parameters

| Name     | Type                     | Description                   |
| -------- | ------------------------ | ----------------------------- |
| *result* | I\_DOCBUILDER\_VALUE\*\* | The returned undefined value. |

## Example

### COM

```cpp
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
IONLYOFFICEDocBuilderContext* oContext = NULL;
IONLYOFFICEDocBuilderValue* oContent = NULL;
oBuilder->Initialize();
oBuilder->GetContext(&oContext);
oContext->CreateUndefined(&oContent);
oBuilder->Dispose();
```
