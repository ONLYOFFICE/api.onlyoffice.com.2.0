---
order: -4
---

Starting from version 7.0, ONLYOFFICE Docs offers the possibility to create, edit and collaborate on online forms, fill them out, and save forms as PDF.

ONLYOFFICE forms are available in the PDF format which is intended for creating form templates from blank or any existing DOCX file and used for filling out the ready forms.

> Please note that starting from version 8.0, the OFORM format is deprecated. To fill out the ready forms, only the PDF format is used.
>
> Starting from version 8.1, the DOCXF format is deprecated. To create and edit forms, only the PDF format is used.

These instructions help you add an online form to your website, making it available for saving as PDF and filling in.

> Please note that these instructions will only work when JWT is disabled. Starting from version 7.2, JWT is enabled by default, so you need to disable it. More information about token can be found [here](../../../Additional%20API/Signature/index.md).

## Editing forms

### How to open PDF form for editing from website

To open an online form in the PDF format for editing from your website, follow the steps below:

1. Find and open the *index.html* file of your ONLYOFFICE Docs.

2. Connect it to the ONLYOFFICE Docs API by specifying the path to the API JavaScript file:

   ``` html
   <script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"></script>
   ```

3. Add the *button* element to open the PDF form:

   ``` html
   <button onclick="open_form_template()">Open Form Template</button>
   ```

4. Add the *div* element where the editor will be opened:

   ``` html
   <div id="placeholder"></div>
   ```

5. Add the script to close the editor in case it is open:

   ``` ts
   if (this.docEditor) {
     this.docEditor.destroyEditor()
   }
   ```

6. Create the full URL address to the PDF form you need to open:

   ``` ts
   const url = "https://example.com/url-to-example-form.pdf"
   ```

7. Create the key to identify the file for co-editing:

   ``` ts
   const key = `${filename}.pdf`
   ```

8. Add the script initializing the Document Editor with the configuration for the document you want to open and open the editor in the placeholder element:

   ``` ts
   this.docEditor = new DocsAPI.DocEditor("placeholder", {
     document: {
       fileType: "pdf",
       key,
       permissions: {
         edit: true,
       },
       title: "Form Template",
       url,
     },
     documentType: "pdf",
   })
   ```

The full code fragment looks like this:

``` html
<script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"></script>
<button onclick="open_form_template()">Open Form Template</button>
<div id="placeholder"></div>
<script>
    function open_form_template() {
        if (this.docEditor) {
            this.docEditor.destroyEditor()
        }
        const url = "https://example.com/url-to-example-form.pdf";
        const key = filename + ".pdf";
        this.docEditor = new DocsAPI.DocEditor("placeholder",
        {
            "document": {
                "fileType": "pdf",
                "key": key,
                "permissions": {
                    "edit": true
                },
                "title": "Form Template",
                "url": url
            },
            "documentType": "pdf"
        });
    }
</script>
```

Once done, the PDF form can be opened for editing. After editing this file, you can fill out the ready forms. To do so, click the **Start filling** button.

![Embed pdf form for editing](/assets/images/editor/embed-pdf-for-editing.png)

## Filling forms

### How to open PDF form for filling from website

To make an online form in the PDF format available for filling in, follow the steps below:

1. Find and open the *index.html* file of your ONLYOFFICE Docs.

2. Connect it to the ONLYOFFICE Docs API by specifying the path to the API JavaScript file:

   ``` html
   <script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"></script>
   ```

3. Add the *button* element to open the PDF form:

   ``` html
   <button onclick="open_form()">Open Form</button>
   ```

4. Add the *div* element where the editor will be opened:

   ``` html
   <div id="placeholder"></div>
   ```

5. Add the script to close the editor in case it is open:

   ``` ts
   if (this.docEditor) {
     this.docEditor.destroyEditor()
   }
   ```

6. Create the full URL address to the PDF form you need to open:

   ``` ts
   const url = "https://example.com/url-to-example-form.pdf"
   ```

7. Create the key to identify the file:

   ``` ts
   const key = `${filename}.pdf`
   ```

   > Please note that the *key* field is not passed to the configuration of the editors. This field will be automatically generated as a random number. This allows making all sessions of opening the form independent. So, collaboration on the PDF form is disabled. That's why anyone can open the form and fill it out without disturbing others.

8. Add the script initializing the Document Editor with the configuration for the document you want to open and open the editor in the placeholder element:

   ``` ts
   this.docEditor = new DocsAPI.DocEditor("placeholder",
     {
       document: {
         fileType: "pdf",
         permissions: {
           edit: false,
           fillForms: true,
         },
         title: "Form",
         url,
       },
       documentType: "pdf",
     })
   ```

The full code fragment looks like this:

``` html
<script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"></script>
<button onclick="open_form()">Open Form</button>
<div id="placeholder"></div>
<script>
    function open_form() {
        if (this.docEditor) {
            this.docEditor.destroyEditor()
        }
        const url = "https://example.com/url-to-example-form.pdf";
        const key = filename + ".pdf";
        this.docEditor = new DocsAPI.DocEditor("placeholder",
        {
            "document": {
                "fileType": "pdf",
                "permissions": {
                    "edit": false,
                    "fillForms": true
                },
                "title": "Form",
                "url": url
            },
            "documentType": "pdf"
        });
    }
</script>
```

Once done, the PDF form can be opened for filling. After filling in all the required fields, you can submit your data. To do so, click the **Complete & Submit** button.

![Embed pdf form](/assets/images/editor/embed-pdf.png)
