Creates a file in the selected folder and opens it in the editors.

<img alt="Authorization sample" src="/assets/images/docspace/gifs/js-sdk-create-file.gif" width="720px">

## Before you start

Please make sure you are using a server environment to run the HTML file because the JavaScript SDK must be launched on the server.
You need to [add the URL](../../../Get%20Started/Basic%20concepts/index.md#step-1-specifying-the-docspace-url) of your server's root directory to the **Developer Tools** section of DocSpace.

## Building a sample

## Step 1. Set HTML structure

Create an HTML file. Add a combo box, a text field, and a button. The HTML file must include a *div* tag where we specify the DocSpace connection parameters:

``` html
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>DocSpace JavaScript SDK</title>
        <style>
            .holder {
                margin: auto;
                width: 800px;
            }
        </style>
        <script src="{PORTAL_SRC}/static/scripts/sdk/1.0.0/api.js"></script>
    </head>
    <body>
        <div id="holder-buttons" class="holder" style="width: 400px; margin-top: 300px;">
            <label for="combobox"><b>Folders</b></label><br />
            <select id="combobox" onclick="onComboboxClick()" style="height: 25px; width: 405px;"></select><br />
            <label for="fileName"><b>File name</b></label><br />
            <input type="text" id="fileName" name="fileName" value="" style="width: 400px;"><br />
            <button onclick="onButtonClick()" style="margin-top: 20px;">Create File</button>
        </div>
        <div id="holder-frame" class="holder" style="display: none;">
            <div id="ds-frame"></div>
        </div>
    </body>
</html>
```

The API JavaScript file can normally be found in the following DocSpace folder: **{PORTAL_SRC}/static/scripts/sdk/1.0.0/api.js** where **{PORTAL_SRC}** is the name of the server with the ONLYOFFICE DocSpace installed.

## Step 2. Initialize the Manager mode

Add a script to initialize the [Manager](../../Initialization%20Modes/Manager/index.md) mode.

1. Add an event handler for [onAppReady](../../Events/index.md#onappready), which fires when initialization is successful:

``` ts
function onAppReady() {
  const frame = DocSpace.SDK.frames["ds-frame"]
}
```

2. Create a configuration for the **Manager** mode. In the [rootPath](../../Config/index.md#rootpath) field, specify the section whose directories you want to display:

``` ts
const config = {
  events: {
    onAppReady,
  },
  rootPath: "/rooms/personal/",
  height: "700px",
}
```

3. Initialize the **Manager** mode with the [initManager](../../Methods/index.md#initmanager) method:

``` ts
const docSpace = DocSpace.SDK.initManager(config)
```

## Step 3. Upload a list of folders to the combo box

Add the **onComboboxClick()** event handler for the combo box. Using the [getFolders](../../Methods/index.md#getfolders) method, upload the list into the combo box:

``` ts
const combobox = document.querySelector("#combobox").value
function onComboboxClick(e) {
  const data = await frame.getFolders()
  for (const item of data) {
    const option = document.createElement("option")
    option.value = item.id
    option.textContent = item.title
    combobox.append(option)
  }
}
```

## Step 4. Add a method to create a file

Add the **onButtonClick()** event handler for the button. Using the [createFile](../../Methods/index.md#createfile) method, create a file in the selected folder:

``` ts
function onButtonClick() {
  const frame = DocSpace.SDK.frames["ds-frame"]
  const selectedFolder = document.querySelector("#combobox").value
  const fileName = document.querySelector("#fileName").value

  const res = await frame.createFile(selectedFolder, fileName)
  const docSpace = DocSpace.SDK.initEditor({
    id: res.id,
    height: "700px",
  })

  document.querySelector("#holder-buttons").style.display = "none"
  document.querySelector("#holder-frame").style.display = "block"
}
```

## Step 5. Run the sample

``` html
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>DocSpace JavaScript SDK</title>
    <script src="{PORTAL_SRC}/static/scripts/sdk/1.0.0/api.js"></script>
    <style>
      .holder {
        margin: auto;
        width: 800px;
      }
    </style>
    ...
  </head>
  <body>
    <div id="holder-buttons" class="holder" style="width: 400px; margin-top: 300px;">
      <label for="combobox"><b>Folders</b></label><br />
      <select id="combobox" onclick="onComboboxClick()" style="height: 25px; width: 405px;"></select><br />
      <label for="fileName"><b>File name</b></label><br />
      <input type="text" id="fileName" name="fileName" value="" style="width: 400px;"><br />
      <button onclick="onButtonClick()" style="margin-top: 20px;">Create File</button>
    </div>
    <div id="holder-frame" class="holder" style="display: none;">
      <div id="ds-frame"></div>
    </div>
    ...
  </body>
  <script>
    const combobox = document.querySelector("#combobox")

    function onAppReady() {
      const frame = DocSpace.SDK.frames["ds-frame"]
    }

    const config = {
      events: {
        onAppReady,
      },
      rootPath: "/rooms/personal/",
      height: "700px",
    }

    function onComboboxClick(e) {
      const data = await frame.getFolders()
      for (const item of data) {
        const option = document.createElement("option")
        option.value = item.id
        option.textContent = item.title
        combobox.append(option)
      }
    }

    function onButtonClick() {
      const frame = DocSpace.SDK.frames["ds-frame"]
      const selectedFolder = document.querySelector("#combobox").value
      const fileName = document.querySelector("#fileName").value

      const res = await frame.createFile(selectedFolder, fileName)
      const docSpace = DocSpace.SDK.initEditor({
        id: res.id,
        height: "700px",
      })

      document.querySelector("#holder-buttons").style.display = "none"
      document.querySelector("#holder-frame").style.display = "block"
    }

    const docSpace = DocSpace.SDK.initManager(config)
  </script>
```
