```yml signature
- {type: type, text: int}
- {type: text, text: " "}
- {type: entity, text: openFile}
- {type: text, text: (}
- {type: parameter, text: path}
- {type: text, text: ": "}
- {type: type, text: String}
- {type: text, text: ", "}
- {type: parameter, text: params}
- {type: text, text: ": "}
- {type: type, text: String}
- {type: text, text: )}
```

## Description

Opens the document file which will be edited and saved afterwards.

## Parameters

<parameters>

- path

  ```yml signature.variant="inline"
  - {type: type, text: String}
  ```

  - :

    The path to the file to be opened together with its name and extension

- params

  ```yml signature.variant="inline"
  - {type: type, text: String}
  ```

  - :

    The parameters needed for the correct file opening (most commonly, the encoding is used for the `txt` and `csv` file types or the delimiter for the `csv` files, for other file types this is just an empty string). The parameters are added in the form of XML tags, where `m_nCsvTxtEncoding` is used for the text encoding and `m_nCsvDelimiter` is used for the `csv` delimiter. You can find all the supported values for the encoding [in this file](https://github.com/ONLYOFFICE/server/blob/master/Common/sources/commondefines.js). The supported values for the `csv` delimiters include:
    
    - `0` - no delimiter;
    - `1` - tab;
    - `2` - semicolon;
    - `3` - colon;
    - `4` - comma;
    - `5` - space.

</parameters>

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
builder.openFile(L"text-document.csv", "<m_nCsvTxtEncoding>46</m_nCsvTxtEncoding><m_nCsvDelimiter>4</m_nCsvDelimiter>");
CDocBuilder.dispose();
```

### .docbuilder

``` ts
builder.OpenFile("text-document.csv", "<m_nCsvTxtEncoding>46</m_nCsvTxtEncoding><m_nCsvDelimiter>4</m_nCsvDelimiter>")
```
