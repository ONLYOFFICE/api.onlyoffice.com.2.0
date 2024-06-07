<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("macrosamples/") %>"></a>
    <span class="hdr">Unhide all rows and columns</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Unhides all the rows and columns in the active spreadsheet.</p>

<pre>(function()
{
    var activeSheet = Api.ActiveSheet;
    var indexRowMax = 1048576;
    var n = 1;
    for (let i = 0; i < indexRowMax; i++) {
        activeSheet.GetRows(n).SetHidden(false);
        n++;
    }
    var newRange = activeSheet.GetRange("A1");
    newRange.SetValue("All the rows and columns are unhidden now");
})();</pre>

<p>Methods used:
<a href="<%= Url.Action("spreadsheetapi/api/getactivesheet", "officeapi") %>">GetActiveSheet</a>,
<a href="<%= Url.Action("spreadsheetapi/apirange/getrows", "officeapi") %>">GetRows</a>,
<a href="<%= Url.Action("spreadsheetapi/apirange/sethidden", "officeapi") %>">SetHidden</a>,
<a href="<%= Url.Action("spreadsheetapi/api/getrange", "officeapi") %>">GetRange</a>,
<a href="<%= Url.Action("spreadsheetapi/apirange/setvalue", "officeapi") %>">SetValue</a>
</p>

<div class="header-gray">Result</div>
</br >
<img class="screenshot max-width-832" alt="Unhide all rows" src="<%= Url.Content("~/content/img/plugins/unhide_all_rows.png") %>" />
