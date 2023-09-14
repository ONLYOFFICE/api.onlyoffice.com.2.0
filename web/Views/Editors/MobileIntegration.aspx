<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Integrating ONLYOFFICE mobile web editors
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Integrating ONLYOFFICE mobile web editors</span>
    </h1>
    <p>To access the editor features in your mobile application, integrate it with ONLYOFFICE editors via the WebView component - a system component that is responsible for opening web pages within applications.
        After that, users will be able to view, create and edit text documents, spreadsheets, and presentations, fill out oforms, and read PDFs directly on their iOS or Android devices.</p>
    <note>Please note that ONLYOFFICE mobile web editors are available only for commercial builds of <a href="https://www.onlyoffice.com/docs-enterprise.aspx" target="_blank">Enterprise</a> and <a href="https://www.onlyoffice.com/developer-edition.aspx" target="_blank">Developer</a> editions.</note>
    <div class="container">
        <ul class="browser">
            <li class="browser tab active copy-link" id="ios">iOS</li>
            <li class="browser tab copy-link" id="android">Android</li>
        </ul>
        <div id="ios" class="content active">
            <p>In this section, we will look at the integration process via <a href="https://developer.apple.com/documentation/webkit/wkwebview" target="_blank">WKWebView</a> using the mobile demo sample for iOS which is available on <a href="https://github.com/ONLYOFFICE/editors-webview-ios" target="_blank">GitHub</a>.</p>

            <h2>Integration based on the ONLYOFFICE test sample</h2>
            <p>This example demonstrates how to integrate ONLYOFFICE mobile web editors with the ONLYOFFICE <a href="<%= Url.Action("demopreview") %>">test or DMS sample</a>.</p>
            <p><img class="screenshot max-width-832" alt="iOS integration via test sample" src="<%= Url.Content("~/content/img/editor/ios-test-sample.png") %>" /></p>
            <p><b>Opening ONLYOFFICE editors</b></p>
            <ol>
                <li>Download and install ONLYOFFICE Docs <a href="https://www.onlyoffice.com/docs-enterprise.aspx" target="_blank">Enterprise</a> or <a href="https://www.onlyoffice.com/developer-edition.aspx" target="_blank">Developer</a> edition.</li>
                <li>Download the mobile demo sample for iOS from <a href="https://github.com/ONLYOFFICE/editors-webview-ios" target="_blank">GitHub</a>.</li>
                <li>Open the <em>EditorWebViewDemo.xcodeproj</em> project with <a href="https://developer.apple.com/xcode/" target="_blank">Xcode</a> to modify code fragments of this example for your DMS to work correctly.</li>
                <li>
                    <p>To display the main page of your DMS, specify the address of the Document Server web interface in the value of the <b>DocumentServerURL</b> property in the <em>Info.plist</em> file:</p>
                    <pre>
&lt;dict&gt;
    ...
    &lt;key&gt;DocumentServerURL&lt;/key&gt;
    &lt;string&gt;https://documentserver/&lt;/string&gt;
&lt;/dict&gt;
</pre>
                    <p>where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Document Server installed.</p>
                    <p>If <b>DocumentServerURL</b> is specified, the DMS main page is loaded. Otherwise, an error occurs:</p>
                    <pre>
