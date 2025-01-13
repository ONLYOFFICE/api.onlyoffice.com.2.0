---
order: -7
---

In order to create an online office session within your application, a host must create an HTML page that will host an iframe element within it pointing to a particular [WOPI action URL](../WOPI%20discovery/index.md#wopi-actions).

The host page must contain the following elements:

- A *form* element via which the host must *POST* the [access\_token](#parameters) and [access\_token\_ttl](#parameters) parameters to the online office iframe for security purposes. The [docs\_api\_config](#parameters) parameter is optional.
- JavaScript code for interacting with the online office iframe using [PostMessage](../PostMessage/index.md).
- Specific CSS styles for the body element and online office to avoid visual bags. In addition, the host page should set an appropriate favicon for the page using the favicon URL provided in [WOPI discovery](../WOPI%20discovery/index.md).
- A *viewport* meta tag to avoid visual and functional problems in mobile browsers.

## Host page code

``` html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width" />

    <title>ONLYOFFICE Document Editors</title>
    <link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon" />

    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            overflow: hidden;
            -ms-content-zooming: none;
        }
        
        #office_frame {
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            margin: 0;
            border: none;
            display: block;
        }
    </style>
</head>

<body>

    <form id="office_form" name="office_form" target="office_frame" action="<%= actionUrl %>" method="post">
        <input name="access_token" value="<%= token %>" type="hidden" />
        <input name="access_token_ttl" value="<%= tokenTtl %>" type="hidden" />
        <!-- <input name="docs_api_config" value="<%= apiConfig %>" type="hidden" /> -->
    </form>

    <span id="frameholder"></span>

    <script type="text/javascript">
        var frameholder = document.getElementById('frameholder');
        var office_frame = document.createElement('iframe');
        office_frame.name = 'office_frame';
        office_frame.id = 'office_frame';

        office_frame.title = 'Office Frame';
        office_frame.setAttribute('allowfullscreen', 'true');

        office_frame.setAttribute('sandbox', 'allow-scripts allow-same-origin allow-forms allow-popups allow-top-navigation allow-popups-to-escape-sandbox allow-downloads allow-modals');
        office_frame.setAttribute('allow', 'autoplay camera microphone display-capture');
        frameholder.appendChild(office_frame);

        document.getElementById('office_form').submit();
    </script>

</body>

</html>
```

> Please note that the *"<%= actionUrl %>"*, *"<%= token %>"*, *"<%= tokenTtl %>"*, *"<%= apiConfig %>"* strings will be rendered with the appropriate parameters.

## Parameters

| Name               | Type    | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| ------------------ | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| access\_token      | string  | An [access token](../Key%20concepts/index.md#access-token) that the host will use to determine the identity and permissions of the issuer of a WOPI request.                                                                                                                                                                                                                                                                                                                                                                                                                           |
| access\_token\_ttl | integer | The time when an [access token expires](../Key%20concepts/index.md#the-access_token_ttl-property), represented as the number of milliseconds since January 1, 1970 UTC. It is recommended to set this parameter to 10 hours. This parameter can be also set to 0. This means for the client that the token expiry is either infinite or unknown. In this case, clients might disable any UI prompting users to refresh their sessions. This can lead to unexpected data loss due to access token expiry. So, this is strongly recommended to specify a value for *access\_token\_ttl*. |
| docs\_api\_config  | string  | The optional [config](../../Usage%20API/Config/index.md) parameters for opening the editor via Docs API that are not supported by the WOPI protocol. For example, to enable the [forcesaving](../../Get%20Started/How%20It%20Works/Saving%20file/index.md#force-saving) functionality by clicking the **Save** button, the [editorConfig.customization.forcesave](../../Usage%20API/Config/Editor/Customization/index.md#forcesave) parameter must be passed in this object.                                                                                                           |

Further information about building a host page can be found [here](https://docs.microsoft.com/en-us/microsoft-365/cloud-storage-partner-program/online/hostpage).
