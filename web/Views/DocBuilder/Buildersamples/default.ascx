<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Builder samples</span>
</h1>

<ul>
    <li><a href="<%= Url.Action("buildersamples/creatingaformaldocument") %>">Creating a formal document</a></li>
    <li><a href="<%= Url.Action("buildersamples/addingtext") %>">Adding text to the opened document</a></li>
</ul>
