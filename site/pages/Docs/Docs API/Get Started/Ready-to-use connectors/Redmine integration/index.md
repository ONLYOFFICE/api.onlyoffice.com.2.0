This [plugin](https://github.com/ONLYOFFICE/onlyoffice-redmine) enables users to edit attachments from [Redmine](https://www.redmine.org/) using ONLYOFFICE Docs.

The plugin is available in the official [Redmine Plugins Directory](https://www.redmine.org/plugins/onlyoffice_redmine).

## Features

- Viewing and editing text documents, spreadsheets, presentations, and forms.
- Co-editing documents in real time using two co-editing modes (Fast and Strict), Track Changes, comments, built-in chat.
- Settings page to set up connection to the server and JWT authentication, customize the editor's appearance.
- Mobile view for licensed editors.
- Creating new attachments using templates that consider the user's language preference.
- Converting attachments and saving or downloading them.

## Supported formats

|        | djvu  |  doc  | docm  | docx  | docxf |  dot  | dotm  | dotx  | epub* | fb2*  | fodt  |  htm  | html* |  mht  | mhtml | odt*  | oform | ott*  | oxps  |  pdf  | rtf*  |  stw  |  sxw  | txt*  |  wps  |  wpt  |  xml  |  xps  | csv*  |  et   |  ett  | fods  | ods*  | ots*  |  sxc  |  xls  | xlsb  | xlsm  | xlsx  |  xlt  | xltm  | xltx  |  dps  |  dpt  | fodp  | odp*  | otp*  |  pot  | potm  | potx  |  pps  | ppsm  | ppsx  |  ppt  | pptm  | pptx  |  sxi  |
| :----- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| View   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |   +   |
| Edit   |   -   |   -   |   +   |   +   |   +   |   -   |   +   |   +   |   +   |   +   |   -   |   -   |   +   |   -   |   -   |   +   |   -   |   +   |   -   |   +   |   +   |   -   |   -   |   +   |   -   |   -   |   -   |   -   |   +   |   -   |   -   |   -   |   +   |   +   |   -   |   -   |   -   |   +   |   +   |   -   |   +   |   +   |   -   |   -   |   -   |   +   |   +   |   -   |   +   |   +   |   -   |   +   |   +   |   -   |   +   |   +   |   -   |
| Create |   -   |   -   |   -   |   +   |   +   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   +   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   -   |   +   |   -   |

\* *- to be able to open the format for editing, check it in the [formats settings](#formats). Due to some format restrictions, data loss may occur.*

## Installing ONLYOFFICE Docs

Before you proceed to the plugin installation, make sure you have an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from Redmine and any end clients. Additionally, ensure that ONLYOFFICE Docs can directly POST to Redmine.

We recommend using [Docker](https://github.com/onlyoffice/Docker-DocumentServer) to install ONLYOFFICE Docs. Alternatively, you can follow [these instructions](https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx) for Debian, Ubuntu, or derivatives.

## Installing Redmine ONLYOFFICE integration plugin

To install the plugin, you will need Redmine version 4.2 or higher, or version 5.0 or higher. It is also important to note that the plugin is compatible with Ruby version 2.7.2 or higher, or 3.0.0 or higher. We recommend using Redmine 5 along with Ruby 3.

1. If you are new to Redmine, install it by following [these instructions](https://www.redmine.org/projects/redmine/wiki/RedmineInstall).

2. Download the [plugin](https://github.com/ONLYOFFICE/onlyoffice-redmine/releases):

   ``` sh
   curl --location https://github.com/ONLYOFFICE/onlyoffice-redmine/releases/latest/download/onlyoffice_redmine.tar.zst --output onlyoffice_redmine.tar.zst
   ```

3. Unzip it into the plugins directory:

   ``` sh
   tar --extract --file onlyoffice_redmine.tar.zst --directory plugins
   ```

4. Install the dependencies of the plugin if Redmine did not do it automatically:

   ``` sh
   bundle install
   ```

5. Perform the migration:

   ``` sh
   RAILS_ENV=production bundle exec rake redmine:plugins:migrate NAME=onlyoffice_redmine
   ```

6. Restart Redmine.

Read more about the plugin installation on the Redmine [Wiki page](https://www.redmine.org/projects/redmine/wiki/Plugins#Installing-a-plugin).

## Configuring Redmine ONLYOFFICE integration plugin

Configure the plugin via the Redmine interface. Go to **Administration -> Plugins**, find the ONLYOFFICE integration plugin for Redmine and click **Configure**:

![Redmine settings](/assets/images/editor/redmine-settings.png)

### General Settings

- **Document Editing Service address**. The URL of the installed ONLYOFFICE Docs (Document Server). Leave blank to disable the plugin.

### Advanced Server Settings

- ONLYOFFICE Docs address for internal requests from the server.
- Server address for internal requests from ONLYOFFICE Docs.
- Connect to the demo ONLYOFFICE Docs server.

### Security

- **Secret key**. Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity. Specify your secret key in the ONLYOFFICE Docs [config file](../../../Additional%20API/Signature/index.md), then specify the same key in the settings page of the plugin. Leave blank to disable authentication.
- Authorization header.
- Disable certificate verification (insecure).

### Editor customization settings

- Display Chat menu button.
- Display the header more compact.
- Display Feedback & Support menu button.
- Display Help menu button.
- Display monochrome toolbar header.

### Formats

- Specify the list of formats allowed to be opened directly for editing.

## How it works

The plugin uses the [ONLYOFFICE Docs API](../../Basic%20concepts/index.md) and is integrated into various Redmine pages, including [Documents](#documents), [Attachments](#attachment), [Files](#files), [Issue](#issues), [News](#news), [Wiki](#wiki), and [Forums](#forums). Additionally, the plugin adds general pages such as ["Create in ONLYOFFICE"](#create-in-onlyoffice) and ["Convert with ONLYOFFICE"](#convert-with-onlyoffice).

### Documents

![Documents page](/assets/images/editor/documents-page.png)

On the **Documents** page, users can open the attachment to view, edit, create, or convert it. The options displayed in the interface may vary depending on the user permissions.

| Option            | Permissions                    |
| ----------------- | ------------------------------ |
| View              | View documents                 |
| Edit              | View documents, Edit documents |
| Create            | View documents, Edit documents |
| Convert: Save     | View documents, Edit documents |
| Convert: Download | View documents                 |

### Attachment

![Attachment page](/assets/images/editor/attachment-page.png)

On the **Attachment** page, users can open the attachment to view, edit, or convert it. The options displayed in the interface may vary depending on the user's permissions for the module where the attachment is located.

### Files

![Files page](/assets/images/editor/files-page.png)

On the **Files** page, users can open the attachment to view, edit, or convert it. The options displayed in the interface may vary depending on the user's permissions.

| Option            | Permissions              |
| ----------------- | ------------------------ |
| View              | View files               |
| Edit              | View files, Manage files |
| Convert: Save     | View files, Manage files |
| Convert: Download | View files               |

### Issues

![Issues page](/assets/images/editor/issues-page.png)

On the **Issues** page, users can open the attachment to view, edit, or convert it. The options displayed in the interface may vary depending on the user's permissions.

| Option            | Permissions                  |
| ----------------- | ---------------------------- |
| View              | View issues                  |
| Edit              | View issues, Edit own issues |
| Convert: Save     | View issues, Edit own issues |
| Convert: Download | View issues                  |

### News

![News page](/assets/images/editor/news-page.png)

On the **News** page, users can open the attachment to view, edit, or convert it. The options displayed in the interface may vary depending on the user's permissions.

| Option            | Permissions            |
| ----------------- | ---------------------- |
| View              | View news              |
| Edit              | View news, Manage news |
| Convert: Save     | View news, Manage news |
| Convert: Download | View news              |

### Wiki

![Wiki page](/assets/images/editor/wiki-page.png)

On the **Wiki** page, users can open the attachment to view, edit, or convert it. The options displayed in the interface may vary depending on the user's permissions.

| Option            | Permissions                |
| ----------------- | -------------------------- |
| View              | View wiki                  |
| Edit              | View wiki, Edit wiki pages |
| Convert: Save     | View wiki, Edit wiki pages |
| Convert: Download | View wiki                  |

### Forums

![Forums page](/assets/images/editor/forums-page.png)

On the **Forums** page, users can open the attachment to view, edit, or convert it. The options displayed in the interface may vary depending on the user's permissions.

| Option            | Permissions                  |
| ----------------- | ---------------------------- |
| View              | View messages                |
| Edit              | View messages, Edit messages |
| Convert: Save     | View messages, Edit messages |
| Convert: Download | View messages                |

### View Or Edit In ONLYOFFICE

![View Or Edit In ONLYOFFICE](/assets/images/editor/view-or-edit.png)

On the **View Or Edit In ONLYOFFICE** page, users can view or edit the attachment. The visibility of this page depends on the user's permissions for the module where the attachment is located.

### Create in ONLYOFFICE

![Create in ONLYOFFICE](/assets/images/editor/create-page.png)

On the **Create in ONLYOFFICE** page, users can create the attachment using templates that consider the user's language preference. Take a look at [supported formats](#formats). The visibility of this page depends on the user's permissions for the module.

### Convert with ONLYOFFICE

![Convert with ONLYOFFICE](/assets/images/editor/convert-page.png)

On the **Convert with ONLYOFFICE** page, the user can convert the attachment. The visibility of this page depends on the user's permissions for the module where the attachment is located.
