<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("macrosamples/") %>"></a>
    <span class="hdr">Remove shapes from slides</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Removes shapes from slides in a presentation. </p>

<pre>(function()
{
  var oPresentation = Api.GetPresentation();
  for (let i = 0; i < 10; i++) {
      var oSlide = oPresentation.GetSlideByIndex(i);
      var aShape  = oSlide.GetAllShapes();
      aShape[0].Delete();
}
})();</pre>

<p>Methods used:
<a href="<%= Url.Action("presentationapi/api/getpresentation", "officeapi") %>">GetPresentation</a>,
<a href="<%= Url.Action("presentationapi/apipresentation/getslidebyindex", "officeapi") %>">GetSlideByIndex</a>,
<a href="<%= Url.Action("presentationapi/apislide/getallshapes", "officeapi") %>">GetAllShapes</a>
</p>

<div class="header-gray">Result</div>
</br >
<img class="screenshot max-width-832" alt="Next blank row" src="<%= Url.Content("~/content/img/plugins/remove-shapes.png") %>" />
