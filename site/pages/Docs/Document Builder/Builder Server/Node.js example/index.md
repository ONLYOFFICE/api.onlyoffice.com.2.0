---
order: -3
---

## Introduction

To integrate **ONLYOFFICE Document Builder** into your own application on **Node.js** you need to download and install **ONLYOFFICE Document Builder** to your computer and use the [Node.js example](../Overview/index.md) for the integration. We will show how to run the Node.js example on [Window OS](#running-the-example-on-windows-os) and on [Linux OS](#running-the-example-on-linux-os).

## Running the example on Windows OS

### Step 1. Download and install ONLYOFFICE Document Builder

First, download **ONLYOFFICE Document Builder** and install it to your computer:

[Get ONLYOFFICE Document Builder](https://www.onlyoffice.com/download-builder.aspx?from=api)

### Step 2. Download the Node.js code for the editors integration

Download the [Node.js Example](../Overview/index.md) from our site.

You need to connnect the ONLYOFFICE Document Builder to your web site. For that specify the path in the *config/default.json* file:

``` json
{
  "builderPath": "C:\\ONLYOFFICE\\DocumentBuilder\\docbuilder.exe"
}
```

### Step 3. System requirements

Download and install the **node.js** enviroment which is going to be used to run the Node.js project. Please follow the link at the oficial website: <https://nodejs.org/en/download/>, choosing the correct version for your Windows OS (32-bit or 64-bit).

### Step 4. Running the Node.js code

We will run the code in Node.js runtime environment and will interact with it using the command line interface (cmd).

1. Launch the **Command Prompt** and switch to the folder with the Node.js project code, for example:

   ``` sh
   cd /d C:\nodejs
   ```

2. Node.js comes with a package manager, **node package manager (npm)**, which is automatically installed along with Node.js. To run the Node.js code install the project modules using the following npm command:

   ``` sh
   npm install
   ```

   A new *node\_modules* folder will be created in the project folder.

3. Run the project using the **Command Prompt**:

   ``` sh
   node bin/www
   ```

4. See the result in your browser using the address:

   ``` sh
   http://localhost:3000
   ```

## Running the example on Linux OS

### Step 1. Download and install ONLYOFFICE Document Builder

First, download [**ONLYOFFICE Document Builder**](https://www.onlyoffice.com/document-builder.aspx) and install it to your computer.

### Step 2. Install the prerequisites and run the application

1. Install **Node.js**:

   ``` sh
   curl -sL https\://deb.nodesource.com/setup\_4.x | sudo bash -
   ```

   ``` sh
   apt-get install nodejs
   ```

2. Create the *Node.js Example* project folder. Download the archive with the Node.js Example and unpack the archive in the created folder:

   ``` sh
   wget https\://github.com/ONLYOFFICE/document-builder-integration/releases/latest/download/Node.js.Example.zip
   ```

   ``` sh
   unzip Node.js.Example.zip
   ```

3. Change the current directory for the project directory:

   ``` sh
   cd \~/Node.js\ Example/
   ```

4. Install the dependencies:

   ``` sh
   npm install
   ```

5. Edit the *config/default.json* configuration file. Specify the path to the ONLYOFFICE Document Builder.

   ``` sh
   nano config/default.json
   ```

   Edit the following lines:

   ``` json
   {
     "builderPath": "/usr/bin/docbuilder"
   }
   ```

6. Run the project with Node.js:

   ``` sh
   nodejs bin/www
   ```

7. See the result in your browser using the address:

   ``` sh
   http://localhost
   ```

Now you will be able to see the result in your browser using the `http://localhost` address or using the computer address in your local network.
