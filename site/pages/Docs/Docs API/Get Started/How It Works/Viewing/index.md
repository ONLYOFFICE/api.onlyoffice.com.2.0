The viewing opening mode allows the user to view the document only without modifying its data. In order to enable this mode, the [editorConfig.mode](/editors/config/editor#mode) parameter must be set to **view**.

Starting from version 7.2, the **live viewer** is added to the text document, spreadsheet and presentation editors. To apply viewing modes, use the [editorConfig.coEditing](/editors/config/editor#coEditing) parameter:

1. If the *mode* field is *fast* and the *change* field is *true*, then the live viewer is opened by default, but you can switch the mode to the common viewer and back without reloading the page. To do this, open the **File** tab, click **Advanced Settings...** and check/uncheck the **Show changes from other users** checkbox. This mode is enabled by default:

   ```
   {
       "editorConfig": {
           "coEditing": {
               "mode": "fast",
               "change": true
           },
           "mode": "view"
       },
       ...
   }
   ```

   ![Setting](/assets/images/editor/show-changes-from-other-users.png)

   In the live viewer, the cursors of the other users are displayed by configuring the [document.permissions.userInfoGroups](/editors/config/document/permissions#userInfoGroups) parameter.

   ![Live viewer](/assets/images/editor/live-viewer.png)

   The changes are displayed in the same way as in the editing mode.

   ![Editor](/assets/images/editor/editor.png)

2. If the *mode* field is *fast* and the *change* field is *false*, then the live viewer is opened by default, and you cannot switch the mode to the common viewer:

   ```
   {
       "editorConfig": {
           "coEditing": {
               "mode": "fast",
               "change": false
           }
       }
   }      
   ```

3. If the *mode* field is *strict* and the *change* field is *true*, then the common viewer is opened by default, but you can switch the mode to the live viewer in the **Advanced Settings...**:

   ```
   {
       "editorConfig": {
           "coEditing": {
               "mode": "strict",
               "change": true
           },
           "mode": "view"
       },
       ...
   }
   ```

4. If the *mode* field is *strict* and the *change* field is *false*, then the common viewer is opened by default, and you cannot switch the mode to the live viewer:

   ```
   {
       "editorConfig": {
           "coEditing": {
               "mode": "strict",
               "change": false
           },
           "mode": "view"
       },
       ...
   }
   ```

   ![Viewer](/assets/images/editor/viewer.png)

In the following cases, only the common viewer is used:

* in the [embedded mode](/editors/config/editor/embedded);
* for [WOPI](/editors/wopi);
* when opening the *pdf/djvu/xps* formats.

Please note that the server connections for the live viewer are counted separately from the total number of simultaneous connections and limited with the [connections\_view](/editors/command/license#license) parameter in the license. For the open source version, this limit is 20. The live viewer is not available for the older licenses.

The concept for working with viewing modes in the mobile editors is the same as for the web version.
