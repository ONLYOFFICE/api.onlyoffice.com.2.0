<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Events</span>
</h1>

<p>The spreadsheet events.</p>
<ul>
    <li><a href="<%= Url.Action("spreadsheetapi/events/onworksheetchange") %>">onWorksheetChange</a> - the function called when the specified range of the current worksheet is changed.</li>
</ul>
