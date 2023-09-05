<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Creating basic oForm</span>
</h1>

<p class="dscr">You can use <b>Document Builder</b> to create forms.<br>Script creates <b>Employee pass card</b> form that can be filled by an employee.</p>
<div class="header-gray">Document Builder script</div>
<pre>
builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
var oHeadingStyle = oDocument.GetStyle("Heading 3");
oParagraph.AddText("Employee pass card");
oParagraph.SetStyle(oHeadingStyle);

var oPictureForm = Api.CreatePictureForm({"key": "Photo", "tip": "Upload your photo", "required": true, "placeholder": "Photo", "scaleFlag": "tooBig", "lockAspectRatio": true, "respectBorders": false, "shiftX": 50, "shiftY": 50});
oParagraph = Api.CreateParagraph();
oParagraph.AddElement(oPictureForm);
oDocument.Push(oParagraph);

oParagraph = Api.CreateParagraph();
var oTextForm = Api.CreateTextForm({"key": "First name", "tip": "Enter your first name", "required": true, "placeholder": "First name", "comb": true, "maxCharacters": 13, "cellWidth": 3, "multiLine": false, "autoFit": false});
oParagraph.AddElement(oTextForm);
oPictureForm.SetImage("https://api.onlyoffice.com/content/img/docbuilder/examples/user-profile.png");
oDocument.Push(oParagraph);

Api.Save();
builder.SaveFile("oform", "PassCard.oform");
builder.CloseFile();
</pre>

<p>Methods used: 
    <a href="<%= Url.Action("textdocumentapi/apiparapr/setstyle", "docbuilder") %>">SetStyle</a>,
    <a href="<%= Url.Action("formapi/api/createpictureform", "docbuilder") %>">CreatePictureForm</a>, 
    <a href="<%= Url.Action("formapi/api/createtextform", "docbuilder") %>">CreateTextForm</a>,  
    <a href="<%= Url.Action("spreadsheetapi/apipictureform/setimage", "docbuilder") %>">SetImage</a>
</p>

<div class="header-gray">Result</div>
<br>
<img class="screenshot max-width-832" alt="Compare documents" src="<%= Url.Content("~/content/img/docbuilder/create-oform-example.png") %>" />