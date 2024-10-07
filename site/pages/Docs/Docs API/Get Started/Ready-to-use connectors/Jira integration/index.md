This [app](https://github.com/ONLYOFFICE/onlyoffice-jira) enables users to edit office documents from [Jira Software](https://www.atlassian.com/software/jira) using ONLYOFFICE Docs.

The connector is available in the official [Atlassian Marketplace](https://marketplace.atlassian.com/apps/1226616/onlyoffice-connector-for-jira).

## Features

- Currently, the following document formats can be edited: DOCX, XLSX, PPTX, DOCXF, OFORM.
- The following formats are available for viewing only: DOC, DOCM, DOC, DOTX, DOTM, ODT, FODT, OTT, RTF, TXT, HTML, HTM, MHT, PDF, DJVU, FB2, EPUB, XPS, XLS, XLSM, XLTZ , XLTX, XLTM, ODS, FODS, OTS, CSV, PPS, PPSX, PPSM, PPT, PPTM, POT, POTX, POTM, ODP, FODP, OTP.
- The plugin will create a new **Edit in ONLYOFFICE** menu option within the document library for Office documents. This allows multiple users to collaborate in real time and to save back those changes to Jira.

## Installing ONLYOFFICE Docs

You will need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from Jira and any end clients. If that is not the case, use the official [ONLYOFFICE Docs documentation page](http://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx). ONLYOFFICE Docs must also be able to POST to Jira directly.

The easiest way to start an instance of ONLYOFFICE Docs is to use [Docker](https://github.com/onlyoffice/Docker-DocumentServer).

## Installing Jira ONLYOFFICE integration app

Upload the compiled *target/onlyoffice-jira-app.jar* to Jira on the **Manage apps** page.

The latest compiled package files are available [here](https://github.com/ONLYOFFICE/onlyoffice-jira/releases) and on [Atlassian Marketplace](https://marketplace.atlassian.com/apps/1226616/onlyoffice-connector-for-jira).

You can also install the app from the Jira administration panel:

1. Navigate to the **Manage apps** page.
2. Click **Find new apps** on the left-side panel.
3. Locate **ONLYOFFICE Connector for Jira** using search.
4. Click **Install** to download and install the app.

## Configuring Jira ONLYOFFICE integration app

Find the uploaded app on the **Manage apps** page. Click **Configure** and enter the name of the server with ONLYOFFICE Docs installed:

``` sh
http://documentserver/
```

where the **documentserver** is the name of the server with the **ONLYOFFICE Docs** installed. The address must be accessible for the user browser and from the Jira server. The Jira server address must also be accessible from **ONLYOFFICE Docs** for correct work.

Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity. Specify your own **Secret key** on the Jira administration page. In the ONLYOFFICE Docs [config file](../../../Additional%20API/Signature/index.md), specify the same secret key and enable the validation.

Sometimes your network configuration might not allow the requests between Jira and ONLYOFFICE Docs using the public addresses. The **Advanced server settings** section allows you to set the ONLYOFFICE Docs address for internal requests from Jira and the returning Jira address for internal requests from ONLYOFFICE Docs.

## Compiling Jira ONLYOFFICE integration app

If you plan to compile the Jira ONLYOFFICE integration app yourself (e.g. edit the source code and compile it afterwards), follow these steps:

1. The stable Java version is necessary for the successful build. If you do not have it installed, use the following commands to install **Open JDK 8**:

   ``` sh
   sudo apt-get update
   sudo apt-get install openjdk-8-jdk
   ```

2. Install **Atlassian Plugin SDK**. Installation process is described [here](https://developer.atlassian.com/server/framework/atlassian-sdk/set-up-the-atlassian-plugin-sdk-and-build-a-project/).

3. Compile package:

   ``` sh
   atlas-package
   ```

## Using Jira ONLYOFFICE integration app

With the ONLYOFFICE integration app, you can view, edit and co-author office files attached to tasks right within your Jira dashboard.

To edit documents, click the ONLYOFFICE Docs icon next to the name of an attachment - the corresponding online editor will be opened in a new tab.

After the editing session is over, a document with all the changes will be saved as a new attachment. You will recognize it by the same name with a postfix. If you're editing an attachment collaboratively, the changes are saved only after the last user quits the editor.

## How it works

The ONLYOFFICE integration follows the API documented [here](../../Basic%20concepts/index.md).

1. User navigates to the Jira attachments and selects the **Edit in ONLYOFFICE** action.

2. Jira makes a request to **OnlyOfficeEditorServlet** (URL of the form: */plugins/servlet/onlyoffice/doceditor?attachmentId=$attachment.id*).

3. Jira sends the document to ONLYOFFICE Document storage service and receives a temporary link.

4. Jira prepares a JSON object with the following properties:

   - **url**: the temporary link that ONLYOFFICE Docs uses to download the document;
   - **callbackUrl**: the URL that ONLYOFFICE Docs informs about status of the document editing;
   - **docserviceApiUrl**: the URL that the client needs to reply to ONLYOFFICE Docs (provided by the *files.docservice.url.api* property);
   - **key**: the UUID to instruct ONLYOFFICE Docs whether to download the document again or not;
   - **title**: the document title (name).

5. Jira takes this object and constructs a page from a freemarker template, filling in all of those values so that the client browser can load up the editor.

6. The client browser makes a request to the JavaScript library from ONLYOFFICE Docs and sends ONLYOFFICE Docs the DocEditor configuration with the above properties.

7. Then ONLYOFFICE Docs downloads the document from document storage and the user begins editing.

8. When all users and client browsers are done with editing, they close the editing window.

9. After [10 seconds](../../How%20It%20Works/Saving%20file/index.md#save-delay) of inactivity, ONLYOFFICE Docs sends a POST to *callbackUrl* letting Jira know that the clients have finished editing the document and closed it.

10. The document with all the changes is saved as a new attachment with the postfix added to the file name.

Download the Jira ONLYOFFICE integration app [here](https://github.com/ONLYOFFICE/onlyoffice-jira).
