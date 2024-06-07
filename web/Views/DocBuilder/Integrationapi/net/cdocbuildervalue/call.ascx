<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Call</span>
</h1>

<h4 class="header-gray" id="CloseFile">CDocBuilderValue^ Call(sName, p1, p2, p3, p4, p5, p6);</h4>
<p class="dscr">Calls the specified Document Builder method.
See the <a href="<%= Url.Action("textdocumentapi", "officeapi") %>">Text document API</a>, <a href="<%= Url.Action("spreadsheetapi", "officeapi") %>">Spreadsheet API</a>, <a href="<%= Url.Action("presentationapi", "officeapi") %>">Presentation API</a> or <a href="<%= Url.Action("formapi", "officeapi") %>">Form API</a> sections for more information which methods are available for various document types.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderValue.Call</em> method is not used explicitly. The method itself is used instead. See the example below.</div>

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
            <td><em>sName</em></td>
            <td>String^</td>
            <td>The name of the Document Builder method.</td>
        </tr>
        <tr class="tablerow">
            <td><em>p1-p6</em></td>
            <td>CBuilderValue^</td>
            <td>The parameters that the Document Builder method takes as argumens.</td>
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
CContext oContext = oBuilder.GetContext();
CValue oGlobal = oContext.GetGlobal();
CValue oApi = oGlobal["Api"];
CValue oDocument = oApi.Call("GetDocument");
CDocBuilder.Destroy();
</pre>
<h4 class="header-gray" >.docbuilder</h4>
<pre>
var oDocument = Api.GetDocument();
</pre>
