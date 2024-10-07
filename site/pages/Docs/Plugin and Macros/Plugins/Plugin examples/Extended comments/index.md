## Description

Pastes, edits, and removes comments and replies (with user data) in a document.

**Plugin type:** visual, non-system.

**Supported editors:** documents.

![ExtendedComments](/assets/images/plugins/gifs/extended-comments.gif)

## Installation

Download this plugin from [GitHub](https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_extended_comments) and install it following the [desktop](../../Adding%20plugins/ONLYOFFICE%20Desktop%20Editors/index.md), [on-premises](../../Adding%20plugins/ONLYOFFICE%20Docs%20on-premises/index.md), or [cloud](../../Adding%20plugins/ONLYOFFICE%20Cloud/index.md) installation instructions.

## Usage

1. Open the **Plugins** tab and press **Extended comments**.
2. Select the text you want to comment on. Enter the comment text and the author name in the fields. Define the **Problem Category**, **Severity**, and **Submitted by** fields for the comment and click the **Comment** button to add the comment into the document.
3. All the document comments will be displayed in the lower plugin window.
4. To delete any comment, select it in the lower plugin window and click the **Delete** button.
5. To reply to any comment, select it in the lower plugin window and click the **Add reply** button. Enter a reply text, check if the comment is accepted or not, and click the **Reply** button.
6. To edit any comment, click the **Edit** button, enter new text or change the comment properties, and click the **Ok** button.

## Plugin structure

Repository on GitHub: <https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_extended_comments>.

1. *config.json*, *index.html*, and *code.js*

2. Icons

3. Third-party services:

   - [jQuery](https://jquery.com) - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development. License: [MIT License](https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/example_extended_comments/licenses/jQuery.license).
   - [Select2](https://select2.org/) gives you a customizable select box with support for searching, tagging, remote data sets, infinite scrolling, and many other highly used options. License: [MIT](https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/example_extended_comments/licenses/Select2.license).

## Config

``` json
{
  "name": "Extended comments",
  "guid": "asc.{91EAC419-EF8B-440C-A960-B451C7DF3A37}",

  "variations": [
    {
      "description": "Extended comments",
      "url": "index.html",

      "icons": ["resources/light/icon.png", "resources/light/icon@2x.png"],
      "icons2": [
        {
          "style": "light",
                    
          "100%": {
            "normal": "resources/light/icon.png"
          },
          "125%": {
            "normal": "resources/light/icon@1.25x.png"
          },
          "150%": {
            "normal": "resources/light/icon@1.5x.png"
          },
          "175%": {
            "normal": "resources/light/icon@1.75x.png"
          },
          "200%": {
            "normal": "resources/light/icon@2x.png"
          }
        },
        {
          "style": "dark",
                    
          "100%": {
            "normal": "resources/dark/icon.png"
          },
          "125%": {
            "normal": "resources/dark/icon@1.25x.png"
          },
          "150%": {
            "normal": "resources/dark/icon@1.5x.png"
          },
          "175%": {
            "normal": "resources/dark/icon@1.75x.png"
          },
          "200%": {
            "normal": "resources/dark/icon@2x.png"
          }
        }
      ],
      "isViewer": false,
      "EditorsSupport": ["word"],

      "isVisual": true,
      "isModal": false,
      "isInsideMode": true,

      "initDataType": "none",
      "initData": "",

      "buttons": [],
      "events": ["onAddComment", "onRemoveComment", "onChangeCommentData"]

    }
  ]
}
```

## Methods and events

- button
- init
- onAddComment
- onChangeCommentData
- onRemoveComment
- executeMethod ("AddComment")
- executeMethod ("ChangeComment")
- executeMethod ("GetAllComments")
- executeMethod ("MoveToComment")
- executeMethod ("RemoveComments")

## Support

If you want to request a feature or report a bug regarding this plugin, use the issues section on [GitHub](https://github.com/ONLYOFFICE/sdkjs-plugins/issues).
