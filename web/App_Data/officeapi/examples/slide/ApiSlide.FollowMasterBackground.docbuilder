builder.CreateFile("pptx");
var oPresentation = Api.GetPresentation();
var oSlide = oPresentation.GetSlideByIndex(0);
var oMaster = oPresentation.GetMaster(0);
var oFill = Api.CreateSolidFill(Api.CreateRGBColor(255, 111, 61));
oMaster.SetBackground(oFill);
oSlide.FollowMasterBackground();
builder.SaveFile("pptx", "FollowMasterBackground.pptx");
builder.CloseFile();