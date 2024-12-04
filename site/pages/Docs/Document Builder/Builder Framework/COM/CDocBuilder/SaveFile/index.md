```yml signature
- {type: type, text: HRESULT}
- {type: text, text: " "}
- {type: entity, text: SaveFile}
- {type: text, text: (}
- {type: parameter, text: type}
- {type: text, text: ": [in] "}
- {type: type, text: BSTR}
- {type: text, text: ", "}
- {type: parameter, text: path}
- {type: text, text: ": [in] "}
- {type: type, text: BSTR}
- {type: text, text: ", "}
- {type: parameter, text: result}
- {type: text, text: ": [out, retval] "}
- {type: type, text: VARIANT_BOOL*}
- {type: text, text: )}
```

## Description

Saves the file after all the changes are made. The type of the file which will be saved needs to be set.

## Parameters

<parameters>

- type

  ```yml signature.variant="inline"
  - {type: type, text: BSTR}
  ```

  - : The file extension. The following values are possible: `docx`, `odt`, `rtf`, `txt`, `pptx`, `xlsx`, `ods`, `csv`, `pdf` (see [OFFICESTUDIO\_FILE\_XXX](../../../../Builder%20App/Overview/index.md#format-types) values).

- path

  ```yml signature.variant="inline"
  - {type: type, text: BSTR}
  ```

  - : The path to the file to be saved together with its name and extension.

- result

  ```yml signature.variant="inline"
  - {type: type, text: VARIANT_BOOL*}
  ```

  - : Specifies if the operation of saving a file is successful or not.

</parameters>

## Example

### COM

```cpp
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
VARIANT_BOOL b;
oBuilder->Initialize();
oBuilder->SaveFile("docx", "result.docx", &b);
oBuilder->Dispose();
```

### .docbuilder

```ts
builder.SaveFile("docx", "result.docx")
```
