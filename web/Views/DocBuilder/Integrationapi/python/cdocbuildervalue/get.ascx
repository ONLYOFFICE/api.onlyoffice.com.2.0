<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Get</span>
</h1>

<h4 class="header-gray" id="CloseFile">def Get(self, key);</h4>
<p class="dscr">Returns an array value by its index.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderValue.Get</em> method is not used.</div>

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
            <td><em>key</em></td>
            <td>int</td>
            <td>The index of the array value.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Example</h2>
<h4 class="header-gray" >Python</h4>
<pre>
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]
document = api.Call("GetDocument")
charts = document.Call("GetAllCharts");
chart = charts.Get(1);
</pre>

<p>The <b>default[]</b> postfix expression can be also used to get an array value by its index:</p>
<pre>
property CDocBuilderValue default[int]
</pre>

<h2>Example</h2>
<h4 class="header-gray" >Python</h4>
<pre>
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]
document = api.Call("GetDocument")
charts = document.Call("GetAllCharts");
chart = charts[1];
</pre>
