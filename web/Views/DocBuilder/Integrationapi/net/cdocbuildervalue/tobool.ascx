<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ToBool</span>
</h1>

<h4 class="header-gray" id="CloseFile">bool ToBool();</h4>
<p class="dscr">Converts the <b>CDocBuilderValue</b> object to a boolean value.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderValue.ToBool</em> method is not used.</div>

<h2>Example</h2>
<h4 class="header-gray" >.Net</h4>
<pre>
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
CContext oContext = oBuilder.GetContext();
CValue oGlobal = oContext.GetGlobal();
bool bGlobal = oGlobal.ToBool();
CDocBuilder.Destroy();
</pre>
