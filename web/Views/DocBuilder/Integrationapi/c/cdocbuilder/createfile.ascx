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
            <td>const&nbsp;int&
            </td>
            <td>The type of the file to be created set as a hexadecimal integer for the C++ code or <b>docx</b>, <b>xlsx</b> or <b>pptx</b> for the <em>.docbuilder</em> script file
            (see <a href="<%= Url.Action("integrationapi/c/cdefault") %>#format-types">AVS_OFFICESTUDIO_FILE_XXX</a> values).</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Example</h2>
<h4 class="header-gray" >C++</h4>
<pre>std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
oBuilder.CreateFile(OFFICESTUDIO_FILE_DOCUMENT_DOCX);
CDocBuilder::Dispose();
</pre>
<h4 class="header-gray" >.docbuilder</h4>
<pre>builder.CreateFile("docx");
</pre>
