<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetProperty</span>
</h1>

<h4 class="header-gray" id="CloseFile">CDocBuilderValue GetProperty(sName);</h4>
<p class="dscr">Returns a property of the <b>CDocBuilderValue</b> object.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderValue.GetProperty</em> method is not used.</div>

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
CValue oDocPr = oDocument.GetProperty("color");
CDocBuilder::Dispose();
</pre>

<p>There are two more ways to get a property of the <b>CDocBuilderValue</b> object:</p>
<ol>
    <li>
        <p>use the <b>Get</b> method that takes the arguments both in the UTF8 or Unicode formats:</p>
        <pre>
CDocBuilderValue Get(const char* name);
CDocBuilderValue Get(const wchar_t* name);
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
CValue oDocPr = oDocument.Get("color");
CDocBuilder::Dispose();
</pre>
    </li>
    <li>
        <p>use the <b>operator[]</b> postfix expression that takes the arguments both in the UTF8 or Unicode formats:</p>
        <pre>
CDocBuilderValue operator[](const char* name);
CDocBuilderValue operator[](const wchar_t*  name);
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
CValue oDocPr = oDocument["color"];
CDocBuilder::Dispose();
</pre>
    </li>
</ol>
