<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">FreeMemoryTypedArray</span>
</h1>

<h4 class="header-gray" id="CloseFile">static void FreeMemoryTypedArray(sData, nSize);</h4>
<p class="dscr">Frees the memory for a typed array.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderContext.FreeMemoryTypedArray</em> method is not used.</div>

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
            <td><em>sData</em></td>
            <td>unsigned char*</td>
            <td>The allocated memory to be released.</td>
        </tr>
        <tr class="tablerow">
            <td><em>nSize</em></td>
            <td>const size_t*</td>
            <td>The buffer array size.</td>
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
CVlaue oTypedArray = oContext.CreateTypedArray(sBuffer, 3, true);
oContext.FreeMemoryTypedArray(sBuffer, 3);
CDocBuilder::Dispose();
</pre>
