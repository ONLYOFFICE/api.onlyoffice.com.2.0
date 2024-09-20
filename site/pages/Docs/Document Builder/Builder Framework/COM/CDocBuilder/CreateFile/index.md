`HRESULT CreateFile([in] BSTR type, [out, retval] VARIANT_BOOL* result);`

Creates a new file. The type of the file which will be created needs to be set.

## Parameters

| Name     | Type            | Description                                                                                                                                                                                       |
| -------- | --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| *type*   | BSTR            | The file extension. The following values are possible: **docx**, **xlsx**, **pptx**, or **pdf** (see [OFFICESTUDIO\_FILE\_XXX](../../../../Builder%20App/Overview/index.md#format-types) values). |
| *result* | VARIANT\_BOOL\* | Specifies if the operation of creating a file is successful or not.                                                                                                                               |

## Example

### COM

```cpp
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
VARIANT_BOOL b;
oBuilder->Initialize();
oBuilder->CreateFile(_bstr_t("docx"), &b);
oBuilder->Dispose();
```

### .docbuilder

```ts
builder.CreateFile("docx")
```
