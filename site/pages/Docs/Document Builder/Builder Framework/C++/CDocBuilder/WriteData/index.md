```yml signature
- {type: type, text: void}
- {type: text, text: " "}
- {type: entity, text: WriteData}
- {type: text, text: (}
- {type: parameter, text: sPath}
- {type: text, text: ": "}
- {type: type, text: const wchar_t*}
- {type: text, text: ", "}
- {type: parameter, text: sValue}
- {type: text, text: ": "}
- {type: type, text: const wchar_t*}
- {type: text, text: ", "}
- {type: parameter, text: bAppend}
- {type: text, text: ": "}
- {type: type, text: const bool&}
- {type: text, text: )}
```

## Description

Writes data to the log file. It is used for logs in JS code.

> Please note, that for the `.docbuilder` file the `CDocBuilder.WriteData` method is not used.

## Parameters

<parameters>

- sPath

  ```yml signature.variant="inline"
  - {type: type, text: const wchar_t*}
  ```

  - : The path to the file where all the logs will be written.

- sValue

  ```yml signature.variant="inline"
  - {type: type, text: const wchar_t*}
  ```

  - : The data which will be written to the log file.

- bAppend

  ```yml signature.variant="inline"
  - {type: type, text: const bool&}
  ```

  - : Specifies if the new data will be appended to the already existing log file or a new file will be created.

</parameters>

## Example

### C++

```cpp
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
oBuilder.WriteData("result.log", "Alert!", false);
CDocBuilder::Dispose();
```
