The document info section allows to change additional parameters for the document (document owner, folder where the document is stored, uploading date, sharing settings).

## author

Defines the name of the document author/creator. Deprecated since version 5.4, please use [owner](#owner) instead.

Type: string

Example: "John Smith"

## created

Defines the document creation date. Deprecated since version 5.4, please use [uploaded](#uploaded) instead.

Type: string

Example: "2010-07-07 3:46 PM"

## favorite

Defines the highlighting state of the *Favorite* icon. When the user clicks the icon, the [onMetaChange](../../Events/index.md#onmetachange) event is called. If the parameter is *undefined*, the *Favorite* icon is not displayed at the editor window header.

Type: boolean

Example: true

![Favorite](/assets/images/editor/favorite.png)

## folder

Defines the folder where the document is stored (can be empty in case the document is stored in the root folder).

Type: string

Example: "Example Files"

## owner

Defines the name of the document owner/creator.

Type: string

Example: "John Smith"

## sharingSettings

Displays the information about the settings which allow to share the document with other users.

Type: array of object

Example:

``` ts
[
  {
    permissions: "Full Access",
    user: "John Smith",
  },
]
```

### sharingSettings.isLink

Changes the user icon to the link icon.

Type: boolean

Example: false

### sharingSettings.permissions

The access rights for the user with the name above. Can be **Full Access**, **Read Only** or **Deny Access**.

Type: string

Example: "Full Access"

### sharingSettings.user

The name of the user the document will be shared with.

Type: string

Example: "John Smith"

![Sharing settings](/assets/images/editor/sharing_settings.png) 

## uploaded

Defines the document uploading date.

Type: string

Example: "2010-07-07 3:46 PM"

![Document information](/assets/images/editor/info.png)

## Example

``` ts
const docEditor = new DocsAPI.DocEditor("placeholder", {
  document: {
    info: {
      favorite: false,
      folder: "Example Files",
      owner: "John Smith",
      sharingSettings: [
        {
          permissions: "Full Access",
          user: "John Smith",
        },
      ],
      uploaded: "2010-07-07 3:46 PM",
    }
    ,
  },
})
```
