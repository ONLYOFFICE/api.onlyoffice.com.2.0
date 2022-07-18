<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Builder samples</span>
</h1>

<ul>
    <li><a href="<%= Url.Action("buildersamples/creatingaformaldocument") %>">Creating a formal document</a></li>
    <li><a href="<%= Url.Action("buildersamples/addingtext") %>">Adding text to the opened document</a></li>
    <li><a href="<%= Url.Action("buildersamples/convertingadocument") %>">Converting a document</a></li>
    <li><a href="<%= Url.Action("buildersamples/creatingatable") %>">Creating a statistical table</a></li>
    <li><a href="<%= Url.Action("buildersamples/creatingapresentation") %>">Creating a presentation</a></li>
    <li><a href="<%= Url.Action("buildersamples/creatingreports") %>">Creating a comment/review report</a></li>
    <li><a href="<%= Url.Action("buildersamples/insertingawatermark") %>">Inserting a watermark</a></li>
    <li><a href="<%= Url.Action("buildersamples/mailmergereceptions") %>">Mail merge receptions</a></li>
    <li><a href="<%= Url.Action("buildersamples/mailmergeprocess") %>">Mail merge process</a></li>
</ul>
