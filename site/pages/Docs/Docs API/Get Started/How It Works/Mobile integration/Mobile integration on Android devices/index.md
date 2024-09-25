In this section, we will look at the integration process via [WebView](https://developer.android.com/reference/android/webkit/WebView) using the mobile demo sample for Android which is available on [GitHub](https://github.com/ONLYOFFICE/editors-webview-android).

## Integration based on the ONLYOFFICE test sample

This example demonstrates how to integrate ONLYOFFICE mobile web editors with the ONLYOFFICE [test or DMS sample](../../../Language-specific%20examples/index.md).

![Android integration via test sample](/assets/images/editor/android-test-sample.png)

### Opening ONLYOFFICE editors

1. Download and install ONLYOFFICE Docs [Enterprise](https://www.onlyoffice.com/docs-enterprise.aspx) or [Developer](https://www.onlyoffice.com/developer-edition.aspx) edition.

2. Download the mobile demo sample for Android from [GitHub](https://github.com/ONLYOFFICE/editors-webview-android).

3. Open the top-level *build.gradle* file with [Android Studio](https://developer.android.com/studio) to modify code fragments of this example for your DMS to work correctly.

4. To display the main page of your DMS, specify the address of the ONLYOFFICE Docs web interface in the value of the **DOCUMENT\_SERVER\_URL** property in the module-level *build.gradle* file:

   ``` groovy
   buildConfigField("String", "DOCUMENT_SERVER_URL", "https://documentserver/")
   ```

   where the **documentserver** is the name of the server with the ONLYOFFICE Docs installed.

   If **DOCUMENT\_SERVER\_URL** is specified, the DMS main page is loaded. Otherwise, an error occurs:

   ``` kt
   private fun showDialog() {
       AlertDialog.Builder(requireContext())
       .setMessage("Document server url is empty.\nYou must specify the address in build.gradle")
       .setPositiveButton("Ok") { dialog, _ ->
           dialog.dismiss()
           requireActivity().finish()
       }
       .create()
       .show()
   }
   ```

   <img alt="Android error" src="/assets/images/editor/android-error.png" width="260px">

   <img alt="Android managing" src="/assets/images/editor/android-managing.png" width="260px">

5. Use the **MainFragment.kt** controller to open the editors correctly on Android devices. In this controller, define a function to open a document via WebView component. Request a URL and check if it contains the *"editor"* string which specifies that the document will be opened:

   ``` kt
   private class MainWebViewClient(private val navController: NavController) : WebViewClient() {

       override fun shouldOverrideUrlLoading(view: WebView?, request: WebResourceRequest?): Boolean {
           val url = request?.url
           if (url != null) {
               val path = url.path
               if (path?.contains("editor") == true) {
                   navController.navigate(R.id.action_mainFragment_to_editorFragment, Bundle(1).apply {
                       putString("document_url", url.toString())
                   })
                   return true
               }
               return false
           }
           return super.shouldOverrideUrlLoading(view, request)
       }

   }
   ```

   The full code for **MainFragment.kt** can be found [here](https://github.com/ONLYOFFICE/editors-webview-android/blob/fd8f9809441fab9653140cf2e51a1303e2edd774/app/src/main/java/ru/mike/florida/MainFragment.kt).

6. To start working with documents, display the ONLYOFFICE editor on your mobile device via the WebView component. To do this, set up WebView and layout in the **EditorFragment.kt** controller as follows:

   ``` kt
   @SuppressLint("SetJavaScriptEnabled")
   private fun setSettings() {
       webView?.settings?.apply {
           javaScriptEnabled = true
           javaScriptCanOpenWindowsAutomatically = true
           loadWithOverviewMode = true
           cacheMode = WebSettings.LOAD_NO_CACHE
           domStorageEnabled = true
       }
       webView?.webViewClient = EditorWebViewClient(findNavController())
   }
   ```

7. In the Android Studio toolbar, select your application and the device where the app will be run. After that, click the **Run** button in the project toolbar to build and run your code.

8. The application will be opened to demonstrate an example of integrating ONLYOFFICE mobile web editors with the ONLYOFFICE test or DMS sample.

### Closing ONLYOFFICE editors

Use the **EditorFragment.kt** controller to exit from the editor:

``` kt
private class EditorWebViewClient(private val navController: NavController) : WebViewClient() {

    override fun shouldOverrideUrlLoading(view: WebView?, request: WebResourceRequest?): Boolean {
        request?.url?.let { url ->
            if (!url.toString().contains("editor")) {
                navController.popBackStack()
                return true
            }
        }
        return super.shouldOverrideUrlLoading(view, request)
    }

}
```

The full code for **EditorFragment.kt** can be found [here](https://github.com/ONLYOFFICE/editors-webview-android/blob/fd8f9809441fab9653140cf2e51a1303e2edd774/app/src/main/java/ru/mike/florida/EditorFragment.kt).
