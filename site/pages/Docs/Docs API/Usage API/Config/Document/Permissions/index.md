The document permission section allows to change the permission for the document to be edited and downloaded or not.

## changeHistory

Allows to display the *Restore* button when using the [onRequestRestore](../../Events/index.md#onrequestrestore) event. The default value is **false**. Deprecated since version 5.5, please add the [onRequestRestore](../../Events/index.md#onrequestrestore) field instead.

Type: boolean

Example: true

## chat

Defines if the chat functionality is enabled in the document or not. In case the chat permission is set to **true**, the **Chat** menu button will be displayed. The default value is **true**.

Type: boolean

Example: true

## comment

Defines if the document can be commented or not. In case the commenting permission is set to **"true"** the document **side bar** will contain the **Comment** menu option; the document commenting will only be available for the document editor if the [mode](../../Editor/index.md#mode) parameter is set to **edit**. The default value coincides with the value of the [edit](#edit) parameter.

Type: boolean

Example: true

> In case *edit* is set to **"true"** and *comment* is also set to **"true"**, the user will be able to edit the document and comment. In case *edit* is set to **"true"** and *comment* is set to **"false"**, the user will be able to edit only, the corresponding commenting functionality will be available for viewing only, the adding and editing of comments will be unavailable. In case *edit* is set to **"false"** and *comment* is set to **"true"**, the document will be available for commenting only. In case *edit* is set to **"false"** and *review* is set to **"false"** and *comments* is set to **"true"** the *fillForms* value is not considered and filling the forms is not available.

![Comments](/assets/images/editor/comment.png)

## commentGroups

Defines the [groups](../../Editor/index.md#user) whose comments the user can edit, remove and/or view.

The *\[""]* value means that the user can edit/remove/view comments made by someone who belongs to none of these groups (for example, if the document is reviewed in third-party editors). If the value is *\[]*, the user cannot edit/remove/view comments made by any group. If the *edit*, *remove* and *view* parameters are *""* or not specified, then the user can view/edit/remove comments made by any user.

Type: object

Example:

``` ts
const config = {
  edit: ["Group2", ""],
  remove: [""],
  view: "",
}
```

### commentGroups.edit

The user can edit comments made by other users.

Type: list

Example: \["Group2", ""]

### commentGroups.remove

The user can remove comments made by other users.

Type: list

Example: []

### commentGroups.view

The user can view comments made by other users.

Type: list

Example: ""

## copy

Defines if the content can be copied to the clipboard or not. In case the parameter is set to **false**, pasting the content will be available within the current document editor only. The default value is **true**.

Type: boolean

Example: true

## deleteCommentAuthorOnly

Defines if the user can delete only his/her comments. The default value is **false**.

Type: boolean

Example: true

## download

Defines if the document can be downloaded or only viewed or edited online. In case the downloading permission is set to **"false"** the **Download as...** menu option will be absent from the **File** menu. The default value is **true**.

Type: boolean

Example: true

![Download document](/assets/images/editor/download.png)

## edit

Defines if the document can be edited or only viewed. In case the editing permission is set to **"true"** the **File** menu will contain the **Edit Document** menu option; please note that if the editing permission is set to **"false"** the document will be opened in viewer and you will **not** be able to switch it to the editor even if the [mode](../../Editor/index.md#mode) parameter is set to **edit**. The default value is **true**.

Type: boolean

Example: true

![Edit document](/assets/images/editor/edit.png)

## editCommentAuthorOnly

Defines if the user can edit only his/her comments. The default value is **false**.

Type: boolean

Example: true

## fillForms

Defines if the forms can be filled. Filling in forms will only be available for the document and pdf editors if the [mode](../../Editor/index.md#mode) parameter is set to **edit**. The default value coincides with the value of the [edit](#edit) or the [review](#review) parameter. 

Type: boolean

Example: true

> In case *edit* is set to **"true"** or *review* is set to **"true"**, the *fillForms* value is not considered and the form filling is possible. In case *edit* is set to **"false"** and *review* is set to **"false"** and *fillForms* is also set to **"true"**, the user can only fill forms in the document. In case *edit* is set to **"false"** and *review* is set to **"false"** and *fillForms* is set to **"true"** the *comments* value is not considered and the commenting is not available. The form filling only mode is currently available for **Document Editor** only.

![Fill forms](/assets/images/editor/fill-forms.png)

## modifyContentControl

Defines if the content control settings can be changed. Content control modification will only be available for the document editor if the [mode](../../Editor/index.md#mode) parameter is set to **edit**. The default value is **true**.

Type: boolean

Example: true

## modifyFilter

Defines if the filter can applied globally (**true**) affecting all the other users, or locally (**false**), i.e. for the current user only. Filter modification will only be available for the spreadsheet editor if the [mode](../../Editor/index.md#mode) parameter is set to **edit**. The default value is **true**.

Type: boolean

Example: true

> In case the document is edited by a user with the full access rights, the filters applied by such a user will be visible to all other users despite their local settings.

## print

Defines if the document can be printed or not. In case the printing permission is set to **"false"** the **Print** menu option will be absent from the **File** menu. The default value is **true**.

Type: boolean

Example: true

![Print document](/assets/images/editor/print.png)

## protect

Defines if the **Protection** tab on the toolbar and the **Protect** button in the left menu are displayed (**true**) or hidden (**false**). The default value is **true**.

Type: boolean

Example: true

![Protect document](/assets/images/editor/protect.png)

## rename

Allows to display the *Rename...* button when using the [onRequestRename](../../Events/index.md#onrequestrename) event. The default value is **false**. Deprecated since version 6.0, please add the [onRequestRename](../../Events/index.md#onrequestrename) field instead.

Type: boolean

Example: true

## review

Defines if the document can be reviewed or not. In case the reviewing permission is set to **true** the document **status bar** will contain the **Review** menu option; the document review will only be available for the document editor if the [mode](../../Editor/index.md#mode) parameter is set to **edit**. The default value coincides with the value of the [edit](#edit) parameter.

Type: boolean

Example: true

> In case *edit* is set to **"true"** and *review* is also set to **"true"**, the user will be able to edit the document, accept/reject the changes made and switch to the review mode him/herself. In case *edit* is set to **"true"** and *review* is set to **"false"**, the user will be able to edit only. In case *edit* is set to **"false"** and *review* is set to **"true"**, the document will be available in review mode only.

![Review document](/assets/images/editor/review.png)

## reviewGroups

Defines the [groups](../../Editor/index.md#user) whose changes the user can accept/reject. The *\[""]* value means that the user can review changes made by someone who belongs to none of these groups (for example, if the document is reviewed in third-party editors). If the value is *\[]*, the user cannot review changes made by any group. If the value is *""* or not specified, then the user can review changes made by any user.

Type: array of string

Example: \["Group1", "Group2", ""]

## userInfoGroups

Defines the groups of users whose information is displayed in the editors:

- the usernames are displayed in the list of the editing users in the editor header;
- when typing text, the user cursors and tooltips with their names are displayed;
- when locking objects in the strict co-editing mode, the usernames are displayed.

The *\["Group1", ""]* means that the information about users from Group1 and users who don't belong to any group is displayed. The *\[]* means that no user information is displayed at all. The *undefined* or *""* values mean that the information about all users is displayed.

Type: array of string

Example: \["Group1", ""]

## Example

``` ts
const docEditor = new DocsAPI.DocEditor("placeholder", {
  document: {
    permissions: {
      chat: true,
      comment: true,
      copy: true,
      commentGroups: {
        edit: ["Group2", ""],
        remove: [""],
        view: "",
      },
      deleteCommentAuthorOnly: false,
      download: true,
      edit: true,
      editCommentAuthorOnly: false,
      fillForms: true,
      modifyContentControl: true,
      modifyFilter: true,
      print: true,
      protect: true,
      review: false,
      reviewGroups: ["Group1", "Group2", ""],
      userInfoGroups: ["Group1", ""],
    }
    ,
  },
})
```
