<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">.Net wrapper</span>
</h1>

<p class="dscr">For the integration of <b>ONLYOFFICE Document Builder</b> into any application, the .Net <b>doctrenderer</b> library is used. The current application version contains five main classes:</p>
<ul>
    <li>
        <em>CDoctrenderer</em> class - used by <b>ONLYOFFICE Document Builder</b> in the file conversion process.
    </li>
    <li>
        <a href="<%= Url.Action("integrationapi/net/cdocbuilder") %>">CDocBuilder</a> class - used by <b>ONLYOFFICE Document Builder</b> for the document file (text document, spreadsheet, presentation, form document, PDF) to be generated.
    </li>
    <li>
        <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue") %>">CDocBuilderValue</a> class - used by <b>ONLYOFFICE Document Builder</b> for getting the results of called JS commands.
        It represents a wrapper for a JS object.
    </li>
    <li>
        <a href="<%= Url.Action("integrationapi/net/cdocbuildercontextscope") %>">CDocBuilderContextScope</a> class - the stack-allocated class which sets the execution context for all operations executed within a local scope.
    </li>
    <li>
        <a href="<%= Url.Action("integrationapi/net/cdocbuildercontext") %>">CDocBuilderContext</a> class -  used by <b>ONLYOFFICE Document Builder</b> for getting JS context for working.
    </li>
</ul>

<h2>Example</h2>
<h4 class="header-gray" >.Net</h4>

<pre >using docbuilder_net;

using OfficeFileTypes = docbuilder_net.FileTypes;
using CValue = docbuilder_net.CDocBuilderValue;
using CContext = docbuilder_net.CDocBuilderContext;
using CContextScope = docbuilder_net.CDocBuilderContextScope;

namespace Test
{
    public class Program
    {
        public static void Main(string[] args)
        {
            string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
            string resultPath = "result.docx";

            // add the Docbuilder dlls to the path
            System.Environment.SetEnvironmentVariable("PATH", System.Environment.GetEnvironmentVariable("PATH") + ";" + workDirectory);

            Test(workDirectory, resultPath);

            // uncomment these lines to check the finalizer calls
            // GC.Collect();
            // Console.ReadKey();
        }
        public static void Test(string workDirectory, string resultPath)
        {
            var doctype = (int)OfficeFileTypes.Document.DOCX;

            CDocBuilder.Initialize(workDirectory);
            CDocBuilder oBuilder = new CDocBuilder();
            oBuilder.SetProperty("--work-directory", workDirectory);
            oBuilder.CreateFile(doctype);

            CContext oContext = oBuilder.GetContext();
            CContextScope oScope = oContext.CreateScope();
          
            CValue oGlobal = oContext.GetGlobal();

            CValue oApi = oGlobal["Api"];
            CValue oDocument = oApi.Call("GetDocument");
            CValue oParagraph = oApi.Call("CreateParagraph");
            CValue oContent = oContext.CreateArray(1);

            oParagraph.Call("SetSpacingAfter", 1000, false);
            oParagraph.Call("AddText", "Hello from .net!");
            oContent[0] = oParagraph;
            oDocument.Call("InsertContent", oContent);

            oBuilder.SaveFile(doctype, resultPath);
            oBuilder.CloseFile();

            CDocBuilder.Destroy();
        }
    }
}</pre>

<h4 class="header-gray" >.docbuilder</h4>
<pre>builder.SetTmpFolder("DocBuilderTemp");
builder.CreateFile("docx");
var oDocument = Api.GetDocument();
var oParagraph = Api.CreateParagraph();
oParagraph.SetSpacingAfter(1000, false);
oParagraph.AddText("Hello from .net!");
oDocument.InsertContent([oParagraph]);
builder.SaveFile("docx", "result.docx");
builder.CloseFile();</pre>
