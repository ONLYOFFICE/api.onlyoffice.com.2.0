<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Python</span>
</h1>

<p class="dscr">For the integration of <b>ONLYOFFICE Document Builder</b> into any application, the Python <b>doctrenderer</b> library is used. The current application version contains four main classes:</p>
<ul>
    <li>
        <a href="<%= Url.Action("integrationapi/python/cdocbuilder") %>">CDocBuilder</a> class - used by <b>ONLYOFFICE Document Builder</b> for the document file (text document, spreadsheet, presentation, form document, PDF) to be generated.
    </li>
    <li>
        <a href="<%= Url.Action("integrationapi/python/cdocbuildercontext") %>">CDocBuilderContext</a> class - used by <b>ONLYOFFICE Document Builder</b> for getting JS context for working.
    </li>
    <li>
        <a href="<%= Url.Action("integrationapi/python/cdocbuildercontextscope") %>">CDocBuilderContextScope</a> class - the stack-allocated class which sets the execution context for all operations executed within a local scope.
    </li>
    <li>
        <a href="<%= Url.Action("integrationapi/python/cdocbuildervalue") %>">CDocBuilderValue</a> class - used by <b>ONLYOFFICE Document Builder</b> for getting the results of called JS commands.
        It represents a wrapper for a JS object.
    </li>
</ul>

<h2>Example</h2>
<h4 class="header-gray" >Python</h4>

<pre >
import os
import sys
sys.path.append("C:/Program Files/ONLYOFFICE/DocumentBuilder")
import docbuilder

builder = docbuilder.CDocBuilder()

builder.CreateFile("docx")

context = builder.GetContext()
scope = context.CreateScope()

globalObj = context.GetGlobal()

api = globalObj["Api"]
document = api.Call("GetDocument")
paragraph = api.Call("CreateParagraph")
paragraph.Call("SetSpacingAfter", 1000, False)
paragraph.Call("AddText", "Hello, World!")
content = context.CreateArray(1)
content[0] = paragraph
document.Call("InsertContent", content)

dstPath = os.getcwd() + "/result.docx"
builder.SaveFile("docx", dstPath)
builder.CloseFile()
</pre>

<h4 class="header-gray" >.docbuilder</h4>
<pre>builder.SetTmpFolder("DocBuilderTemp");
builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = Api.CreateParagraph();
oParagraph.SetSpacingAfter(1000, false);
oParagraph.AddText("Hello, World!");
oDocument.InsertContent([oParagraph]);
builder.SaveFile("docx", "result.docx");
builder.CloseFile();</pre>
