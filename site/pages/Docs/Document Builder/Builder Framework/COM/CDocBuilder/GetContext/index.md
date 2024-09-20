`HRESULT GetContext([out, retval] I_DOCBUILDER_CONTEXT** result);`

Returns the current JS [context](../../CDocBuilderContext/index.md).

> Please note, that for the *.docbuilder* file the *CDocBuilder.GetContext* method is not used.

## Parameters

| Name     | Type                       | Description              |
| -------- | -------------------------- | ------------------------ |
| *result* | I\_DOCBUILDER\_CONTEXT\*\* | The returned JS context. |

## Example

### COM

```cpp
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
IONLYOFFICEDocBuilderContext* oContext = NULL;
oBuilder->GetContext(&oContext);
oBuilder->Dispose();
```
