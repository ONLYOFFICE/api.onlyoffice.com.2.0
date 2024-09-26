Opens a file in [ONLYOFFICE editors](../../../JavaScript%20SDK/Initialization%20Modes/Editor/index.md) using [File Selector](../../../JavaScript%20SDK/Initialization%20Modes/File%20Selector/index.md).

<img alt="Authorization sample" src="/assets/images/docspace/gifs/open-editors.gif" width="720px">

## Before you start

Please make sure you are using a server environment to run the HTML file because the JavaScript SDK must be launched on the server.
You need to [add the URL](../../../Get%20Started/Basic%20concepts/index.md#step-1-specifying-the-docspace-url) of your server's root directory to the **Developer Tools** section of DocSpace.

## Building a sample

## Step 1. Set HTML structure

Create an HTML file. It must include a *div* tag where we specify the DocSpace connection parameters:

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

## Step 2. Add the file selector

Add a script to initialize the [file selector](../../Initialization%20Modes/File%20Selector/index.md).

1. Add an event handler for [onAppReady](../../Events/index.md#onappready), which fires when initialization is successful:

``` ts
function onAppReady() {
  const frame = DocSpace.SDK.frames["ds-frame"]
}
```

2. Add an event handler for [onSelectCallback](../../Events/index.md#onselectcallback). When the user selects a file, **ONLYOFFICE editors** are initialized by passing the ID of the file selected in the **file selector** to the [initEditor](../../Methods/index.md#initeditor) method:

``` ts
function onSelectCallback() {
  docSpace = DocSpace.SDK.initEditor({
    id: e.id,
    height: "700px",
  })
}
```

3. Create a configuration for the **file selector**:

``` ts
const config = {
  events: {
    onSelectCallback,
    onAppReady,
  },
  height: "700px",
  width: "100%",
}
```

- Initialize the **file selector** with the [initFileSelector](../../Methods/index.md#initfileselector) method:

``` ts
const docSpace = DocSpace.SDK.initFileSelector(config)
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
    function onSelectCallback() {
      docSpace = DocSpace.SDK.initEditor({
        id: e.id,
        height: "700px",
      })
    }

    function onAppReady() {
      const frame = DocSpace.SDK.frames["ds-frame"]
    }

    const config = {
      events: {
        onSelectCallback,
        onAppReady,
      },
      height: "700px",
      width: "100%",
    }

    const docSpace = DocSpace.SDK.initFileSelector(config)
  </script>
</html>
```

