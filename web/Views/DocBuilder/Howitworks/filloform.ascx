<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Filling oForm</span>
</h1>

<p class="dscr">You can use <b>Document Builder</b> to fill oForms.<br>Script fills oForm with the data stored in the <b>data</b> variable in the script.<br>You can also pass external data to the script with the <a href="<%= Url.Action("integrationapi/arguments", "docbuilder") %>">command line arguments</a> or <a href="<%= Url.Action("howitworks/globalvariable", "docbuilder") %>">exchanging data among files</a>.</p>
<div class="header-gray">Document Builder script</div>
<pre>
builder.OpenFile("Sample.oform", "Sample.oform");
var oDocument = Api.GetDocument();
    
var data = {
    "Photo": "https://source.com/image.png", 
    "Serial":"A1345",
    "Company Name": "Blue Cloud Corporation",
    "Date": "25.12.2023",
    "Recipient": "Space Corporation",
    "Qty1": "25",
    "Description1": "Frame",
    "Qty2": "2",
    "Description2": "Stack",
    "Qty3": "34",
    "Description3": "Shifter"
};

var aForms = oDocument.GetAllForms();
aForms.forEach(form => {
    if (form.GetFormType() == "textForm") form.SetText(data[form.GetFormKey()]);
    if (form.GetFormType() == "pictureForm") form.SetImage(data[form.GetFormKey()]);
});

Api.Save();
builder.SaveFile("oform", "FillForm.oform");
builder.CloseFile();
</pre>

<p>Methods used: 
    <a href="<%= Url.Action("textdocumentapi/apidocument/getallforms", "docbuilder") %>">GetAllForms</a>,
    <a href="<%= Url.Action("textdocumentapi/apicheckboxform/getformtype", "docbuilder") %>">GetFormType</a>, 
    <a href="<%= Url.Action("textdocumentapi/apiformbase/getformkey", "docbuilder") %>">GetFormKey</a>,  
    <a href="<%= Url.Action("textdocumentapi/apicomboboxform/settext", "docbuilder") %>">SetText</a>
</p>

<div class="header-gray">Result</div>
<br>
<img class="screenshot max-width-832" alt="Compare documents" src="<%= Url.Content("~/content/img/docbuilder/fill-oform-example.png") %>" />