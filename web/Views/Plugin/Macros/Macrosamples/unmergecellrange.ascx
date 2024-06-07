<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("macrosamples/") %>"></a>
    <span class="hdr">Unmerge cell range</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Unmerges the selected cell range.</p>

<pre>(function()
{
    Api.GetActiveSheet().GetRange("C5:D10").UnMerge();
})();</pre>

<p>Methods used: 
<a href="<%= Url.Action("spreadsheetapi/api/getactivesheet", "officeapi") %>">GetActiveSheet</a>, 
<a href="<%= Url.Action("spreadsheetapi/apiworksheet/getrange", "officeapi") %>">GetRange</a>, 
<a href="<%= Url.Action("spreadsheetapi/apirange/unmerge", "officeapi") %>">UnMerge</a>
</p>

<div class="header-gray">Reference Microsoft VBA macro code</div>

<pre>Sub example()
    Range("C5:D10").UnMerge
End Sub</pre>

<div class="header-gray">Result</div>
</br >
<img class="screenshot max-width-832" alt="Unmerge-before" src="<%= Url.Content("~/content/img/plugins/unmerge_cells_before.png") %>" />
<img class="screenshot max-width-832" alt="Unmerge-after" src="<%= Url.Content("~/content/img/plugins/unmerge_cells_after.png") %>" />
