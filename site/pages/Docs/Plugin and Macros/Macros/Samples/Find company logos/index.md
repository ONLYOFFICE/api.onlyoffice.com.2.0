---
order: -1
---

## Description

Searches for a company logo throughout the spreadsheet using the [Logo API](https://api-ninjas.com/api/logo) offered by [API Ninjas](https://api-ninjas.com).

> To use this macro, you need to obtain your own API key from API Ninjas.

<!-- This code snippet is shown in the screenshot. -->

<!-- eslint-skip -->

```ts
(function() {
    // Get the active worksheet
    var oWorksheet = Api.GetActiveSheet();
    // Get the currently selected range of cells
    var selectedRange = Api.GetSelection();
    // Define a mapping of values to insert into specific columns
    var valuesToInsert = {
        "name": "B",
        "ticker": "C",
        "image": "D"
    };
    // Loop through the values to insert and populate empty cells
    for (var value in valuesToInsert) {
        var oCell = oWorksheet.GetRange(valuesToInsert[value] + "1");
        if (!oCell.GetValue()) oCell.SetValue(value);
    } 
    // Iterate through each cell in the selected range
    selectedRange.ForEach(function (cell) {
        var value = cell.GetValue();
        if (value) {
            // Make an AJAX request to an API to retrieve data based on the cell value
            $.ajax({
                method: 'GET',
                url: 'https://api.api-ninjas.com/v1/logo?name=' + value,
                headers: { 'X-Api-Key': 'yourAPIkey' },
                contentType: 'application/json',
                success: function(result) {
                    console.log(result);
                    // Iterate through the API response and populate data into specific columns
                    for (var i = 0; i < result.length; i++) {
                        var data = result[i];
                        var currentRow = cell.GetRow() + i - 1;
                        // Populate data into specific columns and adjust column width
                        oWorksheet.GetRangeByNumber(currentRow, 1).SetValue(data.name);
                        oWorksheet.GetRangeByNumber(currentRow, 1).AutoFit(false, true);
                        oWorksheet.GetRangeByNumber(currentRow, 2).SetValue(data.ticker);
                        oWorksheet.GetRangeByNumber(currentRow, 2).AutoFit(false, true);
                        oWorksheet.GetRangeByNumber(currentRow, 3).SetValue(data.image);
                        oWorksheet.GetRangeByNumber(currentRow, 3).AutoFit(false, true);
                    }
                },
                error: function ajaxError(jqXHR) {
                    console.error('Error: ', jqXHR.responseText);
                }
            });
        }
    });
})();
```

Methods used: GetActiveSheet, GetSelection, GetRange, GetValue, ForEach, AutoFit, SetValue, GetRow, GetRangeByNumber 

## Result

<!-- imgpath -->

![Find Company Logos](/assets/images/plugins/find-company-logos.png)
