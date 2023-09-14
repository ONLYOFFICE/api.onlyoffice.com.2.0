<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">IsObject</span>
</h1>

<h4 class="header-gray" id="CloseFile">bool IsObject();</h4>
<p class="dscr">Returns true if the <b>CDocBuilderValue</b> object is an object.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderValue.IsObject</em> method is not used.</div>

<h2>Example</h2>
<h4 class="header-gray" >C++</h4>
<pre>
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
CContext oContext = oBuilder.GetContext();
CValue oGlobal = oContext.GetGlobal();
bool bObject = oGlobal.IsObject();
CDocBuilder::Dispose();
</pre>
