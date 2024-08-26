---
order: -10
---

## How to open a document with "track changes" mode enabled?

To open the document with the *track changes* mode enabled, the *document.permissions* parameter is used (see the complete structure of ONLYOFFICE Docs configuration object [here](../../../Usage%20API/Advanced%20parameters/index.md)).

There are three main variants how the document can be opened with the *track changes* mode enabled:

1. Both reviewing and editing enabled: if both the *document.permission.edit* and *document.permission.review* parameters are set to **true**, the user will be able to edit the document, accept/reject the changes made and switch to the review mode him-/herself. The configuration in this case will look like this:

  ``` ts
  const docEditor = new DocsAPI.DocEditor("placeholder", {
    document: {
      permissions: {
        edit: true,
        review: true,
      },
    },
    editorConfig: {
      mode: "edit",
    },
  })
  ```

2. Reviewing only enabled: if the *document.permission.edit* parameter is set to **false** and *document.permission.review* is set to **true**, the user will be able to open the document in review mode only. The configuration in this case will look like this:

  ``` ts
  const docEditor = new DocsAPI.DocEditor("placeholder", {
    document: {
      permissions: {
        edit: false,
        review: true,
      },
    },
    editorConfig: {
      mode: "edit",
    },
  })
  ```

3. Reviewing and commenting enabled: if the *document.permission.edit* parameter is set to **false**, *document.permission.review* and *document.permission.comment* are both set to **true**, the user will be able to open the document in review mode with possibility to comment it, but will not be able to edit it. The configuration in this case will look like this:

  ``` ts
  const docEditor = new DocsAPI.DocEditor("placeholder", {
    document: {
      permissions: {
        edit: false,
        comment: true,
        review: true,
      },
    },
    editorConfig: {
      mode: "edit",
    },
  })
  ```

Further information about the permissions can be found [at this page](../../../Usage%20API/Config/Document/Permissions/index.md).

## How to open a document with "commenting" mode enabled?

To open the document with the *commenting* mode enabled, the *document.permissions* parameter is used (see the complete structure of ONLYOFFICE Docs configuration object [here](../../../Usage%20API/Advanced%20parameters/index.md)).

There are the following main variants how the document can be opened with the commenting mode enabled:

1. Both commenting and editing enabled: if both the *document.permission.edit* and *document.permission.comment* parameters are set to **true**, the user will be able to edit the document and comment. The configuration in this case will look like this:

  ``` ts
  const docEditor = new DocsAPI.DocEditor("placeholder", {
    document: {
      permissions: {
        edit: true,
        comment: true,
      },
    },
    editorConfig: {
      mode: "edit",
    },
  })
  ```

2. Commenting only enabled: if the *document.permission.edit* parameter is set to **false** and *document.permission.comment* is set to **true**, the document will be available for commenting only. The configuration in this case will look like this:

  ``` ts
  const docEditor = new DocsAPI.DocEditor("placeholder", {
    document: {
      permissions: {
        edit: false,
        comment: true,
      },
    },
    editorConfig: {
      mode: "edit",
    },
  })
  ```

3. Reviewing and commenting enabled: if the *document.permission.edit* parameter is set to **false**, *document.permission.review* and *document.permission.comment* are both set to **true**, the user will be able to open the document in review mode with possibility to comment it, but will not be able to edit it. The configuration in this case will look like this:

  ``` ts
  const docEditor = new DocsAPI.DocEditor("placeholder", {
    document: {
      permissions: {
        edit: false,
        comment: true,
        review: true,
      },
    },
    editorConfig: {
      mode: "edit",
    },
  })
  ```

4. Comments are available for viewing only: if the *document.permission.edit* parameter is set to **true** and *document.permission.comment* is set to **false**, the user will be able to edit only, the corresponding commenting functionality will be available for viewing only, the adding and editing of comments will be unavailable. The configuration in this case will look like this:

  ``` ts
  const docEditor = new DocsAPI.DocEditor("placeholder", {
    document: {
      permissions: {
        edit: true,
        comment: false,
      },
    },
    editorConfig: {
      mode: "edit",
    },
  })
  ```

Further information about the permissions can be found [at this page](../../../Usage%20API/Config/Document/Permissions/index.md).

## How can the 'fillForms' parameter be used?

