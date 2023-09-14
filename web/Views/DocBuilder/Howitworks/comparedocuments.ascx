<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Comparing documents</span>
</h1>

<p class="dscr">If you need to compare two documents, you can use <b>Document Builder</b>. The steps below will show you how to do it:</p>
<ol>
    <li>
        <p>Create the <em>compare.docbuilder</em> script file with the following code:</p>
        <pre>
builder.OpenFile("https://example.com/file1.docx");
var file = builderJS.OpenTmpFile("https://example.com/file2.docx");
AscCommonWord.CompareDocuments(Api, file, null);
file.Close();
builder.SaveFile("docx", "Result.docx");
builder.CloseFile();
</pre>
        <p>where</p>
        <p><em>https://example.com/file1.docx</em> - the path to the first file for comparing,</p>
        <p><em>https://example.com/file2.docx</em> - the path to the second file for comparing.</p>
    </li>
    <li>
        <p>Send the <a href="<%= Url.Action("documentbuilderapi", "editors") %>">POST request</a> to <b>https://documentserver/docbuilder</b> with the following body in the JSON format:</p>
        <pre>
{
    "async": false,
    "url": "https://example.com/compare.docbuilder"
}
</pre>
        <p>where</p>
        <p><em>https://example.com/compare.docbuilder</em> - the path to the <em>.docbuilder</em> script.</p>
    </li>
    <li>
        <p>Once the document generation is ready, the response with the absolute URL to the output file of document comparing will be returned:</p>
        <pre>
{
   "key": "Khirz6zTPdfd7",
    "urls": {
        "Result.docx": "https://documentserver/Result.docx"
    },
    "end": true
}

</pre>
    </li>
    <li>
        <p>Download the document from the received link. Now you can check all the document differences and accept or reject them using the corresponding buttons on the top toolbar.</p>
        <img class="screenshot max-width-832" alt="Compare documents" src="<%= Url.Content("~/content/img/docbuilder/compare-documents.png") %>" />
    </li>
</ol>
