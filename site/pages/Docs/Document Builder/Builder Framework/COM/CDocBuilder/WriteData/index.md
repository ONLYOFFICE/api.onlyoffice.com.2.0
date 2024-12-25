```yml signature
- {type: type, text: HRESULT}
- {type: text, text: " "}
- {type: entity, text: WriteData}
- {type: text, text: (}
- {type: parameter, text: path}
- {type: text, text: ": [in] "}
- {type: type, text: BSTR}
- {type: text, text: ", "}
- {type: parameter, text: value}
- {type: text, text: ": [in] "}
- {type: type, text: BSTR}
- {type: text, text: ", "}
- {type: parameter, text: append}
- {type: text, text: ": [in] "}
- {type: type, text: VARIANT_BOOL}
- {type: text, text: )}
```

## Description

Writes data to the log file. It is used for logs in JS code.

> Please note, that for the `.docbuilder` file the `CDocBuilder.WriteData` method is not used.

## Parameters

<parameters>

- path

  ```yml signature.variant="inline"
  - {type: type, text: BSTR}
  ```

  - : The path to the file where all the logs will be written.

- value

  ```yml signature.variant="inline"
  - {type: type, text: BSTR}
  ```

  - : The data which will be written to the log file.

- append

  ```yml signature.variant="inline"
  - {type: type, text: VARIANT_BOOL}
  ```

  - : Specifies if the new data will be appended to the already existing log file or a new file will be created.

</parameters>

## Example

### COM

```cpp
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
oBuilder->Initialize();
oBuilder->WriteData("result.log", "Alert!", false);
oBuilder->Dispose();
```
