<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetContext</span>
</h1>

<h4 class="header-gray" id="CreateFile">CDocBuilderContext GetContext();</h4>
<p class="dscr">Returns the current JS <a href="<%= Url.Action("integrationapi/c/cdocbuildercontext") %>">context</a>.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilder.GetContext</em> method is not used.</div>

<h2>Example</h2>
<h4 class="header-gray" >C++</h4>
<pre>std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
CDocBuilderContext oContext = oBuilder.GetContext();
CDocBuilder::Dispose();
</pre>
