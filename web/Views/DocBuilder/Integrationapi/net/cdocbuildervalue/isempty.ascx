<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">IsEmpty</span>
</h1>

<h4 class="header-gray" id="CloseFile">bool IsEmpty();</h4>
<p class="dscr">Returns true if the <b>CDocBuilderValue</b> object is empty.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderValue.IsEmpty</em> method is not used.</div>

<h2>Example</h2>
<h4 class="header-gray" >.Net</h4>
<pre>
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
CContext oContext = oBuilder.GetContext();
CValue oGlobal = oContext.GetGlobal();
bool bEmpty = oGlobal.IsEmpty();
CDocBuilder.Destroy();
</pre>
