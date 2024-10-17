`int openFile(String path, String params);`

Opens the document file which will be edited and saved afterwards.

## Parameters

| Name     | Type   | Attributes  | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| -------- | ------ | ----------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| *path*   | String |             | The path to the file to be opened together with its name and extension.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| *params* | String | \<optional> | The parameters needed for the correct file opening (most commonly, the encoding is used for the *txt* and *csv* file types or the delimiter for the *csv* files, for other file types this is just an empty string). The parameters are added in the form of XML tags, where **m\_nCsvTxtEncoding** is used for the text encoding and **m\_nCsvDelimiter** is used for the *csv* delimiter. You can find all the supported values for the encoding [in this file](https://github.com/ONLYOFFICE/server/blob/master/Common/sources/commondefines.js). The supported values for the *csv* delimiters include:<br/><br/>**0** - no delimiter;<br/><br/>**1** - tab;<br/><br/>**2** - semicolon;<br/><br/>**3** - colon;<br/><br/>**4** - comma;<br/><br/>**5** - space. |

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
