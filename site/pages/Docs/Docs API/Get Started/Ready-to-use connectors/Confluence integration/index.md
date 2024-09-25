This [plugin](https://github.com/ONLYOFFICE/onlyoffice-confluence) enables users to edit office documents from [Confluence](https://www.atlassian.com/software/confluence/) using ONLYOFFICE Docs.

The connector is available in the official [Atlassian Marketplace](https://marketplace.atlassian.com/1218214).

## Features

- Currently, the following document formats can be edited or viewed: DOCX, XLSX, PPTX, DOCXF, OFORM.
- The plugin will create a new **Edit in ONLYOFFICE** menu option within the document library for Office documents. This allows multiple users to collaborate in real time and to save back those changes to Confluence.
- Currently, the following document formats can be converted into OOXML: ODT, DOC, ODP, PPT, ODS, XLS.

## Installing ONLYOFFICE Docs

You will need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from Confluence and any end clients. If that is not the case, use the official [ONLYOFFICE Docs documentation page](https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx). ONLYOFFICE Docs must also be able to POST to Confluence directly.

The easiest way to start an instance of ONLYOFFICE Docs is to use [Docker](https://github.com/ONLYOFFICE/Docker-DocumentServer).

## Installing Confluence ONLYOFFICE integration app

Upload the compiled *target/onlyoffice-confluence-plugin.jar* to Confluence on the **Manage add-ons** page.

The latest compiled package files are available [here](https://github.com/onlyoffice/onlyoffice-confluence/releases) and on [Atlassian Marketplace](https://marketplace.atlassian.com/apps/1218214/onlyoffice-connector-for-confluence?tab=overview\&hosting=datacenter).

You could also install the app from Confluence administration panel:

1. Log in to your Confluence instance as an administrator.
2. Navigate to the **Manage add-ons** page.
3. Click **Find new apps** or **Find new add-ons** on the left panel.
4. Locate **ONLYOFFICE Connector for Confluence** using search. Results will include the add-on versions compatible with your Confluence instance.
5. Click **Install** to download and install the app.
6. Now you can click **Close** in the **Installed and ready to go** dialog.

## Configuring Confluence ONLYOFFICE integration app

Find the uploaded **ONLYOFFICE Confluence connector** on the **Manage add-ons** page. Click **Configure** and enter the name of the server with ONLYOFFICE Docs installed:

``` sh
https://documentserver/
```

where the **documentserver** is the name of the server with **ONLYOFFICE Docs** installed. The address must be accessible from the user browser and from the Confluence server. The Confluence server address must also be accessible from **ONLYOFFICE Docs** for correct work.

Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity. Specify your own **Secret key** on the Confluence administration page. In the ONLYOFFICE Docs [config file](../../../Additional%20API/Signature/index.md), specify the same secret key and enable the validation.

## Compiling Confluence ONLYOFFICE integration app

If you plan to compile the Confluence ONLYOFFICE integration app yourself (e.g. edit the source code and compile it afterwards), follow these steps:

1. The stable Java version is necessary for the successful build. If you do not have it installed, use the following commands to install **Open JDK 8**:

   ``` sh
   sudo apt-get update
   sudo apt-get install openjdk-8-jdk
   ```

2. Install **Atlassian Plugin SDK**. Installation process is described [here](https://developer.atlassian.com/docs/getting-started/set-up-the-atlassian-plugin-sdk-and-build-a-project).

3. Get a submodule:

   ``` sh
   git submodule update --init --recursive
   ```

4. Compile package:

   ``` sh
   atlas-package
   ```

## How it works

The ONLYOFFICE integration follows the API documented [here](../../Basic%20concepts/index.md).

1. User navigates to the Confluence attachments and selects the **Edit in ONLYOFFICE** action.

2. Confluence makes a request to OnlyOfficeEditorServlet (URL of the form: */plugins/servlet/onlyoffice/doceditor?attachmentId=$attachment.id*).

3. Confluence sends a document to ONLYOFFICE Document storage service and receive a temporary link.

4. Confluence prepares a JSON object with the following properties:

   - **url** - the temporary link that ONLYOFFICE Docs uses to download the document;
   - **callbackUrl** - the URL that ONLYOFFICE Docs informs about status of the document editing;
   - **docserviceApiUrl** - the URL that the client needs to reply to ONLYOFFICE Docs (provided by the *files.docservice.url.api* property);
   - **key** - the UUID to instruct ONLYOFFICE Docs whether to download the document again or not;
   - **title** - the document title (name).

5. Confluence takes this object and constructs a page from a freemarker template, filling in all of those values so that the client browser can load up the editor.

6. The client browser makes a request to the JavaScript library from ONLYOFFICE Docs and sends ONLYOFFICE Docs the DocEditor configuration with the above properties.

7. Then ONLYOFFICE Docs downloads the document from Confluence and the user begins editing.

8. When all users and client browsers are done with editing, they close the editing window.

9. After [10 seconds](../../How%20It%20Works/Saving%20file/index.md#save-delay) of inactivity, ONLYOFFICE Docs sends a POST to *callbackUrl* letting Confluence know that the clients have finished editing the document and closed it.

10. Confluence downloads a new version of the document, replacing the old one.

Download the Confluence ONLYOFFICE integration app [here](https://github.com/ONLYOFFICE/onlyoffice-confluence).
