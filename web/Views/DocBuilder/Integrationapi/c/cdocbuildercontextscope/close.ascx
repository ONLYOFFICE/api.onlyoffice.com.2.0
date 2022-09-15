<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Close</span>
</h1>

<h4 class="header-gray" id="CloseFile">void Close();</h4>
<p class="dscr">Closes the current scope. This method will be called automatically when the descructor is executed.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderContextScope.Close</em> method is not used.</div>

<h2>Example</h2>
<h4 class="header-gray" >C++</h4>
<pre>
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
CContext oContext = oBuilder.GetContext();
CContextScope oScope = oContext.CreateScope();
oScope.Close();
CDocBuilder.Destroy();
</pre>
