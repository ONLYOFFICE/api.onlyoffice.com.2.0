```yml signature
- {type: type, text: HRESULT}
- {type: text, text: " "}
- {type: entity, text: CreateInstance}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Creates an instance of the `CDocBuilder` class.

> Please note, that for the `.docbuilder` file the `CDocBuilder.CreateInstance` method is not used.

## Example

### COM

```cpp
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
oBuilder->Initialize();
oBuilder->CreateInstance();
oBuilder->Dispose();
```
