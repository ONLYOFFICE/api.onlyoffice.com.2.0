builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oPictureForm = Api.CreatePictureForm({"tip": "Upload your photo", "required": true, "placeholder": "Photo", "scaleFlag": "tooBig", "lockAspectRatio": true, "respectBorders": false, "shiftX": 50, "shiftY": 50});
oPictureForm.SetImage("https://api.onlyoffice.com/content/img/docbuilder/examples/user-profile.png", 60 * 36000, 35 * 36000);
var oParagraph = oDocument.GetElement(0);
oParagraph.AddElement(oPictureForm);
builder.SaveFile("docx", "SetImage.docx");
builder.CloseFile();
