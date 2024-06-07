<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("macrosamples/") %>"></a>
    <span class="hdr">Recalculate worksheet values</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Repeatedly recalculates worksheet cell values within one-second intervals.</p>

<pre>(function ()
{
    let timerId = setInterval(function(){
        Api.asc_calculate(Asc.c_oAscCalculateType.All);
        var oWorksheet = Api.GetActiveSheet();
        oWorksheet.GetRange("F2").SetValue("Average");
        oWorksheet.GetRange("G2").SetValue("=AVERAGE(B2:B80)");
    }, 1000);
})();</pre>

<p>Methods used:
<a href="<%= Url.Action("spreadsheetapi/api/getactivesheet", "officeapi") %>">GetActiveSheet</a>,
<a href="<%= Url.Action("spreadsheetapi/api/getrange", "officeapi") %>">GetRange</a>,
<a href="<%= Url.Action("spreadsheetapi/apirange/setvalue", "officeapi") %>">SetValue</a>
</p>

<div class="header-gray">Result</div>
</br >
<img class="screenshot max-width-832" alt="Recalculate worksheet values" src="<%= Url.Content("~/content/img/plugins/recalculate-cell-values.png") %>" />
