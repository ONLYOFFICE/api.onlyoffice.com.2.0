<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">IsSaveWithDoctrendererMode</span>
</h1>

<h4 class="header-gray" id="CreateFile">bool IsSaveWithDoctrendererMode();</h4>
<p class="dscr">Specifies if the doctrenderer mode is used when building a document or getting content from the editor when saving a file.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilder.IsSaveWithDoctrendererMode</em> method is not used.</div>

<h2>Example</h2>
<h4 class="header-gray" >C++</h4>
<pre>std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
bool bDoctrendererMode = oBuilder.IsSaveWithDoctrendererMode();
CDocBuilder::Dispose();
</pre>
