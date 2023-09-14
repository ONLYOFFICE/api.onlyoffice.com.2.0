<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">IsBool</span>
</h1>

<h4 class="header-gray" id="CloseFile">bool IsBool();</h4>
<p class="dscr">Returns true if the <b>CDocBuilderValue</b> object is a boolean value.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderValue.IsBool</em> method is not used.</div>

<h2>Example</h2>
<h4 class="header-gray" >.Net</h4>
<pre>
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
CContext oContext = oBuilder.GetContext();
CValue oGlobal = oContext.GetGlobal();
bool bBool = oGlobal.IsBool();
CDocBuilder.Destroy();
</pre>
