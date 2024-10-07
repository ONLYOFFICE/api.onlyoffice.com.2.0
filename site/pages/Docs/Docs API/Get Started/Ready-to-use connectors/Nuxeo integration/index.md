This [plugin](https://github.com/ONLYOFFICE/onlyoffice-nuxeo) enables users to edit office documents from [Nuxeo](https://www.nuxeo.com/) using ONLYOFFICE Docs.

## Features

- Currently, the following document formats can be edited: DOCX, XLSX, PPTX, DOCXF, OFORM.
- The following formats are available for viewing only: PDF, ODT, ODS, ODP, DOC, XLS, PPT.
- The plugin allows multiple users to collaborate in real time and to save back those changes to Nuxeo.

## Installing ONLYOFFICE Docs

You will need an instance of ONLYOFFICE Docs (Document Server) that is resolvable and connectable both from Nuxeo and any end-clients. If that is not the case, use the official [ONLYOFFICE Docs documentation page](https://helpcenter.onlyoffice.com/server/linux/document/linux-installation.aspx). ONLYOFFICE Docs must also be able to POST to Nuxeo directly.

The easiest way to start an instance of ONLYOFFICE Docs is to use [Docker](https://github.com/onlyoffice/Docker-DocumentServer).

## Installing Nuxeo ONLYOFFICE integration plugin

Install it from [marketplace](https://connect.nuxeo.com/nuxeo/site/marketplace).

You can also install it using [nuxeoctl](https://doc.nuxeo.com/nxdoc/installing-a-new-package-on-your-instance/).

``` sh
nuxeoctl mp-install /path/to/onlyoffice-nuxeo-package-x.x.zip
```

## Configuring Nuxeo ONLYOFFICE integration plugin

Open the [nuxeo.conf](https://doc.nuxeo.com/nxdoc/configuration-parameters-index-nuxeoconf/) file and enter the name of the server with ONLYOFFICE Docs installed:

``` ini
onlyoffice.docserv.url=http://documentserver/
```

where the **documentserver** is the name of the server with **ONLYOFFICE Docs** installed. The address must be accessible from the user browser and from the Nuxeo server. The Nuxeo server address must also be accessible from **ONLYOFFICE Docs** for correct work.

Starting from version 7.2, JWT is enabled by default and the secret key is generated automatically to restrict the access to ONLYOFFICE Docs and for security reasons and data integrity. Specify your own secret key by adding the **onlyoffice.jwt.secret=yoursecret** line to the *nuxeo.conf* file. In the ONLYOFFICE Docs [config file](../../../Additional%20API/Signature/index.md), specify the same secret key and enable the validation.

## Compiling Nuxeo ONLYOFFICE plugin

To build Nuxeo plugin, the following steps must be performed for Ubuntu:

1. The stable Java version is necessary for the successful build. If you do not have it installed, use the following commands to install **Open JDK 8**:

   ``` sh
   sudo apt-get update
   sudo apt-get install openjdk-8-jdk
   ```

2. Install the latest **Maven**. Installation process is described [here](https://maven.apache.org/install.html).

3. Download the Nuxeo ONLYOFFICE integration plugin source code:

   ``` sh
   git clone https://github.com/onlyoffice/onlyoffice-nuxeo.git
   ```

4. Compile Nuxeo ONLYOFFICE integration plugin:

   ``` sh
   cd onlyoffice-nuxeo/
   mvn clean install
   ```

5. Built package is located here *./onlyoffice-nuxeo-package/target/onlyoffice-nuxeo-package-x.x.zip*.

## How it works

The ONLYOFFICE integration follows the API documented [here](../../Basic%20concepts/index.md).

Download the Nuxeo ONLYOFFICE integration plugin [here](https://github.com/ONLYOFFICE/onlyoffice-nuxeo).
