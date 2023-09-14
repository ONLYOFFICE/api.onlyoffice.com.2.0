<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">External access to the document editing</span>
</h1>

<p class="dscr">The following examples will show you how to edit text documents, spreadsheets, presentations, and fillable forms from an external source.
To achieve this, use our <a href="<%= Url.Action("connector") %>">Automation API</a>.</p>

<ul class="connector-block">
    <li class="connector-example">
        <div class="connector-info"><a href="<%= Url.Action("interactingoutside/comments") %>"><div class="example-img comments"></div></a>
        <p class="name-example-connector"><a href="<%= Url.Action("interactingoutside/comments") %>">Working with comments</a></p>
        <p>Collects all the comments from the document and displays them in the custom interface.</p></div>
        <p class="block_more"><a href="<%= Url.Action("interactingoutside/comments") %>">More</a></p>
    </li>
    <li class="connector-example">
        <div class="connector-info"><a href="<%= Url.Action("interactingoutside/reviewwork") %>"><div class="example-img review-work"></div></a>
        <p class="name-example-connector"><a href="<%= Url.Action("interactingoutside/reviewwork") %>">Working with review changes</a></p>
        <p>Manages review process from an external source.</p></div>
        <p class="block_more"><a href="<%= Url.Action("interactingoutside/reviewwork") %>">More</a></p>
    </li>
    <li class="connector-example">
        <div class="connector-info"><a href="<%= Url.Action("interactingoutside/fillingform") %>"><div class="example-img filling-form"></div></a>
        <p class="name-example-connector"><a href="<%= Url.Action("interactingoutside/fillingform") %>">Filling out the form</a></p>
        <p>Fills in the empty cells in the form.</p></div>
        <p class="block_more"><a href="<%= Url.Action("interactingoutside/fillingform") %>">More</a></p>
    </li>
</ul>