Starting from version 5.2, ONLYOFFICE Docs provides functionality for filling special forms without the need to give editing permissions to the user. This can be used, for example, in case you have a document form of some kind and want to give the users the access to this form so that they could fill it, but could not edit other document fields (e.g. fill the names in a contract but not change the contract terms, or fill the variable fields in some other document but leave the other parts of the document intact).

To enable this mode the *document.permissions.fillForms* parameter is used:

``` ts
const docEditor = new DocsAPI.DocEditor("placeholder", {
  document: {
    permissions: {
      edit: false,
      review: false,
      fillForms: true,
      comment: false,
    },
  },
  editorConfig: {
    mode: "edit",
  },
})
```

The *comment* field is optional because the commenting is disabled anyway with the *fillForms* parameter enabled and *edit* and *review* parameters disabled.

With the configuration above the document will be opened with the form filling mode enabled and all the other modes disabled, giving the users who have access to it only the possibility to fill the fields in the special [content controls](https://helpcenter.onlyoffice.com/ONLYOFFICE-Editors/ONLYOFFICE-Document-Editor/UsageInstructions/InsertContentControls.aspx?from=api).

It is then up to you to decide what is done next: either the changes to the editable fields will be saved to the same document or a new document will be created each time the original one is accessed and altered by a new user.

The first scenario can be used if the access to the document will be given only once to a certain user with *fillForms* permissions, then it is saved with all the changes and no other user will have to fill it again.

The second scenario is more commonly used, when you have a document template with some fields not filled and want to give access to it to more users (put it to your website, for example, so that the users filled it right there without the need to download it each time, fill and upload it back again). In this case it will be more reasonable to have this document as a template for future changes and, once the users with the *fillForms* access edit the fields, save it under another name.

Further information about the permissions can be found [at this page](../../../Usage%20API/Config/Document/Permissions/index.md).

## How to enable both the editing and commenting mode for a document?

To open the document with both the *editing* and the *commenting* modes enabled, the *document.permissions* parameter is used (see the complete structure of ONLYOFFICE Docs configuration object [here](../../../Usage%20API/Advanced%20parameters/index.md)).

You will need to set both the *document.permission.edit* and *document.permission.comment* parameters to **true**, so that the user will be able to edit the document and comment. The configuration in this case will look like this:

``` ts
const docEditor = new DocsAPI.DocEditor("placeholder", {
  document: {
    permissions: {
      edit: true,
      comment: true,
    },
  },
  editorConfig: {
    mode: "edit",
  },
})
```

Further information about the permissions can be found [at this page](../../../Usage%20API/Config/Document/Permissions/index.md).

## Do the permission parameters influence each other?

Most permission parameters are independent and are only enabled when their value is set to **true** and disabled when the value is set to **false**. There are, though, several combinations, when the permission will be either enabled or disabled notwithstanding the corresponding parameter value:

- Form filling permission is enabled (even if the *fillForm* parameter is set to **false**) when either the *edit* or *review* parameter is set to **true**.
- Form filling permission is disabled (even if the *fillForm* parameter is set to **true**) when both the *edit* and *review* parameters are set to **false** and the *comment* is set to **true**.
- Commenting permission is disabled (even if the *comment* parameter is set to **true**) when both the *edit* and *review* parameters are set to **false** and the *fillForms* is set to **true**.

You should bear this in mind when you set the necessary permissions and combine different permissions for the same document.

See the interactive table below to find out how different parameters and parameter combinations influence each other and the resulting document permissions.

Further information about the permissions can be found [at this page](../../../Usage%20API/Config/Document/Permissions/index.md).

## How to open the document in a viewer without the option to edit it?

To open the document with both the *viewing* mode enabled, the *document.permissions* parameter is used (see the complete structure of ONLYOFFICE Docs configuration object [here](../../../Usage%20API/Advanced%20parameters/index.md)).

You will need to set the *document.permission.edit*, *document.permission.review* and *document.permission.fillForms* parameters to **false**, so that the user will not be able to either edit, or review the document, or change form fields in it. If you additionally want to disable the commenting functionality for the document, set the *comment* parameter also to **false** (the existing comments will be available for viewing though).

> In case you disable all the editing permissions, we suggest that you also set the *document.permissions.chat* to **false**, so that the users with the access to the document could not spam to the document embedded chat.

The configuration in this case will look like this:

``` ts
const docEditor = new DocsAPI.DocEditor("placeholder", {
  document: {
    permissions: {
      chat: false,
      edit: false,
      review: false,
      fillForms: false,
      comment: false,
    },
  },
})
```

Further information about the permissions can be found [at this page](../../../Usage%20API/Config/Document/Permissions/index.md).

## How to disable/enable the possibility to download the file?

To open the document with the *downloading* option disabled, the *document.permissions* parameter is used (see the complete structure of ONLYOFFICE Docs configuration object [here](../../../Usage%20API/Advanced%20parameters/index.md)).

You will need to set the *document.permission.download* to **false**, so that the **Download as...** option were removed from the document **File** menu (in case the *document.permission.edit* parameter is set to **true**) or from the top toolbar (in case the *document.permission.edit* is set to **false** and the file is available for viewing only) and the user could not download the document from the editor. The *permission* configuration in this case will look like this:

``` ts
const docEditor = new DocsAPI.DocEditor("placeholder", {
  document: {
    permissions: {
      download: false,
    },
  },
})
```

Further information about the permissions can be found [at this page](../../../Usage%20API/Config/Document/Permissions/index.md).

## How to prevent a document from being printed?

To open the document with the *printing* option disabled, the *document.permissions* parameter is used (see the complete structure of ONLYOFFICE Docs configuration object [here](../../../Usage%20API/Advanced%20parameters/index.md)).

You will need to set the *document.permission.print* to **false**, so that the **Print** option were removed from the document **File** menu (in case the *document.permission.edit* parameter is set to **true**) or from the top toolbar (in case the *document.permission.edit* is set to **false** and the file is available for viewing only) and the user could not print out the document from the editor. The *permission* configuration in this case will look like this:

``` ts
const docEditor = new DocsAPI.DocEditor("placeholder", {
  document: {
    permissions: {
      print: false,
    },
  },
})
```

Further information about the permissions can be found [at this page](../../../Usage%20API/Config/Document/Permissions/index.md).

## How to view and change sharing settings for a certain document?

The sharing settings are stored at the **document storage service** and must be defined by the software integrators themselves. ONLYOFFICE Docs can display these settings using the *document.info.sharingSettings* parameter the information from which will be displayed in the document **File -> Access rights...** window.

This parameter is an array of objects representing a list of user names (*document.info.sharingSettings.user*) with their access rights for the current document (*document.info.sharingSettings.permissions*).

The *document.info.sharingSettings.user* is a string parameter, which can display any user name passed from the **document storage service** to the ONLYOFFICE Docs.

The *document.info.sharingSettings.permissions* is also a string parameter, which displays the name of the access rights corresponding to the set of rules defining the user access to the current document.

> Please note, that initially there are not any predefined set of rules for the document access. In case you use **ONLYOFFICE Workspace**, there are several access right rules defined (**Full Access, Read Only, Deny Access**) which will be used and displayed. If you set up your own **document storage service**, you will have to define your own set of rules and their names (e.g. **Read-only access** with *document.permission.edit*, *document.permission.review*, *document.permission.fillForms* parameters set to **false**; or **Download only** with all the *document.permission* parameters set to **false** and only *document.permission.download* parameter set to **true**, etc.) and send them to the **document editing service** so that the user could access the document and these settings were displayed in the document **Access rights...** window.

The *sharingSettings* configuration might look the following way:

``` ts
const docEditor = new DocsAPI.DocEditor("placeholder", {
  document: {
    info: {
      sharingSettings: [
        {
          permissions: "Full Access",
          user: "John Smith",
        },
        {
          isLink: true,
          permissions: "Read Only",
          user: "External link",
        },
      ],
    },
  },
})
```

Further information about the permissions can be found [at this page](../../../Usage%20API/Config/Document/Info/index.md).

## How to restrict commenting?

The comments are enabled by default. If you want to restrict commenting and allow the authors to edit and/or delete only their comments, you will need to change the *document.permissions.editCommentsAuthorOnly* and/or *document.permissions.deleteCommentsAuthorOnly* parameters:

``` ts
const docEditor = new DocsAPI.DocEditor("placeholder", {
  document: {
    permissions: {
      comment: true,
      editCommentsAuthorOnly: true,
      deleteCommentsAuthorOnly: true,
    },
  },
})
```

> Do not forget to set the *editorConfig.mode* to **edit**, otherwise any commenting functionality will be disabled.
