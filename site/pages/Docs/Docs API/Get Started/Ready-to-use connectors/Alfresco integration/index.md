This [plugin](https://github.com/ONLYOFFICE/onlyoffice-alfresco) enables users to edit office documents from [Alfresco](https://www.alfresco.com/) Share using ONLYOFFICE Docs.

The plugin is available in the official [Alfresco Add-ons directory](https://community.alfresco.com/docs/DOC-7918-onlyoffice-connector-for-alfresco).

## Features

- Currently, the following document formats can be opened and edited with this plugin: DOCX, XLSX, PPTX, DOCXF, OFORM.

- The plugin will create a new **Edit in ONLYOFFICE** menu option within the document library for Office documents.

  ![Edit in OnlyOffice](/assets/images/editor/alfresco.png)

  This allows multiple users to collaborate in real time and to save back those changes to Alfresco.

- To convert ODT, ODP, ODS, DOC, XLS, PPT files into their OOXML counterparts, select the **Convert using ONLYOFFICE** option. Resulting files will be placed in the same folder. You can also configure rules for a folder, that will automatically convert files on upload or on change. Details you can find [here](https://docs.alfresco.com/content-services/latest/using/content/rules/).

- To create a new document, open the folder where you want to create a document and click the **Create...** button. ![Create new...](/assets/images/editor/alfresco-create.png)

## Installing ONLYOFFICE Docs

You will need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from Alfresco and any end clients. If that is not the case, use the official [ONLYOFFICE Docs documentation page](https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx). ONLYOFFICE Docs must also be able to POST to Alfresco directly.

The easiest way to start an instance of ONLYOFFICE Docs is to use [Docker](https://github.com/ONLYOFFICE/Docker-DocumentServer).

## Installing ONLYOFFICE Alfresco module package

To start using ONLYOFFICE Docs with Alfresco, the following steps must be performed for Ubuntu 14.04:

1. Upload the compiled **\*.amp** packages to directories accordingly for your Alfresco installation:

   - from *onlyoffice-alfresco/repo/target/* to */usr/local/tomcat/amps/* for Alfresco repository,
   - from *onlyoffice-alfresco/share/target/* to */usr/local/tomcat/amps\_share/* for Share.
   > You can download the already compiled package files [here](https://github.com/onlyoffice/onlyoffice-alfresco/releases) and place them to the respective directories.

2. Use the **Module Management Tool (MMT)** to install modules, run this commands:

   **Alfresco**

   ``` sh
   java -jar /usr/local/tomcat/alfresco-mmt/alfresco-mmt.jar install /usr/local/tomcat/amps/onlyoffice-integration-repo.amp /usr/local/tomcat/webapps/alfresco
   ```

   **Share**

   ``` sh
   java -jar /usr/local/tomcat/alfresco-mmt/alfresco-mmt.jar install /usr/local/tomcat/amps_share/onlyoffice-integration-share.amp /usr/local/tomcat/webapps/share
   ```

   More details about using MMT can be found at the following address - `https://docs.alfresco.com/content-services/latest/install/zip/amp/`.

3. Make sure that ONLYOFFICE Docs will be able to POST to Alfresco.

   You may need to change these lines in **alfresco-global.properties** or you can set it using [configuration page](#configuring-onlyoffice-alfresco-module-package):

   ``` ini
   alfresco.host=<hostname>
   alfresco.port=443
   alfresco.protocol=https
   
   share.host=<hostname>
   share.port=443
   share.protocol=https
   ```

   > Probably located here */usr/local/tomcat/shared/classes/alfresco-global.properties*

4. Restart Alfresco:

   ``` sh
   sudo ./alfresco.sh stop
   sudo ./alfresco.sh start
   ```

The module can be checked in administrator tools at */share/page/console/admin-console/module-package* in Alfresco.

## Configuring ONLYOFFICE Alfresco module package

Module configuration can be found inside **Alfresco Administration Console** or by simply navigating to *http\://\<alfrescohost>/alfresco/s/onlyoffice/onlyoffice-config*.

> You can also add *onlyoffice.url* to **alfresco-global.properties**. Configuration made via settings page will override **alfresco-global.properties**.

Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity. Specify your own **Secret key** on the Alfresco configuration page or by adding *onlyoffice.jwtsecret* to **alfresco-global.properties**. In the ONLYOFFICE Docs [config file](../../../Additional%20API/Signature/index.md), specify the same secret key and enable the validation.

## Compiling ONLYOFFICE Alfresco module package

If you plan to compile the ONLYOFFICE Alfresco module package yourself (e.g. edit the source code and compile it afterwards), follow these steps:

1. The latest stable **Oracle Java** version is necessary for the successful build. If you do not have it installed, use the following commands to install Oracle Java 8:

   ``` sh
   sudo apt-get update
   sudo apt-get install openjdk-8-jdk
   ```

2. Install the latest **Maven**. Installation process is described [here](https://maven.apache.org/install.html).

3. Download the ONLYOFFICE Alfresco module package source code:

   ``` sh
   git clone https://github.com/ONLYOFFICE/onlyoffice-alfresco.git
   ```

4. Get a submodule:

   ``` sh
   git submodule update --init --recursive
   ```

5. Compile packages in the *repo* and *share* directories:

   ``` sh
   cd onlyoffice-alfresco/
   mvn clean install
   ```

Another way to build ONLYOFFICE Alfresco module package is using **docker-compose** file.

Use this command from project directory:

``` sh
docker-compose up
```

## How it works

The ONLYOFFICE integration follows the API documented [here](../../Basic%20concepts/index.md).

1. User navigates to a document within Alfresco Share and selects the **Edit in ONLYOFFICE** menu option.

2. Alfresco Share makes a request to the repo end (URL of the form: */parashift/onlyoffice/prepare?nodeRef={nodeRef}*).

3. Alfresco Repo end prepares a JSON object for the Share with the following properties:

   - **url** - the URL that ONLYOFFICE Docs uses to download the document (includes the *alf\_ticket* of the current user);
   - **callbackUrl** - the URL that ONLYOFFICE Docs informs about status of the document editing;
   - **onlyofficeUrl** - the URL that the client needs to respond to ONLYOFFICE Docs (provided by the *onlyoffice.url* property);
   - **key** - the *UUID+Modified Timestamp* to instruct ONLYOFFICE Docs whether to download the document again or not;
   - **title** - the document title (name).

4. Alfresco Share takes this object and constructs a page from a freemarker template, filling in all of those values so that the client browser can load up the editor.

5. The client browser makes a request to the JavaScript library from ONLYOFFICE Docs and sends ONLYOFFICE Docs the DocEditor configuration with the above properties.

6. Then ONLYOFFICE Docs downloads the document from Alfresco and the user begins editing.

7. ONLYOFFICE Docs sends a POST request to *callbackUrl* to inform Alfresco that a user is editing the document.

8. Alfresco locks the document, but still allows other users with write access to collaborate in real time with ONLYOFFICE Docs by leaving the Action present.

9. When all users and client browsers are done with editing, they close the editing window.

10. After [10 seconds](../../How%20It%20Works/Saving%20file/index.md#save-delay) of inactivity, ONLYOFFICE Docs sends a POST to *callbackUrl* letting Alfresco know that the clients have finished editing the document and closed it.

11. Alfresco downloads a new version of the document, replacing the old one.

Download the ONLYOFFICE Alfresco module package [here](https://github.com/ONLYOFFICE/onlyoffice-alfresco).
