```yml signature
- {id: ../../CDocBuilderValue/index.md, token: {type: type, text: CDocBuilderValue^}}
- {type: text, text: " "}
- {type: entity, text: CreateTypedArray}
- {type: text, text: (}
- {type: parameter, text: aBuffer}
- {type: text, text: ": "}
- {type: type, text: array}
- {type: text, text: " | "}
- {type: type, text: <Byte>^}
- {type: text, text: )}
```

## Description

Creates a Uint8Array value, an analogue of `Uint8Array` in JS.

> Please note, that for the `.docbuilder` file the `CDocBuilderContext.CreateTypedArray` method is not used.

## Parameters

<parameters>

- aBuffer

  ```yml signature.variant="inline"
  - {type: type, text: array}
  - {type: text, text: " | "}
  - {type: type, text: <Byte>^}
  ```

  - : The array buffer.

</parameters>

## Example

### .Net

```cs
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
CContext oContext = oBuilder.GetContext();
array<System::Byte>^ aBuffer = gcnew array<Byte>(1500);
CValue oTypedArray = oContext.CreateTypedArray(aBuffer);
CDocBuilder.Destroy();
```
