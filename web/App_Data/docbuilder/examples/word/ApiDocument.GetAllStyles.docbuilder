builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("Document styles:");
oParagraph.SetBold(true);
var aStyles = oDocument.GetAllStyles();
for (let i = 0; i < aStyles.length; i++ ){
    oParagraph = Api.CreateParagraph();
    oParagraph.AddText(aStyles[i].GetName());
    oDocument.AddElement(i + 1, oParagraph);
}
builder.SaveFile("docx", "GetAllStyles.docx");
builder.CloseFile();