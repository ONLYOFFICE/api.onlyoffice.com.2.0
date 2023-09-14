<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">IsUndefined</span>
</h1>

<h4 class="header-gray" id="CloseFile">bool IsUndefined();</h4>
<p class="dscr">Returns true if the <b>CDocBuilderValue</b> object is undefined.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderValue.IsUndefined</em> method is not used.</div>

<h2>Example</h2>
<h4 class="header-gray" >C++</h4>
<pre>
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
CContext oContext = oBuilder.GetContext();
CValue oGlobal = oContext.GetGlobal();
bool bUndefined = oGlobal.IsUndefined();
CDocBuilder::Dispose();
</pre>
