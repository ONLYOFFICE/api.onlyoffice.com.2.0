---
order: -1
---

Use the terminal to run ONLYOFFICE Desktop Editors in debug mode on Mac OS:

1. Press **Command+Space**.

2. In the appeared **Spotlight** window, type *Terminal* in the search line.

3. Choose the **Terminal** option. The terminal will be opened.

4. In the command line, enter the path to the application, add a space and then type the *--ascdesktop-support-debug-info* flag:

   *"/Applications/ONLYOFFICE.app/Contents/MacOS/ONLYOFFICE" --ascdesktop-support-debug-info*

## Working in debug mode

To start working in debug mode, right-click any editable field on the top toolbar (for example, font list combo) and click **Inspect Element**, or click anywhere in the document and press **F1**.

Here is the result:

![Debug](/assets/images/desktop/debugging.png)

## Running the application

Starting from version 7.1, you can run ONLYOFFICE Desktop Editors with the *--ascdesktop-support-debug-info-keep* flag. It can have the following values:

### Parameters

| Value   | Description                                                | Usage                                        |
| ------- | ---------------------------------------------------------- | -------------------------------------------- |
| 1       | Runs the application.                                      | --ascdesktop-support-debug-info-keep=1       |
| 0       | Stops the application.                                     | --ascdesktop-support-debug-info-keep=0       |
| default | The default application condition - the app is turned off. | --ascdesktop-support-debug-info-keep=default |

To launch ONLYOFFICE Desktop Editors with this flag, use the same instructions as for the *--ascdesktop-support-debug-info* flag above. The only difference is that the *--ascdesktop-support-debug-info-keep* flag stores the value passed to it. You will not need to specify it every time you run the application.
