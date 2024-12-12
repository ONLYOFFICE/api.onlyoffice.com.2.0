```yml signature
- {id: ../../CDocBuilderValue/index.md, token: {type: type, text: CDocBuilderValue^}}
- {type: text, text: " "}
- {type: entity, text: CreateArray}
- {type: text, text: (}
- {type: parameter, text: nLength}
- {type: text, text: ": "}
- {type: type, text: int}
- {type: text, text: )}
```

## Description

Creates an array value, an analogue of `new Array (length)` in JS.

> Please note, that for the `.docbuilder` file the `CDocBuilderContext.CreateArray` method is not used.

## Parameters

<parameters>

- nLength

  ```yml signature.variant="inline"
  - {type: type, text: int}
  ```

  - : The array length.

</parameters>

## Example

### .Net

```cs
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
CContext oContext = oBuilder.GetContext();
CValue oArray = oContext.CreateArray(2);
CDocBuilder.Destroy();
```
