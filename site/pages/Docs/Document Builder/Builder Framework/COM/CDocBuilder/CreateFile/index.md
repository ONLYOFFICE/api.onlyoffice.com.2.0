```yml signature
- {type: type, text: HRESULT}
- {type: text, text: " "}
- {type: entity, text: CreateFile}
- {type: text, text: (}
- {type: parameter, text: type}
- {type: text, text: ": [in] "}
- {type: type, text: BSTR}
- {type: text, text: ", "}
- {type: parameter, text: result}
- {type: text, text: ": [out, retval] "}
- {type: type, text: VARIANT_BOOL*}
- {type: text, text: )}
```

## Description

Creates a new file. The type of the file which will be created needs to be set.

## Parameters

<parameters>

- type

  ```yml signature.variant="inline"
  - {type: type, text: BSTR}
  ```

  - : The file extension. The following values are possible: `docx`, `xlsx`, `pptx`, or `pdf` (see [OFFICESTUDIO\_FILE\_XXX](../../../../Builder%20App/Overview/index.md#format-types) values).

- result

  ```yml signature.variant="inline"
  - {type: type, text: VARIANT_BOOL*}
  ```

  - : Specifies if the operation of creating a file is successful or not.

</parameters>

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
