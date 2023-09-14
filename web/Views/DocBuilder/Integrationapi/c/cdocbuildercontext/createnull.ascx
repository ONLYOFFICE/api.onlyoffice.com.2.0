<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateNull</span>
</h1>

<h4 class="header-gray" id="CloseFile">CDocBuilderValue CreateNull();</h4>
<p class="dscr">Creates a null value, an analogue of <em>null</em> in JS.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderContext.CreateNull</em> method is not used.</div>

<h2>Example</h2>
<h4 class="header-gray" >C++</h4>
<pre>
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
CContext oContext = oBuilder.GetContext();
CValue oNull = oContext.CreateNull();
CDocBuilder::Dispose();
</pre>
