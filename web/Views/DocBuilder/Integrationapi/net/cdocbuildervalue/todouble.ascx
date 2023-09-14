<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">ToDouble</span>
</h1>

<h4 class="header-gray" id="CloseFile">double ToDouble();</h4>
<p class="dscr">Converts the <b>CDocBuilderValue</b> object to a double value.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderValue.ToDouble</em> method is not used.</div>

<h2>Example</h2>
<h4 class="header-gray" >.Net</h4>
<pre>
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
CContext oContext = oBuilder.GetContext();
CValue oGlobal = oContext.GetGlobal();
double dGlobal = oGlobal.ToDouble();
CDocBuilder.Destroy();
</pre>
