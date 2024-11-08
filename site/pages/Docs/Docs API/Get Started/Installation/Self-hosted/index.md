---
order: -1
---

ONLYOFFICE Docs is available for Windows, Linux and Docker.

To install it on your local server:

1. [Download](https://www.onlyoffice.com/download-docs.aspx?from=api#docs-developer) ONLYOFFICE Docs Developer solution and install it on your local server following the instructions in ONLYOFFICE Help Center:

   - [Install ONLYOFFICE Docs for Windows](https://helpcenter.onlyoffice.com/installation/docs-developer-install-windows.aspx?from=api)
   - [Install ONLYOFFICE Docs for Linux](https://helpcenter.onlyoffice.com/installation/docs-developer-install-ubuntu.aspx?from=api)
   - [Install ONLYOFFICE Docs for Docker](https://helpcenter.onlyoffice.com/installation/docs-developer-install-docker.aspx?from=api)

2. In the target HTML file where the editors are to be embedded, specify a placeholder *div* tag, where all the information about the editor parameters will be passed:

   ```html
   <div id="placeholder"></div>
   <script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"></script>
   ```

   Where **documentserver** is the name of the server with the ONLYOFFICE Docs installed. In this case, this is an address of you local server (`http://localhost`).

   `https://documentserver/web-apps/apps/api/documents/api.js` is the address where the API JavaScript file can normally be found.

   Starting from version 8.1, it is recommended to add the [shardkey](../../How%20It%20Works/index.md#shard-key) parameter to the URL *QueryString* with the *key* value in it. For example, *?shardkey=Khirz6zTPdfd7*. This allows you to load balance requests.

3. Specify the page code containing the changeable parameters:

   ``` ts
   const docEditor = new DocsAPI.DocEditor("placeholder", config)
   ```

   Where config is an object:

   ``` ts
   const config = {
     document: {
       fileType: "docx",
       key: "Khirz6zTPdfd7",
       title: "Example Document Title.docx",
       url: "https://example.com/url-to-example-document.docx",
     },
     documentType: "word",
     editorConfig: {
       callbackUrl: "https://example.com/url-to-callback.ashx",
     },
   }
   ```

   Where **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

   From now the *docEditor* object can be used to call the **document editor** [Methods](../../../Usage%20API/Methods/index.md).

   The example above includes all the parameters necessary for ONLYOFFICE Docs correct startup.

4. Specify the additional non-obligatory parameters that can be changed to achieve different goals with your document (change access rights for the document, display different information about the document, etc.). See the [Advanced parameters](../../../Usage%20API/Advanced%20parameters/index.md) section to find out what these parameters are and how you can change them.

5. Add an encrypted signature to the requests in the form of [token](../../../Additional%20API/Signature/index.md) to prevent the substitution of important parameters. 

## Before you start

Before working with ONLYOFFICE Docs API documentation, it is recommended to make the following settings if necessary:

- open additional [ports](https://helpcenter.onlyoffice.com/installation/docs-developer-open-ports.aspx?from=api);
- configure [ONLYOFFICE Docs server settings](https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx?from=api) in ONLYOFFICE Docs configuration file;
- switch ONLYOFFICE Docs to the HTTPS protocol for secure connection using [SSL Certificates](https://helpcenter.onlyoffice.com/installation/docs-community-https-linux.aspx?from=api);
- add additional [fonts](https://helpcenter.onlyoffice.com/installation/docs-community-install-fonts-linux.aspx?from=api) to ONLYOFFICE Docs to enhance the work with the editors;
- add your own [color themes](https://helpcenter.onlyoffice.com/installation/docs-developer-change-theme.aspx?from=api) for the application interface.

## Health check

To check if the editors are available, send the GET request to */healthcheck*. This request checks the availability of the databases, message broker, Redis connection, and storage.

The response must be **true**, which means that the editors are ready to use.

If something went wrong, make sure that you have followed the installation instructions above.

## Next steps

- [How to enable document forcesaving](../../How%20It%20Works/Saving%20file/index.md#force-saving)
- [How to customize the editor](../../../Usage%20API/Config/Editor/Customization/index.md)
- [How to manage the editor through Automation API](../../../Usage%20API/Automation%20API/index.md)
- [How to install / disable plugins](../../../Usage%20API/Config/Editor/Plugins/index.md)
