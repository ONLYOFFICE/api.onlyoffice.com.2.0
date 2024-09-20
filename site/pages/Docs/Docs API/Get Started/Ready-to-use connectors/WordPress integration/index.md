This [plugin](https://github.com/ONLYOFFICE/onlyoffice-wordpress) enables users to edit and view office documents from [WordPress](https://wordpress.org/) pages on site and admin panel using ONLYOFFICE Docs.

## Features

- Currently, the following document formats can be edited: DOCX, XLSX, PPTX.
- The following formats are available for viewing only: DOC, DOCM, DOT, DOTX, DOTM, ODT, FODT, OTT, RTF, TXT, HTML, HTM, MHT, XML, PDF, DJVU, FB2, EPUB, XPS, XLS, XLSM, XLT, XLTX, XLTM, ODS, FODS, OTS, CSV, PPS, PPSX, PPSM, PPT, PPTM, POT, POTX, POTM, ODP, FODP, OTP.
- The plugin allows multiple users to collaborate in real time and save back those changes to WordPress.

## Installing ONLYOFFICE Docs

You need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from WordPress and any end clients. If that is not the case, use the official [ONLYOFFICE Docs documentation page](https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx). ONLYOFFICE Docs must also be able to POST to WordPress directly.

The easiest way to install an instance of ONLYOFFICE Docs is to use [Docker](https://github.com/onlyoffice/Docker-DocumentServer).

## Installing WordPress ONLYOFFICE integration plugin

To start using ONLYOFFICE Docs with WordPress, follow these steps:

1. Download the zipped plugin.
2. Navigate to the **Plugins** section in your WordPress administrative dashboard.
3. Click **Add New** at the top of the page.
4. Click **Upload Plugin** at the top of the page.
5. Click **Choose File** and select the downloaded zipped plugin.
6. Once the plugin is installed, click **Activate**.

Alternatively, you can clone the master branch (and then activate the plugin from the WordPress administrative dashboard as well):

``` sh
cd wp-content/plugins
git clone https://github.com/ONLYOFFICE/onlyoffice-wordpress
```

## Configuring WordPress ONLYOFFICE integration plugin

Configure the plugin via the WordPress interface. Go to **WordPress administrative dashboard -> ONLYOFFICE -> Settings** and specify the following parameters:

- **Document Editing Service address**. The URL of the installed ONLYOFFICE Docs.
- **Document server JWT secret key**. Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity. Specify your own secret key in the WordPress administrative configuration. In the ONLYOFFICE Docs [config file](../../../Additional%20API/Signature/index.md), specify the same secret key and enable the validation.

## Using WordPress ONLYOFFICE integration plugin

ONLYOFFICE integration plugin allows WordPress administrators to open files for collaborative editing using ONLYOFFICE Docs (online document editors). In published posts, the editors are visible to all WordPress site visitors (both authorized and unauthorized) in the **Embedded** mode only.

### Editing files uploaded to WordPress

All uploaded files from the **Media** section will appear on the **ONLYOFFICE -> Files** page. The editor opens in the same tab by clicking on the file name. Users with administrator rights are able to co-edit documents. All the changes are saved in the same file.

### Creating a post

When creating a post, you can add the ONLYOFFICE element (block) and then upload a new file or select one from the **Media Library**. The added file will be displayed as the ONLYOFFICE logo with the file name in the currently edited post. After the post is published (when you press the **Publish** or **Update** button), your WordPress site visitors will have access to this file for viewing in the **Embedded** mode.

## How it works

The ONLYOFFICE integration follows the API documented [here](../../Basic%20concepts/index.md).

Download the WordPress ONLYOFFICE integration plugin [here](https://github.com/ONLYOFFICE/onlyoffice-wordpress).
