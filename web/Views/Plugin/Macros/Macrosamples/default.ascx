<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Macro samples</span>
</h1>

<p class="dscr">The following examples will show you how to use ONLYOFFICE macros and compare the JavaScript code with 
Microsoft Visual Basic for Applications code so that you could see the difference and understand what can be done to convert the VBA code to ONLYOFFICE macros.</p>

<ul class="macro-block">
    <li class="macro-example">
        <div class="macro-info"><a href="<%= Url.Action("macrosamples/writedatatoworksheetcell") %>"><div class="example-img worksheet"></div></a>
        <p class="name-example-macros"><a href="<%= Url.Action("macrosamples/writedatatoworksheetcell") %>">Write data to worksheet cell</a></p>
        <p>In this example we are writing the data (the "Hello world" phrase) to fourth column of the third row of the worksheet.</p></div>
        <p class="block_more"><a href="<%= Url.Action("macrosamples/writedatatoworksheetcell") %>">More</a></p>
    </li>
    <li class="macro-example">
        <div class="macro-info"><a href="<%= Url.Action("macrosamples/changecellbackgroundcolor") %>"><div class="example-img cell-background-color"></div></a>
        <p class="name-example-macros"><a href="<%= Url.Action("macrosamples/changecellbackgroundcolor") %>">Change cell background color</a></p>
        <p>In this example we are seting the background color of the cell B3 to blue.</p></div>
        <p class="block_more"><a href="<%= Url.Action("macrosamples/changecellbackgroundcolor") %>">More</a></p>
    </li>
    <li class="macro-example">
        <div class="macro-info"><a href="<%= Url.Action("macrosamples/changecellfontcolor") %>"><div class="example-img change-cell"></div></a>
        <p class="name-example-macros"><a href="<%= Url.Action("macrosamples/changecellfontcolor") %>">Change cell font color</a></p>
        <p>In this example we are seting the font color of the cell B4 to red.</p></div>
        <p class="block_more"><a href="<%= Url.Action("macrosamples/changecellfontcolor") %>">More</a></p>
    </li>
    <li class="macro-example">
        <div class="macro-info"><a href="<%= Url.Action("macrosamples/makecellfontbold") %>"><div class="example-img cell-font-bold"></div></a>
        <p class="name-example-macros"><a href="<%= Url.Action("macrosamples/makecellfontbold") %>">Make cell font bold</a></p>
        <p>In this example we are seting the font of the cell A2 to bold.</p></div>
        <p class="block_more"><a href="<%= Url.Action("macrosamples/makecellfontbold") %>">More</a></p>
    </li>
    <li class="macro-example">
        <div class="macro-info"><a href="<%= Url.Action("macrosamples/mergecellrange") %>"><div class="example-img merge-and-unmerge"></div></a>
        <p class="name-example-macros"><a href="<%= Url.Action("macrosamples/mergecellrange") %>">Merge cell range</a></p>
        <p>In this example we are merging selected cell range.</p></div>
        <p class="block_more"><a href="<%= Url.Action("macrosamples/mergecellrange") %>">More</a></p>
    </li>
    <li class="macro-example">
        <div class="macro-info"><a href="<%= Url.Action("macrosamples/unmergecellrange") %>"><div class="example-img unmerge-cell"></div></a>
        <p class="name-example-macros"><a href="<%= Url.Action("macrosamples/unmergecellrange") %>">Unmerge cell range</a></p>
        <p>In this example we are unmerging selected cell range.</p></div>
        <p class="block_more"><a href="<%= Url.Action("macrosamples/unmergecellrange") %>">More</a></p>
    </li>
    <li class="macro-example">
        <div class="macro-info"><a href="<%= Url.Action("macrosamples/setcolumnwidth") %>"><div class="example-img column-width"></div></a>
        <p class="name-example-macros"><a href="<%= Url.Action("macrosamples/setcolumnwidth") %>">Set column width</a></p>
        <p>In this example we are setting the width for the second ("B") column.</p></div>
        <p class="block_more"><a href="<%= Url.Action("macrosamples/setcolumnwidth") %>">More</a></p>
    </li>
    <li class="macro-example">
        <div class="macro-info"><a href="<%= Url.Action("macrosamples/formatrangeasatable") %>"><div class="example-img format-range"></div></a>
        <p class="name-example-macros"><a href="<%= Url.Action("macrosamples/formatrangeasatable") %>">Format range as table</a></p>
        <p>In this example we are formatting the range of cells as a table.</p></div>
        <p class="block_more"><a href="<%= Url.Action("macrosamples/formatrangeasatable") %>">More</a></p>
    </li>
    <li class="macro-example">
        <div class="macro-info"><a href="<%= Url.Action("macrosamples/addchart") %>"><div class="example-img add-new-chart"></div></a>
        <p class="name-example-macros"><a href="<%= Url.Action("macrosamples/addchart") %>">Add chart</a></p>
        <p>In this example we are creating the chart from the data in the "C5:D7" cell range.</p></div>
        <p class="block_more"><a href="<%= Url.Action("macrosamples/addchart") %>">More</a></p>
    </li>
    <li class="macro-example">
        <div class="macro-info"><a href="<%= Url.Action("macrosamples/highlightduplicates") %>"><div class="example-img highlight-duplicates"></div></a>
        <p class="name-example-macros"><a href="<%= Url.Action("macrosamples/highlightduplicates") %>">Highlight duplicates</a></p>
        <p>In this example we are highlighting duplicates in the selected area with different colors to recognize duplicated values quickly.</p></div>
        <p class="block_more"><a href="<%= Url.Action("macrosamples/highlightduplicates") %>">More</a></p>
    </li>
    <li class="macro-example">
        <div class="macro-info"><a href="<%= Url.Action("macrosamples/nextblankrow") %>"><div class="example-img next-blank-row"></div></a>
        <p class="name-example-macros"><a href="<%= Url.Action("macrosamples/nextblankrow") %>">Next blank row</a></p>
        <p>In this example we are finding the next available blank row in a worksheet.</p></div>
        <p class="block_more"><a href="<%= Url.Action("macrosamples/nextblankrow") %>">More</a></p>
    </li>
    <li class="macro-example">
        <div class="macro-info"><a href="<%= Url.Action("macrosamples/inserttext") %>"><div class="example-img insert-text"></div></a>
        <h2 class="name-example-macros"><a href="<%= Url.Action("macrosamples/inserttext") %>">Insert text</a></h2>
        <p>In this example we are inserting text into the document at the current cursor position.</p></div>
        <p class="block_more"><a href="<%= Url.Action("macrosamples/inserttext") %>">More</a></p>
    </li>
    <li class="macro-example">
        <div class="macro-info"><a href="<%= Url.Action("macrosamples/currencyexchangerates") %>"><div class="example-img currency-exchange-rates"></div></a>
        <h2 class="name-example-macros"><a href="<%= Url.Action("macrosamples/currencyexchangerates") %>">Currency exchange rates</a></h2>
        <p>In this example we are returning information about the exchange rates for the last several days and fill in the table with the received values.</p></div>
        <p class="block_more"><a href="<%= Url.Action("macrosamples/currencyexchangerates") %>">More</a></p>
    </li>
    <li class="macro-example">
        <div class="macro-info"><a href="<%= Url.Action("macrosamples/importcsv") %>"><div class="example-img import-csv"></div></a>
        <h2 class="name-example-macros"><a href="<%= Url.Action("macrosamples/importcsv") %>">Import CSV/TXT data</a></h2>
        <p>In this example we are importing data from remote CSV/TXT files into the spreadsheet.</p></div>
        <p class="block_more"><a href="<%= Url.Action("macrosamples/importcsv") %>">More</a></p>
    </li>
    <li class="macro-example">
        <div class="macro-info"><a href="<%= Url.Action("macrosamples/recalculatevalues") %>"><div class="example-img recalculate-values"></div></a>
        <h2 class="name-example-macros"><a href="<%= Url.Action("macrosamples/recalculatevalues") %>">Recalculate worksheet values</a></h2>
        <p>This macro repeatedly recalculates worksheet cell values within one-second intervals.</p></div>
        <p class="block_more"><a href="<%= Url.Action("macrosamples/recalculatevalues") %>">More</a></p>
    </li>
    <li class="macro-example">
        <div class="macro-info"><a href="<%= Url.Action("macrosamples/unhideallrows") %>"><div class="example-img unhide_all_rows"></div></a>
        <h2 class="name-example-macros"><a href="<%= Url.Action("macrosamples/unhideallrows") %>">Unhide all rows and columns</a></h2>
        <p>In this example we are unhiding all the rows and columns in a worksheet.</p></div>
        <p class="block_more"><a href="<%= Url.Action("macrosamples/unhideallrows") %>">More</a></p>
    </li>
      <li class="macro-example">
        <div class="macro-info"><a href="<%= Url.Action("macrosamples/removeshapes") %>"><div class="example-img replace-shapes-with-charts"></div></a>
        <h2 class="name-example-macros"><a href="<%= Url.Action("macrosamples/removeshapes") %>">Remove shapes from slides</a></h2>
        <p>In this example we are removing shapes from the presentation.</p></div>
        <p class="block_more"><a href="<%= Url.Action("macrosamples/removeshapes") %>">More</a></p>
    </li>
     <li class="macro-example">
        <div class="macro-info"><a href="<%= Url.Action("macrosamples/insertid") %>"><div class="example-img assign_unique_id"></div></a>
        <h2 class="name-example-macros"><a href="<%= Url.Action("macrosamples/insertid") %>">Insert unique id</a></h2>
        <p>In this example we are inserting a unique id into the OFORM.</p></div>
        <p class="block_more"><a href="<%= Url.Action("macrosamples/insertid") %>">More</a></p>
    </li>
     <li class="macro-example">
        <div class="macro-info"><a href="<%= Url.Action("macrosamples/completeaddressinformation") %>"><div class="example-img complete_address_information"></div></a>
        <h2 class="name-example-macros"><a href="<%= Url.Action("macrosamples/completeaddressinformation") %>">Complete address information</a></h2>
        <p>In this example we are completing address information in the spreadsheet.</p></div>
        <p class="block_more"><a href="<%= Url.Action("macrosamples/completeaddressinformation") %>">More</a></p>
    </li>
</ul>

<h2>Support</h2>
<p>If you want to request a feature or report a bug regarding macros, use the issues section <a href="https://github.com/ONLYOFFICE/plugin-macros/issues" target="_blank">on GitHub.</a></p>
<p>You can also request a macro sample by contacting us at <a href="mailto:marketing@onlyoffice.com" target="_blank">marketing@onlyoffice.com</a>.</p>



<%--<ul>
    <li>
        <a href="<%= Url.Action("macrosamples/changecellfontcolor") %>">Change cell font color</a>
    </li>
    <li>
        <a href="<%= Url.Action("macrosamples/makecellfontbold") %>">Make cell font bold</a>
    </li>
    <li>
        <a href="<%= Url.Action("macrosamples/unmergecellrange") %>">Unmerge cell range</a>
    </li>
    <li>
        <a href="<%= Url.Action("macrosamples/highlightduplicates") %>">Highlight duplicates</a>
    </li>
    <li>
        <a href="<%= Url.Action("macrosamples/nextblankrow") %>">Next blank row</a>
    </li>
</ul>--%>
