---
order: -1
---

If you need to compare two documents, you can use **Document Builder**. The steps below will show you how to do it:

1. Create the *compare.docbuilder* script file with the following code:

   ``` ts
   builder.OpenFile("https://example.com/file1.docx")
   const file = builderJS.OpenTmpFile("https://example.com/file2.docx")
   AscCommonWord.CompareDocuments(Api, file, null)
   file.Close()
   builder.SaveFile("docx", "Result.docx")
   builder.CloseFile()
   ```

   where

   `https://example.com/file1.docx` - the path to the first file for comparing,

   `https://example.com/file2.docx` - the path to the second file for comparing.

2. Send the [POST request](../../../../Docs%20API/Additional%20API/Document%20Builder%20API/index.md) to **https\://documentserver/docbuilder** with the following body in the JSON format:

   ``` json
   {
     "async": false,
     "url": "https://example.com/compare.docbuilder"
   }
   ```

   where

   `https://example.com/compare.docbuilder` - the path to the *.docbuilder* script.

3. Once the document generation is ready, the response with the absolute URL to the output file of document comparing will be returned:

   ``` json
   {
     "key": "Khirz6zTPdfd7",
     "urls": {
       "Result.docx": "https://documentserver/Result.docx"
     },
     "end": true
   }
   ```

4. Download the document from the received link. Now you can check all the document differences and accept or reject them using the corresponding buttons on the top toolbar.

   ![Compare documents](/assets/images/docbuilder/compare-documents.png)
