<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("macrosamples/") %>"></a>
    <span class="hdr">Write data to worksheet cell</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Write the data (the <em>Hello world</em> phrase) to the worksheet third column of the fourth row.</p>

<pre>(function()
{
    Api.GetActiveSheet().GetRange("C4").SetValue("Hello world");
})();</pre>

<p>Methods used: 
<a href="<%= Url.Action("spreadsheetapi/api/getactivesheet", "docbuilder") %>">GetActiveSheet</a>, 
<a href="<%= Url.Action("spreadsheetapi/apiworksheet/getrange", "docbuilder") %>">GetRange</a>, 
<a href="<%= Url.Action("spreadsheetapi/apirange/setvalue", "docbuilder") %>">SetValue</a>
</p>

<div class="header-gray">Reference Microsoft VBA macro code</div>

<pre>Sub example()
    Cells(3, 4)="Hello world"
End Sub</pre>

<div class="header-gray">Result</div>
</br >
<img alt="Write data" src="<%= Url.Content("~/content/img/plugins/write_data_to_cell.png") %>" />
