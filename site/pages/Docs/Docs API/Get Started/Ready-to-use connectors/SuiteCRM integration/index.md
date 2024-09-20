This [plugin](https://github.com/ONLYOFFICE/onlyoffice-suitecrm) enables users to edit office documents from [SuiteCRM](https://suitecrm.com/) using ONLYOFFICE Docs.

## Features

- Currently, the following document formats can be edited: DOCX, XLSX, PPTX, DOCXF, OFORM.
- The following formats are available for viewing only: PDF, ODT, ODS, ODP, DOC, XLS, PPT, PPS, EPUB, RTF, HTML, HTM, TXT, CSV.
- The plugin allows users to edit text documents, spreadsheets, presentations, and create and fill out digital forms.
- The plugin will create a new **Open in ONLYOFFICE** menu option within the document library for office documents. This allows multiple users to collaborate in real time and save back those changes to SuiteCRM.

## Installing ONLYOFFICE Docs

You need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from SuiteCRM and any end clients. If that is not the case, use the official [ONLYOFFICE Docs documentation page](https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx). ONLYOFFICE Docs must also be able to POST to SuiteCRM directly.

The easiest way to install an instance of ONLYOFFICE Docs is to use [Docker](https://github.com/onlyoffice/Docker-DocumentServer).

## Installing SuiteCRM ONLYOFFICE integration plugin

The latest compiled package files of the ONLYOFFICE integration plugin are available [here](https://github.com/ONLYOFFICE/onlyoffice-suitecrm/releases).

To start using ONLYOFFICE Docs with SuiteCRM, follow these steps:

1. Launch your SuiteCRM, switch to **Admin -> Admin Tools -> Module Loader** and upload the ONLYOFFICE plugin archive.
2. Install the uploaded module by pressing the **Install** button.
3. Switch to **Admin -> Admin Tools -> Repair** and run **Quick Repair and Rebuild**.

## Configuring SuiteCRM ONLYOFFICE integration plugin

The plugin settings page is available after installation: **Admin -> ONLYOFFICE -> ONLYOFFICE Settings**.

- **Document Server address**. Enter the name of the server with ONLYOFFICE Docs installed:

  ``` sh
  http://documentserver/
  ```

  where **documentserver** is the name of the server with **ONLYOFFICE Docs** installed. The address must be accessible from the user browser and from the SuiteCRM server. The SuiteCRM server address must also be accessible from **ONLYOFFICE Docs** for correct work.

- **Document Server Secret**. Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity. Specify your own secret key on the SuiteCRM **ONLYOFFICE Settings** page. In the ONLYOFFICE Docs [config file](../../../Additional%20API/Signature/index.md), specify the same secret key and enable the validation.

## Using SuiteCRM ONLYOFFICE integration plugin

Once the plugin is installed and configured, you can edit and collaborate on office files in the **Documents** module:

1. Go to the **Documents** module.
2. Open the **Detail View** page by clicking the file name.
3. On the **Detail View** page, click **Open in ONLYOFFICE** in the drop-down **ACTIONS** menu - the file will open in a new tab.

## How it works

The ONLYOFFICE integration follows the API documented [here](../../Basic%20concepts/index.md).

Download the SuiteCRM ONLYOFFICE integration plugin [here](https://github.com/ONLYOFFICE/onlyoffice-suitecrm).
