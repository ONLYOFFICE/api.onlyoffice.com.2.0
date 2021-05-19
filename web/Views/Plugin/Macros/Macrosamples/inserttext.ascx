<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("macrosamples/") %>"></a>
    <span class="hdr">Insert text</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Insert text into the document at the current cursor position.</p>

<pre>(function()
{
    oDocument = Api.GetDocument();
    oParagraph = Api.CreateParagraph();
    oParagraph.AddText("Hello world!");
    oDocument.InsertContent([oParagraph]);
})();</pre>

<p>Methods used: 
<a href="<%= Url.Action("textdocumentapi/api/getdocument", "docbuilder") %>">GetDocument</a>, 
<a href="<%= Url.Action("textdocumentapi/api/createparagraph", "docbuilder") %>">CreateParagraph</a>, 
<a href="<%= Url.Action("textdocumentapi/apiparagraph/addtext", "docbuilder") %>">AddText</a>, 
<a href="<%= Url.Action("textdocumentapi/apidocument/insertcontent", "docbuilder") %>">InsertContent</a>
</p>

<div class="header-gray">Result</div>
<br/>
<img alt="Chart" src="<%= Url.Content("~/content/img/plugins/insert-text.png") %>" />