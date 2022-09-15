<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Destroy</span>
</h1>

<h4 class="header-gray" id="CloseFile">static void Destroy();</h4>
<p class="dscr">Unloads the <b>ONLYOFFICE Document Builder</b> from the application memory when it is no longer needed.
Generally, there is no need to dispose JS before exiting the process, it should happen automatically. It should only be used if the process needs the resources taken up by JS.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilder.Destroy</em> method is not used.</div>

<h2>Example</h2>
<h4 class="header-gray" >.Net</h4>
<pre>
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
CDocBuilder.Destroy();
</pre>
