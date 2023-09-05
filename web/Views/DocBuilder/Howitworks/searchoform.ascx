<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Searching by key in oForm</span>
</h1>

<p class="dscr">You can use <b>Document Builder</b> to manipulate a special form in existing oForm document.<br>This example searches for a form with its <b>GetFormKey</b> method. Learn more about TextForms on <a href="<%= Url.Action("textdocumentapi/apitextform", "docbuilder") %>">ApiTextForm</a> page.</p>
<div class="header-gray">Document Builder script</div>
<pre>
builder.OpenFile("Sample.oform", "Sample.oform");
var oDocument = Api.GetDocument();
    
var searchKey = "First name";
var formText = "John";

oDocument.GetAllForms().forEach(form => {
    if (form.GetFormKey() == searchKey) form.SetText(formText);
});

Api.Save();
builder.SaveFile("oform", "Sample.oform");
builder.CloseFile();
</pre>
<p>Methods used: 
    <a href="<%= Url.Action("textdocumentapi/apidocument/getallforms", "docbuilder") %>">GetAllForms</a>,
    <a href="<%= Url.Action("textdocumentapi/apiformbase/getformkey", "docbuilder") %>">GetFormKey</a>,  
    <a href="<%= Url.Action("textdocumentapi/apicomboboxform/settext", "docbuilder") %>">SetText</a>
</p>

<div class="header-gray">Result</div>
<br>
<img class="screenshot max-width-832" alt="Compare documents" src="<%= Url.Content("~/content/img/docbuilder/search-oform-example.png") %>" />


