<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("macrosamples/") %>"></a>
    <span class="hdr">Change cell font color</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Sets the font color of the cell <b>B4</b> to red.</p>

<pre>(function()
{
    Api.GetActiveSheet().GetRange("B4").SetFontColor(Api.CreateColorFromRGB(255, 0, 0));
})();</pre>

<p>Methods used: 
<a href="<%= Url.Action("spreadsheetapi/api/getactivesheet", "officeapi") %>">GetActiveSheet</a>, 
<a href="<%= Url.Action("spreadsheetapi/apiworksheet/getrange", "officeapi") %>">GetRange</a>, 
<a href="<%= Url.Action("spreadsheetapi/apirange/setfontcolor", "officeapi") %>">SetFontColor</a> 
</p>

<div class="header-gray">Reference Microsoft VBA macro code</div>

<pre>Sub example()
    Range("B4").Font.Color = RGB(255, 0, 0)
End Sub</pre>

<div class="header-gray">Result</div>
</br >
<img class="screenshot max-width-832" alt="Font color" src="<%= Url.Content("~/content/img/plugins/font_color.png") %>" />
