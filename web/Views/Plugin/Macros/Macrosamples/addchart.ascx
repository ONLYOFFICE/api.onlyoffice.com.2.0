<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("macrosamples/") %>"></a>
    <span class="hdr">Add chart</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Add new chart to the selected cell range.</p>

<pre>(function()
{
    Api.GetActiveSheet().AddChart("'Sheet1'!$C$5:$D$7", true, "bar", 2, 105 * 36000, 105 * 36000, 5, 2 * 36000, 1, 3 * 36000);
})();</pre>

<p>Methods used: 
<a href="<%= Url.Action("spreadsheetapi/api/getactivesheet", "docbuilder") %>">GetActiveSheet</a>, 
<a href="<%= Url.Action("spreadsheetapi/apiworksheet/addchart", "docbuilder") %>">AddChart</a>
</p>

<div class="header-gray">Reference Microsoft VBA macro code</div>

<pre>Sub example()
    With ActiveSheet.ChartObjects.Add(Left:=300, Width:=300, Top:=10, Height:=300)
        .Chart.SetSourceData Source:=Sheets("Sheet1").Range("C5:D7")
    End With
End Sub</pre>

<div class="header-gray">Result</div>
</br >
<img alt="Chart" src="<%= Url.Content("~/content/img/plugins/add_chart.png") %>" />
