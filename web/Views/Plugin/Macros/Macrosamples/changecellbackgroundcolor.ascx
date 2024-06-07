<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("macrosamples/") %>"></a>
    <span class="hdr">Change cell background color</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Sets the background color of the cell <b>B3</b> to blue.</p>

<pre>(function()
{
    Api.GetActiveSheet().GetRange("B3").SetFillColor(Api.CreateColorFromRGB(0, 0, 250));
})();</pre>

<p>Methods used: 
<a href="<%= Url.Action("spreadsheetapi/api/getactivesheet", "officeapi") %>">GetActiveSheet</a>, 
<a href="<%= Url.Action("spreadsheetapi/apiworksheet/getrange", "officeapi") %>">GetRange</a>, 
<a href="<%= Url.Action("spreadsheetapi/apirange/setfillcolor", "officeapi") %>">SetFillColor</a>, 
<a href="<%= Url.Action("spreadsheetapi/api/createcolorfromrgb", "officeapi") %>">CreateColorFromRGB</a>
</p>

<div class="header-gray">Reference Microsoft VBA macro code</div>

<pre>Sub example()
    Range("B3").Interior.Color = RGB(0, 0, 250)
End Sub</pre>

<div class="header-gray">Result</div>
</br >
<img class="screenshot max-width-832" alt="Background color" src="<%= Url.Content("~/content/img/plugins/background_color.png") %>" />
