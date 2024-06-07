<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ExecuteCommand</span>
</h1>

<h4 class="header-gray" id="ExecuteCommand">bool ExecuteCommand(sCommand, oRetValue = 0);</h4>

<p class="dscr">
    Executes the command which will be used to create the document file (text document, spreadsheet, presentation, form document, PDF).
    See the <a href="<%= Url.Action("textdocumentapi", "officeapi") %>">Text document API</a>, <a href="<%= Url.Action("spreadsheetapi", "officeapi") %>">Spreadsheet API</a>, <a href="<%= Url.Action("presentationapi", "officeapi") %>">Presentation API</a>, or <a href="<%= Url.Action("formapi", "officeapi") %>">Form API</a> sections for more information which commands are available for various document types.
</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilder.ExecuteCommand</em> method is not used explicitly. The command itself is used instead. See the example below.</div>

<h2>Parameters:</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Type</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><em>sCommand</em></td>
            <td>String^</td>
            <td>The command in the form of JavaScript code which will be used to create the document file (in .Net, the escape character must be used when the command contains quotation symbols).</td>
        </tr>
        <tr class="tablerow">
            <td><em>oRetValue</em></td>
            <td>CDocBuilderValue^%</td>
            <td>The command return value.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Example</h2>
<h4 class="header-gray" >.Net</h4>
<pre>
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
oBuilder.ExecuteCommand(L"oParagraph.AddText(\"Hello from .net!\");");
CDocBuilder.Destroy();
</pre>
<h4 class="header-gray" >.docbuilder</h4>
<pre>
oParagraph.AddText("Hello from .net!");
</pre>
