<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>
<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    List of all ONLYOFFICE Document Builder classes and methods
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">List of all ONLYOFFICE Document Builder classes and methods</span>
    </h1>

    <h2 id="Integration"><a href="<%= Url.Action("integrationapi/c") %>">Integration API (C++ wrapper)</a></h2>
    <h5 class="builder_page_class">
        <a href="<%= Url.Action("integrationapi/c/cdocbuilder") %>">CDocBuilder</a>
    </h5>
    <table class="table table-classlist">
        <thead>
            <tr class="tablerow">
                <td class="table-classlist-name">Name</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuilder/closefile") %>">CloseFile</a></td>
                <td>Closes the file to stop working with it.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuilder/createfile") %>">CreateFile</a></td>
                <td>Creates a new file.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuilder/dispose") %>">Dispose</a></td>
                <td>Unloads the <b>ONLYOFFICE Document Builder</b> from the application memory when it is no longer needed.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuilder/executecommand") %>">ExecuteCommand</a></td>
                <td>Executes the command which will be used to create the document file (text document, spreadsheet, presentation, form document, PDF).</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuilder/getcontext") %>">GetContext</a></td>
                <td>Returns the current JS <a href="<%= Url.Action("integrationapi/c/cdocbuildercontext") %>">context</a>.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuilder/getversion") %>">GetVersion</a></td>
                <td>Returns the <b>ONLYOFFICE Document Builder</b> engine version.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuilder/initialize") %>">Initialize</a></td>
                <td>Initializes the <b>ONLYOFFICE Document Builder</b> as a library for the application to be able to work with it.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuilder/issavewithdoctrenderermode") %>">IsSaveWithDoctrendererMode</a></td>
                <td>Specifies if the doctrenderer mode is used when building a document or getting content from the editor when saving a file.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuilder/openfile") %>">OpenFile</a></td>
                <td>Opens the document file which will be edited and saved afterwards.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuilder/run") %>">Run</a></td>
                <td>Runs the <b>ONLYOFFICE Document Builder</b> executable.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuilder/runtexta") %>">RunTextA</a></td>
                <td>Runs all the commands for the document creation using a single command in the UTF8 format.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuilder/runtextw") %>">RunTextW</a></td>
                <td>Runs all the commands for the document creation using a single command in the Unicode format. </td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuilder/savefile") %>">SaveFile</a></td>
                <td>Saves the file after all the changes are made.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuilder/setproperty") %>">SetProperty</a></td>
                <td>Sets an argument in the UTF8 format to the builder class which can be trasferred to the program outside the <a href="<%= Url.Action("integrationapi/c/cdocbuilder/executecommand") %>">CDocBuilder.ExecuteCommand</a> method.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuilder/setpropertyw") %>">SetPropertyW</a></td>
                <td>Sets an argument in the Unicode format which can be trasferred to the program outside the <a href="<%= Url.Action("integrationapi/c/cdocbuilder/executecommand") %>">CDocBuilder.ExecuteCommand</a> method.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuilder/settmpfolder") %>">SetTmpFolder</a></td>
                <td>Sets the path to the folder where the program will temporarily save files needed for the program correct work.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuilder/writedata") %>">WriteData</a></td>
                <td>Writes data to the log file.</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("integrationapi/c/cdocbuildercontext") %>">CDocBuilderContext</a>
    </h5>
    <table class="table table-classlist">
        <thead>
            <tr class="tablerow">
                <td class="table-classlist-name">Name</td>
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

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("integrationapi/c/cdocbuildercontextscope") %>">CDocBuilderContextScope</a>
    </h5>
    <table class="table table-classlist">
        <thead>
            <tr class="tablerow">
                <td class="table-classlist-name">Name</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuildercontextscope/close") %>">Close</a></td>
                <td>Closes the current scope.</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue") %>">CDocBuilderValue</a>
    </h5>
    <table class="table table-classlist">
        <thead>
            <tr class="tablerow">
                <td class="table-classlist-name">Name</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/call") %>">Call</a></td>
                <td>Calls the specified Document Builder method.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/clear") %>">Clear</a></td>
                <td>Clears the object.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/createnull") %>">CreateNull</a></td>
                <td>Creates a null value.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/createundefined") %>">CreateUndefined</a></td>
                <td>Creates an undefined value.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/get") %>">Get</a></td>
                <td>Returns an array value by its index.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/getlength") %>">GetLength</a></td>
                <td>Returns the length if this object is an array/typed array.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/getproperty") %>">GetProperty</a></td>
                <td>Returns a property of this object.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isarray") %>">IsArray</a></td>
                <td>Returns true if this object is an array.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isbool") %>">IsBool</a></td>
                <td>Returns true if this object is a boolean value.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isdouble") %>">IsDouble</a></td>
                <td>Returns true if this object is a double value.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isempty") %>">IsEmpty</a></td>
                <td>Returns true if this object is empty.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isfunction") %>">IsFunction</a></td>
                <td>Returns true if this object is a function.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isint") %>">IsInt</a></td>
                <td>Returns true if this object is an integer.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isnull") %>">IsNull</a></td>
                <td>Returns true if this object is null.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isobject") %>">IsObject</a></td>
                <td>Returns true if this object is an object.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isstring") %>">IsString</a></td>
                <td>Returns true if this object is a string.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/istypedarray") %>">IsTypedArray</a></td>
                <td>Returns true if this object is a typed array.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isundefined") %>">IsUndefined</a></td>
                <td>Returns true if this object is undefined.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/set") %>">Set</a></td>
                <td>Sets an array value by its index.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/setproperty") %>">SetProperty</a></td>
                <td>Sets a property to this object.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/tobool") %>">ToBool</a></td>
                <td>Converts this object to a boolean value.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/todouble") %>">ToDouble</a></td>
                <td>Converts this object to a double value.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/toint") %>">ToInt</a></td>
                <td>Converts this object to an integer.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/tostring") %>">ToString</a></td>
                <td>Converts this object to a string.</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <h2 id="Integration"><a href="<%= Url.Action("integrationapi/net") %>">Integration API (.Net wrapper)</a></h2>
    <h5 class="builder_page_class">
        <a href="<%= Url.Action("integrationapi/net/cdocbuilder") %>">CDocBuilder</a>
    </h5>
    <table class="table table-classlist">
        <thead>
            <tr class="tablerow">
                <td class="table-classlist-name">Name</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuilder/closefile") %>">CloseFile</a></td>
                <td>Closes the file to stop working with it.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuilder/createfile") %>">CreateFile</a></td>
                <td>Creates a new file.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuilder/destroy") %>">Destroy</a></td>
                <td>Unloads the <b>ONLYOFFICE Document Builder</b> from the application memory when it is no longer needed.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuilder/executecommand") %>">ExecuteCommand</a></td>
                <td>Executes the command which will be used to create the document file (text document, spreadsheet, presentation, form document, PDF).</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuilder/getcontext") %>">GetContext</a></td>
                <td>Returns the current JS <a href="<%= Url.Action("integrationapi/net/cdocbuildercontext") %>">context</a>.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuilder/getversion") %>">GetVersion</a></td>
                <td>Returns the <b>ONLYOFFICE Document Builder</b> engine version.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuilder/initialize") %>">Initialize</a></td>
                <td>Initializes the <b>ONLYOFFICE Document Builder</b> as a library for the application to be able to work with it.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuilder/issavewithdoctrenderermode") %>">IsSaveWithDoctrendererMode</a></td>
                <td>Specifies if the doctrenderer mode is used when building a document or getting content from the editor when saving a file.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuilder/openfile") %>">OpenFile</a></td>
                <td>Opens the document file which will be edited and saved afterwards.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuilder/run") %>">Run</a></td>
                <td>Runs the <b>ONLYOFFICE Document Builder</b> executable.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuilder/runtext") %>">RunText</a></td>
                <td>Runs all the commands for the document creation using a single command.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuilder/savefile") %>">SaveFile</a></td>
                <td>Saves the file after all the changes are made.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuilder/setproperty") %>">SetProperty</a></td>
                <td>Sets an argument which can be trasferred to the program outside the <a href="<%= Url.Action("integrationapi/net/cdocbuilder/executecommand") %>">CDocBuilder.ExecuteCommand</a> method.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuilder/settmpfolder") %>">SetTmpFolder</a></td>
                <td>Sets the path to the folder where the program will temporarily save files needed for the program correct work.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuilder/writedata") %>">WriteData</a></td>
                <td>Writes data to the log file.</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("integrationapi/net/cdocbuildercontext") %>">CDocBuilderContext</a>
    </h5>
    <table class="table table-classlist">
        <thead>
            <tr class="tablerow">
                <td class="table-classlist-name">Name</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildercontext/createarray") %>">CreateArray</a></td>
                <td>Creates an array, an analogue of <em>new Array (length)</em> in JS.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildercontext/createnull") %>">CreateNull</a></td>
                <td>Creates a null value, an analogue of <em>null</em> in JS.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildercontext/createobject") %>">CreateObject</a></td>
                <td>Creates an empty object, an analogue of <em>{}</em> in JS.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildercontext/createscope") %>">CreateScope</a></td>
                <td>Creates a context scope.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildercontext/createtypedarray") %>">CreateTypedArray</a></td>
                <td>Creates a Uint8Array value, an analogue of <em>Uint8Array</em> in JS.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildercontext/createundefined") %>">CreateUndefined</a></td>
                <td>Creates an undefined value, an analogue of <em>undefined</em> in JS.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildercontext/getglobal") %>">GetGlobal</a></td>
                <td>Returns the global object for the current context.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildercontext/iserror") %>">IsError</a></td>
                <td>Checks for errors in JS.</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("integrationapi/net/cdocbuildercontextscope") %>">CDocBuilderContextScope</a>
    </h5>
    <table class="table table-classlist">
        <thead>
            <tr class="tablerow">
                <td class="table-classlist-name">Name</td>
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

    <h5 class="builder_page_class">
        <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue") %>">CDocBuilderValue</a>
    </h5>
    <table class="table table-classlist">
        <thead>
            <tr class="tablerow">
                <td class="table-classlist-name">Name</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/call") %>">Call</a></td>
                <td>Calls the specified Document Builder method.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/clear") %>">Clear</a></td>
                <td>Clears the object.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/createnull") %>">CreateNull</a></td>
                <td>Creates a null value.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/createundefined") %>">CreateUndefined</a></td>
                <td>Creates an undefined value.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/get") %>">Get</a></td>
                <td>Returns an array value by its index.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/getlength") %>">GetLength</a></td>
                <td>Returns the length if this object is an array/typed array.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/getproperty") %>">GetProperty</a></td>
                <td>Returns a property of this object.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isarray") %>">IsArray</a></td>
                <td>Returns true if this object is an array.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isbool") %>">IsBool</a></td>
                <td>Returns true if this object is a boolean value.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isdouble") %>">IsDouble</a></td>
                <td>Returns true if this object is a double value.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isempty") %>">IsEmpty</a></td>
                <td>Returns true if this object is empty.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isfunction") %>">IsFunction</a></td>
                <td>Returns true if this object is a function.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isint") %>">IsInt</a></td>
                <td>Returns true if this object is an integer.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isnull") %>">IsNull</a></td>
                <td>Returns true if this object is null.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isobject") %>">IsObject</a></td>
                <td>Returns true if this object is an object.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isstring") %>">IsString</a></td>
                <td>Returns true if this object is a string.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/istypedarray") %>">IsTypedArray</a></td>
                <td>Returns true if this object is a typed array.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isundefined") %>">IsUndefined</a></td>
                <td>Returns true if this object is undefined.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/set") %>">Set</a></td>
                <td>Sets an array value by its index.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/setproperty") %>">SetProperty</a></td>
                <td>Sets a property to this object.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/tobool") %>">ToBool</a></td>
                <td>Converts this object to a boolean value.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/todouble") %>">ToDouble</a></td>
                <td>Converts this object to a double value.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/toint") %>">ToInt</a></td>
                <td>Converts this object to an integer.</td>
            </tr>
            <tr class="tablerow">
                <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/tostring") %>">ToString</a></td>
                <td>Converts this object to a string.</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <h2 id="TextDocuments"><a href="<%= Url.Action("textdocumentapi") %>">Text documents API</a></h2>
    <% var word = DocBuilderDocumentation.Instance.GetModule("word"); %>
    <% foreach (var section in word.Values) { %>
        <h5 class="builder_page_class">
            <a href="<%= section.Path %>"><%= section.Name %></a>
        </h5>
        <table class="table table-classlist">
            <thead>
                <tr class="tablerow">
                    <td class="table-classlist-name">Name</td>
                    <td>Description</td>
                </tr>
            </thead>
            <tbody>
                <% foreach (var method in section.Methods.Values) { %>
                    <tr class="tablerow">
                        <td><a href="<%= method.Path %>"><%= method.Name %></a></td>    
                        <td><%= method.Description %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    <% } %>

    <h2 id="SpreadsheetDocuments"><a href="<%= Url.Action("spreadsheetapi") %>">Spreadsheet API</a></h2>
    <% var cell = DocBuilderDocumentation.Instance.GetModule("cell"); %>
    <% foreach (var section in cell.Values) { %>
        <h5 class="builder_page_class">
            <a href="<%= section.Path %>"><%= section.Name %></a>
        </h5>
        <table class="table table-classlist">
            <thead>
                <tr class="tablerow">
                    <td class="table-classlist-name">Name</td>
                    <td>Description</td>
                </tr>
            </thead>
            <tbody>
                <% foreach (var method in section.Methods.Values) { %>
                    <tr class="tablerow">
                        <td><a href="<%= method.Path %>"><%= method.Name %></a></td>    
                        <td><%= method.Description %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    <% } %>

    <h2 id="PresentationDocuments"><a href="<%= Url.Action("presentationapi") %>">Presentation API</a></h2>
    <% var slide = DocBuilderDocumentation.Instance.GetModule("slide"); %>
    <% foreach (var section in slide.Values) { %>
        <h5 class="builder_page_class">
            <a href="<%= section.Path %>"><%= section.Name %></a>
        </h5>
        <table class="table table-classlist">
            <thead>
                <tr class="tablerow">
                    <td class="table-classlist-name">Name</td>
                    <td>Description</td>
                </tr>
            </thead>
            <tbody>
                <% foreach (var method in section.Methods.Values) { %>
                    <tr class="tablerow">
                        <td><a href="<%= method.Path %>"><%= method.Name %></a></td>    
                        <td><%= method.Description %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    <% } %>

    <h2 id="FormsDocuments"><a href="<%= Url.Action("formapi") %>">Form API</a></h2>
    <% var form = DocBuilderDocumentation.Instance.GetModule("form"); %>
    <% foreach (var section in form.Values) { %>
        <h5 class="builder_page_class">
            <a href="<%= section.Path %>"><%= section.Name %></a>
        </h5>
        <table class="table table-classlist">
            <thead>
                <tr class="tablerow">
                    <td class="table-classlist-name">Name</td>
                    <td>Description</td>
                </tr>
            </thead>
            <tbody>
                <% foreach (var method in section.Methods.Values) { %>
                    <tr class="tablerow">
                        <td><a href="<%= method.Path %>"><%= method.Name %></a></td>    
                        <td><%= method.Description %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    <% } %>

    <h5 class="builder_page_class"><a href="<%= Url.Action("global") %>">Global</a></h5>

</asp:Content>
