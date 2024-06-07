<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("macrosamples/") %>"></a>
    <span class="hdr">Set column width</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Sets the width for the column <b>B</b>.</p>

<pre>(function()
{
    Api.GetActiveSheet().SetColumnWidth(1, 25);
})();</pre>

<p>Methods used: 
<a href="<%= Url.Action("spreadsheetapi/api/getactivesheet", "officeapi") %>">GetActiveSheet</a>, 
<a href="<%= Url.Action("spreadsheetapi/apiworksheet/setcolumnwidth", "officeapi") %>">SetColumnWidth</a>
</p>

<div class="header-gray">Reference Microsoft VBA macro code</div>

<pre>Sub example()
    Columns("B").ColumnWidth = 25
End Sub</pre>

<div class="header-gray">Result</div>
</br >
<img class="screenshot max-width-832" alt="Column width" src="<%= Url.Content("~/content/img/plugins/column_width.png") %>" />
