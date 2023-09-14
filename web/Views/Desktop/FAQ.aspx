<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>
<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="FaqHead" ContentPlaceHolderID="HeadContent" runat="server">
    <%= Scripts.Render("~/bundles/faq") %>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Frequently asked questions
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Frequently asked questions: Desktop Editors</span>
    </h1>

    <% Html.RenderPartial("FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="desktop_1">
    <dt>How to install ONLYOFFICE Desktop Editors?</dt>
    <dd>
        <p>
            ONLYOFFICE Desktop Editors is available for Windows, Linux and Mac OS. Starting from version 6.1, this application is also supported by ARM-based Apple Silicon Macs.
        </p>
        <p>
            The simplest way to install this application on your local computer is to download it 
            from our official <a href="https://www.onlyoffice.com/download-desktop.aspx" target="_blank">website</a>.
        </p>
        <p>
            For some Linux distributions, like Zorin OS, Linux Mint, Linkat, Linspire, etc., the ONLYOFFICE Desktop Editors package is already pre-installed 
            or available on their official stores.
        </p>
    </dd>
</dl>
<dl class="faq_block" id="desktop_2">
    <dt>How to enable debug mode?</dt>
    <dd>
        <p>To enable <a href="<%= Url.Action("debugging") %>">debug mode</a>, run the desktop editor with <em>--ascdesktop-support-debug-info</em> flag.</p>
    </dd>
</dl>
<dl class="faq_block" id="desktop_3">
    <dt>How to add plugins to the desktop editors?</dt>
    <dd>
        <p>
            Some plugins are installed by default in the desktop editors and displayed within the <b>Plugins</b> tab. 
            You can install additional plugins through the plugin manager or the plugin folder. 
            Find out more information <a href="<%= Url.Action("plugins") %>">in this section</a>.
        </p>
    </dd>
</dl>
<dl class="faq_block" id="desktop_4">
    <dt>Can I add my DMS provider to the default connection list?</dt>
    <dd>
        <p>
            Yes, you can. Follow the instructions <a href="<%= Url.Action("addingdms/") %>">on this page</a>.
        </p>
        <p>
            In this way, you can add the DMS provider only to your own connection list. 
            If you want to add it for all the users, submit a feature request <a href="https://github.com/ONLYOFFICE/DesktopEditors/issues" target="_blank">on GitHub</a>.
        </p>
    </dd>
</dl>
<dl class="faq_block" id="desktop_5">
    <dt>How to check DMS portal availability?</dt>
    <dd>
        <p>To check the portal availability, you need to send the GET request. If the portal is available, then the <em>HTTP_STATUS_CODE = 200</em> response is expected.</p>
        <p>These two parameters should be specified in the integration <a href="<%= Url.Action("addingdms/") %>">config</a> to create this request:</p>
        <ul>
            <li><em>check.url</em> - the URL used in the request,</li>
            <li><em>check.headers</em> - the headers added to the <em>ajax</em> request.</li>
        </ul>
        <pre>
{
    "name" : "Nextcloud",
    "check": {
        "url": "status.php",
        "headers": 
            "OCS-APIREQUEST": true
        }
}
</pre>
    </dd>
</dl>
<dl class="faq_block" id="desktop_6">
    <dt>How to find out the file status?</dt>
    <dd>
        <p>Declare the following global function:</p>
        <pre>
window.DesktopUpdateFile = function ()
</pre>
        <p>It will be called by the desktop app to notify the user about the completion of file editing.</p>
    </dd>
</dl>
<dl class="faq_block" id="desktop_7">
    <dt>How to check if the document is being opened in the desktop application?</dt>
    <dd>
        <p>There are three ways for the desktop app to be recognized:</p>
        <ul>
            <li><em>?desktop = true</em> is added to the parameters of the server request address.</li>
            <li>Starting from version 6.1, the application adds the <em>AscDesktopEditor $version$</em> line to the <em>navigator.userAgent</em> parameter. 
                For example, <em>AscDesktopEditor 5.6.0</em>.</li>
            <li>In JavaScript code there is also a <em>window.AscDesktopEditor</em> object the methods of which can send commands and information to the app.</li>
        </ul>
    </dd>
</dl>
<dl class="faq_block" id="desktop_8">
    <dt>How to open new windows in the desktop editors?</dt>
    <dd>
        <p>You can&#8217;t open new windows in the desktop editors because it is blocked (for example, for <em>OAuth</em>).</p>
        <p>To open the document in a new window / tab correctly, you need to use the <em>window.open("http://url.to.document")</em> JavaScript command 
            or the <em>open:document</em> command of the <b>execCommand</b> method. The details on how to open documents in the desktop editors can be found <a href="<%= Url.Action("addingdms/opening") %>">in this section</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="desktop_9">
    <dt>How to check if the desktop app supports encryption?</dt>
    <dd>
        <p>To check if the desktop app supports encryption, call the following command:</p>
        <pre>
typeof window.AscDesktopEditor.cloudCryptoCommand === "function"
</pre>
    </dd>
</dl>
<dl class="faq_block" id="desktop_10">
    <dt>How to remove all the read keys?</dt>
    <dd>
        <p>To reset the keys and add new ones, please do the following:</p>
        <ul>
            <li>delete the keys in the DMS database;</li>
            <li>
                <p>delete the <em>cloud_crypto.xml</em> file from the <em>sdkjs-plugins</em> directory. The path to the folder depends on the operating system you use:</p>
                <ul style="list-style: none;">
                    <li>For Linux - <em>/opt/onlyoffice/desktopeditors/editors/sdkjs-plugins/</em></li>
                    <li>For Windows - <em>%ProgramFiles%\ONLYOFFICE\DesktopEditors\sdkjs-plugins\</em></li>
                </ul>
            </li>
        </ul>
    </dd>
</dl>

</asp:Content>