private func load() {
    if documentServerUrlString.isEmpty {
        showAlert(title: "Error", message: "You must specify the document server address, the \"DocumentServerURL\" value in the Info.plist file.")
        return
    }

    guard let url = URL(string: documentServerUrlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else {
        return
    }

    webView.load(URLRequest(url: url))
}
</pre>
                    <div class="img-block-2">
                        <div>
                            <img class="screenshot max-width-260" alt="iOS error" src="<%= Url.Content("~/content/img/editor/ios-error.png") %>" />
                            <p><b>DocumentServerURL is not specified</b></p>
                        </div>
                        <div>
                            <img class="screenshot max-width-260" alt="iOS managing" src="<%= Url.Content("~/content/img/editor/ios-managing.png") %>" />
                            <p><b>DocumentServerURL is specified</b></p>
                        </div>
                    </div>
                </li>
                <li>
                    <p>Use the <b>DocumentServerViewController</b> controller to open the editors correctly on iOS devices.
                        In this controller, define a function to open a document via WKWebView component.
                        First, request an absolute URL and check if it contains the <em>"/editor?"</em> string.
                        If so, add an additional query parameter (the mobile platform type) to the link:</p>
                    <pre>
private var openDocumentMarker = "/editor?"
private var additionalQueryParameters = ["type": "mobile"]

func webView(_ webView: WKWebView,
    decidePolicyFor navigationAction:
    WKNavigationAction,
    decisionHandler: @escaping (WKNavigationActionPolicy) -> Void)
{
    guard let urlString = navigationAction.request.url?.absoluteString else {
        decisionHandler(.cancel)
        return
    }

    if urlString.contains(openDocumentMarker),
       let redirectUrl = navigationAction.request.url?.appendingQueryParameters(additionalQueryParameters)
    {
        decisionHandler(.cancel)
        navigator.navigate(to: .documentServerEditor(url: redirectUrl))
    } else {
        reloadItem.isEnabled = true
        backItem.isEnabled = webView.canGoBack
        forwardItem.isEnabled = webView.canGoForward

        title = navigationAction.request.url?.host ?? ""

        decisionHandler(.allow)
    }

}
</pre>
                </li>
                <li>In the <b>DocumentServerViewController</b> controller, create the navigation actions available on the DMS main page.
                    For example, in our test sample, they are specified with the interface elements such as the <b>Reload</b>, <b>Back</b>, and <b>Forward</b> buttons.</li>
                <li>
                    <p>For easy interaction with the editor, define the <b>Activity Indicator</b> and <b>Progress View</b> UI components.</p>
                    <p>The full code for <b>DocumentServerViewController</b> can be found <a href="https://github.com/ONLYOFFICE/editors-webview-ios/blob/ad146259742d0cecb7b10e67e19b4594730663e0/EditorWebViewDemo/PresentationLayer/UserStories/DocumentServerDemo/DocumentServerViewController.swift" target="_blank">here</a>.</p>
                    <div class="img-block-3">
                        <div>
                            <img class="screenshot max-width-260" alt="Activity indicator" src="<%= Url.Content("~/content/img/editor/activity-indicator.png") %>" />
                            <p align="center"><b>Activity Indicator</b></p>
                        </div>
                        <div>
                            <img class="screenshot max-width-260" alt="Progress view" src="<%= Url.Content("~/content/img/editor/progress-view.png") %>" />
                            <p align="center"><b>Progress View</b></p>
                        </div>
                        <div>
                            <img class="screenshot max-width-260" alt="Buttons" src="<%= Url.Content("~/content/img/editor/buttons.png") %>" />
                            <p align="center"><b>Buttons</b></p>
                        </div>
                    </div>
                </li>
                <li>
                    <p>To start working with documents, display the ONLYOFFICE editor on your mobile device via the WKWebView component.
                        To do this, set up WKWebView and layout in the <b>DocumentServerEditorViewController</b> controller as follows:</p>
                    <pre>
private func configureView() {
    let preferences = WKPreferences()
    let configuration = WKWebViewConfiguration()
    preferences.javaScriptEnabled = true
    configuration.preferences = preferences

    webView = WKWebView(frame: .zero, configuration: configuration)

    view.addSubview(webView)
    webView.translatesAutoresizingMaskIntoConstraints = false

    webView.navigationDelegate = self
    webView.uiDelegate = self

    if let webViewSuperview = webView.superview {
        webView.topAnchor.constraint(equalTo: webViewSuperview.topAnchor).isActive = true
        webView.leadingAnchor.constraint(equalTo: webViewSuperview.leadingAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: webViewSuperview.bottomAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: webViewSuperview.trailingAnchor).isActive = true
    }
...
}
</pre>
                </li>
                <li>In the Xcode toolbar, select a build scheme and a device where the app will be run.
                    After that, choose <b>Product -> Run</b>, or click the <b>Run</b> button in the project toolbar to build and run your code.</li>
                <li>On the main screen of the application, select the <b>Using DocumentServer</b> option to demonstrate an example of integrating ONLYOFFICE mobile web editors with the ONLYOFFICE test or DMS sample.</li>
            </ol>

            <br />
            <p><b>Closing ONLYOFFICE editors</b></p>
            <p>Use the <b>DocumentServerEditorViewController</b> controller to exit from the editor.
                For example, in the current test samples the <b>Go back</b> button is created to navigate to the previous screen:</p>
            <pre>
private let goBackUrl = Bundle.main.object(forInfoDictionaryKey: "DocumentServerURL") as? String ?? ""

func webView(_ webView: WKWebView,
    decidePolicyFor navigationAction: WKNavigationAction,
    decisionHandler: @escaping (WKNavigationActionPolicy) -> Void)
{
    guard let urlString = navigationAction.request.url?.absoluteString else {
        decisionHandler(.cancel)
        return
    }
        
    if urlString == goBackUrl {
        decisionHandler(.cancel)
        navigationController?.popViewController(animated: true)
    } else {
        decisionHandler(.allow)
    }
}
</pre>
            <div>
                <img class="screenshot max-width-260" alt="Go back" src="<%= Url.Content("~/content/img/editor/exit-button.png") %>" />
                <p style="margin-left: 40px;"><b>Button to exit the editor</b></p>
            </div>
            <p>The full code for <b>DocumentServerEditorViewController</b> can be found <a href="https://github.com/ONLYOFFICE/editors-webview-ios/blob/ad146259742d0cecb7b10e67e19b4594730663e0/EditorWebViewDemo/PresentationLayer/UserStories/DocumentServerEditor/DocumentServerEditorViewController.swift" target="_blank">here</a>.</p>

            <h2>Integration based on the ONLYOFFICE Docs API</h2>
            <p>This example demonstrates how to open the ONLYOFFICE editors via WKWebView using the editor configuration described in the <a href="<%= Url.Action("basic") %>">API documentation</a> and the <a href="<%= Url.Action("try") %>">configuration examples</a>.</p>
            <p><img class="screenshot max-width-832" alt="iOS integration via api" src="<%= Url.Content("~/content/img/editor/ios-api-config.png") %>" /></p>
            <p><b>Opening ONLYOFFICE editors</b></p>
            <ol>
                <li>Download and install ONLYOFFICE Docs <a href="https://www.onlyoffice.com/docs-enterprise.aspx" target="_blank">Enterprise</a> or <a href="https://www.onlyoffice.com/developer-edition.aspx" target="_blank">Developer</a> edition.</li>
                <li>Download the mobile demo sample for iOS from <a href="https://github.com/ONLYOFFICE/editors-webview-ios" target="_blank">GitHub</a>.</li>
                <li>Open the <em>EditorWebViewDemo.xcodeproj</em> project with <a href="https://developer.apple.com/xcode/" target="_blank">Xcode</a> to modify code fragments of this example for your DMS to work correctly.</li>
                <li>Create an empty <em>html</em> file. The demo project <a href="https://github.com/ONLYOFFICE/editors-webview-ios/blob/ad146259742d0cecb7b10e67e19b4594730663e0/EditorWebViewDemo/Resources/editor.html" target="_blank">editor.html</a> resource is used as a template.</p></li>
                <li>
                    <p>Add the <em>div</em> element as shown below:</p>
                    <pre>
&lt;div id="placeholder"&gt;&lt;/div&gt;
</pre>
                </li>
                <li>
                    <p>Specify your ONLYOFFICE Document Server link with the JavaScript API that will be used for your website:</p>
                    <pre>
&lt;script type="text/javascript" src="https://documentserver/web-apps/apps/api/documents/api.js"&gt;&lt;/script&gt;
</pre>
                    <p>where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Document Server installed.</p>
                </li>
                <li>
                    <p>Add the script initializing the <b>Document Editor</b> for the <em>div</em> element with the configuration for the document you want to open:</p>
                    <pre>
window.docEditor = new DocsAPI.DocEditor("placeholder",
    {
        {external_config},
        "type": "mobile",
        "events": {
            "onAppReady": onAppReady,
            "onDocumentReady": onDocumentReady,
            "onDownloadAs": onDownloadAs,
            "onError": onError,
            "onInfo": onInfo,
            "onRequestClose": onRequestClose,
            "onRequestInsertImage": onRequestInsertImage,
            "onRequestUsers": onRequestUsers,
            "onWarning": onWarning,
        }
    });
</pre>
                </li>
                <li>
                    <p>To start working with documents, display the ONLYOFFICE editor on your mobile device via the WKWebView component.
                        To do this, specify the <b>EditorViewController</b> controller. Request the URL to the <em>editor.html</em> file,
                        get its contents and replace the <em>"{external_config}"</em> parameter with a config from the <em>samples.plist</em> file
                        where all the sample configurations are categorized according to  <a href="<%= Url.Action("try") %>">API documentation Try page</a>:</p>
                    <pre>
private func load() {
    guard let url = Bundle.main.url(forResource: "editor", withExtension: "html") else {
        return
    }

    var html = ""

    do {
        html = try String(contentsOf: url)
    } catch {
        print(error)
    }

    html = html.replacingOccurrences(of: "{external_config}", with: config ?? "")
    webView.loadHTMLString(html, baseURL: nil)
}
</pre>
                    <div>
                        <img class="screenshot max-width-260" alt="Editor samples" src="<%= Url.Content("~/content/img/editor/editor-samples.png") %>" />
                        <p style="margin-left: 25px;"><b>ONLYOFFICE Editor Samples</b></p>
                    </div>
                    <p>The full code for <b>EditorViewController</b> can be found <a href="https://github.com/ONLYOFFICE/editors-webview-ios/blob/ad146259742d0cecb7b10e67e19b4594730663e0/EditorWebViewDemo/PresentationLayer/UserStories/Editor/EditorViewController.swift" target="_blank">here</a>.</p>
                </li>
                <li>In the Xcode toolbar, select a build scheme and a device where the app will be run.
                    After that, choose <b>Product -> Run</b>, or click the <b>Run</b> button in the project toolbar to build and run your code.</li>
                <li>On the main screen of the application, select the <b>Using API Configuration</b> option to demonstrate how to open the ONLYOFFICE mobile web editors
                    using the editor configuration described in the API documentation and the configuration examples.</li>
                <li>On the next page, choose one of the configuration samples to open the resulting HTML in the WKWebView component.</li>
            </ol>

            <br />
            <p><b>Working with documents</b></p>
            <p>To work with documents (open, download, insert images, mention other users, etc.), use the API documentation with its events and methods:</p>
            <ol>
                <li>
                    <p>To track events and call appropriate methods, handle the <a href="<%= Url.Action("config/events") %>">events</a> of ONLYOFFICE editors in native code
                    by the <b>EditorEventsHandler</b> controller and then delegate them to <b>EditorViewController</b>:</p>
                    <pre>
var delegate: EditorEventsDelegate?

convenience init(configuration: WKWebViewConfiguration) {
    self.init()
   
    configuration.userContentController.add(self, name: EditorEvent.onDownloadAs.rawValue)
    ....
}

extension EditorEventsHandler: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController,
        didReceive message: WKScriptMessage)
    {
        let event = EditorEvent(rawValue: message.name)

        switch event {
        case .onDownloadAs:
            guard
                let json = message.body as? [String: Any],
                let fileType = json["fileType"] as? String,
                let url = json["url"] as? String
            else { return }

            delegate?.onDownloadAs(fileType: fileType, url: url)
        ...
        }
    }
}
</pre>
                    <p>Let's consider the <a href="<%= Url.Action("config/events") %>#onDownloadAs">onDownloadAs</a> event as an example.
                        Register an object as a handler for a particular message by calling <em>configuration.userContentController.add(self, name: messageName)</em> during the WKWebView configuration.
                        Get the event parameters (file type and URL) and delegate the event handling to <b>EditorViewController</b>:</p>
                    <pre>
