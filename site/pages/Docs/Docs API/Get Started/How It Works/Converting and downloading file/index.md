---
order: -12
---

Document conversion service is a part of ONLYOFFICE Docs. It lets the user convert files from one format into another to open them later in **document editors** or for their export.

There are two main situations when document conversion is necessary.

## Interim conversion needed for document editing

For the **document editors** correct work with the document files it is recommended to convert them prior to editing into Office Open XML formats:

- *docx* for text documents,
- *xlsx* for spreadsheets,
- *pptx* for presentations.

The reference figure and the steps below explain the process of document conversion.

<img alt="Interim conversion needed for document editing" src="/assets/images/editor/conversion.jpg" width="720px">

1. The users selects a file on the computer hard disk drive that is to be uploaded to the **document manager**.
2. The **document manager** uploads the selected file to the **document storage service**.
3. The **document storage service** sends the uploaded file to ONLYOFFICE Docs **document conversion service** for conversion into the Office Open XML format using the [conversion API](../../../Additional%20API/Conversion%20API/index.md).
4. The **document conversion service** converts the selected file to the Office Open XML format.
5. The **document storage service** downloads the converted document file.

## Document export

When the user needs to download the file in some format different from the Office Open XML format, ONLYOFFICE Docs converts the document file saved at the **document storage service** into the appropriate format prior to its export.

The reference figure and the steps below explain the process of document export.

<img alt="Document export" src="/assets/images/editor/export.jpg" width="720px">

1. The user selects the file in the **document manager** and the format the file must be downloaded in.
2. The **document manager** transforms this user action into a request to the **document storage service**.
3. The **document storage service** sends the uploaded file to ONLYOFFICE Docs **document conversion service** for conversion into the appropriate format using the [conversion API](../../../Additional%20API/Conversion%20API/index.md).
4. The **document conversion service** converts the selected file to the appropriate format.
5. When the conversion is finished the **document storage service** downloads the converted file.
6. The **document storage service** notifies the **document manager** that the conversion is successfully performed.
7. The **document manager** downloads the converted file.
