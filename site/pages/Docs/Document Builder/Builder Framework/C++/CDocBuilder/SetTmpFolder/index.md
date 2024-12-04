```yml signature
- {type: type, text: void}
- {type: text, text: " "}
- {type: entity, text: SetTmpFolder}
- {type: text, text: (}
- {type: parameter, text: sFolder}
- {type: text, text: ": "}
- {type: type, text: const wchar_t*}
- {type: text, text: )}
```

## Description

Sets the path to the folder where the program will temporarily save files needed for the program correct work. After the successful document file creation, all the files will be deleted from the folder. If no temporary folder is set, the system one will be used.

## Parameters

<parameters>

- sFolder

  ```yml signature.variant="inline"
  - {type: type, text: const wchar_t*}
  ```

  - : The path to the folder where the temporary files will be saved.

</parameters>

## Example

### C++

```cpp
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
oBuilder.SetTmpFolder(L"DocBuilderTemp");
CDocBuilder::Dispose();
```

### .docbuilder

```ts
builder.SetTmpFolder("DocBuilderTemp")
```
