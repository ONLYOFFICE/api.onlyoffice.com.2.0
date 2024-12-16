```yml signature
- {id: ../../CDocBuilderContext/index.md, token: {type: type, text: CDocBuilderContext}}
- {type: text, text: " "}
- {type: entity, text: getContext}
- {type: text, text: (}
- {type: parameter, text: enterContext}
- {type: text, text: ": "}
- {type: type, text: boolean}
- {type: text, text: " = "}
- {type: text, text: 0}
- {type: text, text: )}
```

## Description

Returns the current JS [context](../../CDocBuilderContext/index.md).

> Please note, that for the `.docbuilder` file the `CDocBuilder.getContext` method is not used.

## Parameters

<parameters>

- enterContext, default: 0

  ```yml signature.variant="inline"
  - {type: type, text: boolean}
  ```

  - : Specifies whether the context will be entered.

</parameters>

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilderContext context = builder.getContext();
CDocBuilder.dispose();
```
