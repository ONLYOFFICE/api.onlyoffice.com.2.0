<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SaveFile</span>
</h1>

<h4 class="header-gray" id="SaveFile">HRESULT SaveFile([in] BSTR type, [in] BSTR path, [out, retval] VARIANT_BOOL* result);</h4>
<p class="dscr">Saves the file after all the changes are made. The type of the file which will be saved needs to be set.</p>

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
            <td>The file extension. The following values are possible: <b>docx</b>, <b>odt</b>, <b>rtf</b>, <b>txt</b>, <b>pptx</b>, <b>xlsx</b>, <b>ods</b>, <b>csv</b>, <b>pdf</b>, <b>form</b>
            (see <a href="<%= Url.Action("integrationapi/default") %>#format-types">AVS_OFFICESTUDIO_FILE_XXX</a> values).</td>
        </tr>
        <tr class="tablerow">
            <td><em>path</em></td>
            <td>BSTR</td>
            <td>The path to the file to be saved together with its name and extension.</td>
        </tr>
        <tr class="tablerow">
            <td><em>result</em></td>
            <td>VARIANT_BOOL*</td>
            <td>Specifies if the operation of saving a file is successful or not.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Example</h2>
<h4 class="header-gray">COM</h4>
<pre>
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
VARIANT_BOOL b;
oBuilder-&gt;Initialize();
oBuilder-&gt;SaveFile("docx", "result.docx", &b);
oBuilder-&gt;Dispose();
</pre>
<h4 class="header-gray">.docbuilder</h4>
<pre>
builder.SaveFile("docx", "result.docx");
</pre>

<h2 id="SaveForm">Saving form documents</h2>
<p><b>ONLYOFFICE Document Builder</b> allows you to save your documents as PDF forms. To do this, use the <b>form</b> value as the <em>type</em> parameter.
If you use the <b>pdf</b> type, the document will be saved as a regular <em>pdf</em> file.</p>
<h2>Example</h2>
<h4 class="header-gray">Saving PDF form</h4>
<pre>
builder.SaveFile("form", "myform.pdf")
</pre>
<h4 class="header-gray">Saving regular PDF</h4>
<pre>
builder.SaveFile("pdf", "myform.pdf")
</pre>