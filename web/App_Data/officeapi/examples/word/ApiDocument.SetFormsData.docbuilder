builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph1 = oDocument.GetElement(0);
var oCheckBox = Api.CreateCheckBoxForm({"key": "BestCompany"});
oParagraph1.Push(oCheckBox);
var oTextForm = Api.CreateTextForm({"key": "CompanyName"});
oParagraph1.Push(oTextForm);
oDocument.SetFormsData([
    {"key": "BestCompany", "value": true},
    {"key": "CompanyName", "value": "ONLYOFFICE"}
]);
builder.SaveFile("docx", "SetFormsData.docx");
builder.CloseFile();