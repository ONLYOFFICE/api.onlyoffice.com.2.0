The ONLYOFFICE [module](https://github.com/ONLYOFFICE/onlyoffice-drupal) enables users to edit files in the Media module from [Drupal](https://www.drupal.org/) using ONLYOFFICE Docs.

## Features

- Currently, the following document formats can be edited: DOCX, XLSX, PPTX.
- The following formats are available for viewing: DJVU, DOC, DOCM, DOCX, DOT, DOTM, DOTX, EPUB, FB2, FODT, HTML, MHT, ODT, OTT, OXPS, PDF, PPTX, RTF, TXT, XPS, XML, CSV, FODS, ODS, OTS, XLS, XLSM, XLSX, XLT, XLTM, XLTX, FODP, ODP, OTP, POT, POTM, POTX, PPS, PPSM, PPSX, PPT, PPTM.
- The module also allows to preview files on public pages.
- The module will create a new **Edit in ONLYOFFICE** menu option within the document library for office documents. This allows multiple users to collaborate in real time and save back those changes to Drupal.

## Installing ONLYOFFICE Docs

You need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from Drupal and any end clients. If that is not the case, use the official [ONLYOFFICE Docs documentation page](https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx). ONLYOFFICE Docs must also be able to POST to Drupal directly.

The easiest way to install an instance of ONLYOFFICE Docs is to use [Docker](https://github.com/onlyoffice/Docker-DocumentServer).

## Installing Drupal ONLYOFFICE connector module

To start using ONLYOFFICE Docs with Drupal, follow these steps:

### Step 1: Add the module

There are two options to add the Drupal module.

**Option 1**. Add a module using [Drupal's User Interface](https://www.drupal.org/docs/extending-drupal/installing-modules#s-add-a-module-using-drupals-user-interface-easy).

1. On the **Admin** toolbar project page on [drupal.org](https://www.drupal.org/download), scroll to the **Downloads** section at the bottom of the page.
2. Copy the address of the *tar.gz* link. Depending on your device and browser, you might do this by right clicking and selecting **Copy link address**.
3. In the **Manage** administrative menu, navigate to **Extend** (admin/modules). The **Extend** page appears.
4. Click **Install new module**. The **Install new module** page appears.
5. In the field **Install from a URL**, paste the copied download link.
6. Click **Install** to upload and unpack the new module on the server. The files are being downloaded to the modules directory.

**Option 2**. Add a module with [Composer](https://www.drupal.org/docs/extending-drupal/installing-modules#s-add-a-module-with-composer).

Enter the following command at the root of your site:

``` sh
composer require onlyoffice/onlyoffice-drupal
```

### Step 2: Enable the module

There are two options to enable the Drupal module.

**Option 1**. Using [Drupal's User Interface](https://www.drupal.org/docs/extending-drupal/installing-modules#s-add-a-module-using-drupals-user-interface-easy).

1. Navigate to the **Extend** page (admin/modules) via the **Manage** administrative menu.
2. Locate the ONLYOFFICE Connector module and check the box.
3. Click **Install** to enable.

**Option 2**. Using the command line.

1. Run the following **Drush** command, giving the project name as a parameter:

   ``` sh
   drush pm:enable onlyoffice
   ```

2. Follow the instructions on the screen.

## Configuring Drupal ONLYOFFICE connector module

In Drupal, open *\~/config/system/onlyoffice-settings* page with administrative settings for **ONLYOFFICE** section. Enter the address to connect ONLYOFFICE Docs:

``` sh
https://<documentserver>/
```

where **documentserver** is the name of the server with the ONLYOFFICE Docs installed. The address must be accessible for the user browser and from the Drupal server. The Drupal server address must also be accessible from ONLYOFFICE Docs for correct work.

Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity. Specify your own **Secret key** in the Drupal administrative configuration. In the ONLYOFFICE Docs [config file](../../../Additional%20API/Signature/index.md), specify the same secret key and enable the validation.

## Using Drupal ONLYOFFICE connector module

### Edit files already uploaded to Drupal

All office files added to Media can be opened for editing. In the last table column, call the drop-down list and select the **Edit in ONLYOFFICE** action. The editor opens in the same tab. Users with Administrator rights are able to co-edit files using ONLYOFFICE Docs. All changes are saved in the same file.

### Create new posts

When creating a post, you can add the new ONLYOFFICE element:

1. Go to **Structure -> Content types -> Manage fields**. On the opened page, click **Add field**. Add a new field: **File** or **Media**. Set the label and save.
2. For the added **File** field, specify the file extensions. Go to **Structure -> Content types -> Manage fields**. In the **Allowed file extensions** field, specify the file formats that will be shown in the editors (docx, xlsx, pptx).
3. For the added **Media** field, click the **Document** checkbox.
4. Go to **Structure -> Media types -> Document -> Manage display**.
5. For the **Document** field, specify the *ONLYOFFICE Preview* format. By clicking on the gear symbol, you can specify the dimensions of the embedded editor window.

When you are done with the pre-settings, you can create posts on the **Content** tab. Click on the **Add Content** button and select the created content.

Specify title and select a file (if the content contains **File** fields).

For **Media** section, specify the name of the previously uploaded file.

Your site visitors will also be able to view the created page (**People -> Permissions -> View published content**).

## How it works

The ONLYOFFICE integration follows the API documented [here](../../Basic%20concepts/index.md).

Download the Drupal ONLYOFFICE connector module [here](https://github.com/ONLYOFFICE/onlyoffice-drupal).
