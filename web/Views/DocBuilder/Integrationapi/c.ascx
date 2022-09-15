<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">C++ wrapper</span>
</h1>

<p class="dscr">For the integration of <b>ONLYOFFICE Document Builder</b> into any application, the C++ <b>doctrenderer</b> library is used. The current application version contains six main classes:</p>
<ul>
    <li>
        <em>CDoctrenderer</em> class - used by <b>ONLYOFFICE Document Builder</b> in the file conversion process.
    </li>
    <li>
        <em>CString</em> class - the string class with the <em>wchar_t*</em> property.
    </li>
    <li>
        <a href="<%= Url.Action("integrationapi/c/cdocbuilder") %>">CDocBuilder</a> class - used by <b>ONLYOFFICE Document Builder</b> for the document file (text document, spreadsheet, presentation, form document, PDF) to be generated.
    </li>
    <li>
        <a href="<%= Url.Action("integrationapi/c/cdocbuildercontext") %>">CDocBuilderContext</a> class -  used by <b>ONLYOFFICE Document Builder</b> for getting JS context for working.
    </li>
    <li>
        <a href="<%= Url.Action("integrationapi/c/cdocbuildercontextscope") %>">CDocBuilderContextScope</a> class - the stack-allocated class which sets the execution context for all operations executed within a local scope.
    </li>
    <li>
        <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue") %>">CDocBuilderValue</a> class - used by <b>ONLYOFFICE Document Builder</b> for getting the results of called JS commands.
        It represents a wrapper for a JS object.
    </li>
</ul>

<h2>Example</h2>
<h4 class="header-gray" >C++</h4>

<pre >#include "./../common_deploy.h"
#include "../docbuilder.h"
#include "./utils.cpp"

using namespace NSDoctRenderer;
int main(int argc, char *argv[])
{
	std::wstring sProcessDirectory = NSUtils::GetProcessDirectory();
	std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();

    CDocBuilder::Initialize(sWorkDirectory.c_str());

    CDocBuilder oBuilder;
    oBuilder.SetProperty("--work-directory", sWorkDirectory.c_str());

    oBuilder.CreateFile(OFFICESTUDIO_FILE_DOCUMENT_DOCX);

    CContext oContext = oBuilder.GetContext();
    CContextScope oScope = oContext.CreateScope();

    CValue oGlobal = oContext.GetGlobal();

    CValue oApi = oGlobal["Api"];
    CValue oDocument = oApi.Call("GetDocument");
    CValue oParagraph = oApi.Call("CreateParagraph");
    oParagraph.Call("SetSpacingAfter", 1000, false);
    oParagraph.Call("AddText", "Hello, world!");
    CValue oContent = oContext.CreateArray(1);
    oContent[0] = oParagraph;
    oDocument.Call("InsertContent", oContent);

    std::wstring sDstPath = sProcessDirectory + L"/result.docx";
    oBuilder.SaveFile(OFFICESTUDIO_FILE_DOCUMENT_DOCX, sDstPath.c_str());
    oBuilder.CloseFile();

    CDocBuilder::Dispose();

    return 0;
}</pre>

<h4 class="header-gray" >.docbuilder</h4>
<pre>builder.SetTmpFolder("DocBuilderTemp");
builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = Api.CreateParagraph();
oParagraph.SetSpacingAfter(1000, false);
oParagraph.AddText("Hello, world!");
oDocument.InsertContent([oParagraph]);
builder.SaveFile("docx", "result.docx");
builder.CloseFile();</pre>
