<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateUndefined</span>
</h1>

<h4 class="header-gray" id="CloseFile">static CDocBuilderValue^ CreateUndefined();</h4>
<p class="dscr">Creates an undefined value. This method returns the current <a href="<%= Url.Action("integrationapi/net/cdocbuildercontext") %>">context</a>
and calls its <a href="<%= Url.Action("integrationapi/net/cdocbuildercontext/createundefined") %>">CreateUndefined</a> method.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderValue.CreateUndefined</em> method is not used.</div>

<h2>Example</h2>
<h4 class="header-gray" >.Net</h4>
<pre>
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
CContext oContext = oBuilder.GetContext();
CValue oGlobal = oContext.GetGlobal();
CValue oApi = oGlobal["Api"];
CValue oUndefined = oApi.CreateUndefined();
CDocBuilder.Destroy();
</pre>
