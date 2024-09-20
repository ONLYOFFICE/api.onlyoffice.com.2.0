This [plugin](https://github.com/ONLYOFFICE/moodle-mod_onlyofficeeditor) enables users to edit office documents from [Moodle](https://moodle.org/) using ONLYOFFICE Docs.

## Features

- Currently, the following document formats can be edited: DOCX, XLSX, PPTX, TXT, CSV.
- The following formats are available for viewing only: PDF.
- Currently, the following document formats can be converted into OOXML: ODT, ODS, ODP, DOC, XLS, PPT, PPS, EPUB, RTF, HTML, HTM.
- The plugin will create a new **ONLYOFFICE document** activity as one of the edit modes for the necessary course page. This allows multiple users to collaborate in real time and to save back those changes to Moodle.

## Installing ONLYOFFICE Docs

You need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from Moodle and any end clients. If that is not the case, use the official [ONLYOFFICE Docs documentation page](https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx). ONLYOFFICE Docs must also be able to POST to Moodle directly.

The easiest way to install an instance of ONLYOFFICE Docs is to use [Docker](https://github.com/onlyoffice/Docker-DocumentServer).

## Installing Moodle ONLYOFFICE integration plugin

This plugin is an **activity module**.

Follow the usual Moodle plugin installation steps to install this plugin into your *mod/onlyoffice* directory. Please see [Moodle Documentation](https://docs.moodle.org/311/en/Installing_plugins) for more information.

The latest compiled package files are available [here](https://github.com/ONLYOFFICE/moodle-mod_onlyofficeeditor/releases).

## Configuring Moodle ONLYOFFICE integration plugin

Once the plugin is installed, the plugin settings page will be opened. Alternatively, you can find the uploaded app on the **Plugins overview** page and click **Settings**.

- Enter the name of the server with ONLYOFFICE Docs installed in the **Document Editing Service address** field:

  ``` sh
  http://documentserver/
  ```

  where **documentserver** is the name of the server with **ONLYOFFICE Docs** installed. The address must be accessible from the user browser and from the Moodle server. The Moodle server address must also be accessible from **ONLYOFFICE Docs** for correct work.

- Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity. Specify your own **Document Server Secret** on the Moodle **Settings** page. In the ONLYOFFICE Docs [config file](../../../Additional%20API/Signature/index.md), specify the same secret key and enable the validation.

## Using Moodle ONLYOFFICE integration plugin

Once the plugin is installed and configured, you can add instances of ONLYOFFICE activity to your course pages as per usual Moodle practice:

1. Open the necessary course page.
2. Activate the **Edit Mode** using the switcher at the top right corner.
3. Click **Add an activity or resource**.
4. Select the **ONLYOFFICE document** activity in the pop-up window.
5. Type in the activity name, upload or drag-and-drop the necessary document from your PC and click the **Save and display** button.

Admins/Teachers can choose whether or not documents can be downloaded or printed from inside the ONLYOFFICE editor. This can be done in the **Document permissions** section.

Clicking the activity name/link in the course page opens the *ONLYOFFICE editor* in the user's browser, ready for collaborative editing.

## How it works

The ONLYOFFICE integration follows the API documented [here](../../Basic%20concepts/index.md).

Download the Moodle ONLYOFFICE integration plugin [here](https://github.com/ONLYOFFICE/moodle-mod_onlyofficeeditor).
