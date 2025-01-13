```yml signature
- {type: type, text: HRESULT}
- {type: text, text: " "}
- {type: entity, text: CloseFile}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Closes the file to stop working with it. You can use a single ONLYOFFICE Document Builder instance to work with all your files, but you need to close the previous file before you can start working with the next one in this case.

## Example

### COM

```cpp
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
oBuilder->Initialize();
oBuilder->CloseFile();
oBuilder->Dispose();
```

### .docbuilder

```ts
builder.CloseFile()
```
