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
            <td>const&nbsp;wchar_t*</td>
            <td>The command which will be used to create the document file (in C++, the escape character must be used when the command contains quotation symbols).</td>
        </tr>
        <tr class="tablerow">
            <td><em>oRetValue</em></td>
            <td>CDocBuilderValue*</td>
            <td>The command return value.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Example</h2>
<h4 class="header-gray" >C++</h4>
<pre>
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
oBuilder.ExecuteCommand(L"oParagraph.AddText(\"Hello, world!\");");
CDocBuilder::Dispose();
</pre>
<h4 class="header-gray" >.docbuilder</h4>
<pre>
oParagraph.AddText("Hello, world!");
</pre>
