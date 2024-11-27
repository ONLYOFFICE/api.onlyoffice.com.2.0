```yml signature
- {type: type, text: void}
- {type: text, text: " "}
- {type: entity, text: SetProperty}
- {type: text, text: (}
- {type: parameter, text: sParam}
- {type: text, text: ": "}
- {type: type, text: const char*}
- {type: text, text: ", "}
- {type: parameter, text: sValue}
- {type: text, text: ": "}
- {type: type, text: const char*}
- {type: text, text: )}
```

## Description

Sets an argument in the UTF8 format to the builder class which can be trasferred to the program outside the [CDocBuilder.ExecuteCommand](../ExecuteCommand/index.md) method, i.e. either as an additional property when running ONLYOFFICE Document Builder executable file or as a part of program code, but not included into the document file script.

> Please note, that for the `.docbuilder` file the `CDocBuilder.SetProperty` method is not used explicitly. The argument itself is used instead as an additional property for the executable. See the example below.

## Parameters

<parameters>

- sParam

  ```yml signature.variant="inline"
  - {type: type, text: const char*}
  ```

  - : The parameter name in the UTF8 format, the value is always `--argument`.

- sValue

  ```yml signature.variant="inline"
  - {type: type, text: const char*}
  ```

  - : The parameter value in the UTF8 format which will be used in the document.

</parameters>

## Supported properties

<parameters>

- --use-doctrenderer-scheme, default: false

  ```yml signature.variant="inline"
  - {type: type, text: bool}
  ```

  - : Specifies if the doctrenderer mode is used when building a document or getting content from the editor when saving a file.

- --check-fonts, default: true

  ```yml signature.variant="inline"
  - {type: type, text: bool}
  ```

  - : Specifies if the system fonts are cached for faster work.

- --work-directory, default: ""

  ```yml signature.variant="inline"
  - {type: type, text: const wchar_t*}
  ```

  - : The path to the temporary directory.

- --cache-scripts, default: true

  ```yml signature.variant="inline"
  - {type: type, text: bool}
  ```

  - : Specifies if the sdkjs scripts are cached.

- --save-use-only-names, default: false

  ```yml signature.variant="inline"
  - {type: type, text: bool}
  ```

  - : Specifies if the destination paths are used (for server work). For example: `/home/user/1.txt` => `/tmp/1.txt`.

- --all-fonts-path, default: ""

  ```yml signature.variant="inline"
  - {type: type, text: const wchar_t*}
  ```

  - : The path to the `AllFonts.js` script.

- --argument, default: ""

  ```yml signature.variant="inline"
  - {type: type, text: const wchar_t*}
  ```

  - : The JSON argument which is sent to the global parameters of all the opened JS context.

- --fonts-system, default: true

  ```yml signature.variant="inline"
  - {type: type, text: bool}
  ```

  - : Specifies if the system fonts are used.

- --fonts-dir, default: ""

  ```yml signature.variant="inline"
  - {type: type, text: const wchar_t*}
  ```

  - : The path to the additional fonts directory (may be many records).

</parameters>

Once added, the argument will be available as the `Argument` variable with its parameter values set:

```cpp
Argument.name === "ONLYOFFICE" // true
```

## Example

### C++

```cpp
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
oBuilder.SetProperty("--argument", L"{\"name\":\"ONLYOFFICE\"}");
CDocBuilder::Dispose();
```

### .docbuilder

```sh
docbuilder.exe "--argument={\"name\":\"ONLYOFFICE\"}" test.docbuilder
```

## Adding or removing fonts

It is also possible to update the font list when you either add new fonts or remove old ones. To do this, the `check-fonts` variable is used:

## Example

### C++

```cpp
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
oBuilder.SetProperty("--check-fonts", L"true");
CDocBuilder::Dispose();
```

### .docbuilder

```sh
docbuilder.exe "--check-fonts=true" test.docbuilder
```
