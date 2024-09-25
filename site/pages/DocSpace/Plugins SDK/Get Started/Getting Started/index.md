---
order: -1
---

Here are the fundamental steps for building plugins:

1. Preparing
2. Creating plugin template
3. Coding
4. Building
5. Uploading to the portal

## Step 1. Preparing

Install the *@onlyoffice/docspace-plugin-sdk* npm package globally:

``` sh
npm i -g @onlyoffice/docspace-plugin-sdk
```

Now, the **npx** command is available, which will be used to create a plugin.

## Step 2. Creating plugin template

1. To create a plugin template, run the following command:

   ``` sh
   npx create-docspace-plugin
   ```

2. Configure the plugin in the terminal specifying in the dialog the plugin settings such as name, version, author, logo, etc.

3. Select the plugin scopes from the list by pressing *Space* on the necessary scopes (API, Settings, Context menu, etc.).

More information about plugin settings and scopes can be found [here](../../Usage%20SDK/Creating%20Plugin%20Template/index.md).

![Creating template](/assets/images/docspace/creating-template.png)

## Step 3. Coding

Develop a plugin. Follow the plugin structure described [here](../../Usage%20SDK/Plugin%20Structure/index.md).

- Write code for each [plugin type](../../Usage%20SDK/Coding%20Plugin/Plugin%20Types/index.md) using the corresponding variables, methods and [items](../../Usage%20SDK/Coding%20Plugin/Plugin%20Items/index.md). Put the scripts into the *src* folder. Specify the required [Plugin](../../Usage%20SDK/Coding%20Plugin/Plugin%20Types/Plugin/index.md) interface for each plugin to be embedded in the portal.

  ![Plugin structure](/assets/images/docspace/plugin-structure.png)

- Specify [plugin messages](../../Usage%20SDK/Coding%20Plugin/Plugin%20Message/index.md) that will be returned by the items. Use the appropriate [events](../../Usage%20SDK/Coding%20Plugin/Events/index.md) that will be processed on the portal side.

- Learn which [plugin components](../../Usage%20SDK/Coding%20Plugin/Plugin%20Components/index.md) can be used for the DocSpace plugin interface and add them to your scripts.

Code samples are available at <https://github.com/ONLYOFFICE/docspace-plugins>.

## Step 4. Building

To build a plugin, you need the *yarn* package manager to be installed. Install all the necessary dependencies using the **yarn install** command in the plugin root folder (if this was not done previously in step 2). After that collect a plugin archive by running the **yarn build** command. The completed plugin will be located in the *dist* folder and can be uploaded to the DocSpace portal. More information can be found [here](../../Usage%20SDK/Building%20Plugin/index.md).

## Step 5. Uploading to the portal

To upload a plugin to the DocSpace portal, follow the instructions [here](../../Usage%20SDK/Adding%20Plugin/index.md).

The plugin will appear in the plugin list and start functioning automatically.
