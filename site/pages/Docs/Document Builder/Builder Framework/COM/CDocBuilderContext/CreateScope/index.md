#### HRESULT CreateScope(\[out, retval] I\_DOCBUILDER\_CONTEXT\_SCOPE\*\* result);

Creates a [context scope](../../CDocBuilderContextScope/index.md) which sets the execution context for all operations executed within a local scope.

> Please note, that for the *.docbuilder* file the *CDocBuilderContext.CreateScope* method is not used.

## Parameters:

| Name     | Type                              | Description                 |
| -------- | --------------------------------- | --------------------------- |
| *result* | I\_DOCBUILDER\_CONTEXT\_SCOPE\*\* | The returned context scope. |

## Example

#### COM

```c++
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
IONLYOFFICEDocBuilderContext* oContext = NULL;
IONLYOFFICEDocBuilderContextScope* oScope = NULL;
oBuilder->Initialize();
oBuilder->GetContext(&oContext);
oContext->CreateScope(&oScope);
oBuilder->Dispose();
```
