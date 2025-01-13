```yml signature
- {type: type, text: void}
- {type: text, text: " "}
- {type: entity, text: setProperty}
- {type: text, text: (}
- {type: parameter, text: param}
- {type: text, text: ": "}
- {type: type, text: String}
- {type: text, text: ", "}
- {type: parameter, text: value}
- {type: text, text: ": "}
- {type: type, text: String}
- {type: text, text: )}
```

## Description

Sets an argument to the builder class which can be trasferred to the program outside the [CDocBuilder.executeCommand](../executeCommand/index.md) method, i.e. either as an additional property when running ONLYOFFICE Document Builder executable file or as a part of program code, but not included into the document file script.

> Please note, that for the `.docbuilder` file the `CDocBuilder.setProperty` method is not used explicitly. The argument itself is used instead as an additional property for the executable. See the example below.

## Parameters

<parameters>

- param

  ```yml signature.variant="inline"
  - {type: type, text: String}
  ```

  - : The parameter name, the value is always `--argument`.

- value

  ```yml signature.variant="inline"
  - {type: type, text: String}
  ```

  - : The parameter value which will be used in the document.

</parameters>

## Supported properties

<parameters>

- --use-doctrenderer-scheme, default: false

  ```yml signature.variant="inline"
  - {type: type, text: boolean}
  ```

  - : Specifies if the doctrenderer mode is used when building a document or getting content from the editor when saving a file.

- --check-fonts, default: true

  ```yml signature.variant="inline"
  - {type: type, text: boolean}
  ```

  - : Specifies if the system fonts are cached for faster work.

- --work-directory, default: ""

  ```yml signature.variant="inline"
  - {type: type, text: String}
  ```

  - : The path to the temporary directory.

- --cache-scripts, default: true

  ```yml signature.variant="inline"
  - {type: type, text: boolean}
  ```

  - : Specifies if the sdkjs scripts are cached.

- --save-use-only-names, default: false

  ```yml signature.variant="inline"
  - {type: type, text: boolean}
  ```

  - : Specifies if the destination paths are used (for server work). For example: `/home/user/1.txt` => `/tmp/1.txt`.

- --all-fonts-path, default: ""

  ```yml signature.variant="inline"
  - {type: type, text: String}
  ```

  - : The path to the `AllFonts.js` script.

- --argument, default: ""

  ```yml signature.variant="inline"
  - {type: type, text: String}
  ```

  - : The JSON argument which is sent to the global parameters of all the opened JS context.

- --fonts-system, default: true

  ```yml signature.variant="inline"
  - {type: type, text: boolean}
  ```

  - : Specifies if the system fonts are used.

- --fonts-dir, default: ""

  ```yml signature.variant="inline"
  - {type: type, text: String}
  ```

  - : The path to the additional fonts directory (may be many records).

</parameters>

Once added, the argument will be available as the `Argument` variable with its parameter values set:

``` java
Argument.name === "ONLYOFFICE" // true
```

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
builder.setProperty("--argument", L"{\"name\":\"ONLYOFFICE\"}");
CDocBuilder.dispose();
```

### .docbuilder

```sh
docbuilder.exe "--argument={\"name\":\"ONLYOFFICE\"}" test.docbuilder
```

## Adding or removing fonts

It is also possible to update the font list when you either add new fonts or remove old ones. To do this, the `check-fonts` variable is used.

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
builder.setProperty("--check-fonts", L"true");
CDocBuilder.dispose();
```

### .docbuilder

```sh
docbuilder.exe "--check-fonts=true" test.docbuilder
```
