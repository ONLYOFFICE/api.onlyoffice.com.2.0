The **Review option** allows you to review a document, change sentences, phrases and other page elements, correct spelling, etc. without actually editing it. All the changes will be recorded and shown to the user who created the document.

![](/content/img/editor/review.png)

## Review access rights

In order to enable the review option, the [review](/editors/config/document/permissions#review) parameter in the permissions section of the document initialization must be set to **true**. The document **status bar** will contain the **Review** menu option.

In case the *edit* parameter is set to **true** and the *review* parameter is also set to **true**, the user will be able to edit the document, accept or reject the changes and switch to the review mode him/herself.

![Reviewing](/content/img/editor/accept_reject.png)

In case the *edit* parameter is set to **false** and the *review* parameter is set to **true**, the document will be available for reviewing only.

```
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "document": {
        "permissions": {
            "edit": false,
            "review": true
        },
        ...
    },
    ...
});
```

Please note that the document review will only be available for the document editor if the [mode](/editors/config/editor#mode) parameter is set to **edit**.

## Differentiation of reviewing rights by groups

1. Specify the group (or several groups separated with commas) the user belongs to by adding the field *group* to the [user](/editors/config/editor#user) parameter in the editorConfig section.

   ```
   var docEditor = new DocsAPI.DocEditor("placeholder", {
       "editorConfig": {
           "user": {
               "id": "78e1e841",
               "name": "John Smith",
               "group": "Group1,Group2"
           }
       },
       ...
   });

   var docEditor = new DocsAPI.DocEditor("placeholder", {
       "editorConfig": {
           "user": {
               "id": "F89d8069ba2b",
               "name": "Kate Cage",
               "group": "Group2"
           }
       },
       ...
   });
   ```

2. Specify the access rights using the [reviewGroups](/editors/config/document/permissions#reviewGroups) parameter in the permissions section of the editor initialization.

   If the **reviewGroups** parameter is specified in the editor config, the access rights to reviewing all changes are disabled. Otherwise, if the current user does not belong to any of the groups, he or she can review documents of all groups.

   ```
   var docEditor = new DocsAPI.DocEditor("placeholder", {
       "document": {
           "permissions": {
               "reviewGroups": ["Group1", "Group2"],
               ...
           }
           ...
       },
       ...
   });
   ```

   *\["Group1", "Group2"]* means that user can review changes made by users from *Group1* and *Group2*.

   The [reviewGroups](/editors/config/document/permissions#reviewGroups) parameter can take the value of an empty group. This means that the user can review changes made by users who do not belong to any of the groups (for example, the document that is reviewed in third-party editors).

   ```
   var docEditor = new DocsAPI.DocEditor("placeholder", {
       "document": {
           "permissions": {
               "reviewGroups": ["Group2", ""],
               ...
           }
           ...
       },
       ...
   });
   ```

   *\["Group2", ""]* means that user can review changes made by users from *Group2* and users who do not belong to any of the groups.
