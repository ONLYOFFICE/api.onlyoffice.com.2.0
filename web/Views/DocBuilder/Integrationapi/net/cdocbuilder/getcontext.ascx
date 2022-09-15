<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetContext</span>
</h1>

<h4 class="header-gray" id="CreateFile">CDocBuilderContext^ GetContext();</h4>
<p class="dscr">Returns the current JS <a href="<%= Url.Action("integrationapi/net/cdocbuildercontext") %>">context</a>.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilder.GetContext</em> method is not used.</div>

<h2>Example</h2>
<h4 class="header-gray" >.Net</h4>
<pre>
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
CContext oContext = oBuilder.GetContext();
CDocBuilder.Destroy();
</pre>
