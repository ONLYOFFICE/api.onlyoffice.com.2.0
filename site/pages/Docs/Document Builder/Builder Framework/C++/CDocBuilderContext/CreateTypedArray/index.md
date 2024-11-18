```yml signature
- {id: ../../CDocBuilderValue/index.md, token: {type: type, text: CDocBuilderValue}}
- {type: text, text: " "}
- {type: entity, text: CreateTypedArray}
- {type: text, text: (}
- {type: parameter, text: sBuffer}
- {type: text, text: ": "}
- {type: type, text: unsigned char*}
- {type: text, text: ", "}
- {type: parameter, text: nLength}
- {type: text, text: ": "}
- {type: type, text: const int&}
- {type: text, text: ", "}
- {type: parameter, text: bExternalize}
- {type: text, text: ": "}
- {type: type, text: const bool&}
- {type: text, text: )}
```

## Description

Creates a Uint8Array value, an analogue of `Uint8Array` in JS.

> Please note, that for the `.docbuilder` file the `CDocBuilderContext.CreateTypedArray` method is not used.

## Parameters

<parameters>

- sBuffer

  ```yml signature.variant="inline"
  - {type: type, text: unsigned char*}
  ```

  - : The array buffer.

- nLength

  ```yml signature.variant="inline"
  - {type: type, text: const int&}
  ```

  - : The array length.

- bExternalize

  ```yml signature.variant="inline"
  - {type: type, text: const bool&}
  ```

  - : Specifies if the application releases the memory after freeing Uint8Array (`true`). If this parameter is `false`, then the memory will be released automatically. In this case, the buffer must be created with the [AllocMemoryTypedArray](../AllocMemoryTypedArray/index.md) method.

</parameters>

## Example

### C++

```cpp
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
CContext oContext = oBuilder.GetContext();
unsigned char* sBuffer = oContext.AllocMemoryTypedArray(1500);
CValue oTypedArray = oContext.CreateTypedArray(sBuffer, 3, false);
CDocBuilder::Dispose();
```
