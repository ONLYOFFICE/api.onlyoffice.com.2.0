The ONLYOFFICE DocSpace SDK based on JavaScript allows developers to use all the DocSpace possibilities with *api.js*. You can integrate ONLYOFFICE DocSpace into your own web application, allowing users to create and submit documents directly from your website.

You don't need to be an experienced JavaScript developer to use the DocSpace JavaScript SDK because we provide you with all the basics. You only need a few lines of JavaScript to set up a fully functional integration.

Follow the steps below to connect DocSpace as a frame to your website.

## Step 1. Creating the HTML file

Create the target HTML file which must include a placeholder *div* tag, where all the information about DocSpace parameters will be passed:

``` html
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>DocSpace JavaScript SDK</title>
        <script src="{PORTAL_SRC}/static/scripts/sdk/1.0.0/api.js"></script>
    </head>
    <body>
        <div id="ds-frame"></div>
    </body>
</html>
```

The API JavaScript file can normally be found in the following DocSpace folder:

`{PORTAL\_SRC}/static/scripts/sdk/1.0.0/api.js`

where **{PORTAL\_SRC}** is the name of the server with the ONLYOFFICE DocSpace installed.

## Step 2. Getting the base class

When the API JavaScript is connected to the page, get the base class that provides all the basic functionality of *api.js*:

| Class        | Description                                                                                                                               |
| ------------ | ----------------------------------------------------------------------------------------------------------------------------------------- |
| DocSpace.SDK | Defines the DocSpace document manager and allows you to perform operations with rooms, folders, and documents within the DocSpace portal. |

## Step 3. Authorizing

*api.js* uses the active DocSpace application sessions to authenticate users. If the user is logged in to the DocSpace portal that the SDK will connect to, then *api.js* recognizes and uses that active session.

If the users are not authenticated, they will see a page asking them to sign in to DocSpace the first time they use it. Authentication is also possible through the SDK [methods](../../JavaScript%20SDK/Methods/index.md#login).

## Step 4. Initializing

> Please note that when working via HTTPS, it is necessary to set the **"SameSite": "none"** parameter in *appsettings.json* to avoid blocking the work with cookies during cross-domain requests.

Initialize DocSpace frame using the [initFrame](../../JavaScript%20SDK/Methods/index.md#initframe) method with the SDK config passed to it:

``` ts
const docSpace = DocSpace.SDK.initFrame({
  frameId: "frameId",
  showMenu: true,
})
```

You can use other available [methods](../../JavaScript%20SDK/Methods/index.md) to initialize DocSpace.

The full list of [config parameters](../../JavaScript%20SDK/Config/index.md) can be found here.

## Step 5. Using

After initialization, the current SDK instance can be accessed by using its [frameId](../../JavaScript%20SDK/Config/index.md#frameid). The list of current SDK instances is available in the *DocSpace.SDK.frames* array. To get the specific SDK instance, use the following string:

``` ts
DocSpace.SDK.frames[frameId]
```
