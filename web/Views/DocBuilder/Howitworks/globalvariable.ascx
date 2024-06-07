<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Exchanging data among files</span>
</h1>

<p class="dscr">There is always a chance that you will need to exchange the data among the documents. For example, you might need to open some document, copy style from it, or some data values, close the document, create a new one and paste the copied data to it or use it to form some report.</p>
<p>But once you close the file (using the <a href="<%= Url.Action("integrationapi/c/cdocbuilder/closefile") %>">CDocBuilder.CloseFile</a> method), all the variable data you worked with will be void and cleared, and you will not be able to use it with any other file.</p>
<p>To exchange the data between the files <em>GlobalVariable</em> is introduced.</p>
<p>What you need, is to create a variable in the first opened or created file using the <em>GlobalVariable</em> method, e.g.:</p>
<pre>
GlobalVariable["CommentsReport"] = oDocument.GetCommentsReport();
</pre>
<p>Then close the document and open or create a new one where this variable can be used without any problems, e.g.:</p>
<pre>
var oCommentsReport = GlobalVariable["CommentsReport"];
</pre>
<p>The example below shows how <em>GlobalVariable</em> is used. For more information visit the <a href="<%= Url.Action("textdocumentapi/apidocument/getcommentsreport", "officeapi") %>">ApiDocument.GetCommentsReport</a> and <a href="<%= Url.Action("textdocumentapi/apidocument/getreviewreport", "officeapi") %>">ApiDocument.GetReviewReport</a> sections.</p>
<h2>Example</h2>
<pre>builder.OpenFile("https://example.com/DocumentWithComments.docx");
var oDocument = Api.GetDocument();
GlobalVariable["CommentsReport"] = oDocument.GetCommentsReport();
builder.CloseFile();

builder.CreateFile("docx");
var oCommentsReport = GlobalVariable["CommentsReport"];
... // now you can use the 'CommentsReport' variable from the previous document in the current document;
builder.SaveFile("docx", "GetCommentsReport.docx");
builder.CloseFile();</pre>