<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Clear</span>
</h1>

<h4 class="header-gray" id="CloseFile">void Clear();</h4>
<p class="dscr">Clears the <b>CDocBuilderValue</b> object.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderValue.Clear</em> method is not used.</div>

<h2>Example</h2>
<h4 class="header-gray" >C++</h4>
<pre>
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
CContext oContext = oBuilder.GetContext();
CValue oGlobal = oContext.GetGlobal();
CValue oApi = oGlobal["Api"];
CValue oDocument = oApi.Call("GetDocument");
oDocument.Clear();
CDocBuilder::Dispose();
</pre>
