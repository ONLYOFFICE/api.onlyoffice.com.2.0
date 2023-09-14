<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Set</span>
</h1>

<h4 class="header-gray" id="CloseFile">void Set(nIndex, sValue);</h4>
<p class="dscr">Sets an array value by its index.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderValue.Set</em> method is not used.</div>

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
            <td><em>nIndex</em></td>
            <td>const int&</td>
            <td>The index of the array value.</td>
        </tr>
        <tr class="tablerow">
            <td><em>sValue</em></td>
            <td>CDocBuilderValue</td>
            <td>The array value to be set.</td>
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
CValue aCharts = oDocument.GetAllCharts(); 
CValue oChart =  Api.CreateChart("bar3D", [
  [200, 240, 280],
  [250, 260, 280]
], ["Projected Revenue", "Estimated Costs"], [2014, 2015, 2016], 4051300, 2347595, 24);
aCharts.Set(1, oChart);
CDocBuilder::Dispose();
</pre>
