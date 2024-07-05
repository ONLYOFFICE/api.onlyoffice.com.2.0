Before you start working on documents stored within your cloud, you need to log in to it.

## Login

Use the [execCommand](/desktop/execcommand) method to display a cloud in the **Connected clouds** list. When the *portal:login* command is sent, the cloud is registered and listed on the **Connected clouds** page. Call the command on all the pages you can access after logging in to your cloud. Parameters are specified in the format of a string with the serialized *json* as follows:

```
{
    "displayName": "user name", 
    "email": "user@email.addr",
    "domain": "domain name",
    "provider": "provider",
    "uiTheme": "theme",
    "userId": "user id"
}
```

Parameters

| Name          | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Type   | Example                      |
| ------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------ | ---------------------------- |
| displayName\* | Defines the user name displayed on the **Connected clouds** page.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | string | "John Smith"                 |
| email         | Defines the user email displayed on the **Connected clouds** page.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | string | "john\@example.com"          |
| domain\*      | Defines the cloud name and the cloud entry point.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | string | "https\://exampledomain.com" |
| provider\*    | Defines the provider id used to refer to the desktop app in the JavaScript commands (the same as in the [config](/desktop/addingdms/)).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | string | "onlyoffice"                 |
| uiTheme       | Defines the editor theme settings. It can be set in two ways:- **theme id** - the user sets the theme parameter by its id (**theme-light**, **theme-classic-light**, **theme-dark**, **theme-contrast-dark**),
- **default theme** - the default dark or light theme value will be set (**default-dark**, **default-light**). The default light theme is **theme-classic-light**.The first option has higher priority.Apart from the available editor themes, the user can also customize their own [color themes](https://helpcenter.onlyoffice.com/installation/docs-developer-change-theme.aspx) for the application interface. | string | "theme-dark"                 |
| userId\*      | Defines the user id.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | string | "78e1e841"                   |

\** - required field*

Example

```
const params = {
    "displayName": "John Smith", 
    "email": "john@example.com",
    "domain": "https://exampledomain.com",
    "provider": "onlyoffice",
    "uiTheme": "theme-dark",
    "userId": "78e1e841"
}
window.AscDesktopEditor.execCommand ("portal:login", JSON.stringify(params))
```

## Logout

Use the [execCommand](/desktop/execcommand) method to remove a cloud from the **Connected clouds** list. When the *portal:logout* command is sent, the cloud will be removed from the list on the **Connected clouds** page. Cookies for this domain will be cleared. Parameters are specified in the format of a string with the serialized *json* as follows:

```
{
    "domain": "domain name"
}
```

Parameters

| Name   | Description                                       | Type   | Example                      |
| ------ | ------------------------------------------------- | ------ | ---------------------------- |
| domain | Defines the cloud name and the cloud entry point. | string | "https\://exampledomain.com" |

Example

```
window.AscDesktopEditor.execCommand ("portal:logout", JSON.stringify ({
    "domain": "https://exampledomain.com"
}));
```