func onDownloadAs(fileType: String, url: String) {
    print("&#9889; ONLYOFFICE Document Editor create file: \(url)")
}
</pre>
                </li>
                <li>
                    <p>Define the <b>callMethod</b> function to call <a href="<%= Url.Action("methods") %>">API methods</a> from native code. It can take string, boolean or object values as arguments.
                        This function adds the method name and its arguments to the string with the JavaScript code and then evaluates JavaScript in the WKWebView component with the <em>evaluateJavaScript</em> method:</p>
                    <pre>
private func callMethod(function: String, arg: Bool) {
    let javascript = "window.docEditor.\(function)(\(arg))"
    webView.evaluateJavaScript(javascript, completionHandler: nil)
}

private func callMethod(function: String, arg: String) {
    let javascript = "window.docEditor.\(function)(\"\(arg)\")"
    webView.evaluateJavaScript(javascript, completionHandler: nil)
}

private func callMethod(function: String, arg: [String: Any]) {
    guard
        let json = try? JSONSerialization.data(withJSONObject: arg, options: []),
        let jsonString = String(data: json, encoding: .utf8)
    else {
        return
    }

    let javascript = "window.docEditor.\(function)(\(jsonString))"
    webView.evaluateJavaScript(javascript, completionHandler: nil)
}
</pre>
                    <p>The full code for <b>EditorEventsHandler</b> can be found <a href="https://github.com/ONLYOFFICE/editors-webview-ios/blob/ad146259742d0cecb7b10e67e19b4594730663e0/EditorWebViewDemo/PresentationLayer/UserStories/Editor/EditorEventsHandler.swift" target="_blank">here</a>.</p>
                </li>
                <li>
                    <p>To display the result of downloading and printing a document, use the <b>PreviewController</b> controller. This controller is based on <b>QLPreviewController</b>.
                        Download a document by its URL and set the <em>dataSource</em> and <em>delegate</em> properties to <b>QLPreviewController</b>:</p>
                    <pre>
