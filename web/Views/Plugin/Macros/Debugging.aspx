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

    <p class="dscr">To debug ONLYOFFICE macros, follow the instructions below.</p>

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
            <img class="screenshot-width-832" alt="Debugger" src="<%= Url.Content("~/content/img/plugins/debugger.png") %>" />
        </li>
    </ol>
    <p>The <b>debugger</b> command works as a breakpoint and pauses the execution at the script point where this command is inserted.</p>

    <p>If you just need to display the specific values in the browser developer console, you can use the <b>console.log()</b> method.
    Pass a value you want to check or just a message string as an argument of this method and open the developer console by pressing the <b>F12</b> button to see the result:</p>
    <pre>
console.log(123);
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("Hello world!");
</pre>

</asp:Content>
