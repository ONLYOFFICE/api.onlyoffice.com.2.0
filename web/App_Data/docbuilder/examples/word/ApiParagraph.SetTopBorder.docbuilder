builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = oDocument.GetElement(0);
oParagraph.AddText("This is the first paragraph. We will add a thick orange border above it.");
oParagraph.SetTopBorder("single", 24, 0, 255, 111, 61);
builder.SaveFile("docx", "SetTopBorder.docx");
builder.CloseFile();
