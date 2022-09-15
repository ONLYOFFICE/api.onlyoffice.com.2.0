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
            <td>const wchar_t*</td>
            <td>The name of the <b>CDocBuilderValue</b> object property.</td>
        </tr>
        <tr class="tablerow">
            <td><em>sValue</em></td>
            <td>const wchar_t*</td>
            <td>The value of the <b>CDocBuilderValue</b> object property.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Example</h2>
<h4 class="header-gray" >C++</h4>
<pre>
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
CContext oContext = oBuilder.GetContext();
CValue oGlobal = oContext.GetGlobal();
CValue oApi = oGlobal["Api"];
CValue oDocument = oApi.Call("GetDocument");
oDocument.SetProperty("color", {"zX":{"red":112,"green":173,"blue":71,"alpha":255},"type":"srgb"},"Zvf":null,"type":"uniColor"});
CDocBuilder::Dispose();
</pre>

<p>The <b>Set</b> method can be also used to set a property to the <b>CDocBuilderValue</b> object. The object property can be specified with its name in the Unicode format:</p>
<pre>
void Set(const wchar_t* name, CDocBuilderValue value);
</pre>

<h2>Example</h2>
<h4 class="header-gray" >C++</h4>
<pre>
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
CContext oContext = oBuilder.GetContext();
CValue oGlobal = oContext.GetGlobal();
CValue oApi = oGlobal["Api"];
CValue oDocument = oApi.Call("GetDocument");
oDocument.Set("color", {"zX":{"red":112,"green":173,"blue":71,"alpha":255},"type":"srgb"},"Zvf":null,"type":"uniColor"});
CDocBuilder::Dispose();
</pre>
