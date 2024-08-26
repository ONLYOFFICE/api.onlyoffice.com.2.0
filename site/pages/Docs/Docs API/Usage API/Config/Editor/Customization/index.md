The customization section allows to customize the editor interface so that it looked like your other products (if there are any) and change the presence or absence of the additional buttons, links, change logos and editor owner details.

- [about](#about)
- [anonymous](#anonymous)
- [autosave](#autosave)
- [chat](#chat)
- [close](#close)
- [commentAuthorOnly](#commentauthoronly)
- [comments](#comments)
- [compactHeader](#compactheader)
- [compactToolbar](#compacttoolbar)
- [compatibleFeatures](#compatiblefeatures)
- [customer](#customer)
- [features](#features)
- [feedback](#feedback)
- [font](#font)
- [forcesave](#forcesave)
- [goback](#goback)
- [help](#help)
- [hideNotes](#hidenotes)
- [hideRightMenu](#hiderightmenu)
- [hideRulers](#hiderulers)
- [integrationMode](#integrationmode)
- [layout](#layout)
- [leftMenu](#leftmenu)
- [loaderLogo](#loaderlogo)
- [loaderName](#loadername)
- [logo](#logo)
- [macros](#macros)
- [macrosMode](#macrosmode)
- [mentionShare](#mentionshare)
- [mobileForceView](#mobileforceview)
- [plugins](#plugins)
- [review](#review)
- [reviewDisplay](#reviewdisplay)
- [rightMenu](#rightmenu)
- [showReviewChanges](#showreviewchanges)
- [spellcheck](#spellcheck)
- [statusBar](#statusbar)
- [submitForm](#submitform)
- [toolbar](#toolbar)
- [toolbarHideFileName](#toolbarhidefilename)
- [toolbarNoTabs](#toolbarnotabs)
- [trackChanges](#trackchanges)
- [uiTheme](#uitheme)
- [unit](#unit)
- [zoom](#zoom)

> Please note that only the following parameters are available for the mobile editors: [close](#close), [feedback](#feedback), [goback](#goback), [help](#help), [logo](#logo), [macrosMode](#macrosmode), [mobileForceView](#mobileforceview).

## about

Defines if the **About** menu button is displayed or hidden. The default value is **true**.

> This parameter is an extended white label option for Developer Edition.

Type: boolean

Example: true

## anonymous

Adds a request for the anonymous name.

Type: object

Example:

``` ts
const anonymous = {
  request: true,
  label: "Guest",
}
```

### anonymous.request

Defines if the request is sent or not. The default value is **true**.

Type: boolean

Example: true

### anonymous.label

A postfix added to the user name. The default value is **Guest**.

Type: string

Example: "Guest"

![Anonymous](/assets/images/editor/anonymous.png)

## autosave

Defines if the **Autosave** menu option is enabled or disabled. If set to **false**, only **Strict** co-editing mode can be selected, as **Fast** does not work without autosave. The default value is **true**.

Type: boolean

Example: true

> Please note that in case this setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the *editorConfig.customization.autosave* parameter.

## chat

Defines if the **Chat** menu button is displayed or hidden. Please note that in case you hide the **Chat** button, the corresponding chat functionality will also be disabled. The default value is **true**. Deprecated since version 7.1, please use the [document.permissions.chat](../../Document/Permissions/index.md#chat) parameter instead.

Type: boolean

Example: true

![Chat](/assets/images/editor/chat.png)

## close

Defines settings for the cross button to close the editor.

Type: object

Example:

``` ts
const close = {
  visible: true,
  text: "Close file",
}
```

### close.visible

Defines if the cross button to close the editor is displayed or hidden. The default value is **true**.

Type: boolean

Example: true

### close.text

Defines the tooltip text for a button in the editor header or the menu item text in the mobile editors and in the **File** menu of the web editors.

Type: string

Example: "Close file"

> Please note that it will only be available if the [onRequestClose](../../Events/index.md#onrequestclose) event is set. If the event is not declared and the *close* parameter is not specified, the cross button will not be displayed.

> Please note that this parameter is also available for the mobile editors.

![Cross button in the header](/assets/images/editor/cross-button.jpg)

## commentAuthorOnly

Defines if the user can edit and delete only his comments. The default value is **false**. Deprecated since version 6.3, please use the [document.permissions.editCommentAuthorOnly](../../Document/Permissions/index.md#editcommentauthoronly) and [document.permissions.deleteCommentAuthorOnly](../../Document/Permissions/index.md#deletecommentauthoronly) fields instead.

Type: boolean

Example: true

## comments

Defines if the **Comments** menu button is displayed or hidden. Please note that in case you hide the **Comments** button, the corresponding commenting functionality will be available for viewing only, adding and editing comments will be unavailable. The default value is **true**.

Type: boolean

Example: true

![Comments](/assets/images/editor/comment.png)

## compactHeader

Defines if the additional action buttons are displayed in the upper part of the editor window header next to the logo (**false**) or in the toolbar (**true**) making the header more compact. The default value is **false**.

Type: boolean

Example: false

![Compact header](/assets/images/editor/compactHeader.png)

## compactToolbar

Defines if the top toolbar type displayed is full (**false**) or compact (**true**). The default value is **false**.

Type: boolean

Example: false

> Please note that in case this setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the *editorConfig.customization.compactToolbar* parameter.

![Compact toolbar](/assets/images/editor/compactToolbar.png)

## compatibleFeatures

Defines the use of functionality only compatible with the OOXML format. For example, do not use comments on the entire document. The default value is **false**.

Type: boolean

Example: false

## customer

Contains the information which will be displayed in the editor **About** section and visible to all the editor users.

> This parameter is available for editing only for ONLYOFFICE Developer Edition.

Type: object

Example:

``` ts
const customer = {
  address: "My City, 123a-45",
  info: "Some additional information",
  logo: "https://example.com/logo-big.png",
  logoDark: "https://example.com/dark-logo-big.png",
  mail: "john@example.com",
  name: "John Smith and Co.",
  phone: "123456789",
  www: "example.com",
}
```

### customer.address

Postal address of the company or person who gives access to the editors or the editor authors.

Type: string

Example: "My City, 123a-45"

### customer.info

Some additional information about the company or person you want the others to know.

Type: string

Example: "Some additional information"

### customer.logo

The path to the image logo (there are no special recommendations for this file, but it would be better if it was in the *.png* format with transparent background). The image must have the following size: 432x70.

Type: string

Example: `https://example.com/logo-big.png`

### customer.logoDark

The path to the image logo for the dark theme (there are no special recommendations for this file, but it would be better if it was in *.png* format with transparent background). The image must have the following size: 432x70.

Type: string

Example: `https://example.com/dark-logo-big.png`

### customer.mail

Email address of the company or person who gives access to the editors or the editor authors.

Type: string

Example: `john@example.com`

### customer.name

The name of the company or person who gives access to the editors or the editor authors.

Type: string

Example: "John Smith and Co."

### customer.phone

The phone of the company or person who gives access to the editors or the editor authors.

Type: string

Example: "123456789"

### customer.www

Home website address of the above company or person.

Type: string

Example: "example.com"

![Customer](/assets/images/editor/customer.png)

## features

Defines the parameters that the user can disable or customize if possible.

Type: object

Example:

``` ts
const features = {
  roles: true,
  spellcheck: {
    mode: true,
    change: true,
  },
}
```

### features.roles

Defines if the role settings will be disabled in the pdf forms or not. If the parameter is equal to **false**, then the role manager is hidden and viewing the form on behalf of a specific role is disabled. In this case, the **Manage Roles** and **View Form** buttons on the **Forms** tab and a drop-down list for setting the field role in the right panel will not be displayed. The default value is **true**.

> This parameter is available for editing only for ONLYOFFICE Developer Edition.

Type: boolean

Example: true

### features.spellcheck

Defines if the spell checker is automatically switched on or off when the editor is loaded. If this parameter is a boolean value, then it is set as the initial spell checker value and the spell checker setting will not be hidden. The default value is **true**.

Type: object or boolean

Example: true

### features.spellcheck.mode

Defines if the spell checker is automatically switched on or off when the editor is loaded. This parameter will only be available for the document editor and the presentation editor.

Type: boolean

Example: true

### features.spellcheck.change

Defines if the spell checker setting will be displayed or not. Spell checker setting is available in all editor types.

> This parameter is an extended white label option for Developer Edition.

Type: boolean

Example: true

> Please note that in case *spellcheck* setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the *editorConfig.customization.features.spellcheck* parameter.

## feedback

Defines settings for the **Feedback & Support** menu button. Can be either boolean (simply displays or hides the **Feedback & Support** menu button) or object.

The default value is **false**.

Type: boolean or object

Example: true

> Please note that this parameter is also available for the mobile editors.

![Feedback](/assets/images/editor/feedback.png)

### feedback.url

The absolute URL to the website address which will be opened when clicking the **Feedback & Support** menu button.

Type: string

Example: `https://example.com`

### feedback.visible

Shows or hides the **Feedback & Support** menu button.

Type: boolean

Example: true

## font

Defines the font for the interface elements (buttons, tabs, etc.).

> This parameter is an extended white label option for Developer Edition.

Type:  object

Example:

``` ts
const font = {
  name: "Arial",
  size: "11px",
}
```

### font.name

The font name.

Type: string

Example: "Arial"

### font.size

The font size.

Type: string

Example: "11px"

## forcesave

Adds the request for the file force saving to the [callback handler](../../../Callback%20handler/index.md#forcesavetype) when saving the document within the **document editing service** (e.g. clicking the **Save** button, etc.). The default value is **false**.

Type: boolean

Example: false

> Please note that in case this setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the *editorConfig.customization.forcesave* parameter.

## goback

Defines settings for the **Open file location** menu button and upper right corner button.

Type: object

Example:

``` ts
const goback = {
  blank: true,
  text: "Open file location",
  url: "https://example.com",
}
```

> Please note that this parameter is also available for the mobile editors.

![Go back](/assets/images/editor/goback.png)

### goback.blank

Opens the website in the new browser tab/window (if the value is set to **true**) or the current tab (if the value is set to **false**) when the **Open file location** button is clicked. The default value is **true**.

Type: boolean

Example: true

### goback.requestClose

Defines that if the **Open file location** button is clicked, [events.onRequestClose](../../Events/index.md#onrequestclose) event is called instead of opening a browser tab or window. Deprecated since version 8.1. Please use the [close](#close) parameter instead.

Type: boolean

Example: false

### goback.text

The text which will be displayed for the **Open file location** menu button and upper right corner button (i.e. instead of *Go to Documents*).

Type: string

Example: "Open file location"

### goback.url

The absolute URL to the website address which will be opened when clicking the **Open file location** menu button.

Type: string

Example: `https://example.com`

## help

Defines if the **Help** menu button is displayed or hidden. The default value is **true**.

Type: boolean

Example: true

> Please note that this parameter is also available for the mobile editors.

![Help](/assets/images/editor/help.png)

## hideNotes

Defines if the note panel is displayed or hidden on first loading. The default value is **false**. This parameter is available for the presentation editor only.

Type: boolean

Example: false

> Please note that in case this setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the *editorConfig.customization.hideNotes* parameter.

![Hide notes](/assets/images/editor/hideNotes.png)

## hideRightMenu

Defines if the right menu is displayed or hidden on first loading. The default value is **true**.

Type: boolean

Example: true

> Please note that in case this setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the *editorConfig.customization.hideRightMenu* parameter.

## hideRulers

Defines if the editor rulers are displayed or hidden. This parameter is available for the document and presentation editors. The default value is **false** for the document editor and **true** for presentations.

Type: boolean

Example: false

![Hide rulers](/assets/images/editor/hideRulers.png)

## integrationMode

Defines the mode of embedding editors into the web page. The **embed** value disables scrolling to the editor frame when it is loaded as the focus is not captured.

Type: string

Example: "embed"

## layout

Defines the parameters that the user can use to hide the interface elements but not to disable features completely (for example, if this functionality is available from other elements such as context menu, or via hotkeys).

> This parameter is an extended white label option for Developer Edition.

Type:  object

Example:

``` ts
const layout = {
  header: {
    editMode: true,
    save: true,
    users: true,
  },
  leftMenu: {
    mode: true,
    navigation: true,
    spellcheck: true,
  },
  rightMenu: {
    mode: true,
  },
  statusBar: {
    actionStatus: true,
    docLang: true,
    textLang: true,
  },
  toolbar: {
    collaboration: {
      mailmerge: true,
    },
    draw: true,
    file: {
      close: true,
      info: true,
      save: true,
      settings: true,
    },
    home: {},
    layout: true,
    plugins: true,
    protect: true,
    references: true,
    save: true,
    view: {
      navigation: true,
    },
  },
}
```

### layout.header

Defines the editor header settings.

Type: object

Example:

``` ts
const header = {
  editMode: true,
  save: true,
  users: true,
}
```

### layout.header.editMode

Defines if a button for switching editor modes will be displayed in the header or not. The default value is **true**.

Type: boolean

Example: true

### layout.header.save

Defines if the **Save** button in the editor header is displayed or hidden. The default value is **true**. Please note that this setting is used when the [compactHeader](#compactheader) parameter is set to **false**.

Type: boolean

Example: true

### layout.header.users

Defines if the button with the editing users is displayed or hidden. The default value is **true**.

Type: boolean

Example: true

### layout.leftMenu

Defines the left menu settings. If this parameter is a boolean value, then it specifies whether the left menu will be displayed or hidden. The default value is **true**.

Type: object or boolean

Example:

``` ts
const leftMenu = {
  mode: true,
  navigation: true,
  spellcheck: true,
}
```

### layout.leftMenu.mode

Defines the initial value of the left panel visibility - displayed or hidden. It is used for the **Left panel** menu option on the **View** tab. The default value is **true**.

Type: boolean

Example: true

### layout.leftMenu.navigation

Defines if the **Navigation** button is displayed or hidden. The default value is **true**. This parameter will only be available for the document editor.

Type: boolean

Example: true

### layout.leftMenu.spellcheck

Defines if the **Spellcheck** button is displayed or hidden. The default value is **true**. This parameter will only be available for the spreadsheet editor.

Type: boolean

Example: true

### layout.rightMenu

Defines the right menu settings. If this parameter is a boolean value, then it specifies whether the right menu will be displayed or hidden. The default value is **true**.

Type: object or boolean

Example:

``` ts
const rightMenu = {
  mode: true,
}
```

### layout.rightMenu.mode

Defines the initial value of the right panel visibility - displayed or hidden. It is used for the **Right panel** menu option on the **View** tab. The default value is **true**.

Type: boolean

Example: true

### layout.statusBar

Defines the status bar settings. If this parameter is a boolean value, then it specifies whether the status bar will be displayed or hidden. The default value is **true**.

Type: object or boolean

Example:

``` ts
const statusBar = {
  actionStatus: true,
  docLang: true,
  textLang: true,
}
```

### layout.statusBar.actionStatus

Defines if an action status is displayed or hidden. The default value is **true**.

Type: boolean

Example: true

### layout.statusBar.docLang

Defines if a button for choosing the document language is displayed or hidden. The default value is **true**. This parameter will only be available for the document editor and the presentation editor.

Type: boolean

Example: true

### layout.statusBar.textLang

Defines if a button for choosing the text language is displayed or hidden. The default value is **true**. This parameter will only be available for the document editor and the presentation editor.

Type: boolean

Example: true

### layout.toolbar

Defines the toolbar settings. If this parameter is a boolean value, then it specifies whether the toolbar will be displayed or hidden. The default value is **true**.

Type: object or boolean

Example:

``` ts
const toolbar = {
  collaboration: {
    mailmerge: true,
  },
  draw: true,
  file: {
    close: true,
    info: true,
    save: true,
    settings: true,
  },
  home: {},
  layout: true,
  plugins: true,
  protect: true,
  references: true,
  save: true,
  view: {
    navigation: true,
  },
}
```

### layout.toolbar.collaboration

Defines the **Collaboration** tab settings. If this parameter is a boolean value, then it specifies whether the **Collaboration** tab will be displayed or hidden. The default value is **true**.

Type: object or boolean

Example:

``` ts
const collaboration = {
  mailmerge: true,
}
```

### layout.toolbar.collaboration.mailmerge

Defines if the button for choosing the mail merge base is displayed or hidden. The default value is **true**.

Type: boolean

Example: true

### layout.toolbar.draw

Defines if the **Draw** tab is displayed or hidden. The default value is **true**.

Type: boolean

Example: true

### layout.toolbar.file

Defines the **File** tab settings. If this parameter is a boolean value, then it specifies whether the **File** tab will be displayed or hidden. The default value is **true**.

Type: object or boolean

Example:

``` ts
const file = {
  close: true,
  info: true,
  save: true,
  settings: true,
}
```

### layout.toolbar.file.close

Defines if the **Close menu** option is displayed or hidden. The default value is **true**.

Type: boolean

Example: true

### layout.toolbar.file.info

Defines if the **Document info** option is displayed or hidden. The default value is **true**.

Type: boolean

Example: true

### layout.toolbar.file.save

Defines if the **Save** option is displayed or hidden. The default value is **true**.

Type: boolean

Example: true

### layout.toolbar.file.settings

Defines if the **Advanced settings** option is displayed or hidden. The default value is **true**.

Type: boolean

Example: true

### layout.toolbar.home

Defines the **Home** tab settings. This tab cannot be hidden.

Type: object

Example: {}

### layout.toolbar.home.mailmerge

Defines if the button for choosing the mail merge base is displayed or hidden. This parameter is deprecated, please use the *toolbar.collaboration.mailmerge* parameter instead.

Type: boolean

Example: true

### layout.toolbar.layout

Defines if the **Layout** tab is displayed or hidden. This parameter will only be available for the document editor and the spreadsheet editor. The default value is **true**.

Type: boolean

Example: true

### layout.toolbar.plugins

Defines if the **Plugins** tab is displayed or hidden. The default value is **true**.

Type: boolean

Example: true

### layout.toolbar.protect

Defines if the **Protection** tab is displayed or hidden. The default value is **true**.

Type: boolean

Example: true

### layout.toolbar.references

Defines if the **References** tab is displayed or hidden. This parameter will only be available for the document editor. The default value is **true**.

Type: boolean

Example: true

### layout.toolbar.save

Defines if the **Save** button on the toolbar is displayed or hidden. The default value is **true**. Please note that this setting is used when the [compactHeader](#compactheader) parameter is set to **true**.

Type: boolean

Example: true

### layout.toolbar.view

Defines the **View** tab settings. If this parameter is a boolean value, then it specifies whether the **View** tab will be displayed or hidden. The default value is **true**.

Type: object or boolean

Example:

``` ts
const view = {
  navigation: true,
}
```

### layout.toolbar.view.navigation

Defines if the **Navigation** button is displayed or hidden. The default value is **true**. This parameter will only be available for the document editor.

Type: boolean

Example: true

## leftMenu

Defines if the left menu panel is displayed or hidden. The default value is **true**.

> This parameter is an extended white label option for Developer Edition.

> Deprecated since version 7.1. Please use the [layout.leftMenu](#layoutleftmenu) parameter instead.

Type: boolean

Example: true

## loaderLogo

Defines the path to the image logo which will be displayed while the document is being loaded (there are no special recommendations for this file, but it would be better if it were in .png format with transparent background). The image will be proportionally resized to the height of 160 pixels when displayed in the editors.

> This parameter is an extended white label option for Developer Edition.

Type: string

Example: `https://example.com/loader-logo.png`

## loaderName

Defines the text which will be displayed while the document is being loaded.

> This parameter is an extended white label option for Developer Edition.

Type: string

Example: "The document is loading, please wait..."

## logo

Changes the image file at the top left corner of the editor header. The recommended image height is 20 pixels.

> This parameter is available for editing only for ONLYOFFICE Developer Edition.

Type: object

Example:

``` ts
const logo = {
  image: "https://example.com/logo.png",
  imageDark: "https://example.com/dark-logo.png",
  url: "https://example.com",
  visible: true,
}
```

> Please note that this parameter is also available for the mobile editors.

### logo.image

Path to the image file used to show in the common work mode (i.e. in view and edit modes for all editors) or in the embedded mode (see the [config](../../index.md#type) section to find out how to define the **embedded** document type). The image must have the following size: 172x40.

Type: string

Example: `https://example.com/logo.png`

### logo.imageDark

Path to the image file used for the dark theme. The image must have the following size: 172x40.

Type: string

Example: `https://example.com/dark-logo.png`

### logo.imageEmbedded

Path to the image file used to show in the embedded mode (see the [config](../../index.md#type) section to find out how to define the **embedded** document type). The image must have the following size: 248x40. Deprecated since version 7.0, please use the *image* field instead.

Type: string

Example: `https://example.com/logo_em.png`

### logo.url

The absolute URL which will be used when someone clicks the logo image (can be used to go to your web site, etc.). Leave as an empty string or *null* to make the logo not clickable.

Type: string

Example: `https://example.com`

### logo.visible

Shows or hides the logo. The default value is **true**.

Type: boolean

Example: true

## macros

Defines if document macros will be automatically run when the editor opens. The default value is **true**. The **false** value hides the [macros settings](#macrosmode) from the user.

Type: boolean

Example: true

## macrosMode

Defines the macros run mode when autostart is enabled. Can take the following values:

- **disable** - don't run macros at all;
- **enable** - run all macros automatically;
- **warn** - warn about macros and ask permission to run them.

The default value is **warn**.

Type: string

Example: "warn"

> Please note that in case this setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the *editorConfig.customization.macrosMode* parameter.

> Please note that this parameter is also available for the mobile editors.

## mentionShare

Defines the hint that describes the event after mentions in a comment. If **true**, a hint indicates that the user will receive a notification and access to the document. If **false**, a hint indicates that the user will receive only a notification of the mention. The default value is **true**.

Type: boolean

Example: true

> Please note that it will only be available for the comments if the [onRequestSendNotify](../../Events/index.md#onrequestsendnotify) event is set.

<img alt="Mention share" src="/assets/images/editor/mentionShare.png" width="379px">

## mobileForceView

Defines if the mobile document editor is opened in the view/edit mode on launch. The default value is **true**.

Type: boolean

Example: true

> Please note that this parameter is only available for the mobile editors.

## plugins

Defines if [plugins](../../../../../Plugin%20and%20Macros/Get%20Started/Overview/index.md) will be launched and available. The default value is **true**.

Type: boolean

Example: true

## review

Contains the information about the review mode.

Type: object

Example:

``` ts
const review = {
  hideReviewDisplay: false,
  showReviewChanges: false,
  reviewDisplay: "original",
  trackChanges: true,
  hoverMode: false,
}
```

> The [showReviewChanges](#showreviewchanges), [reviewDisplay](#reviewdisplay), [trackChanges](#trackchanges) parameters are deprecated since version 7.0. Please use the *review* parameter instead.

> Please note that in case this setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the *editorConfig.customization.review\.hoverMode* and the *editorConfig.customization.review\.reviewDisplay* parameters.

![Review display](/assets/images/editor/reviewDisplay.png)

### review.hideReviewDisplay

Defines if the **Display mode** button is displayed or hidden on the **Collaboration** tab. The default value is **false**.

Type: boolean

Example: false

### review.hoverMode

Defines the review display mode: show reviews in tooltips by hovering the changes (**true**) or in balloons by clicking the changes (**false**). The default value is **false**.

Type: boolean

Example: false

### review.reviewDisplay

Defines the review editing mode which will be used when the document is opened for viewing. It will only be available for the document editor if [mode](../../Editor/index.md#mode) is set to **view**. Can take the following values:

- **markup** - the document is displayed with proposed changes highlighted;
- **simple** - the document is displayed with proposed changes highlighted, but the balloons are turned off;
- **final** - the document is displayed with all the proposed changes applied;
- **original** - the original document is displayed without the proposed changes.

The default value is **original**.

Type: string

Example: "original"

### review.showReviewChanges

Defines if the review changes panel is automatically displayed or hidden when the editor is loaded. The default value is **false**.

Type: boolean

Example: false

### review.trackChanges

Defines if the document is opened in the review editing mode (**true**) or not (**false**) regardless of the [document.permissions.review](../../Document/Permissions/index.md#review) parameter (the review mode is changed only for the current user). If the parameter is *undefined*, the *document.permissions.review* value is used (for all the document users).

Type: boolean

Example: true

## reviewDisplay

Defines the review editing mode in the document editor. This parameter can take the following values:

- **markup** - the document is displayed with proposed changes highlighted;
- **simple** - the document is displayed with proposed changes highlighted, but the balloons are turned off;
- **final** - the document is displayed with all the proposed changes applied;
- **original** - the original document is displayed without the proposed changes.

The default value is **original** for viewer and **markup** for editor.                                                                   

Type: string

Example: "original"

> Deprecated since version 7.0. Please use the [review.reviewDisplay](#review) parameter instead.

> Please note that in case this setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the *editorConfig.customization.reviewDisplay* parameter.

## rightMenu

Defines if the right menu panel is displayed or hidden. The default value is **true**.

> This parameter is an extended white label option for Developer Edition.

> Deprecated since version 7.1. Please use the [layout.rightMenu](#layoutrightmenu) parameter instead.

Type: boolean

Example: true

## showReviewChanges

Defines if the review changes panel is automatically displayed or hidden when the editor is loaded. The default value is **false**.

Type: boolean

Example: false

> Deprecated since version 7.0. Please use the [review.showReviewChanges](#review) parameter instead.

## spellcheck

Defines if the spell checker is automatically switched on or off when the editor is loaded. Spell checker will only be available for the document editor and the presentation editor. The default value is **true**.

Type: boolean

Example: true

> Deprecated since version 7.1. Please use the [features.spellcheck](#features) parameter instead.

> Please note that in case this setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the *editorConfig.customization.spellcheck* parameter.

## statusBar

Defines if the status bar is displayed or hidden. The default value is **true**.

> This parameter is an extended white label option for Developer Edition.

> Deprecated since version 7.1. Please use the [layout.statusBar](#layoutstatusbar) parameter instead.

Type: boolean

Example: true

## submitForm

Defines if the **Complete & Submit** button is displayed or hidden on the top toolbar. Button will only be available for the *pdf* format. The default value is **false**.

Type: boolean

Example: true

![Submit button](/assets/images/editor/submitForm.png)

## toolbar

Defines if the top toolbar is displayed or hidden. The default value is **true**.

> This parameter is an extended white label option for Developer Edition.

> Deprecated since version 7.1. Please use the [layout.toolbar](#layouttoolbar) parameter instead.

Type: boolean

Example: true

## toolbarHideFileName

Defines if the document title is visible on the top toolbar (**false**) or hidden (**true**). The default value is **false**.

Type: boolean

Example: false

> Please note that this setting is used when the [compactHeader](#compactheader) and [toolbarNoTabs](#toolbarnotabs) parameters are set to **true**.

![Toolbar hide file name](/assets/images/editor/toolbarHideFileName.png)

## toolbarNoTabs

Defines if the top toolbar tabs are distinctly displayed (**false**) or only highlighted to see which one is selected (**true**). The default value is **false**. 

Type: boolean

Example: false

![Toolbar no tabs](/assets/images/editor/toolbarNoTabs.png)

## trackChanges

Defines if the document is opened in the review editing mode (**true**) or not (**false**) regardless of the [document.permissions.review](../../Document/Permissions/index.md#review) parameter (the review mode is changed only for the current user). If the parameter is *undefined*, the *document.permissions.review* value is used (for all the document users). 

Type: boolean

Example: true

> Deprecated since version 7.0. Please use the [review.trackChanges](#review.trackchanges) parameter instead.

## uiTheme

Defines the editor theme settings. It can be set in two ways:

- **theme id** - the user sets the theme parameter by its id (**theme-light**, **theme-classic-light**, **theme-dark**, **theme-contrast-dark**);
- **default theme** - the default dark or light theme value will be set (**default-dark**, **default-light**). The default light theme is **theme-classic-light**.

The first option has higher priority.

Apart from the available editor themes, the user can also customize their own [color themes](https://helpcenter.onlyoffice.com/installation/docs-developer-change-theme.aspx) for the application interface.

Type: string

Example: "theme-dark"

> Please note that in case this setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the *editorConfig.customization.uiTheme* parameter.

## unit

Defines the measurement units used on the ruler and in dialog boxes. Can take the following values:

- **cm** - centimeters;
- **pt** - points;
- **inch** - inches.

The default value is centimeters (**cm**).

Type: string

Example: "cm"

> Please note that in case this setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the *editorConfig.customization.unit* parameter.

## zoom

Defines the document display zoom value measured in percent. Can take values larger than **0**. For text documents and presentations it is possible to set this parameter to **-1** (fitting the document to page option) or to **-2** (fitting the document page width to the editor page). The default value is **100**.

Type: integer

Example: 100

> Please note that in case this setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the *editorConfig.customization.zoom* parameter.

![Customization](/assets/images/editor/customization.png)

## Example

``` ts
const docEditor = new DocsAPI.DocEditor("placeholder", {
  editorConfig: {
    customization: {
      about: true,
      anonymous: {
        request: true,
        label: "Guest",
      },
      autosave: true,
      close: {
        visible: true,
        text: "Close file",
      },
      comments: true,
      compactHeader: false,
      compactToolbar: false,
      compatibleFeatures: false,
      customer: {
        address: "My City, 123a-45",
        info: "Some additional information",
        logo: "https://example.com/logo-big.png",
        logoDark: "https://example.com/dark-logo-big.png",
        mail: "john@example.com",
        name: "John Smith and Co.",
        phone: "123456789",
        www: "example.com",
      },
      features: {
        roles: true,
        spellcheck: {
          mode: true,
          change: true,
        },
      },
      feedback: {
        url: "https://example.com",
        visible: true,
      },
      font: {
        name: "Arial",
        size: "11px",
      },
      forcesave: false,
      goback: {
        blank: true,
        text: "Open file location",
        url: "https://example.com",
      },
      help: true,
      hideNotes: false,
      hideRightMenu: true,
      hideRulers: false,
      integrationMode: "embed",
      layout: {
        header: {
          editMode: true,
          save: true,
          users: true,
        },
        leftMenu: {
          mode: true,
          navigation: true,
          spellcheck: true,
        },
        rightMenu: {
          mode: true,
        },
        statusBar: {
          actionStatus: true,
          docLang: true,
          textLang: true,
        },
        toolbar: {
          collaboration: {
            mailmerge: true,
          },
          draw: true,
          file: {
            close: true,
            info: true,
            save: true,
            settings: true,
          },
          home: {},
          layout: true,
          plugins: true,
          protect: true,
          references: true,
          save: true,
          view: {
            navigation: true,
          },
        },
      },
      loaderLogo: "https://example.com/loader-logo.png",
      loaderName: "The document is loading, please wait...",
      logo: {
        image: "https://example.com/logo.png",
        imageDark: "https://example.com/dark-logo.png",
        url: "https://example.com",
        visible: true,
      },
      macros: true,
      macrosMode: "warn",
      mentionShare: true,
      mobileForceView: true,
      plugins: true,
      review: {
        hideReviewDisplay: false,
        showReviewChanges: false,
        reviewDisplay: "original",
        trackChanges: true,
        hoverMode: false,
      },
      submitForm: true,
      toolbarHideFileName: false,
      toolbarNoTabs: false,
      uiTheme: "theme-dark",
      unit: "cm",
      zoom: 100,
    },
  },
})
```

The **example.com** is the name of the server where **document manager** and **document storage service** are installed. See the [How it works](../../../../Get%20Started/How%20It%20Works/index.md) section to find out more on ONLYOFFICE Docs service client-server interactions.
