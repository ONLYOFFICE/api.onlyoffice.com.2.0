<%@  Page
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
        <li>Let's consult the <a href="<%= Url.Action("spreadsheetapi", "officeapi") %>">Office API documentation</a> to see what we need to complete our task:
            <ul>
                <li>First, get the current worksheet using the <a href="<%= Url.Action("spreadsheetapi/api/getactivesheet", "officeapi") %>">GetActiveSheet</a> method:
                    <pre>var oWorksheet = Api.GetActiveSheet();</pre>
                </li>
                <li>Then create a loop to run from the first to the last row:
                    <pre>for (var i = 1; i < 200; i += 2) {
}</pre>
                </li>
                <li>Set two variables: one for odd rows, the second for even rows:
                    <pre>var rowOdd = i, rowEven = i + 1;</pre>
                </li>
                <li>Now that we can access both the odd and even rows, let's color them in proper colors. Set the desired colors using the <a href="<%= Url.Action("spreadsheetapi/api/createcolorfromrgb", "officeapi") %>">CreateColorFromRGB</a> method. Get the cell range within the row using the <a href="<%= Url.Action("spreadsheetapi/apiworksheet/getrange", "officeapi") %>">GetRange</a> method and set the color for the odd rows:
                    <pre>oWorksheet.GetRange("A" + rowOdd + ":S" + rowOdd).SetFillColor(Api.CreateColorFromRGB(138, 181, 155));</pre>
                    The same is for the even rows, but with a different color:
                    <pre>oWorksheet.GetRange("A" + rowEven + ":S" + rowEven).SetFillColor(Api.CreateColorFromRGB(216, 227, 220));</pre>
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
        oWorksheet.GetRange("A" + rowOdd + ":S" + rowOdd).SetFillColor(Api.CreateColorFromRGB(138, 181, 155));
        oWorksheet.GetRange("A" + rowEven + ":S" + rowEven).SetFillColor(Api.CreateColorFromRGB(216, 227, 220));
    }
})();</pre>

    <p>Paste the code above to the macros window and click <b>Run</b>. The table rows from 1 to 200 will be colored alternately in less than a second.</p>
    <img class="screenshot max-width-832" alt="Alternate raws" src="<%= Url.Content("~/content/img/plugins/alternate-raws.png") %>" />

    <h2 id="events" class="copy-link">Subscribing to events</h2>
    <p>To subscribe to the specified event and call the callback function when the event fires, use the <a href="<%= Url.Action("textdocumentapi/api/attachevent", "officeapi") %>">attachEvent</a> method.</p>
    <p>For example, to subscribe to an event when a hyperlink in a document is clicked, use the following lines:</p>
    <pre>
Api.attachEvent("asc_onHyperlinkClick", function(){
    console.log("HYPERLINK!!!");
});
</pre>
    <p>When you click any hyperlink in a document, the <b>asc_onHyperlinkClick</b> event will be executed and the <em>"HYPERLINK!!!"</em> message will appear in the console.</p>
    <img alt="Click hyperlink" class="screenshot" src="<%= Url.Content("~/content/img/plugins/click-hyperlink.png") %>" />

    <h2 id="assign-macro" class="copy-link">Assigning macros</h2>
    <p>In the spreadsheet editor, you can assign a macro to the graphic object:</p>
    <ol>
        <li>Right-click the graphic object.</li>
        <li>Click <b>Assign Macro</b>.</li>
        <li>Choose a macro in the appeared window. You can type the macro name in the corresponding field.</li>
        <li>Click the <b>OK</b> button.</li>
    </ol>
    <img class="screenshot max-width-832" alt="Assign macro" src="<%= Url.Content("~/content/img/plugins/assign-macro.png") %>" />
    <p>To run the macro, just click the graphic object and the script will be executed.</p>

</asp:Content>
