```yml signature
- {type: keyword, text: static}
- {type: text, text: " "}
- {type: type, text: void}
- {type: text, text: " "}
- {type: entity, text: FreeMemoryTypedArray}
- {type: text, text: (}
- {type: parameter, text: sData}
- {type: text, text: ": "}
- {type: type, text: unsigned char*}
- {type: text, text: ", "}
- {type: parameter, text: nSize}
- {type: text, text: ": "}
- {type: type, text: const size_t*}
- {type: text, text: )}
```

## Description

Frees the memory for a typed array.

> Please note, that for the `.docbuilder` file the `CDocBuilderContext.FreeMemoryTypedArray` method is not used.

## Parameters

<parameters>

- sData

  ```yml signature.variant="inline"
  - {type: type, text: unsigned char*}
  ```

  - : The allocated memory to be released.

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
CVlaue oTypedArray = oContext.CreateTypedArray(sBuffer, 3, true);
oContext.FreeMemoryTypedArray(sBuffer, 3);
CDocBuilder::Dispose();
```
