<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateFile</span>
</h1>

<h4 class="header-gray" id="CreateFile">HRESULT CreateFile([in] BSTR type, [out, retval] VARIANT_BOOL* result);</h4>
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
            <td>BSTR</td>
            <td>The file extension. The following values are possible: <b>docx</b>, <b>xlsx</b>, <b>pptx</b>, or <b>pdf</b>
            (see <a href="<%= Url.Action("integrationapi/default") %>#format-types">AVS_OFFICESTUDIO_FILE_XXX</a> values).</td>
        </tr>
        <tr class="tablerow">
            <td><em>result</em></td>
            <td>VARIANT_BOOL*</td>
            <td>Specifies if the operation of creating a file is successful or not.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Example</h2>
<h4 class="header-gray">COM</h4>
<pre>CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
VARIANT_BOOL b;
oBuilder-&gt;Initialize();
oBuilder-&gt;CreateFile(_bstr_t("docx"), &b);
oBuilder-&gt;Dispose();
</pre>
<h4 class="header-gray" >.docbuilder</h4>
<pre>builder.CreateFile("docx");
</pre>
