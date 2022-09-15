<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CreateTypedArray</span>
</h1>

<h4 class="header-gray" id="CloseFile">CDocBuilderValue CreateTypedArray(sBuffer, nLength, bExternalize);</h4>
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
            <td><em>sBuffer</em></td>
            <td>unsigned char*</td>
            <td>The array buffer.</td>
        </tr>
        <tr class="tablerow">
            <td><em>nLength</em></td>
            <td>const int&</td>
            <td>The array length.</td>
        </tr>
        <tr class="tablerow">
            <td><em>bExternalize</em></td>
            <td>const bool&</td>
            <td>Specifies if the application releases the memory after freeing Uint8Array (<b>true</b>). If this parameter is <b>false</b>, then the memory will be released automatically.
            In this case, the buffer must be created with the <a href="<%= Url.Action("integrationapi/c/cdocbuildercontext/allocmemorytypedarray") %>">AllocMemoryTypedArray</a> method.</td>
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
unsigned char* sBuffer = oContext.AllocMemoryTypedArray(1500);
CValue oTypedArray = oContext.CreateTypedArray(sBuffer, 3, false);
CDocBuilder::Dispose();
</pre>
