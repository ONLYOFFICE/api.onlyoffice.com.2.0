<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateFile</span>
</h1>

<h4 class="header-gray" id="CreateFile">def CreateFile(self, type);</h4>
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
            <td><em>type</em></td>
            <td>int | str</td>
            <td>The type of the file to be created set as a hexadecimal integer for the Python code or <b>docx</b>, <b>xlsx</b>, <b>pptx</b>, <b>pdf</b>, or <b>form</b> for the <em>.docbuilder</em> script file
            (see <a href="<%= Url.Action("integrationapi/c/cdefault") %>#format-types">AVS_OFFICESTUDIO_FILE_XXX</a> values).</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Example</h2>
<h4 class="header-gray" >Python</h4>
<pre>builder = docbuilder.CDocBuilder()
builder.CreateFile("docx")
</pre>
<h4 class="header-gray" >.docbuilder</h4>
<pre>builder.CreateFile("docx");
</pre>
