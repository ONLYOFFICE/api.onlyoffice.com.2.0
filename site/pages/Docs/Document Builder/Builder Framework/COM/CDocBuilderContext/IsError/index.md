#### HRESULT IsError(\[out, retval] VARIANT\_BOOL\* result);

Checks for errors in JS.

> Please note, that for the *.docbuilder* file the *CDocBuilderContext.IsError* method is not used.

## Parameters:

| Name     | Type            | Description                        |
| -------- | --------------- | ---------------------------------- |
| *result* | VARIANT\_BOOL\* | Specifies whether an error occurs. |

## Example

#### COM

```c++
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
IONLYOFFICEDocBuilderContext* oContext = NULL;
VARIANT_BOOL b;
oBuilder->Initialize();
oBuilder->GetContext(&oContext);
oContext->IsError(&b);
oBuilder->Dispose();
```
