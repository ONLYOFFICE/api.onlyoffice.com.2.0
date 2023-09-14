<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">OpenFile</span>
</h1>

<h4 class="header-gray" id="OpenFile">int OpenFile(sPath, sParams);</h4>
<p class="dscr">Opens the document file which will be edited and saved afterwards.</p>

<h2>Parameters:</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Type</td>
            <td>Attributes</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><em>sPath</em></td>
            <td>const&nbsp;wchar_t*</td>
            <td></td>
            <td>The path to the file to be opened together with its name and extension.</td>
        </tr>
        <tr class="tablerow">
            <td><em>sParams</em></td>
            <td>const&nbsp;wchar_t*</td>
            <td>&lt;optional></td>
            <td>The parameters needed for the correct file opening (most commonly, the encoding is used for the <em>txt</em> and <em>csv</em> file types
            or the delimiter for the <em>csv</em> files, for other file types this is just an empty string). The parameters are added in the form of XML tags,
            where <b>m_nCsvTxtEncoding</b> is used for the text encoding and <b>m_nCsvDelimiter</b> is used for the <em></em> delimiter.
            You can find all the supported values for the encoding <a target="_blank" href="https://github.com/ONLYOFFICE/server/blob/master/Common/sources/commondefines.js">in this file</a>.
            The supported values for the <em>csv</em> delimiters include:
                <ul>
                    <li><b>0</b> - no delimiter</li>
                    <li><b>1</b> - tab</li>
                    <li><b>2</b> - semicolon</li>
                    <li><b>3</b> - colon</li>
                    <li><b>4</b> - comma</li>
                    <li><b>5</b> - space</li>
                </ul>
            </td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Example</h2>
<h4 class="header-gray" >C++</h4>
<pre>
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
oBuilder.OpenFile(L"text-document.csv", "&lt;m_nCsvTxtEncoding&gt;46&lt;/m_nCsvTxtEncoding&gt;&lt;m_nCsvDelimiter&gt;4&lt;/m_nCsvDelimiter&gt;");
CDocBuilder::Dispose();
</pre>
<h4 class="header-gray" >.docbuilder</h4>
<pre>
builder.OpenFile("text-document.csv", "&lt;m_nCsvTxtEncoding&gt;46&lt;/m_nCsvTxtEncoding&gt;&lt;m_nCsvDelimiter&gt;4&lt;/m_nCsvDelimiter&gt;");
</pre>
