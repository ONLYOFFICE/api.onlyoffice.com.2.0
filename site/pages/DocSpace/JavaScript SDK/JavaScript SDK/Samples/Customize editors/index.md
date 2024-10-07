Customizes the editor interface so that it looks like your other products (if there are any), and changes the presence or absence of the additional buttons, links, logos and editor owner details.

<img alt="Authorization sample" src="/assets/images/docspace/customization-of-editors.png" width="720px">

## Before you start

Please make sure you are using a server environment to run the HTML file because the JavaScript SDK must be launched on the server.
You need to [add the URL](../../../Get%20Started/Basic%20concepts/index.md#step-1-specifying-the-docspace-url) of your server's root directory to the **Developer Tools** section of DocSpace.

## Step 1. Set HTML structure

Create an HTML file. The HTML file must include a *div* tag where we specify the DocSpace connection parameters:

``` html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>DocSpace JavaScript SDK</title>
    <script src="{PORTAL_SRC}/static/scripts/sdk/1.0.0/api.js"></script>
    ...
  </head>
  <body>
    <div id="ds-frame"></div>
    ...
  </body>
</html>
```

The API JavaScript file can normally be found in the following DocSpace folder: **{PORTAL_SRC}/static/scripts/sdk/1.0.0/api.js** where **{PORTAL_SRC}** is the name of the server with the ONLYOFFICE DocSpace installed.

## Step 2. Initialize the editors

Add a script to initialize the [editors](../../Initialization%20Modes/Editor/index.md).

1. Add an event handler for [onAppReady](../../Events/index.md#onappready), which fires when initialization is successful:

``` ts
function onAppReady() {
  const frame = DocSpace.SDK.frames["ds-frame"]
}
```

2. Create a configuration for the **Editor** mode. Go to the [editorCustomization](../../Config/index.md#editorcustomization) section and configure the editors as needed.
After that, copy the resulting config and paste it into the [customization](../../../../../Docs/Docs%20API/Usage%20API/Config/Editor/Customization/index.md) section, as shown below. In the config, pass the id of the file that will be opened in the editors:

``` ts
const config = {
  editorCustomization: {
    autosave: true,
    comments: true,
    compactHeader: true,
    compactToolbar: false,
    compatibleFeatures: false,
    forcesave: false,
    help: true,
    hideRightMenu: false,
    hideRulers: false,
    integrationMode: "embed",
    macros: true,
    macrosMode: "Warn",
    mentionShare: true,
    mobileForceView: true,
    plugins: true,
    toolbarHideFileName: false,
    toolbarNoTabs: false,
    uiTheme: "theme-light",
    unit: "cm",
    zoom: 100,
  },
  events: {
    onAppReady,
  },
  height: "700px",
  id: "361797",
}
```

3. Initialize the <b>Editors</b> mode with the [initEditor](../../Methods/index.md#initeditor) method:

```ts
const docSpace = DocSpace.SDK.initEditor(config)
```

## Step 3. Run the sample

Run our HTML file and make sure everything works.

``` html
<!DOCTYPE html>
<html lang="en">
  <head>
  <meta charset="UTF-8">
  <title>DocSpace JavaScript SDK</title>
  <script src="{PORTAL_SRC}/static/scripts/sdk/1.0.0/api.js"></script>
    ...
  </head>
  <body>
    <div id="ds-frame"></div>
    ...
  </body>
  <script>
    function onAppReady() {
      const frame = DocSpace.SDK.frames["ds-frame"]
    }
    const config = {
      editorCustomization: {
        autosave: true,
        comments: true,
        compactHeader: true,
        compactToolbar: false,
        compatibleFeatures: false,
        forcesave: false,
        help: true,
        hideRightMenu: false,
        hideRulers: false,
        integrationMode: "embed",
        macros: true,
        macrosMode: "Warn",
        mentionShare: true,
        mobileForceView: true,
        plugins: true,
        toolbarHideFileName: false,
        toolbarNoTabs: false,
        uiTheme: "theme-light",
        unit: "cm",
        zoom: 100,
      },
      events: {
        onAppReady,
      },
      height: "700px",
      id: "361797",
    }
    var docSpace = DocSpace.SDK.initEditor(config);   
  </script>
</html>
```
