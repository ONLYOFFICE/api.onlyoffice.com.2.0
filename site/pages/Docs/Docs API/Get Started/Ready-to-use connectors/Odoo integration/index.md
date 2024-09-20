This [app](https://github.com/ONLYOFFICE/onlyoffice-odoo) enables users to edit and collaborate on office documents within [Odoo](https://www.odoo.com/) Documents using ONLYOFFICE Docs.

## Features

- Currently, the following document formats can be edited: DOCX, DOCXF, XLSX, PPTX.
- The following formats are available for viewing only: DJVU, DOC, DOCM, DOT, DOTM, DOTX, EPUB, FB2, FODT, HTML, MHT, ODT, OFORM, OTT, OXPS, PDF, RTF, TXT, XPS, XML, CSV, FODS, ODS, OTS, XLS, XLSB, XLSM, XLT, XLTM, XLTX, FODP, ODP, OTP, POT, POTM, POTX, PPS, PPSM, PPSX, PPT, PPTM.
- The app will create a new **Open in ONLYOFFICE** menu option within the document library for Office documents. This allows multiple users to collaborate in real time and to save back those changes to Odoo.

## Installing ONLYOFFICE Docs

You need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from Odoo and any end clients. If that is not the case, use the official [ONLYOFFICE Docs documentation page](https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx). ONLYOFFICE Docs must also be able to POST to Odoo directly.

The easiest way to start an instance of ONLYOFFICE Docs is to use [Docker](https://github.com/onlyoffice/Docker-DocumentServer).

## Installing Odoo ONLYOFFICE integration app

To start using ONLYOFFICE Docs with Odoo, the following steps must be performed:

**Option 1**. Installation from the administration panel

1. [Log into](https://www.odoo.com/web/login) your exisiting Odoo account or [sign up](https://www.odoo.com/web/signup) for a new account.
2. Go to the Odoo administration panel and click **Apps** on the top menu bar.
3. Search for ONLYOFFICE in the **Apps** catalog.
4. Click the **Install** button.

**Option 2**. Manual installation

1. Navigate to the [Odoo Apps catalog](https://apps.odoo.com/apps) and select the Odoo version you have installed.

2. Search for ONLYOFFICE and download it. You can also download the latest app version from the official [GitHub repository](https://github.com/ONLYOFFICE/onlyoffice-odoo/releases).

3. Put ONLYOFFICE connector into */path/to/odoo/addons*. Make sure the ONLYOFFICE folder is named as *onlyoffice_odoo*.

   Alternatively, you can add the following lines in the */path/to/odoo/config/odoo.conf* file specifying your path to the folder with *apps/addons*:

   ``` ini
   [options]
   addons_path = /mnt/extra-addons
   ```

4. Install the *pyjwt* package:

   ``` sh
   pip install pyjwt
   ```

5. Switch your Odoo to the developer mode and click **Apps -> Update Apps List** or just restart your Odoo instance.

## Configuring Odoo ONLYOFFICE integration app

To configure the app, go to **Settings**. Find **ONLYOFFICE** on the left sidebar and press it. Specify the URL of the installed ONLYOFFICE Docs:

``` sh
https://<documentserver>/
```

where the **documentserver** is the name of the server with **ONLYOFFICE Docs** installed. The address must be accessible from the user browser and from the Odoo server. The Odoo server address must also be accessible from **ONLYOFFICE Docs** for correct work.

Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity. Specify your own **Secret key** on the Odoo configuration page. In the ONLYOFFICE Docs [config file](../../../Additional%20API/Signature/index.md), specify the same secret key and enable the validation.

## How it works

The ONLYOFFICE integration follows the API documented [here](../../Basic%20concepts/index.md).

Download the Odoo ONLYOFFICE integration app [here](https://github.com/ONLYOFFICE/onlyoffice-odoo/tree/develop).
