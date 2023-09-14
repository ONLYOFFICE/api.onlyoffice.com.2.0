<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CDocBuilder</span>
</h1>


<h4 class="header-gray" id="CDocBuilder">new CDocBuilder</h4>
<p class="dscr">Base class used by <b>ONLYOFFICE Document Builder</b> for the document file (text document, spreadsheet, presentation, form document, PDF) to be generated.</p>

<h2>Methods</h2>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Name</td>
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
            <td>Returns the current JS context.</td>
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
