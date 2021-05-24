﻿<%@  Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Writing your own macros
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Writing your own macros</span>
    </h1>

    <p class="dscr">Now that you know how macros work, try to write your own macro. 
        We have a table and need to color the alternate table rows (odd will be colored green, even will become red). 
        The table contains 200 rows and columns from <b>A</b> to <b>S</b>. It would take a lot of time to do that manually. So, using macros will be the best solution for this problem.</p>

    <ol>
        <li>Open ONLYOFFICE editors and create a new spreadsheet.</li>
        <li>Now open the <b>Plugins</b> tab and select <b>Macros</b>. The macros window will pop up.</li>
        <li>Click <b>New</b>. You will be presented with the basic function wrapper which will allow you to enter the necessary code:

            <pre>(function()
{
    // ... your code goes here ...
})();</pre>
        </li>
        <li>Let's consult the <b>ONLYOFFICE Document Builder</b> <a href="<%= Url.Action("basic", "docbuilder") %>">API documentation</a> to see what we need to complete our task:
            <ul>
                <li>First, get the current worksheet using the <a href="<%= Url.Action("spreadsheetapi/api/getactivesheet", "docbuilder") %>">GetActiveSheet</a> method:
                    <pre>var oWorksheet = Api.GetActiveSheet();</pre>
                </li>
                <li>Then create a loop to run from the first to the last row:
                    <pre>for (var i = 1; i < 200; i += 2) {
}</pre>
                </li>
                <li>Set two variables: one for odd rows, the second for even rows:
                    <pre>var rowOdd = i, rowEven = i + 1;</pre>
                </li>
                <li>Now that we can access both the odd and even rows, let's color them in proper colors. Set the desired colors using the <a href="<%= Url.Action("spreadsheetapi/api/createcolorfromrgb", "docbuilder") %>">CreateColorFromRGB</a> method. Get the cell range within the row using the <a href="<%= Url.Action("spreadsheetapi/apiworksheet/getrange", "docbuilder") %>">GetRange</a> method and set the color for the odd rows:
                    <pre>oWorksheet.GetRange("A" + rowOdd + ":S" + rowOdd).SetFillColor(Api.CreateColorFromRGB(118, 190, 39));</pre>
                    The same is for the even rows, but with a different color:
                    <pre>oWorksheet.GetRange("A" + rowEven + ":S" + rowEven).SetFillColor(Api.CreateColorFromRGB(186, 56, 46));</pre>
                </li>
            </ul>
        </li>
    </ol>

    <p>Now let's sum it up with the complete script code:</p>

    <pre>(function()
{
    var oWorksheet = Api.GetActiveSheet();
    for (var i = 1; i < 200; i += 2) {
        var rowOdd = i, rowEven = i + 1;
        oWorksheet.GetRange("A" + rowOdd + ":S" + rowOdd).SetFillColor(Api.CreateColorFromRGB(118, 190, 39));
        oWorksheet.GetRange("A" + rowEven + ":S" + rowEven).SetFillColor(Api.CreateColorFromRGB(186, 56, 46));
    }
})();</pre>

    <p>Paste the code above to the macros window and click <b>Run</b>. The table rows from 1 to 200 will be colored alternately in less than a second.</p>
    <img alt="Alternate raws" src="<%= Url.Content("~/content/img/plugins/alternate-raws.png") %>" />

</asp:Content>
