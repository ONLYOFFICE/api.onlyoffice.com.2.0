<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("macrosamples/") %>"></a>
    <span class="hdr">Import CSV/TXT data</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Imports data from remote CSV/TXT files into the spreadsheet.</p>
<note>This macro is operational only with the desktop versions of the ONLYOFFICE editors.</note>

<pre>(function() 
{
    function LoadFile() {
        $.ajax({
            url: 'your url',
            dataType: 'text',
        }).done(successFunction);
    }
    function successFunction(data) {
        var arrAllRows = data.split(/\r?\n|\r/);
        var oWorksheet = Api.GetActiveSheet();

        //reference point
        var i = 1;
        var j = 1;

        for (var singleRow = 0; singleRow < arrAllRows.length; singleRow++) {
            var rowCells = arrAllRows[singleRow].split(',');
            for (var rowCell = 0; rowCell < rowCells.length; rowCell++) {
               oWorksheet.GetCells(i,j).SetValue(rowCells[rowCell]);
                j = j + 1;
            }
            i = i + 1;
            j = 1;
        }
    }
    LoadFile();
    let reload = setInterval(function(){
        Api.asc_calculate(Asc.c_oAscCalculateType.All);
    });
})();</pre>

<p>Methods used:
<a href="<%= Url.Action("spreadsheetapi/api/getactivesheet", "officeapi") %>">GetActiveSheet</a>,
<a href="<%= Url.Action("spreadsheetapi/apiworksheet/getcells", "officeapi") %>">GetCells</a>,
<a href="<%= Url.Action("spreadsheetapi/apirange/setvalue", "officeapi") %>">SetValue</a>
</p>

<div class="header-gray">Result</div>
</br >
<img class="screenshot max-width-832" alt="Import CSV/text data" src="<%= Url.Content("~/content/img/plugins/import-csv-macro.png") %>" />
