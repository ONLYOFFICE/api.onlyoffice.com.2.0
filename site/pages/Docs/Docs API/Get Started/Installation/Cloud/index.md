---
order: -2
---

To install ONLYOFFICE Docs in the cloud:

1. Deploy ONLYOFFICE Docs Developer solution in the cloud using our [instructions](https://helpcenter.onlyoffice.com/installation/docs-developer-index.aspx?from=api) from ONLYOFFICE Help Center.

2. In the target HTML file where the editors are to be embedded, specify a placeholder *div* tag, where all the information about the editor parameters will be passed:

   ```html
   <div id="placeholder"></div>
   <script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"></script>
   ```

   Where **documentserver** is the public IP address or public DNS provided by your cloud. It is automatically allocated by the system and can be found in the **Instances** section of the cloud console.

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

   Where **example.com** is the public IP address or public DNS provided by your cloud where **document manager** and **document storage service** are installed. See the [How it works](../../How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.

   From now the *docEditor* object can be used to call the **document editor** [Methods](../../../Usage%20API/Methods/index.md).

   The example above includes all the parameters necessary for ONLYOFFICE Docs correct startup.

4. Specify the additional non-obligatory parameters that can be changed to achieve different goals with your document (change access rights for the document, display different information about the document, etc.). See the [Advanced parameters](../../../Usage%20API/Advanced%20parameters/index.md) section to find out what these parameters are and how you can change them.

5. Add an encrypted signature to the requests in the form of [token](../../../Additional%20API/Signature/index.md) to prevent the substitution of important parameters. 

## Next steps

- [How to enable document forcesaving](../../How%20It%20Works/Saving%20file/index.md#force-saving)
- [How to customize the editor](../../../Usage%20API/Config/Editor/Customization/index.md)
- [How to manage the editor through Automation API](../../../Usage%20API/Automation%20API/index.md)
- [How to install / disable plugins](../../../Usage%20API/Config/Editor/Plugins/index.md)
