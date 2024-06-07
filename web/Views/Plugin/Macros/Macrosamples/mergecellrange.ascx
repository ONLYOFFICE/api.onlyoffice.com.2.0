<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("macrosamples/") %>"></a>
    <span class="hdr">Merge cell range</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Merges the selected cell range.</p>

<pre>(function()
{
    Api.GetActiveSheet().GetRange("A1:B3").Merge(true);
})();</pre>

<p>Methods used: 
<a href="<%= Url.Action("spreadsheetapi/api/getactivesheet", "officeapi") %>">GetActiveSheet</a>, 
<a href="<%= Url.Action("spreadsheetapi/apiworksheet/getrange", "officeapi") %>">GetRange</a>, 
<a href="<%= Url.Action("spreadsheetapi/apirange/merge", "officeapi") %>">Merge</a>
</p> 

<div class="header-gray">Reference Microsoft VBA macro code</div>

<pre>Sub example()
    Range("A1:B3").Merge
End Sub</pre>

<div class="header-gray">Result</div>
</br >
<img class="screenshot max-width-832" alt="Merge cells" src="<%= Url.Content("~/content/img/plugins/merge_cells.png") %>" />
