<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("macrosamples/") %>"></a>
    <span class="hdr">Make cell font bold</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Sets the font of the cell <b>A2</b> to bold.</p>

<pre>(function()
{
    Api.GetActiveSheet().GetRange("A2").SetBold(true);
})();</pre>

<p>Methods used: 
<a href="<%= Url.Action("spreadsheetapi/api/getactivesheet", "officeapi") %>">GetActiveSheet</a>, 
<a href="<%= Url.Action("spreadsheetapi/apiworksheet/getrange", "officeapi") %>">GetRange</a>, 
<a href="<%= Url.Action("spreadsheetapi/apirange/setbold", "officeapi") %>">SetBold</a> 
</p>

<div class="header-gray">Reference Microsoft VBA macro code</div>

<pre>Sub example()
    Range("A2").Font.Bold = True
End Sub</pre>

<div class="header-gray">Result</div>
</br >
<img class="screenshot max-width-832" alt="Font bold" src="<%= Url.Content("~/content/img/plugins/font_bold.png") %>" />
