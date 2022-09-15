<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CDocBuilderContext</span>
</h1>

<h4 class="header-gray" id="CDocBuilder">new CDocBuilderContext</h4>
<p class="dscr">Class used by <b>ONLYOFFICE Document Builder</b> for getting JS context for working.</p>

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
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildercontext/allocmemorytypedarray") %>">AllocMemoryTypedArray</a></td>
            <td>Allocates the memory for a typed array.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildercontext/createarray") %>">CreateArray</a></td>
            <td>Creates an array, an analogue of <em>new Array (length)</em> in JS.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildercontext/createnull") %>">CreateNull</a></td>
            <td>Creates a null value, an analogue of <em>null</em> in JS.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildercontext/createobject") %>">CreateObject</a></td>
            <td>Creates an empty object, an analogue of <em>{}</em> in JS.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildercontext/createscope") %>">CreateScope</a></td>
            <td>Creates a context scope.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildercontext/createtypedarray") %>">CreateTypedArray</a></td>
            <td>Creates a Uint8Array value, an analogue of <em>Uint8Array</em> in JS.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildercontext/createundefined") %>">CreateUndefined</a></td>
            <td>Creates an undefined value, an analogue of <em>undefined</em> in JS.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildercontext/freememorytypedarray") %>">FreeMemoryTypedArray</a></td>
            <td>Frees the memory for a typed array.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildercontext/getglobal") %>">GetGlobal</a></td>
            <td>Returns the global object for the current context.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildercontext/iserror") %>">IsError</a></td>
            <td>Checks for errors in JS.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
