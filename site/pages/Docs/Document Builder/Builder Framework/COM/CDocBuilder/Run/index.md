```yml signature
- {type: type, text: HRESULT}
- {type: text, text: " "}
- {type: entity, text: Run}
- {type: text, text: (}
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

Runs the ONLYOFFICE Document Builder executable. If you do not want to write an application, you can simply use the `docbuilder.exe` executable file and run it with the `.docbuilder` file as an argument, where all the code for the document file creation will be written. For COM, create the `CDocBuilder` object and call the `Run` method with the path to the executable file from the `patр` parameter.

## Parameters

<parameters>

- path

  ```yml signature.variant="inline"
  - {type: type, text: BSTR}
  ```

  - : The path to the ONLYOFFICE Document Builder executable.

- result

  ```yml signature.variant="inline"
  - {type: type, text: VARIANT_BOOL*}
  ```

  - : Specifies if the operation of running the executable is successful or not.

</parameters>

## Example

### COM

```cpp
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
VARIANT_BOOL b;
oBuilder->Initialize();
oBuilder->Run("path-to-script.docbuilder", &b);
oBuilder->Dispose();
```

### .docbuilder

```sh
docbuilder.exe mydocument.docbuilder
```
