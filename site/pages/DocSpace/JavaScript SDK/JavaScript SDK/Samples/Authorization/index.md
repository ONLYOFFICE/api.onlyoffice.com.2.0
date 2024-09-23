Logs in to the DocSpace account using the specified email and password hash.

<img alt="Authorization sample" src="/assets/images/docspace/gifs/js-sdk-authorization-sample.gif" width="720px">

## Before you start

Please make sure you are using a server environment to run the HTML file because the JavaScript SDK must be launched on the server.
You need to [add the URL](../../../Get%20Started/Basic%20concepts/index.md#step-1-specifying-the-docspace-url) of your server's root directory to the <b>Developer Tools</b> section of DocSpace.

## Building a sample

## Step 1. Set HTML structure

Create an HTML file. Add two text fields and a button. The HTML file must include a *div* tag where we specify the DocSpace connection parameters:

``` html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>DocSpace JavaScript SDK</title>
  <script src="{PORTAL_SRC}/static/scripts/sdk/1.0.0/api.js"></script>
</head>
<body>
  <label for="login">Login</label><br>
  <input type="text" id="login"><br>
  <label for="password">Password</label><br>
  <input type="password" id="password"><br>
  <button id="startButton" onclick="onButtonClick()">Login</button>
  <div id="ds-frame"></div>
</body>
</html>
```

The API JavaScript file can normally be found in the following DocSpace folder: **{PORTAL_SRC}/static/scripts/sdk/1.0.0/api.js** where **{PORTAL_SRC}** is the name of the server with the ONLYOFFICE DocSpace installed.

## Step 2. Initialize the System mode

Add a script to initialize the [System](../../Initialization%20Modes/System/index.md) mode.

1. Add an event handler for [onAppReady](../../Events/index.md#onappready), which fires when initialization is successful:

``` ts
function onAppReady() {
  const frame = DocSpace.SDK.frames["ds-frame"]
}
```

2. Create a configuration for the **System** mode:

``` ts
const config = {
  events: {
    onAppReady,
  },
}
```

3. Initialize the **System** mode with the [initSystem](../../Methods/index.md#initsystem) method:

``` ts
const docSpace = DocSpace.SDK.initSystem(config)
```

## Step 3. Add a method to log in

Add the **onButtonClick()** event handler for the button. Using the [getHashSettings](../../Methods/index.md#gethashsettings) method, return the password hash settings
and generate the password hash using the [createHash](../../Methods/index.md#createhash) method. After this, authorize the user using the [login](../../Methods/index.md#login) method:

``` ts
function onButtonClick() {
  const frame = DocSpace.SDK.frames["ds-frame"]
  const login = document.querySelector("#login").value
  const password = document.querySelector("#password").value
  const hashSettings = await frame.getHashSettings()
  const passwordHash = await frame.createHash(password, hashSettings)
  frame.login(login, passwordHash)
}
```

## Step 4. Add a method to log in

Run our HTML file and make sure everything works.

``` html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>DocSpace JavaScript SDK</title>
    <script src="{PORTAL_SRC}/static/scripts/sdk/1.0.0/api.js"></script>
  </head>
  <body>
    <label>Login</label><br />
    <input type="text" id="login"><br />
    <label>Password</label><br />
    <input type="text" id="password" style="-webkit-text-security: circle"><br />
    <button id="startButton" onclick="onButtonClick()" style="margin-top: 20px;">Login</button>
    <div id="ds-frame"></div>
    <script>
      function onButtonClick() {
        const frame = DocSpace.SDK.frames["ds-frame"]
        const login = document.querySelector("#login").value
        const password = document.querySelector("#password").value
        const hashSettings = await frame.getHashSettings()
        const passwordHash = await frame.createHash(password, hashSettings)
        frame.login(login, passwordHash)
      }

      function onAppReady() {
        const frame = DocSpace.SDK.frames["ds-frame"]
      }

      const config = {
        events: {
          onAppReady,
        },
      }
      const docSpace = DocSpace.SDK.initSystem(config);   
    </script>
  </body>
</html>
```
