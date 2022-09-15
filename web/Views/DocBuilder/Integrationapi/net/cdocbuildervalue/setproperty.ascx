<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetProperty</span>
</h1>

<h4 class="header-gray" id="CloseFile">void SetProperty(sName, sValue);</h4>
<p class="dscr">Sets a property to the <b>CDocBuilderValue</b> object.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderValue.SetProperty</em> method is not used.</div>

<h2>Parameters:</h2>

<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Type</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><em>sName</em></td>
            <td>String^</td>
            <td>The name of the <b>CDocBuilderValue</b> object property.</td>
        </tr>
        <tr class="tablerow">
            <td><em>sValue</em></td>
            <td>CDocBuilderValue^</td>
            <td>The value of the <b>CDocBuilderValue</b> object property.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Example</h2>
<h4 class="header-gray" >.Net</h4>
<pre>
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
CContext oContext = oBuilder.GetContext();
CValue oGlobal = oContext.GetGlobal();
CValue oApi = oGlobal["Api"];
CValue oDocument = oApi.Call("GetDocument");
oDocument.SetProperty("color", {"zX":{"red":112,"green":173,"blue":71,"alpha":255},"type":"srgb"},"Zvf":null,"type":"uniColor"});
CDocBuilder.Destroy();
</pre>

<p>There are two more ways to set a property to the <b>CDocBuilderValue</b> object:</p>
<ol>
    <li>
        <p>use the <b>Set</b> method that takes the object property name and value as arguments:</p>
        <pre>
void Set(String^ name, CDocBuilderValue^ value);
</pre>

<h2>Example</h2>
<h4 class="header-gray" >.Net</h4>
<pre>
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
CContext oContext = oBuilder.GetContext();
CValue oGlobal = oContext.GetGlobal();
CValue oApi = oGlobal["Api"];
CValue oDocument = oApi.Call("GetDocument");
oDocument.Set("color", {"zX":{"red":112,"green":173,"blue":71,"alpha":255},"type":"srgb"},"Zvf":null,"type":"uniColor"});
CDocBuilder.Destroy();
</pre>
    </li>
    <li>
        <p>use the <b>default[]</b> postfix expression:</p>
        <pre>
property CDocBuilderValue^ default[String^]
</pre>

<h2>Example</h2>
<h4 class="header-gray" >.Net</h4>
<pre>
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
CContext oContext = oBuilder.GetContext();
CValue oGlobal = oContext.GetGlobal();
CValue oApi = oGlobal["Api"];
CValue oDocument = oApi.Call("GetDocument");
oDocument["color", {"zX":{"red":112,"green":173,"blue":71,"alpha":255},"type":"srgb"},"Zvf":null,"type":"uniColor"}];
CDocBuilder.Destroy();
</pre>
    </li>
</ol>
