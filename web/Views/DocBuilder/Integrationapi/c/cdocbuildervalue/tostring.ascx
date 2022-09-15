<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ToString</span>
</h1>

<h4 class="header-gray" id="CloseFile">CString ToString();</h4>
<p class="dscr">Converts the <b>CDocBuilderValue</b> object to a string.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderValue.ToString</em> method is not used.</div>

<h2>Example</h2>
<h4 class="header-gray" >C++</h4>
<pre>
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
CValue oGlobal = oContext.GetGlobal();
CValue oGlobal = oContext.GetGlobal();
CString sGlobal = oGlobal.ToString();
CDocBuilder::Dispose();
</pre>
