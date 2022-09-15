<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateUndefined</span>
</h1>

<h4 class="header-gray" id="CloseFile">static CDocBuilderValue CreateUndefined();</h4>
<p class="dscr">Creates an undefined value. This method returns the current <a href="<%= Url.Action("integrationapi/c/cdocbuildercontext") %>">context</a>
and calls its <a href="<%= Url.Action("integrationapi/c/cdocbuildercontext/createundefined") %>">CreateUndefined</a> method.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderValue.CreateUndefined</em> method is not used.</div>

<h2>Example</h2>
<h4 class="header-gray" >C++</h4>
<pre>
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
CContext oContext = oBuilder.GetContext();
CValue oGlobal = oContext.GetGlobal();
CValue oApi = oGlobal["Api"];
CValue oUndefined = oApi.CreateUndefined();
CDocBuilder::Dispose();
</pre>
