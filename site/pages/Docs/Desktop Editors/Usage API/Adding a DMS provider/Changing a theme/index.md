---
order: -3
---

Starting from version 7.5, you can change a theme of the desktop editor tab. To do this, use the *portal:uitheme* command of the [execCommand](../execCommand/index.md) method.

``` ts
window.AscDesktopEditor.execCommand("portal:uitheme", editorTheme)
```

## editorTheme

Defines the editor theme settings. It can be set in two ways:

- **theme id** - the user sets the theme parameter by its id (**theme-light**, **theme-classic-light**, **theme-dark**, **theme-contrast-dark**);
- **default theme** - the default dark or light theme value will be set (**default-dark**, **default-light**). The default light theme is **theme-classic-light**.

The first option has higher priority.

Apart from the available editor themes, the user can also customize their own [color themes](https://helpcenter.onlyoffice.com/installation/docs-developer-change-theme.aspx) for the application interface.

Type: string

Example: "theme-dark"

## Example

``` ts
window.AscDesktopEditor.execCommand("portal:uitheme", "theme-dark")
```

When the *portal:uitheme* command is sent, the editor theme is changed to the one specified in the method parameters.
