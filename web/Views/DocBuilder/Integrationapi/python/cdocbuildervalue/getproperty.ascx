<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">GetProperty</span>
</h1>

<h4 class="header-gray" id="GetProperty">def GetProperty(self, name);</h4>
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
            <td><em>name</em></td>
            <td>str</td>
            <td>The name of the <b>CDocBuilderValue</b> object property.</td>
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
docPr = document.GetProperty("color")
</pre>

<p>There are two more ways to get a property of the <b>CDocBuilderValue</b> object:</p>
<ol>
    <li>
        <p>use the <b>Get</b> method that takes an argument in the string format:</p>
        <pre>
def Get(self, name);
</pre>

<h2>Example</h2>
<h4 class="header-gray" >Python</h4>
<pre>
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]
document = api.Call("GetDocument")
docPr = document.Get("color")
</pre>
    </li>
    <li>
        <p>use the <b>default[]</b> postfix expression that takes an argument in the string format:</p>
        <pre>
property CDocBuilderValue default[str]
</pre>

<h2>Example</h2>
<h4 class="header-gray" >Python</h4>
<pre>
builder = docbuilder.CDocBuilder()
context = builder.GetContext()
globalObj = context.GetGlobal()
api = globalObj["Api"]
document = api.Call("GetDocument")
docPr = document["color"]
</pre>
    </li>
</ol>
