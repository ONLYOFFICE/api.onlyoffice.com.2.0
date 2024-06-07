builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph0 = oDocument.GetElement(0);
oParagraph0.AddText("This is paragraph #0, you must not push it to take effect.");
for (let nParaIncrease = 0; nParaIncrease < 5; ++nParaIncrease) {
  var oParagraph = Api.CreateParagraph();
  oParagraph.AddText("This is paragraph #" + (nParaIncrease + 1) + ", you must push it to take effect.");
  oDocument.Push(oParagraph);
}
builder.SaveFile("docx", "Push.docx");
builder.CloseFile();
