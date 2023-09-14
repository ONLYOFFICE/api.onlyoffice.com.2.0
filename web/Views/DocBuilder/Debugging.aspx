<%@  Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Debugging
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Debugging</span>
    </h1>

    <p class="dscr">To debug ONLYOFFICE Builder scripts, follow the instructions below.</p>

    <h2 id="debugger" class="copy-link">Executing from a browser (for plugins and macros)</h2>
    <ol>
        <li>Open the <b>Plugins</b> tab and click <b>Macros</b>.</li>
        <li>
            <p>Use the <b>debugger</b> command in your script:</p>
            <pre>
debugger;
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("Hello world!");
</pre>
        </li>
        <li>Open the developer console by pressing the <b>F12</b> button.</li>
        <li>
            <p>Press the <b>Run</b> button to run your script.</p>
            <note>Please note that the <b>debugger</b> command will only work if the development tools are open. Otherwise, the browser will ignore it.</note>
            <img class="screenshot max-width-832" alt="Builder debugger" src="<%= Url.Content("~/content/img/docbuilder/builder-debugger.png") %>" />
        </li>
    </ol>
    <p>The <b>debugger</b> command works as a breakpoint and pauses the execution at the script point where this command is inserted.</p>

    <h2 id="v8-inspector" class="copy-link">Executing from Builder.Framework or Builder.App</h2>
    <ol>
        <li>Open a terminal in the <em>DocumentBuilder</em> folder.</li>
        <li>
            <p>Set the <b>V8_USE_INSPECTOR</b> environment variable to 1:</p>
            <div class="header-gray">Windows</div>
            <pre>
SET V8_USE_INSPECTOR=1
</pre>
            <div class="header-gray">Linux</div>
            <pre>
export  V8_USE_INSPECTOR=1
</pre>
        </li>
        <li>
            <p>Run the Builder script with the <b>docbuilder</b> command:</p>
            <pre>
docbuilder script.docbuilder
</pre>
        </li>
        <li>
            <p>A link will appear in the terminal. You must open it in your Chrome/Chromium browser to connect to the JavaScript context.</p>
            <img class="screenshot max-width-550" alt="Terminal" src="<%= Url.Content("~/content/img/docbuilder/terminal.png") %>" />
        </li>
        <li>Set the breakpoints by clicking the line numbers and run your script again.</li>
        <li>
            <p>Now you can debug the executed methods.</p>
            <img class="screenshot max-width-832" alt="DevTools" src="<%= Url.Content("~/content/img/docbuilder/devtools.png") %>" />
        </li>
    </ol>

</asp:Content>
