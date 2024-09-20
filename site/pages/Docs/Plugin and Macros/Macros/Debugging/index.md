---
order: -3
---

To debug ONLYOFFICE macros, follow the instructions below.

1. Open the **Plugins** tab and click **Macros**.

2. Use the **debugger** command in your script:

   ``` ts
   debugger
   const oDocument = Api.GetDocument()
   const oParagraph = oDocument.GetElement(0)
   oParagraph.AddText("Hello world!")
   ```

3. To run your script in debug mode:

   - **For ONLYOFFICE Docs**: open the developer console by pressing the **F12** button.
   - **For Desktop Editors**: use the [instruction](../../../Desktop%20Editors/Usage%20API/Debugging/index.md) for debugging in ONLYOFFICE Desktop Editors.

4. Press the **Run** button to run your script.

   > Please note that the **debugger** command will only work if the development tools are open. Otherwise, the browser will ignore it.

   ![Debugger](/assets/images/plugins/debugger.png)

The **debugger** command works as a breakpoint and pauses the execution at the script point where this command is inserted.

If you just need to display the specific values in the browser developer console, you can use the **console.log()** method. Pass a value you want to check or just a message string as an argument of this method and open the developer console by pressing the **F12** button to see the result:

``` ts
console.log(123)
const oDocument = Api.GetDocument()
const oParagraph = oDocument.GetElement(0)
oParagraph.AddText("Hello world!")
```
