<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CDocBuilderContextScope</span>
</h1>

<h4 class="header-gray" id="CDocBuilder">new CDocBuilderContextScope</h4>
<p class="dscr">The stack-allocated class used by <b>ONLYOFFICE Document Builder</b> which sets the execution context for all operations executed within a local scope.
All opened scopes will be closed automatically when the builder <a href="<%= Url.Action("integrationapi/net/cdocbuilder/closefile") %>">CloseFile</a> method is called.</p>

<h2>Methods</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/net/cdocbuildercontextscope/close") %>">Close</a></td>
            <td>Closes the current scope.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