func present(url: URL, in parent: UIViewController, complation: @escaping (() -> Void)) {
    download(url: url) { fileUrl in
        DispatchQueue.main.async {
            guard let fileUrl = fileUrl else {
                complation()
                return
            }

            self.fileUrl = fileUrl

            let quickLookController = QLPreviewController()
            quickLookController.dataSource = self
            quickLookController.delegate = self

            if QLPreviewController.canPreview(fileUrl as QLPreviewItem) {
                quickLookController.currentPreviewItemIndex = 0
                parent.present(quickLookController, animated: true, completion: nil)
            }
            complation()
        }
    }
}
</pre>
                    <p>The full code for <b>PreviewController</b> can be found <a href="https://github.com/ONLYOFFICE/editors-webview-ios/blob/ad146259742d0cecb7b10e67e19b4594730663e0/EditorWebViewDemo/PresentationLayer/UserStories/Editor/PreviewController.swift" target="_blank">here</a>.</p>
                </li>
            </ol>
        </div>
        <div id="android" class="content">
            <p>In this section, we will look at the integration process via <a href="https://developer.android.com/reference/android/webkit/WebView" target="_blank">WebView</a> using the mobile demo sample for Android which is available on <a href="https://github.com/ONLYOFFICE/editors-webview-android" target="_blank">GitHub</a>.</p>
            <h2>Integration based on the ONLYOFFICE test sample</h2>
            <p>This example demonstrates how to integrate ONLYOFFICE mobile web editors with the ONLYOFFICE <a href="<%= Url.Action("demopreview") %>">test or DMS sample</a>.</p>
            
            <p><img class="screenshot max-width-832" alt="Android integration via test sample" src="<%= Url.Content("~/content/img/editor/android-test-sample.png") %>" /></p>
            <p><b>Opening ONLYOFFICE editors</b></p>
            <ol>
                <li>Download and install ONLYOFFICE Docs <a href="https://www.onlyoffice.com/docs-enterprise.aspx" target="_blank">Enterprise</a> or <a href="https://www.onlyoffice.com/developer-edition.aspx" target="_blank">Developer</a> edition.</li>
                <li>Download the mobile demo sample for Android from <a href="https://github.com/ONLYOFFICE/editors-webview-android" target="_blank">GitHub</a>.</li>
                <li>Open the top-level <em>build.gradle</em> file with <a href="https://developer.android.com/studio" target="_blank">Android Studio</a> to modify code fragments of this example for your DMS to work correctly.</li>
                <li>
                    <p>To display the main page of your DMS, specify the address of the Document Server web interface in the value of the <b>DOCUMENT_SERVER_URL</b> property in the module-level <em>build.gradle</em> file:</p>
                    <pre>
