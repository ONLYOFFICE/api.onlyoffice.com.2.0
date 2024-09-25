This [plugin](https://github.com/ONLYOFFICE/onlyoffice-liferay) enables users to edit office documents from [Liferay](https://www.liferay.com/) using ONLYOFFICE Docs.

## Features

- Currently, the following document formats can be opened and edited with this plugin: DOCX, XLSX, PPTX, DOCXF, OFORM.
- The following formats are available for viewing only: ODT, ODS, ODP, DOC, XLS, PPT, PDF.
- The plugin will create a new **ONLYOFFICE Edit/View** menu option within the **Documents and Media** section for Office documents. This allows multiple users to collaborate in real time and to save back those changes to Liferay.

## Installing ONLYOFFICE Docs

You will need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from Liferay and any end clients. If that is not the case, use the official [ONLYOFFICE Docs documentation page](https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx). ONLYOFFICE Docs must also be able to POST to Liferay directly.

The easiest way to start an instance of ONLYOFFICE Docs is to use [Docker](https://github.com/onlyoffice/Docker-DocumentServer).

## Installing ONLYOFFICE Connector for Liferay

Either install it from [Liferay Marketplace](https://web.liferay.com/marketplace/-/mp/application/171169174) or if you are building the connector by yourself, simply put compiled **.jar** file from *build\libs* folder to */opt/liferay/deploy*. Liferay will install it automatically.

## Configuring ONLYOFFICE Connector for Liferay

In order to configure connector, you must navigate to **System Settings** (**Control Panel -> Configuration -> System Settings**). In **Platform** section click the **Connectors** category and select **ONLYOFFICE**.

Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity. Specify your own **Secret key** on the Liferay **System Settings** page. In the ONLYOFFICE Docs [config file](../../../Additional%20API/Signature/index.md), specify the same secret key and enable the validation.

## Compiling ONLYOFFICE Connector for Liferay

Simply run *gradle build*. Output **.jar** will be placed inside the *build/libs* directory.

## How it works

The ONLYOFFICE integration follows the API documented [here](../../Basic%20concepts/index.md).

1. User navigates to the **Documents and Media** section within Liferay and selects the **Edit in ONLYOFFICE** action.

2. Liferay prepares a JSON object for the ONLYOFFICE Docs with the following properties:

   - **url**: the URL that ONLYOFFICE Docs uses to download the document,
   - **callbackUrl**: the URL that ONLYOFFICE Docs informs about status of the document editing;
   - **key**: the *fileVersionId* to instruct ONLYOFFICE Docs whether to download the document again or not;
   - **title**: the document title (name).

3. The client browser makes a request to the JavaScript library from ONLYOFFICE Docs and sends ONLYOFFICE Docs the DocEditor configuration with the above properties.

4. Then ONLYOFFICE Docs downloads the document from Liferay and the user begins editing.

5. ONLYOFFICE Docs sends a POST request to *callbackUrl* to inform Liferay that a user is editing the document.

6. Liferay locks the document, but still allows other users with write access to collaborate in real time with ONLYOFFICE Docs by leaving the Action present.

7. When all users and client browsers are done with editing, they close the editing window.

8. After [10 seconds](../../How%20It%20Works/Saving%20file/index.md#save-delay) of inactivity, ONLYOFFICE Docs sends a POST to *callbackUrl* letting Liferay know that the clients have finished editing the document and closed it.

9. Liferay downloads a new version of the document, replacing the old one.

Download the ONLYOFFICE Connector for Liferay [here](https://github.com/ONLYOFFICE/onlyoffice-liferay).
