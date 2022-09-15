<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetProperty</span>
</h1>

<h4 class="header-gray" id="SetProperty">void SetProperty(sParam, sValue);</h4>

<p class="dscr">Sets an argument in the UTF8 format to the builder class which can be trasferred to the program outside the <a href="<%= Url.Action("integrationapi/c/cdocbuilder/executecommand") %>">CDocBuilder.ExecuteCommand</a> method,
i.e. either as an additional property when running <b>ONLYOFFICE Document Builder</b> executable file or as a part of program code, but not included into the document file script.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilder.SetProperty</em> method is not used explicitly. The argument itself is used instead as an additional property for the executable. See the example below.</div>

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
            <td><em>sParam</em></td>
            <td>const&nbsp;char*</td>
            <td>The parameter name in the UTF8 format, the value is always <em>--argument</em>.</td>
        </tr>
        <tr class="tablerow">
            <td><em>sValue</em></td>
            <td>const&nbsp;char*</td>
            <td>The parameter value in the UTF8 format which will be used in the document.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Supported properties:</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Type</td>
            <td>Description</td>
            <td>Default</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><em>--use-doctrenderer-scheme</em></td>
            <td>bool</td>
            <td>Specifies if the doctrenderer mode is used when building a document or getting content from the editor when saving a file.</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td><em>--check-fonts</em></td>
            <td>bool</td>
            <td>Specifies if the system fonts are cached for faster work.</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td><em>--work-directory</em></td>
            <td>const&nbsp;wchar_t*</td>
            <td>The path to the temporary directory.</td>
            <td>""</td>
        </tr>
        <tr class="tablerow">
            <td><em>--cache-scripts</em></td>
            <td>bool</td>
            <td>Specifies if the sdkjs scripts are cached.</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td><em>--save-use-only-names</em></td>
            <td>bool</td>
            <td>Specifies if the destination paths are used (for server work). For example: /home/user/1.txt => /tmp/1.txt</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td><em>--all-fonts-path</em></td>
            <td>const&nbsp;wchar_t*</td>
            <td>The path to the <em>AllFonts.js</em> script.</td>
            <td>""</td>
        </tr>
            <tr class="tablerow">
            <td><em>--argument</em></td>
            <td>const&nbsp;wchar_t*</td>
            <td>The JSON argument which is sent to the global parameters of all the opened JS context.</td>
            <td>""</td>
        </tr>
        </tr>
            <tr class="tablerow">
            <td><em>--fonts-system</em></td>
            <td>bool</td>
            <td>Specifies if the system fonts are used.</td>
            <td>true</td>
        </tr>
        </tr>
            <tr class="tablerow">
            <td><em>--fonts-dir</em></td>
            <td>const&nbsp;wchar_t*</td>
            <td>The path to the additional fonts directory (may be many records).</td>
            <td>""</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<p>Once added, the argument will be available as the <b>Argument</b> variable with its parameter values set:</p>
<pre>
Argument.name === "ONLYOFFICE" // true
</pre>

<h2>Example</h2>
<h4 class="header-gray" >C++</h4>
<pre>
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
oBuilder.SetProperty("--argument", L"{\"name\":\"ONLYOFFICE\"}");
CDocBuilder::Dispose();
</pre>
<h4 class="header-gray" >.docbuilder</h4>
<pre>
docbuilder.exe "--argument={\"name\":\"ONLYOFFICE\"}" test.docbuilder
</pre>

<h2>Adding or removing fonts</h2>
<p>It is also possible to update the font list when you either add new fonts or remove old ones. To do this, the <b>check-fonts</b> variable is used:</p>
<h2>Example</h2>
<h4 class="header-gray">C++</h4>
<pre>
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
oBuilder.SetProperty("--check-fonts", L"true");
CDocBuilder::Dispose();
</pre>
<h4 class="header-gray">.docbuilder</h4>
<pre>
docbuilder.exe "--check-fonts=true" test.docbuilder
</pre>
