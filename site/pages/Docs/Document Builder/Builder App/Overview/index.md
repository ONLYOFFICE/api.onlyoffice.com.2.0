---
order: -4
---

**Builder.App** is the *docbuilder.exe* executable file which can be run from your application with the *.docbuilder* script file as a parameter to it.

If you are going to use **ONLYOFFICE Document Builder** with an application written in any programming language, run Document Builder executable from your application and use the **.docbuilder** script file for the document to be created as a parameter to it. It is much more flexible and allows to change the document script files (especially if there are more than one of them) independently of your application in future. You will only need to recompile your application if you need to add more document script files to it.

To launch **ONLYOFFICE Document Builder** executable file run the following command:

```sh
docbuilder.exe mydocument.docbuilder
```

Here **docbuilder** is the name of **ONLYOFFICE Document Builder** executive file. It must be used together with the path if the command is run from the folder different from the one where the executive is placed. The command will look like **docbuilder.exe** for Windows version and **documentbuilder** for Linux. The **mydocument.docbuilder** parameter is the name of the script file that will form the document contents (use it with the path if needed).

Visit the [.docbuilder](../Using%20.docbuilder%20file/index.md) file section for more information about the file structure and rules used when creating it.

See the examples in some of the most popular programming languages at [this page](../../Builder%20Server/Overview/index.md).

## Known issues

If you use **ONLYOFFICE Document Builder** as both an application and a script, then you need to know some rules and limitations:

1. To run ONLYOFFICE Document Builder executable in the C++ application, use the [CDocBuilder.Run](../../Builder%20Framework/C++/CDocBuilder/Run/index.md) method in the following way:

   ```cpp
   CDocBuilder::Initialize(sWorkDirectory.c_str());
   CDocBuilder oBuilder;
   oBuilder.Run("path-to-script.docbuilder");
   CDocBuilder::Dispose();
   ```

   Another way to do this is to use the **docbuilder.exe** executable file and run it with the **.docbuilder** file as an argument, where all the code for the document file creation will be written:

   ```sh
   docbuilder.exe "path-to-script.docbuilder"
   ```

2. To set an argument to the builder class which can be trasferred to the program outside the [CDocBuilder.ExecuteCommand](../../Builder%20Framework/C++/CDocBuilder/ExecuteCommand/index.md) method, add it as an additional property when running **ONLYOFFICE Document Builder** executable file or as a part of program JavaScript code, but not included into the document file script:

   ### Sets the --argument property to CDocBuilder.Run

   ```sh
   docbuilder.exe "--argument={\"company\":\"ONLYOFFICE\",\"product\":\"ONLYOFFICE Document Builder\"}" "path-to-script.docbuilder"
   ```

   ### Sets the --argument property using JavaScript code

   ``` ts
   const sCompany = Argument["company"]
   const sProduct = Argument["product"]
   ```

3. The **builder** object methods cannot be called with the JS variables. Wrap them with the *jsValue* instruction if necessary:

   ``` ts
   const jsVar = "123.docx"
   builder.SaveFile("docx", jsVar) // Incorrect
   builder.SaveFile("docx", jsValue(jsVar)) // Correct
   ```

