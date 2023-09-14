<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateScope</span>
</h1>

<h4 class="header-gray" id="CloseFile">CDocBuilderContextScope^ CreateScope();</h4>
<p class="dscr">Creates a <a href="<%= Url.Action("integrationapi/net/cdocbuildercontextscope") %>">context scope</a> which sets the execution context for all operations executed within a local scope.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderContext.CreateScope</em> method is not used.</div>

<h2>Example</h2>
<h4 class="header-gray" >.Net</h4>
<pre>
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
CContext oContext = oBuilder.GetContext();
CContextScope oScope = oContext.CreateScope();
CDocBuilder.Destroy();
</pre>
