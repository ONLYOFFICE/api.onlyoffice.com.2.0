This [solution](https://github.com/ONLYOFFICE/onlyoffice-sharepoint) enables users to edit office documents from SharePoint using ONLYOFFICE Docs.

## Features

- Currently, the following document formats can be edited: DOCX, XLSX, PPTX.
- The following formats are available for viewing only: PDF, DJVU, TXT, CSV, ODT, ODS, ODP, DOC, XLS, PPT, PPS, EPUB, RTF, HTML, HTM, MHT, XPS.
- The plugin will create a new **Edit in ONLYOFFICE** menu option within the context menu of the file and the ribbon for Office documents. This allows multiple users to collaborate in real time and to save back those changes to SharePoint.

## Installing ONLYOFFICE Docs

You will need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from SharePoint and any end clients. If that is not the case, use the official [ONLYOFFICE Docs documentation page](https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx). ONLYOFFICE Docs must also be able to POST to SharePoint directly.

The easiest way to start an instance of ONLYOFFICE Docs is to use [Docker](https://github.com/ONLYOFFICE/Docker-DocumentServer).

## Installing ONLYOFFICE SharePoint integration solution

To start using ONLYOFFICE Docs with SharePoint, the following steps must be performed:

1. Click **Start**, point to **All Programs**, then choose **Administrative Tools**, and click **Services**. Make sure that **SharePoint Administration** service is started.

2. Click **Start -> SharePoint Management Shell**, go to the directory with the *.wsp* file.

3. Run the *Install.ps1* script:

   ``` sh
   PS> .\Install.ps1
   ```

4. Enter your SharePoint site address:

   ``` sh
   https://<yoursharepointsite>
   ```

   > Alternatively to steps **3** and **4** you can type the following command:
   >
   >   ``` ps1
   >   Add-SPSolution -LiteralPath<SolutionPath>/onlyoffice.wsp
   >   ```
   >   
   > On the **SharePoint Central Administration** home page, click **System Settings -> Farm Management -> Manage farm solutions**. On the **Solution Management** page, click **onlyoffice.wsp -> Deploy Solution**.

5. On the **SharePoint Central Administration** home page, under **Application Management**, click **Manage web applications**.

6. Make sure you select your site and click the **Authentication Providers** icon.

7. In the **Authentication Providers** pop-up window, click **Default zone**.

8. Under **Edit Authentication**, check **Enable anonymous access** and click **Save**.

9. Go back to **Web Application Management** and click the **Anonymous Policy** icon.

10. Under **Anonymous Access Restrictions**, select your **Zone**, set the **Permissions** to *None – No policy* and click **Save**.

## Configuring SharePoint ONLYOFFICE integration solution

In SharePoint, open the */\_layouts/15/Onlyoffice/Settings.aspx* page with administrative settings. Enter the following address to connect ONLYOFFICE Docs:

``` sh
https://<documentserver>/
```

where the **documentserver** is the name of the server with the **ONLYOFFICE Docs** installed. The address must be accessible for the user browser and from the SharePoint server. The SharePoint server address must also be accessible from **ONLYOFFICE Docs** for correct work.

> Please note, that if you have subsites set up with SharePoint, you will need to additionally configure ONLYOFFICE Docs connection with each of them, in order for it to work properly. Go to each subsite settings and enter the ONLYOFFICE Docs address to the proper field.

Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity. Specify your own **Secret key** in the SharePoint administrative settings. In the ONLYOFFICE Docs [config file](../../../Additional%20API/Signature/index.md), specify the same secret key and enable the validation.

If JWT protection is enabled, it is necessary to specify a custom header name since the SharePoint security policy blocks external **Authorization** headers. This header should be specified in the ONLYOFFICE Docs signature settings as well. Further information about signature can be found [here](../../../Additional%20API/Signature/index.md).

## Compiling ONLYOFFICE SharePoint integration solution

There are two ways to compile ONLYOFFICE SharePoint integration solution:

1. Using **MS Visual Studio**:

   1. Enter the SharePoint server and open this project in Visual Studio.
   2. In **Solution Explorer**, open the shortcut menu for the project and then choose **Publish**.
   3. In the **Publish** dialog box, choose the **Publish to File System** option button.
   4. Click the **Publish** button. When the publishing process is finished, the solution *.wsp* file will be created.
   5. Copy the resulting file to the folder with the *Install.ps1* file (**BuildAndInstall** folder by default).

2. With the help of the *build.bat* file provided:

   1. Go to the **BuildAndInstall** folder.
   2. Run the *build.bat* file.
   3. The resulting solution *.wsp* file will be created and placed to the **BuildAndInstall** folder.

## How it works

The ONLYOFFICE integration follows the API documented [here](../../Basic%20concepts/index.md).

1. User navigates to a document within SharePoint and selects the **Edit in ONLYOFFICE** action on context menu or ribbon.

2. SharePoint makes a request to the editor page (URL of the form: */\_layouts/15/Onlyoffice/editorPage.aspx?SPListItemId={ItemId}\&SPListURLDir={ListUrlDir}\&action=track*).

3. SharePoint prepares a JSON object with the following properties:

   - **url** - the URL that ONLYOFFICE Docs uses to download the document;
   - **callbackUrl** - the URL that ONLYOFFICE Docs informs about status of the document editing;
   - **DocumentSeverHost** - the URL that the client needs to reply to ONLYOFFICE Docs (can be set at the settings page);
   - **Key** - the file identifier from SharePoint;
   - **FileName** - the document title (name);
   - **CurrentUserId** - the user identifier;
   - **CurrentUserName** - the user name.

4. SharePoint constructs a page, filling in all of those values so that the client browser can load up the editor.

5. The client browser makes a request to the JavaScript library from ONLYOFFICE Docs and sends ONLYOFFICE Docs the DocEditor configuration with the above properties.

6. Then ONLYOFFICE Docs downloads the document from SharePoint and the user begins editing.

7. When all users and client browsers are done with editing, they close the editing window.

8. After [10 seconds](../../How%20It%20Works/Saving%20file/index.md#save-delay) of inactivity, ONLYOFFICE Docs sends a POST to *callbackUrl* letting SharePoint ONLYOFFICE solution know that the clients have finished editing the document and closed it.

9. SharePoint downloads a new version of the document, replacing the old one.

Download the ONLYOFFICE SharePoint integration solution [here](https://github.com/ONLYOFFICE/onlyoffice-sharepoint).
