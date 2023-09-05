<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Reading oForm</span>
</h1>

<p class="dscr">You can use <b>Document Builder</b> to read values in the forms.<br>Script reads filled oForm and creates <b>Data.xlsx</b> with the form values.<br>Form Values are also printed to the <b>Command line</b> in the JSON format.</p>
<div class="header-gray">Document Builder script</div>
<pre>
builder.OpenFile("FillForm.oform", "FillForm.oform");
var oDocument = Api.GetDocument();

var fields = {};
var aForms = oDocument.GetAllForms();
aForms.forEach(form => {
    fields[form.GetFormKey()] = form.GetText();
});
var json = JSON.stringify(fields);
GlobalVariable["JSON"] = json;
console.log(json);

builder.CloseFile();
builder.CreateFile("xlsx");

var oWorksheet = Api.GetActiveSheet();
var data = JSON.parse(GlobalVariable["JSON"]);
var count = 0
for (const [key, value] of Object.entries(data)) {
    oWorksheet.GetRangeByNumber(count, 0).SetValue(key);
    oWorksheet.GetRangeByNumber(count, 1).SetValue(value);
    count++;
}
oWorksheet.GetRange("A:B").SetColumnWidth(20);
oWorksheet.GetRange("A:B").SetAlignHorizontal("left");

builder.SaveFile("xlsx", "Data.xlsx");
builder.CloseFile();

</pre>
<p>Methods used: 
    <a href="<%= Url.Action("textdocumentapi/apidocument/getallforms", "docbuilder") %>">GetAllForms</a>,
    <a href="<%= Url.Action("textdocumentapi/apiformbase/getformkey", "docbuilder") %>">GetFormKey</a>,  
    <a href="<%= Url.Action("textdocumentapi/apicomboboxform/settext", "docbuilder") %>">SetText</a>
</p>

<div class="header-gray">Result</div>
<br>
<img class="screenshot max-width-832" alt="Compare documents" src="<%= Url.Content("~/content/img/docbuilder/read-form-xlsx.png") %>" />
<div class="header-gray">Command line output</div>
<br>
<img class="screenshot max-width-832" alt="Compare documents" src="<%= Url.Content("~/content/img/docbuilder/read-form-output.png") %>" />