<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("macrosamples/") %>"></a>
    <span class="hdr">Complete address information</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Completes the basic address data with detailed address information and inserts it into a spreadsheet.</p>

<pre>// Macros structure:
// Read Address (Cell A2) ->
// REQUEST Data -> 
// Get RESPONSE and Create Address Details object ->
// PASTE Address Details -> 
// Read Address on the next row (Cell A3) and REQUEST Data

(function()
{
    const API_KEY = 'yourAPIkey'
    const ENDPOINT = 'https://api.geoapify.com/v1/geocode/search'
    const oWorksheet = Api.GetActiveSheet()
    let row = 2
    makeRequest(oWorksheet.GetRange(`A${row}`).GetText())
    
    // REQUEST
    function makeRequest(ADDRESS) {
        if (ADDRESS === '') return
        $.ajax({
            url: `${ENDPOINT}?text=${addressToRequest(ADDRESS)}&apiKey=${API_KEY}`,
            dataType: 'json',
        }).done(successFunction)
    }
    // London, United Kingdom -> London%2C%20United%20Kingdom
    function addressToRequest (address) {
        return address.replaceAll(' ', '%20').replaceAll(',', '%2C')
    }
    
    // RESPONSE
    function successFunction(response) {
        const data = createAddressDetailsObject(response)
        pasteAddressDetails(data)
        reload()
    }
    // Create Address Details object if address is found
    function createAddressDetailsObject(response) {
        if (response.features.length === 0) {
            return { error: 'Address not found' }
        }
        console.log(response)
        let data = {
            country: response.features[0].properties.country,
            county: response.features[0].properties.county,
            city: response.features[0].properties.city,
            post_code: response.features[0].properties.postcode,
            full_address_line: response.features[0].properties.formatted
        }
        data = checkMissingData(data)
        return data
    }
    // Replace missing fields with '-'
    function checkMissingData(data) {
        Object.keys(data).forEach(key => {
            if(data[key] === undefined) data[key] = '-'
        })
        return data
    }
    
    // PASTE
    function pasteAddressDetails(data) {
        const oRange = oWorksheet.GetRange(`B${row}:F${row}`)
        if (data.error !== undefined) {
            oRange.SetValue([[data.error]])
        } else {
            oRange.SetValue([
                [
                    data.country,
                    data.county,
                    data.city,
                    data.post_code,
                    data.full_address_line
                ]
            ]);
        }
        // Execute recursively until "Address" value is empty
        row++
        makeRequest(oWorksheet.GetRange(`A${row}:A${row}`).GetText())
    }
    // Sheet has to be reloaded on changes
    function reload() {
        let reload = setInterval(function(){
            Api.asc_calculate(Asc.c_oAscCalculateType.All);
        })
    }
})();</pre>

<p>Methods used: 
<a href="<%= Url.Action("spreadsheetapi/api/getactivesheet", "officeapi") %>">GetActiveSheet</a>,
<a href="<%= Url.Action("spreadsheetapi/apiworksheet/getrange", "officeapi") %>">GetRange</a>,
<a href="<%= Url.Action("spreadsheetapi/apirange/setvalue", "officeapi") %>">SetValue</a>,
<a href="<%= Url.Action("spreadsheetapi/apirange/gettext", "officeapi") %>">GetText</a>
</p>
<note>For the macros to function, replace <em>yourAPIkey</em> with the API key obtained from <a href="https://www.geoapify.com/" target="_blank">Geoapify</a>.</note>

<div class="header-gray">Result</div>
</br >
<img class="screenshot max-width-832" alt="Write data" src="<%= Url.Content("~/content/img/plugins/complete_address_information.png") %>" />