buildConfigField("String", "DOCUMENT_SERVER_URL", "https://documentserver/")
</pre>
                    <p>where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Document Server installed.</p>
                    <p>If <b>DOCUMENT_SERVER_URL</b> is specified, the DMS main page is loaded. Otherwise, an error occurs:</p>
                    <pre>
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
</pre>
                    <div class="img-block-2">
                        <div>
                            <img class="screenshot max-width-260" alt="Android error" src="<%= Url.Content("~/content/img/editor/android-error.png") %>" />
                            <p><b>DocumentServerURL is not specified</b></p>
                        </div>
                        <div>
                            <img class="screenshot max-width-260" alt="Android managing" src="<%= Url.Content("~/content/img/editor/android-managing.png") %>" />
                            <p><b>DocumentServerURL is specified</b></p>
                        </div>
                    </div>
                </li>
                <li>
                    <p>Use the <b>MainFragment.kt</b> controller to open the editors correctly on Android devices.
                        In this controller, define a function to open a document via WebView component.
                        Request a URL and check if it contains the <em>"editor"</em> string which specifies that the document will be opened:</p>
                    <pre>
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
</pre>
                    <p>The full code for <b>MainFragment.kt</b> can be found <a href="https://github.com/ONLYOFFICE/editors-webview-android/blob/fd8f9809441fab9653140cf2e51a1303e2edd774/app/src/main/java/ru/mike/florida/MainFragment.kt" target="_blank">here</a>.</p>
                </li>
                <li>
                    <p>To start working with documents, display the ONLYOFFICE editor on your mobile device via the WebView component.
                        To do this, set up WebView and layout in the <b>EditorFragment.kt</b> controller as follows:</p>
                    <pre>
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
</pre>
                </li>
                <li>In the Android Studio toolbar, select your application and the device where the app will be run.
                    After that, click the <b>Run</b> button in the project toolbar to build and run your code.</li>
                <li>The application will be opened to demonstrate an example of integrating ONLYOFFICE mobile web editors with the ONLYOFFICE test or DMS sample.</li>
            </ol>

            <br />
            <p><b>Closing ONLYOFFICE editors</b></p>
            <p>Use the <b>EditorFragment.kt</b> controller to exit from the editor:</p>
            <pre>
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
</pre>
            <p>The full code for <b>EditorFragment.kt</b> can be found <a href="https://github.com/ONLYOFFICE/editors-webview-android/blob/fd8f9809441fab9653140cf2e51a1303e2edd774/app/src/main/java/ru/mike/florida/EditorFragment.kt" target="_blank">here</a>.</p>
        </div>
    </div>

    <script type="text/javascript">
        $('ul.browser').on('click', 'li:not(.browser tab active)', function() {
            $(this)
            .addClass('active').siblings().removeClass('active')
            .closest('div.container').find('div.content').removeClass('active').eq($(this).index()).addClass('active');
        });
        var loc = window.location.hash;
        if (loc != "") {
            var id = loc.substring(1);;
            $('.browser .tab').removeClass('active');
            $('.browser .tab[id="'+id  +'"]').addClass('active');
            $('.content').removeClass('active');
            $('.content[id="'+id  +'"]').addClass('active');
        }
    </script>

</asp:Content>
