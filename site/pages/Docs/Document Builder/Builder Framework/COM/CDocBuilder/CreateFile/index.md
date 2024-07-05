#### HRESULT CreateFile(\[in] BSTR type, \[out, retval] VARIANT\_BOOL\* result);

Creates a new file. The type of the file which will be created needs to be set.

## Parameters:

| Name     | Type            | Description                                                                                                                                                                                   |
| -------- | --------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| *type*   | BSTR            | The file extension. The following values are possible: **docx**, **xlsx**, **pptx**, or **pdf** (see [AVS\_OFFICESTUDIO\_FILE\_XXX](/docbuilder/integrationapi/default#format-types) values). |
| *result* | VARIANT\_BOOL\* | Specifies if the operation of creating a file is successful or not.                                                                                                                           |

## Example

#### COM

```
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
VARIANT_BOOL b;
oBuilder->Initialize();
oBuilder->CreateFile(_bstr_t("docx"), &b);
oBuilder->Dispose();
```

#### .docbuilder

```
builder.CreateFile("docx");
```
