builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oComboBoxForm = Api.CreateComboBoxForm({"key": "Personal information", "tip": "Choose your country", "required": true, "placeholder": "Country", "editable": true, "autoFit": false});
var oParagraph = oDocument.GetElement(0);
oParagraph.AddElement(oComboBoxForm);
oComboBoxForm.SetListValues(["Latvia", "USA", "UK"]);
oComboBoxForm.SetText("France");
oComboBoxForm.SelectListValue("USA");
var aListValues = oComboBoxForm.GetListValues();
oParagraph = Api.CreateParagraph();
oParagraph.AddText("Combo box list values: ");
oParagraph.AddLineBreak();
for (let i = 0; i < aListValues.length; i++ ){
    oParagraph.AddText(aListValues[i]);
    oParagraph.AddLineBreak();
}
var bEdit = oComboBoxForm.IsEditable();
oParagraph.AddLineBreak();
oParagraph.AddText("The first combo box from this document is editable: " + bEdit);
oDocument.Push(oParagraph);
builder.SaveFile("docx", "ApiComboBoxForm.docx");
builder.CloseFile();
