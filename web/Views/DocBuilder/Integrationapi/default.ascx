<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Overview</span>
</h1>

<p class="dscr"><b>Builder.App</b> is the <em>docbuilder.exe</em> executable file which can be run from your application with the <em>.docbuilder</em> script file as a parameter to it.</p>
<p>If you are going to use <b>ONLYOFFICE Document Builder</b> with an application written in any programming language, run Document Builder executable
from your application and use the <b>.docbuilder</b> script file for the document to be created as a parameter to it. It is much more flexible and allows
to change the document script files (especially if there are more than one of them) independently of your application in future. You will only need to recompile your application
if you need to add more document script files to it.</p>
<p>To launch <b>ONLYOFFICE Document Builder</b> executable file run the following command:</p>
<pre>
docbuilder.exe mydocument.docbuilder
</pre>
        <p>Here <b>docbuilder</b> is the name of <b>ONLYOFFICE Document Builder</b> executive file.
        It must be used together with the path if the command is run from the folder different from the one where the executive is placed.
        The command will look like <b>docbuilder.exe</b> for Windows version and <b>documentbuilder</b> for Linux.
        The <b>mydocument.docbuilder</b> parameter is the name of the script file that will form the document contents (use it with the path if needed).</p>
        <p>Visit the <a href="<%= Url.Action("integrationapi/usingdocbuilderfile") %>">.docbuilder</a> file section for more information about the file structure and rules used when creating it.</p>
    </li>
</ol>
<p>See the examples in some of the most popular programming languages at <a href="<%= Url.Action("integratingdocumentbuilder") %>">this page</a>.</p>

<br />
<h1>Known issues</h1>

<p>If you use <b>ONLYOFFICE Document Builder</b> as both an application and a script, then you need to know some rules and limitations:</p>

<ol>
    <li>
        <p>To run ONLYOFFICE Document Builder executable in the C++ application, use the <a href="<%= Url.Action("integrationapi/c/cdocbuilder/run") %>">CDocBuilder.Run</a> method in the following way:</p>
        <pre>
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
oBuilder.Run("path-to-script.docbuilder");
CDocBuilder::Dispose();
</pre>
        <p>Another way to do this is to use the <b>docbuilder.exe</b> executable file and run it with the <b>.docbuilder</b> file as an argument,
        where all the code for the document file creation will be written:</p>
        <pre>
docbuilder.exe "path-to-script.docbuilder"
</pre>
    </li>
    <li>
        <p>To set an argument to the builder class which can be trasferred to the program outside the <a href="<%= Url.Action("integrationapi/c/cdocbuilder/executecommand") %>">CDocBuilder.ExecuteCommand</a> method,
        add it as an additional property when running <b>ONLYOFFICE Document Builder</b> executable file or as a part of program JavaScript code, but not included into the document file script:</p>
        <h4 class="header-gray">Sets the --argument property to CDocBuilder.Run</h4>
        <pre>
docbuilder.exe "--argument={\"company\":\"ONLYOFFICE\",\"product\":\"ONLYOFFICE Document Builder\"}" "path-to-script.docbuilder"
</pre>
        <h4 class="header-gray">Sets the --argument property using JavaScript code</h4>
        <pre>
var sCompany = Argument["company"];
var sProduct = Argument["product"];
</pre>
    </li>
    <li>
        <p>The <b>builder</b> object methods cannot be called with the JS variables. Wrap them with the <em>jsValue</em> instruction if necessary:</p>
        <pre>
var jsVar = "123.docx";
builder.SaveFile("docx", jsVar); // Incorrect
builder.SaveFile("docx", jsValue(jsVar)); // Correct
</pre>
    </li>
    <li>
        <p>For convenience, format types are replaced with strings.</p>
        <p>For example,</p>
        <pre>
builder.CreateFile("docx");
</pre>
        <p>is the same as</p>
        <pre>
CDocBuilder.CreateFile(AVS_OFFICESTUDIO_FILE_DOCUMENT_DOCX);
</pre>
        <p>And</p>
        <pre>
builder.SaveFile("docx", file_path);
</pre>
        <p>is the same as</p>
        <pre>
