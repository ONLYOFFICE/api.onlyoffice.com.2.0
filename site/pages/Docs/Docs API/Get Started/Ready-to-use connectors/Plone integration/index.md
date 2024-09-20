This [plugin](https://github.com/ONLYOFFICE/onlyoffice-plone) allows users to edit office documents within [Plone](https://plone.org/) using ONLYOFFICE Docs.

## Features

- Currently, the following document formats can be edited: DOCX, XLSX, PPTX, DOCXF, OFORM.
- The following formats are available for viewing only: PDF, ODT, ODS, ODP, DOC, XLS, PPT.
- The plugin will create a new **ONLYOFFICE Edit** menu option within the document library for Office documents. This allows multiple users to collaborate in real time and to save back those changes to Plone.

## Installing ONLYOFFICE Docs

You will need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from Plone and any end-clients. If that is not the case, use the official [ONLYOFFICE Docs documentation page](https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx). ONLYOFFICE Docs must also be able to POST to Plone directly.

The easiest way to start an instance of ONLYOFFICE Docs is to use [Docker](https://github.com/onlyoffice/Docker-DocumentServer).

## Installing Plone ONLYOFFICE integration plugin

To start using ONLYOFFICE Docs with Plone, the following steps must be performed:

1. Install plugin by adding it to your *buildout.cfg*:

   ``` ini
   [buildout]
   eggs = onlyoffice.plone
   ```

2. Run *bin/buildout*.

3. Go to **Site Setup -> Add-ons** and press the **Install** button to enable plugin.

You could also install plugin via Docker:

``` sh
docker run --rm -p 8080:8080 -e ADDONS="onlyoffice.plone" plone
```

Both options will automatically install plugin from [PyPi](https://pypi.org/project/onlyoffice.plone/).

> Please note that if you have the previous plugin version installed (earlier plugin versions with the previous name *onlyoffice.connector*), please remove it before installing the new version.

## Configuring Plone ONLYOFFICE integration plugin

To configure plugin, go to **Site Setup**. Scroll down to **Add-ons Configuration** section and press the **ONLYOFFICE Configuration** button.

Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity. Specify your own **Secret key** on the Plone configuration page. In the ONLYOFFICE Docs [config file](../../../Additional%20API/Signature/index.md), specify the same secret key and enable the validation.

## Developing Plone ONLYOFFICE plugin

1. Clone repository and change directory:

   ``` sh
   git clone --branch deploy git@github.com:ONLYOFFICE/onlyoffice-plone.git
   cd onlyoffice-plone
   ```

2. Create a *virtualenv* in the package.

3. Install requirements with pip.

4. Run *buildout*:

   ``` sh
   virtualenv .
   ./bin/pip install -r requirements.txt
   ./bin/buildout
   ```

5. Start Plone in foreground:

   ``` sh
   ./bin/instance fg
   ```

If you have a working Plone instance, you can install plugin by adding the project files to the *scr* directory:

1. In the *scr* directory create the *onlyoffice.plone* directory.

2. Put your project files received by Git into the *onlyoffice.plone* directory.

3. Edit the *buildout.cfg* file:

   ``` ini
   [buildout]
   eggs = onlyoffice.plone
   develop = src/onlyoffice.plone
   ```

4. Rerun buildout for the changes to take effect:

   ``` sh
   .bin/buildout
   ```

5. Then start or restart your Plone instance.

> Plone is based on **Zope server** and will not run as *root* user. If you intend to run it as *root* user, you must supply [effective-user directive](https://zope.readthedocs.io/en/2.12/SETUID.html). In order to do so, add *effective-user \<username>* line to *./parts/instance/etc/zope.conf*.

## Upgrade Plone ONLYOFFICE integration plugin

1. If you specified a concrete plugin version in your *buildout.cfg* file (so-called *pinning*, and a recommended practice), like *onlyoffice.plone = 1.0.0*, update this reference to point to the newer version. If the plugin version is not specified, then the latest version will be automatically loaded:

   ``` ini
   [versions]
   onlyoffice.plone = 1.0.1
   ```

2. Run *bin/buildout*. Wait until a new version is downloaded and installed.

3. Restart Plone. Your site may look weird, or even be inaccessible until you have performed the next step.

4. Navigate to the **Add-on** screen (add */prefs\_install\_products\_form* to your site URL) and in the **Upgrades** list select **onlyoffice.plone** and click **Upgrade onlyoffice.plone**.

## How it works

The ONLYOFFICE integration follows the API documented [here](../../Basic%20concepts/index.md).

1. User navigates to a document within Plone and selects the **ONLYOFFICE Edit** action.

2. Plone prepares a JSON object for the ONLYOFFICE Docs with the following properties:

   - **url**: the URL that ONLYOFFICE Docs uses to download the document;
   - **callbackUrl**: the URL that ONLYOFFICE Docs informs about status of the document editing;
   - **key**: the *UUID+Modified Timestamp* to instruct ONLYOFFICE Docs whether to download the document again or not;
   - **title**: the document title (name).

3. Plone constructs a page from the *.pt* template, filling in all of those values so that the client browser can load up the editor.

4. The client browser makes a request to the JavaScript library from ONLYOFFICE Docs and sends ONLYOFFICE Docs the DocEditor configuration with the above properties.

5. Then ONLYOFFICE Docs downloads the document from Plone and the user begins editing.

6. ONLYOFFICE Docs sends a POST request to *callbackUrl* to inform Plone that a user is editing the document.

7. When all users and client browsers are done with editing, they close the editing window.

8. After [10 seconds](../../How%20It%20Works/Saving%20file/index.md#save-delay) of inactivity, ONLYOFFICE Docs sends a POST to *callbackUrl* letting Plone know that the clients have finished editing the document and closed it.

9. Plone downloads a new version of the document, replacing the old one.

Download the Plone ONLYOFFICE integration plugin [here](https://github.com/ONLYOFFICE/onlyoffice-plone).
