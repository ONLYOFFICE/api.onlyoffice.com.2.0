<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SaveFile</span>
</h1>

<h4 class="header-gray" id="SaveFile">bool SaveFile(nType, sPath, sParams);</h4>
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
            <td><em>nType</em></td>
            <td>int</td>
            <td>The type of the file to be saved set as a hexadecimal integer for the .Net code.
            For the <em>.docbuilder</em> script file the following values are possible: <b>docx</b>, <b>odt</b>, <b>rtf</b>, <b>txt</b>, <b>pptx</b>, <b>xlsx</b>, <b>ods</b>, <b>csv</b>, <b>pdf</b>, <b>form</b>
            (see <a href="<%= Url.Action("integrationapi/default") %>#format-types">AVS_OFFICESTUDIO_FILE_XXX</a> values).</td>
        </tr>
        <tr class="tablerow">
            <td><em>sPath</em></td>
            <td>String^</td>
            <td>The path to the file to be saved together with its name and extension.</td>
        </tr>
        <tr class="tablerow">
            <td><em>sParams</em></td>
            <td>String^</td>
            <td>The parameters needed for the correct file saving (most commonly, the encoding is used for the <em>txt</em> and <em>csv</em> file types or the delimiter for the <em>csv</em> files,
            for other file types this is just an empty string). The parameters are added in the form of XML tags, where <b>m_nCsvTxtEncoding</b> is used for the text encoding
            and <b>m_nCsvDelimiter</b> is used for the <em>csv</em> delimiter. You can find all the supported values for the encoding <a target="_blank" href="https://github.com/ONLYOFFICE/server/blob/master/Common/sources/commondefines.js">in this file</a>.
            The supported values for the <em>csv</em> delimiters include:
            <ul>
                <li><b>0</b> - no delimiter</li>
                <li><b>1</b> - tab</li>
                <li><b>2</b> - semicolon</li>
                <li><b>3</b> - colon</li>
                <li><b>4</b> - comma</li>
                <li><b>5</b> - space</li>
            </ul>
            When saving into an image file (<em>png</em> or <em>jpg</em>) for creating thumbnails, the additional parameters are used. <a href="#SaveImage">See below</a> to find them out.
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Example</h2>
<h4 class="header-gray">.Net</h4>
<pre>
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
string resultPath = "result.docx";
var doctype = (int)OfficeFileTypes.Document.DOCX;
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
oBuilder.SaveFile(doctype, resultPath);
CDocBuilder.Destroy();
</pre>
<h4 class="header-gray">.docbuilder</h4>
<pre>
builder.SaveFile("docx", "result.docx");
</pre>

<h2 id="SaveImage">Saving into images</h2>
<p><b>ONLYOFFICE Document Builder</b> allows to save your document files into image files creating thumbnails of the first page or of all the pages in the document.
This is done using the parameters of the <em>SaveFile()</em> method. The parameters are added in the form of XML tags, where the following tags can be used:</p>
<ul>
    <li><b>m_oThumbnail</b> - the core tag showing that the inner nodes will be used to create a thumbnail out of the document file;</li>
    <li><b>format</b> - the image file format used to create a thumbnail (can be of the following values: <b>3</b> - for a JPG file, <b>4</b> - for a PNG file);</li>
    <li><b>aspect</b> - the image aspect when creating a thumbnail from the document file (can be of the following values: <b>1</b> - will keep the original aspect, <b>0</b> - will stretch the image to fit the width and the height set below);</li>
    <li><b>first</b> - whether only the first page or all the pages should be converted into a thumbnail (can be of the following values: <b>true</b> - only the first page will be converted, <b>false</b> - all the document pages will be used to create thumbnails, in this case the file will be saved as an archive of images, one for each page);</li>
    <li><b>width</b> - the image width in pixels;</li>
    <li><b>height</b> - the image height in pixels.</li>
</ul>
<h2>Example</h2>
<h4 class="header-gray">.Net</h4>
<pre>
oBuilder.SaveFile(OFFICESTUDIO_FILE_IMAGE, L"thumbnail.png", "&lt;m_oThumbnail&gt;&lt;format&gt;4&lt;/format&gt;&lt;aspect&gt;1&lt;/aspect&gt;&lt;first&gt;false&lt;/first&gt;&lt;width&gt;1000&lt;/width&gt;&lt;height&gt;1000&lt;/height&gt;&lt;/m_oThumbnail&gt;");
</pre>
<h4 class="header-gray">.docbuilder</h4>
<pre>
builder.SaveFile("image", "./thumbnail.png", "&lt;m_oThumbnail&gt;&lt;format&gt;4&lt;/format&gt;&lt;aspect&gt;1&lt;/aspect&gt;&lt;first&gt;false&lt;/first&gt;&lt;width&gt;1000&lt;/width&gt;&lt;height&gt;1000&lt;/height&gt;&lt;/m_oThumbnail&gt;");
</pre>

<h2 id="SaveForm">Saving form documents</h2>
<p><b>ONLYOFFICE Document Builder</b> allows you to save your documents as PDF forms. To do this, use the <b>form</b> value as the <em>nType</em> parameter.
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