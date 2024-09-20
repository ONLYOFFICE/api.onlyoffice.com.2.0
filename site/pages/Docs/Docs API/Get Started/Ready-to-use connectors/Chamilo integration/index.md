This [plugin](https://github.com/ONLYOFFICE/onlyoffice-chamilo) enables users to edit office documents within [Chamilo](https://chamilo.org/en/) using ONLYOFFICE Docs.

## Features

- Currently, the following document formats can be edited: DOCX, XLSX, PPTX, PPSX, DOCXF, OFORM.
- The following formats are available for viewing only: PDF, DJVU, TXT, CSV, ODT, ODS, ODP, DOC, XLS, PPT, PPS, EPUB, RTF, HTML, HTM, MHT, XPS.
- The plugin will create a new **Open with ONLYOFFICE** menu option within the document library for Office documents. This allows multiple users to collaborate in real time and to save back those changes to Chamilo.

## Installing ONLYOFFICE Docs

You need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from Chamilo and any end clients. If that is not the case, use the official [ONLYOFFICE Docs documentation page](https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx). ONLYOFFICE Docs must also be able to POST to Chamilo directly.

ONLYOFFICE Docs and Chamilo can be installed either on different computers, or on the same machine. If you use one machine, set up a custom port for Document Server as by default both ONLYOFFICE Docs and Chamilo work on port 80.

The easiest way to start an instance of ONLYOFFICE Docs is to use [Docker](https://github.com/onlyoffice/Docker-DocumentServer).

## Collecting Chamilo ONLYOFFICE integration plugin

1. Get the latest version of the [repository](https://github.com/ONLYOFFICE/onlyoffice-chamilo) running the command:

   ``` sh
   git clone https://github.com/ONLYOFFICE/onlyoffice-chamilo cd onlyoffice-chamilo
   ```

2. Get a submodule:

   ``` sh
   git submodule update --init --recursive
   ```

3. Collect all files:

   ``` sh
   mkdir /tmp/onlyoffice-deploy
   mkdir /tmp/onlyoffice-deploy/onlyoffice
   cp -r ./ /tmp/onlyoffice-deploy/onlyoffice
   cd /tmp/onlyoffice-deploy/onlyoffice
   rm -rf ./.git*
   rm -rf */.git*
   ```

4. Archive the files obtained in the previous step:

   ``` sh
   cd ../
   zip onlyoffice.zip -r onlyoffice
   ```

## Installing Chamilo ONLYOFFICE integration plugin

To start using ONLYOFFICE Docs with Chamilo, the following steps must be performed:

1. Go to Chamilo **Administration** and choose the **Plugins** section.

2. Select the ONLYOFFICE plugin and click the **Enable the selected plugins** button.

   If you want more up-to-date versions of the plugin, you need to replace the pre-installed default plugin folder with the newly collected plugin:

   ``` sh
   /var/www/html/chamilo-1.11.16/plugin/onlyoffice
   ```

   where **chamilo-1.11.16** is your current Chamilo version.

If your Chamilo version is lower than 1.11.16:

1. Go to Chamilo **Administration**, choose the **Plugins** section, and click the **Upload plugin** button.
2. Upload *onlyoffice.zip* from the **Releases** section. You'll see the plugin list.
3. Launch *composer install* from the Chamilo root folder.
4. Return to the plugin list, select the ONLYOFFICE plugin, and click the **Enable the selected plugins** button.

## Configuring Chamilo ONLYOFFICE integration plugin

On the **Plugins** page, find ONLYOFFICE and click **Configure**. You'll see the **Settings** page. Enable the plugin and specify ONLYOFFICE Docs address:

``` sh
https://<documentserver>/
```

where the **documentserver** is the name of the server with **ONLYOFFICE Docs** installed. The address must be accessible from the user browser and from the Chamilo server. The Chamilo server address must also be accessible from **ONLYOFFICE Docs** for correct work.

Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity. Specify your own **Secret key** on the Chamilo **Settings** page. In the ONLYOFFICE Docs [config file](../../../Additional%20API/Signature/index.md), specify the same secret key and enable the validation.

## How it works

The ONLYOFFICE integration follows the API documented [here](../../Basic%20concepts/index.md).

1. To create a new file, the teacher opens the necessary folder and clicks the **Create new** ONLYOFFICE icon.

2. The user is redirected to the file creation page where they need to enter the file name and format (text document, spreadsheet, or presentation). The browser calls the */plugin/onlyoffice/create.php* method. It adds a copy of an empty file to the course folder.

3. To open an existing file, the user chooses the **Open with ONLYOFFICE** icon.

4. The request is sent to */plugin/onlyoffice/editor.php?docId="document identificator"*. The server processes the request, generates the editor initialization configuration with the following properties:

   - **url** - the URL that ONLYOFFICE Docs uses to download the document;
   - **callbackUrl** - the URL that ONLYOFFICE Docs uses to inform about the status of document editing;
   - **documentServerUrl** - the URL that the client needs to respond to ONLYOFFICE Docs (can be set at the administrative settings page);
   - **key** - the etag to instruct ONLYOFFICE Docs whether to download the document again or not.

5. The server returns a page with a script to open the editor.

6. The browser opens this page and loads the editor.

7. The browser makes a request to ONLYOFFICE Docs and passes the document configuration to it.

8. ONLYOFFICE Docs loads the document and the user starts editing.

9. ONLYOFFICE Docs sends a POST request to *callbackUrl* to inform Chamilo that the user is editing the document.

10. When all the users have finished editing, they close the editor window.

11. After [10 seconds](../../How%20It%20Works/Saving%20file/index.md#save-delay), ONLYOFFICE Docs makes a POST request to *callbackUrl* with the information that editing has ended and sends a link to a new document version.

12. Chamilo loads a new version of the document and overwrites the file.

Download the Chamilo ONLYOFFICE integration plugin [here](https://github.com/ONLYOFFICE/onlyoffice-chamilo/tree/master).
