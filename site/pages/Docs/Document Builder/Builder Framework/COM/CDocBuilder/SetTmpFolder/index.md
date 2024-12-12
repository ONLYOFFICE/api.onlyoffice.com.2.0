```yml signature
- {type: type, text: HRESULT}
- {type: text, text: " "}
- {type: entity, text: SetTmpFolder}
- {type: text, text: (}
- {type: parameter, text: folder}
- {type: text, text: ": [in] "}
- {type: type, text: BSTR}
- {type: text, text: )}
```

## Description

Sets the path to the folder where the program will temporarily save files needed for the program correct work. After the successful document file creation, all the files will be deleted from the folder. If no temporary folder is set, the system one will be used.

## Parameters

<parameters>

- folder

  ```yml signature.variant="inline"
  - {type: type, text: BSTR}
  ```

  - : The path to the folder where the temporary files will be saved.

</parameters>

## Example

### COM

```cpp
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
oBuilder->Initialize();
oBuilder->SetTmpFolder(L"DocBuilderTemp");
oBuilder->Dispose();
```

### .docbuilder

```ts
builder.SetTmpFolder("DocBuilderTemp")
```
