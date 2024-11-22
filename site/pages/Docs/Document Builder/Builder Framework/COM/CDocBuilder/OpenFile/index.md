```yml signature
- {type: type, text: HRESULT}
- {type: text, text: " "}
- {type: entity, text: OpenFile}
- {type: text, text: (}
- {type: parameter, text: path}
- {type: text, text: ": [in] "}
- {type: type, text: BSTR}
- {type: text, text: ", "}
- {type: parameter, text: params}
- {type: text, text: ": [in] "}
- {type: type, text: BSTR}
- {type: text, text: ", "}
- {type: parameter, text: result}
- {type: text, text: ": [out, retval] "}
- {type: type, text: VARIANT_BOOL*}
- {type: text, text: )}
```

## Description

Opens the document file which will be edited and saved afterwards.

## Parameters

<parameters>

- path

  ```yml signature.variant="inline"
  - {type: type, text: BSTR}
  ```

  - :

    The path to the file to be opened together with its name and extension.

- params

  ```yml signature.variant="inline"
  - {type: type, text: BSTR}
  ```

  - :

    The parameters needed for the correct file opening (most commonly, the encoding is used for the `txt` and `csv` file types or the delimiter for the `csv` files, for other file types this is just an empty string). The parameters are added in the form of XML tags, where `m_nCsvTxtEncoding` is used for the text encoding and `m_nCsvDelimiter` is used for the delimiter. You can find all the supported values for the encoding [in this file](https://github.com/ONLYOFFICE/server/blob/master/Common/sources/commondefines.js). The supported values for the `csv` delimiters include:
    
    - `0` - no delimiter;
    - `1` - tab;
    - `2` - semicolon;
    - `3` - colon;
    - `4` - comma;
    - `5` - space.

- result

  ```yml signature.variant="inline"
  - {type: type, text: VARIANT_BOOL*}
  ```

  - :

    Specifies if the operation of opening a file is successful or not.

</parameters>

## Example

### COM

```cpp
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
VARIANT_BOOL b;
oBuilder->Initialize();
oBuilder->OpenFile("text-document.csv", "<m_nCsvTxtEncoding>46</m_nCsvTxtEncoding><m_nCsvDelimiter>4</m_nCsvDelimiter>", &b);
oBuilder->Dispose();
```

### .docbuilder

```ts
builder.OpenFile("text-document.csv", "<m_nCsvTxtEncoding>46</m_nCsvTxtEncoding><m_nCsvDelimiter>4</m_nCsvDelimiter>")
```
