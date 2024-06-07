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
            <td><em>sExtension</em></td>
            <td>const&nbsp;wchar_t*
            </td>
            <td>The file extension. The following values are possible: <b>docx</b>, <b>xlsx</b>, <b>pptx</b>, or <b>pdf</b>
            (see <a href="<%= Url.Action("integrationapi/default") %>#format-types">AVS_OFFICESTUDIO_FILE_XXX</a> values).</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Example</h2>
<h4 class="header-gray" >C++</h4>
<pre>std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
oBuilder.CreateFile("docx");
CDocBuilder::Dispose();
</pre>
<h4 class="header-gray" >.docbuilder</h4>
<pre>builder.CreateFile("docx");
</pre>
