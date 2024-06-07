<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("macrosamples/") %>"></a>
    <span class="hdr">Insert text</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Inserts text into the document at the current cursor position.</p>

<pre>(function()
{
    var oDocument = Api.GetDocument();
    var oParagraph = Api.CreateParagraph();
    oParagraph.AddText("Hello world!");
    oDocument.InsertContent([oParagraph]);
})();</pre>

<p>Methods used: 
<a href="<%= Url.Action("textdocumentapi/api/getdocument", "officeapi") %>">GetDocument</a>, 
<a href="<%= Url.Action("textdocumentapi/api/createparagraph", "officeapi") %>">CreateParagraph</a>, 
<a href="<%= Url.Action("textdocumentapi/apiparagraph/addtext", "officeapi") %>">AddText</a>, 
<a href="<%= Url.Action("textdocumentapi/apidocument/insertcontent", "officeapi") %>">InsertContent</a>
</p>

<div class="header-gray">Result</div>
<br/>
<img class="screenshot max-width-832" alt="Chart" src="<%= Url.Content("~/content/img/plugins/insert-text.png") %>" />