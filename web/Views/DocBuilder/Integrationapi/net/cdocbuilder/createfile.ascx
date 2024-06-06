<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateFile</span>
</h1>

<h4 class="header-gray" id="CreateFile">bool CreateFile(nType);</h4>
<p class="dscr">Creates a new file. The type of the file which will be created needs to be set.</p>

<h2>Parameters:</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Type</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><em>nType</em></td>
            <td>int</td>
            <td>The type of the file to be created set as a hexadecimal integer for the .Net code or <b>docx</b>, <b>xlsx</b>, <b>pptx</b>, <b>pdf</b>, or <b>form</b> for the <em>.docbuilder</em> script file
            (see <a href="<%= Url.Action("integrationapi/c/cdefault") %>#format-types">AVS_OFFICESTUDIO_FILE_XXX</a> values).</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Example</h2>
<h4 class="header-gray" >.Net</h4>
<pre>string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
var doctype = (int)OfficeFileTypes.Document.DOCX;
oBuilder.CreateFile(doctype);
CDocBuilder.Destroy();
</pre>
<h4 class="header-gray" >.docbuilder</h4>
<pre>builder.CreateFile("docx");
</pre>