4. For convenience, format types are replaced with strings.

   For example,

   ``` ts
   builder.CreateFile("docx")
   ```

   is the same as

   ``` ts
   CDocBuilder.CreateFile(OFFICESTUDIO_FILE_DOCUMENT_DOCX)
   ```

   And

   ``` ts
   builder.SaveFile("docx", file_path)
   ```

   is the same as

   ``` ts
   CDocBuilder.SaveFile(OFFICESTUDIO_FILE_DOCUMENT_DOCX, file_path)
   ```

   ## Format types

   | String | Format type                                       |
   | ------ | ------------------------------------------------- |
   | "docx" | OFFICESTUDIO\_FILE\_DOCUMENT\_DOCX                |
   | "doc"  | OFFICESTUDIO\_FILE\_DOCUMENT\_DOC                 |
   | "odt"  | OFFICESTUDIO\_FILE\_DOCUMENT\_ODT                 |
   | "rtf"  | OFFICESTUDIO\_FILE\_DOCUMENT\_RTF                 |
   | "txt"  | OFFICESTUDIO\_FILE\_DOCUMENT\_TXT                 |
   | "dotx" | OFFICESTUDIO\_FILE\_DOCUMENT\_DOTX                |
   | "ott"  | OFFICESTUDIO\_FILE\_DOCUMENT\_OTT                 |
   | "html" | OFFICESTUDIO\_FILE\_DOCUMENT\_HTML                |
   | "pdf"  | OFFICESTUDIO\_FILE\_DOCUMENT\_OFORM\_PDF          |
   | "pptx" | OFFICESTUDIO\_FILE\_PRESENTATION\_PPTX            |
   | "ppt"  | OFFICESTUDIO\_FILE\_PRESENTATION\_PPT             |
   | "odp"  | OFFICESTUDIO\_FILE\_PRESENTATION\_ODP             |
   | "ppsx" | OFFICESTUDIO\_FILE\_PRESENTATION\_PPSX            |
   | "potx" | OFFICESTUDIO\_FILE\_PRESENTATION\_POTX            |
   | "otp"  | OFFICESTUDIO\_FILE\_PRESENTATION\_OTP             |
   | "xlsx" | OFFICESTUDIO\_FILE\_SPREADSHEET\_XLSX             |
   | "xls"  | OFFICESTUDIO\_FILE\_SPREADSHEET\_XLS              |
   | "ods"  | OFFICESTUDIO\_FILE\_SPREADSHEET\_ODS              |
   | "csv"  | OFFICESTUDIO\_FILE\_SPREADSHEET\_CSV              |
   | "xltx" | OFFICESTUDIO\_FILE\_SPREADSHEET\_XLTX             |
   | "ots"  | OFFICESTUDIO\_FILE\_SPREADSHEET\_OTS              |
   | "pdf"  | OFFICESTUDIO\_FILE\_CROSSPLATFORM\_PDF            |
   | "djvu" | OFFICESTUDIO\_FILE\_CROSSPLATFORM\_DJVU           |
   | "xps"  | OFFICESTUDIO\_FILE\_CROSSPLATFORM\_XPS            |
   | "pdfa" | OFFICESTUDIO\_FILE\_CROSSPLATFORM\_PDFA           |
   | "jpg"  | OFFICESTUDIO\_FILE\_IMAGE\_JPG                    |
   | "png"  | OFFICESTUDIO\_FILE\_IMAGE\_PNG                    |
   | "bmp"  | OFFICESTUDIO\_FILE\_IMAGE\_BMP                    |

5. The entire JavaScript context is a wrapper for its native CDocBuilder **builderJS** object. You need to work with it as with an ordinary JavaScript object. In this case, the *jsValue* instruction is not needed for the JS variables:

   ``` ts
   builderJS.OpenFile("path_or_url", "x2t_additons_as_xml")
   builderJS.CreateFile(OFFICESTUDIO_FILE_DOCUMENT_DOCX)
   // or builderJS.CreateFile("docx")
   builderJS.SetTmpFolder("folder")
   builderJS.SaveFile(OFFICESTUDIO_FILE_DOCUMENT_DOCX, "path", "x2t_additons_as_xml")
   // or builderJS.SaveFile("docx", "path", "x2t_additons_as_xml")
   builderJS.CloseFile()
   ```

6. The Document Builder always works with one file. But there are cases when you need to be able to open another file not for adding its data to the content, but for some kind of manipulation (document comparison, mailmerge, etc). For such cases, the Document Builder provides the **OpenTmpFile** method:

   ``` ts
   const tmpFile = builderJS.OpenTmpFile("path_or_url")
   ```

   ## Methods

   | Name        | Description                                                                                                    |
   | ----------- | -------------------------------------------------------------------------------------------------------------- |
   | IsValid     | Specifies if the temporary file is valid (**true**).                                                           |
   | GetBinary   | Returns Uint8Array with the *doct/pptt/xlst* binary content.                                                   |
   | GetFolder   | Returns the string path to the temporary folder with the temporary file contents.                              |
   | Close       | Closes the file (removes the temporary folder contents).                                                       |
   | GetImageMap | Returns a dictionary object with the *imageId -> imagePath* key-value pairs (for inserting into the document). |

7. To make the code shorter, use the following type definitions:

   ```cpp
   typedef CDocBuilderValue CValue;
   typedef CDocBuilderContext CContext;
   typedef CDocBuilderContextScope CContextScope;
   ```
