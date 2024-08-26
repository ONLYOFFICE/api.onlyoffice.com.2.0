---
order: -9
---

The **Comment option** allows you to leave comments on the specific words, phrases, sentences and other document parts, edit and remove these comments. All the comments will be saved and shown to other document users.

![Comment](/assets/images/editor/comment.png)

## Comment access rights

In order to enable the comment option, the [comment](../../../Usage%20API/Config/Document/Permissions/index.md#comment) parameter in the permissions section of the document initialization must be set to **true**. The document **side bar** will contain the **Comment** menu option.

In case the *edit* parameter is set to **true** and the *comment* parameter is also set to **true**, the user will be able to edit the document and comment.

![Commenting](/assets/images/editor/commenting.png)

In case the *edit* parameter is set to **false** and the *comment* parameter is set to **true**, the document will be available for commenting only.

``` ts
const docEditor = new DocsAPI.DocEditor("placeholder", {
  document: {
    permissions: {
      edit: false,
      comment: true,
    },
  },
})
```

> Please note that the document commenting will only be available for the document editor if the [mode](../../../Usage%20API/Config/Editor/index.md#mode) parameter is set to **edit**.

## Differentiation of commenting rights by authors

1. If you want to allow editing comments only by their authors, set the [editCommentAuthorOnly](../../../Usage%20API/Config/Document/Permissions/index.md#editcommentauthoronly) parameter in the permissions section of the editor initialization to **true**.

   ``` ts
   const docEditor = new DocsAPI.DocEditor("placeholder", {
     document: {
       permissions: {
         editCommentAuthorOnly: true,
       },
     },
   })
   ```

2. If you want to allow deleting comments only by their authors, set the [deleteCommentAuthorOnly](../../../Usage%20API/Config/Document/Permissions/index.md#deletecommentauthoronly) parameter in the permissions section of the editor initialization to **true**.

   ``` ts
   const docEditor = new DocsAPI.DocEditor("placeholder", {
     document: {
       permissions: {
         deleteCommentAuthorOnly: true,
       },
     },
   })
   ```

## Differentiation of commenting rights by groups

1. Specify the group (or several groups separated with commas) the user belongs to by adding the field *group* to the [user](../../../Usage%20API/Config/Editor/index.md#user) parameter in the editorConfig section.

  ``` ts
  const docEditor = new DocsAPI.DocEditor("placeholder", {
    editorConfig: {
      user: [{
        id: "78e1e841",
        name: "John Smith",
        group: "Group1,Group2",
      },
      {
        id: "78e1e841",
        name: "John Smith",
        group: "Group1,Group2",
      }],
    },
  })
  ```

2. Specify the access rights using the [commentGroups](../../../Usage%20API/Config/Document/Permissions/index.md#commentgroups) parameter in the permissions section of the editor initialization.

   > If the **commentGroups** parameter is specified in the editor config, the access rights to viewing, editing and/or removing all comments are disabled. Otherwise, if the current user does not belong to any of the groups, he or she can edit, remove and/or view comments of all groups.

   ``` ts
   const docEditor = new DocsAPI.DocEditor("placeholder", {
     document: {
       permissions: {
         commentGroups: {
           edit: ["Group2", ""],
           remove: [""],
           view: "",
         },
       },
     },
   })
   ```

   - *"edit": \["Group2", ""]* means that the user can edit comments made by users from *Group2* and users who do not belong to any of the groups (for example, the document that is commented in third-party editors).
   - *"remove": \[""]* means that the user can remove comments made by someone who belongs to none of these groups (for example, the document that is commented in third-party editors).
   - *"view": ""* means that the user can view comments made by any user.

## Threaded comments in spreadsheets

To display ONLYOFFICE spreadsheet comments in other editors correctly, all the comments are saved in two formats - original and threaded:

1. The **original comment format** looks as follows:

   ```txt
   ${author1}:
   comment
   ${author2}:
   reply1
   ${author2}:
   reply2
   ```

   ![Threaded comments](/assets/images/editor/comments-threaded.png)

2. To convert the original comments format into the **threaded comments**, the *"${author}:\n"* string is deleted if the comment starts with it.

The file in the editors opens as follows:

- If there are threaded comments in the file, they are used when opening.
- If there are comments in the original ONLYOFFICE format only, they are converted into threaded comments.
