<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("macrosamples/") %>"></a>
    <span class="hdr">Format range as a table</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Formats the range of cells <b>A1:D10</b> as a table.</p>

<pre>(function()
{
    Api.GetActiveSheet().FormatAsTable("A1:D10");
})();</pre>

<p>
Methods used: 
<a href="<%= Url.Action("spreadsheetapi/api/getactivesheet", "officeapi") %>">GetActiveSheet</a>, 
<a href="<%= Url.Action("spreadsheetapi/apiworksheet/formatastable", "officeapi") %>">FormatAsTable</a>
</p>

<div class="header-gray">Reference Microsoft VBA macro code</div>

<pre>Sub example()
    Sheet1.ListObjects.Add(xlSrcRange, Range("A1:D10"), , xlYes).Name = "myTable1"
End Sub</pre>

<div class="header-gray">Result</div>
</br >
<img class="screenshot max-width-832" alt="Range as a table" src="<%= Url.Content("~/content/img/plugins/range_as_a_table.png") %>" />