CDocBuilder.SaveFile(AVS_OFFICESTUDIO_FILE_DOCUMENT_DOCX, file_path);
</pre>
        <h2 id="format-types" class="copy-link">Format types</h2>
        <table class="table">
            <thead>
                <tr class="tablerow">
                    <td>String</td>
                    <td>Format type</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>"docx"</td>
                    <td>AVS_OFFICESTUDIO_FILE_DOCUMENT_DOCX</td>
                </tr>
                <tr class="tablerow">
                    <td>"doc"</td>
                    <td>AVS_OFFICESTUDIO_FILE_DOCUMENT_DOC</td>
                </tr>
                <tr class="tablerow">
                    <td>"odt"</td>
                    <td>AVS_OFFICESTUDIO_FILE_DOCUMENT_ODT</td>
                </tr>
                <tr class="tablerow">
                    <td>"rtf"</td>
                    <td>AVS_OFFICESTUDIO_FILE_DOCUMENT_RTF</td>
                </tr>
                <tr class="tablerow">
                    <td>"txt"</td>
                    <td>AVS_OFFICESTUDIO_FILE_DOCUMENT_TXT</td>
                </tr>
                <tr class="tablerow">
                    <td>"pptx"</td>
                    <td>AVS_OFFICESTUDIO_FILE_PRESENTATION_PPTX</td>
                </tr>
                <tr class="tablerow">
                    <td>"odp"</td>
                    <td>AVS_OFFICESTUDIO_FILE_PRESENTATION_ODP</td>
                </tr>
                <tr class="tablerow">
                    <td>"xlsx"</td>
                    <td>AVS_OFFICESTUDIO_FILE_SPREADSHEET_XLSX</td>
                </tr>
                <tr class="tablerow">
                    <td>"xls"</td>
                    <td>AVS_OFFICESTUDIO_FILE_SPREADSHEET_XLS</td>
                </tr>
                <tr class="tablerow">
                    <td>"ods"</td>
                    <td>AVS_OFFICESTUDIO_FILE_SPREADSHEET_ODS</td>
                </tr>
                <tr class="tablerow">
                    <td>"csv"</td>
                    <td>AVS_OFFICESTUDIO_FILE_SPREADSHEET_CSV</td>
                </tr>
                <tr class="tablerow">
                    <td>"pdf"</td>
                    <td>AVS_OFFICESTUDIO_FILE_CROSSPLATFORM_PDF</td>
                </tr>
                <tr class="tablerow">
                    <td>"image"</td>
                    <td>AVS_OFFICESTUDIO_FILE_IMAGE</td>
                </tr>
                <tr class="tablerow">
                    <td>"jpg"</td>
                    <td>AVS_OFFICESTUDIO_FILE_IMAGE</td>
                </tr>
                <tr class="tablerow">
                    <td>"png"</td>
                    <td>AVS_OFFICESTUDIO_FILE_IMAGE</td>
                </tr>
                <tr class="tablerow">
                    <td>"html"</td>
                    <td>AVS_OFFICESTUDIO_FILE_DOCUMENT_HTML_IN_CONTAINER</td>
                </tr>
                <tr class="tablerow">
                    <td>"form"</td>
                    <td>AVS_OFFICESTUDIO_FILE_DOCUMENT_OFORM_PDF</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p>The entire JavaScript context is a wrapper for its native CDocBuilder <b>builderJS</b> object. You need to work with it as with an ordinary JavaScript object.
        In this case, the <em>jsValue</em> instruction is not needed for the JS variables:</p>
        <pre>
builderJS.OpenFile("path_or_url", "x2t_additons_as_xml");
builderJS.CreateFile(AVS_OFFICESTUDIO_FILE_DOCUMENT_DOCX); or builderJS.CreateFile("docx");
builderJS.SetTmpFolder("folder");
builderJS.SaveFile(AVS_OFFICESTUDIO_FILE_DOCUMENT_DOCX, "path", "x2t_additons_as_xml"); or builderJS.SaveFile("docx", "path", "x2t_additons_as_xml");
builderJS.CloseFile();
</pre>
    </li>
    <li>
        <p>The Document Builder always works with one file. But there are cases when you need to be able to open another file not for adding its data to the content, but for some kind of manipulation
        (document comparison, mailmerge, etc). For such cases, the Document Builder provides the <b>OpenTmpFile</b> method:</p>
        <pre>
var tmpFile = builderJS.OpenTmpFile("path_or_url");
</pre>
        <h2>Methods:</h2>
        <table class="table">
            <thead>
                <tr class="tablerow">
                    <td>Name</td>
                    <td>Description</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>IsValid</td>
                    <td>Specifies if the temporary file is valid (<b>true</b>).</td>
                </tr>
                <tr class="tablerow">
                    <td>GetBinary</td>
                    <td>Returns Uint8Array with the <em>doct/pptt/xlst</em> binary content.</td>
                </tr>
                <tr class="tablerow">
                    <td>GetFolder</td>
                    <td>Returns the string path to the temporary folder with the temporary file contents.</td>
                </tr>
                <tr class="tablerow">
                    <td>Close</td>
                    <td>Closes the file (removes the temporary folder contents).</td>
                </tr>
                <tr class="tablerow">
                    <td>GetImageMap</td>
                    <td>Returns a dictionary object with the <em>imageId -> imagePath</em> key-value pairs (for inserting into the document).</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p>To make the code shorter, use the following type definitions:</p>
        <pre>
typedef CDocBuilderValue CValue;
typedef CDocBuilderContext CContext;
typedef CDocBuilderContextScope CContextScope;
</pre>
    </li>
</ol>
