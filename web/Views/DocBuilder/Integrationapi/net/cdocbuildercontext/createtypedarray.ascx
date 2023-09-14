<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateTypedArray</span>
</h1>

<h4 class="header-gray" id="CloseFile">CDocBuilderValue^ CreateTypedArray(aBuffer);</h4>
<p class="dscr">Creates a Uint8Array value, an analogue of <em>Uint8Array</em> in JS.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderContext.CreateTypedArray</em> method is not used.</div>

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
            <td><em>aBuffer</em></td>
            <td>array&lt;Byte&gt;^</td>
            <td>The array buffer.</td>
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
array&lt;System::Byte&gt;^ aBuffer = gcnew array&lt;Byte&gt;(1500);
CValue oTypedArray = oContext.CreateTypedArray(aBuffer);
CDocBuilder.Destroy();
</pre>
