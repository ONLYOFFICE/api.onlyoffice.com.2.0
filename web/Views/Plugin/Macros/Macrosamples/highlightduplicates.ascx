<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("macrosamples/") %>"></a>
    <span class="hdr">Highlight duplicates</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Highlights duplicates in the selected area with different colors to recognize duplicated values quickly.</p>

<pre>(function () 
{
    // Background color of cells with non-repeating values
    var whiteFill = Api.CreateColorFromRGB(255, 255, 255);
    // The current index of the color range
    var uniqueColorIndex = 0;
    // Color range to highlight duplicate values
    var uniqueColors = [Api.CreateColorFromRGB(255, 255, 0),
        Api.CreateColorFromRGB(204, 204, 255),
        Api.CreateColorFromRGB(0, 255, 0),
        Api.CreateColorFromRGB(0, 128, 128),
        Api.CreateColorFromRGB(192, 192, 192),
        Api.CreateColorFromRGB(255, 204, 0)];

    // Function to get color for duplicates
    function getColor() {
        // If you have chosen all the unique colors, then let's go from the beginning
        if (uniqueColorIndex === uniqueColors.length) {
            uniqueColorIndex = 0;
        }
        return uniqueColors[uniqueColorIndex++];
    }

    // Getting an active sheet
    var activeSheet = Api.ActiveSheet;
    // Getting selection on the active sheet
    var selection = activeSheet.Selection;
    // Map of values in cells with the duplicates number
    var mapValues = {};
    // All cells range
    var arrRanges = [];
    // Going through the selection
    selection.ForEach(function (range) {
        // Getting value from cell
        var value = range.GetValue();
        if (!mapValues.hasOwnProperty(value)) {
            mapValues[value] = 0;
        }
        mapValues[value] += 1;
        arrRanges.push(range);
    });
    var value;
    var mapColors = {};
    // We go through all the cells of the selection and setting the highlighting if this value is repeated more than 1 time
    for (var i = 0; i < arrRanges.length; ++i) {
        value = arrRanges[i].GetValue();
        if (mapValues[value] > 1) {
            if (!mapColors.hasOwnProperty(value)) {
                mapColors[value] = getColor();
            }
            arrRanges[i].SetFillColor(mapColors[value]);
        } else {
            arrRanges[i].SetFillColor(whiteFill);
        }
    }
})();</pre>

<p>Methods used: 
<a href="<%= Url.Action("spreadsheetapi/api/createcolorfromrgb", "officeapi") %>">CreateColorFromRGB</a>
<a href="<%= Url.Action("spreadsheetapi/api/getactivesheet", "officeapi") %>">GetActiveSheet</a>, 
<a href="<%= Url.Action("spreadsheetapi/apiworksheet/getselection", "officeapi") %>">GetSelection</a>, 
<a href="<%= Url.Action("spreadsheetapi/apirange/foreach", "officeapi") %>">ForEach</a>,
<a href="<%= Url.Action("spreadsheetapi/apirange/getvalue", "officeapi") %>">GetValue</a>,
<a href="<%= Url.Action("spreadsheetapi/apirange/setfillcolor", "officeapi") %>">SetFillColor</a>
</p>

<div class="header-gray">Reference Microsoft VBA macro code</div>

<p><a href="https://www.extendoffice.com/documents/excel/3772-excel-highlight-duplicate-values-in-different-colors.html" target="_blank">This VBA macro</a> was used as a base.</p>
<pre>Sub example()
    Dim xRg As Range
    Dim xTxt As String
    Dim xCell As Range
    Dim xChar As String
    Dim xCellPre As Range
    Dim xCIndex As Long
    Dim xCol As Collection
    Dim I As Long
    On Error Resume Next
    If ActiveWindow.RangeSelection.Count > 1 Then
      xTxt = ActiveWindow.RangeSelection.AddressLocal
    Else
      xTxt = ActiveSheet.UsedRange.AddressLocal
    End If
    Set xRg = Application.InputBox("please select the data range:", "Kutools for Excel", xTxt, , , , , 8)
    If xRg Is Nothing Then Exit Sub
    xCIndex = 2
    Set xCol = New Collection
    For Each xCell In xRg
      On Error Resume Next
      xCol.Add xCell, xCell.Text
      If Err.Number = 457 Then
        xCIndex = xCIndex + 1
        Set xCellPre = xCol(xCell.Text)
        If xCellPre.Interior.ColorIndex = xlNone Then xCellPre.Interior.ColorIndex = xCIndex
        xCell.Interior.ColorIndex = xCellPre.Interior.ColorIndex
      ElseIf Err.Number = 9 Then
        MsgBox "Too many duplicate companies!", vbCritical, "Kutools for Excel"
        Exit Sub
      End If
      On Error GoTo 0
    Next
End Sub</pre>

<div class="header-gray">Result</div>
</br >
<img class="screenshot max-width-832" alt="Highlight duplicates" src="<%= Url.Content("~/content/img/plugins/highlight_duplicates.png") %>" />
