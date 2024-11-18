```yml signature
- {type: keyword, text: static}
- {type: text, text: " "}
- {type: type, text: unsigned char*}
- {type: text, text: " "}
- {type: entity, text: AllocMemoryTypedArray}
- {type: text, text: (}
- {type: parameter, text: nSize}
- {type: text, text: ": "}
- {type: type, text: const size_t*}
- {type: text, text: )}
```

## Description

Allocates the memory for a typed array by creating a buffer array of the specified size.

> Please note, that for the `.docbuilder` file the `CDocBuilderContext.AllocMemoryTypedArray` method is not used.

## Parameters

<parameters>

- nSize

  ```yml signature.variant="inline"
  - {type: type, text: const size_t*}
  ```

  - : The buffer array size.

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
