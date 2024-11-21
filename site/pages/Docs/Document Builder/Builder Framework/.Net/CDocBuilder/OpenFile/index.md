```yml signature
- {type: type, text: int}
- {type: text, text: " "}
- {type: entity, text: OpenFile}
- {type: text, text: (}
- {type: parameter, text: sPath}
- {type: text, text: ": "}
- {type: type, text: String^}
- {type: text, text: ", "}
- {type: parameter, text: sParams}
- {type: text, text: ": "}
- {type: type, text: String^}
- {type: text, text: )}
```

## Description

Opens the document file which will be edited and saved afterwards.

## Parameters

<parameters>

- sPath

  ```yml signature.variant="inline"
  - {type: type, text: String^}
  ```

  - :

    The path to the file to be opened together with its name and extension.

- sParams

  ```yml signature.variant="inline"
  - {type: type, text: String^}
  ```

  - :

    The parameters needed for the correct file opening (most commonly, the encoding is used for the `txt` and `csv` file types or the delimiter for the `csv` files, for other file types this is just an empty string). The parameters are added in the form of XML tags, where `m_nCsvTxtEncoding` is used for the text encoding and `m_nCsvDelimiter` is used for the delimiter. You can find all the supported values for the encoding [in this file](https://github.com/ONLYOFFICE/server/blob/master/Common/sources/commondefines.js). The supported values for the `csv` delimiters include:
    
    - `0` - no delimiter;
    - `1` - tab;
    - `2` - semicolon;
    - `3` - colon;
    - `4` - comma;
    - `5` - space.

</parameters>

## Example

### .Net

``` cs
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
oBuilder.OpenFile(L"text-document.csv", "<m_nCsvTxtEncoding>46</m_nCsvTxtEncoding><m_nCsvDelimiter>4</m_nCsvDelimiter>");
CDocBuilder.Destroy();
```

### .docbuilder

``` ts
builder.OpenFile("text-document.csv", "<m_nCsvTxtEncoding>46</m_nCsvTxtEncoding><m_nCsvDelimiter>4</m_nCsvDelimiter>")
```
