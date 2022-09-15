<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CloseFile</span>
</h1>

<h4 class="header-gray" id="CloseFile">void CloseFile();</h4>
<p class="dscr">Closes the file to stop working with it. You can use a single <b>ONLYOFFICE Document Builder</b> instance to work with all your files,
but you need to close the previous file before you can start working with the next one in this case.</p>

<h2>Example</h2>
<h4 class="header-gray" >C++</h4>
<pre>std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
oBuilder.CloseFile();
CDocBuilder::Dispose();
</pre>
<h4 class="header-gray" >.docbuilder</h4>
<pre>builder.CloseFile();</pre>
