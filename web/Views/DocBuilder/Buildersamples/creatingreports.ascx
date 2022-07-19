<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("buildersamples/") %>"></a>
    <span class="hdr">Creating a comment/review report</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Create reports on all the comments added to the document and on every change which was made to the document in the review mode:</p>
<ul>
    <li>open the created file (<a href="<%= Url.Action("textdocumentapi/api/getdocument") %>">Api/GetDocument</a>);</li>
    <li>get the comments and review reports and save them to the global variable (<a href="<%= Url.Action("textdocumentapi/apidocument/getcommentsreport") %>">ApiDocument/GetCommentsReport</a>,
    <a href="<%= Url.Action("textdocumentapi/apidocument/getreviewreport") %>">ApiDocument/GetReviewReport</a>);</li>
    <li>create a table for the comments/review report and fill it in with the data from the global variable (<a href="<%= Url.Action("textdocumentapi/api/createparagraph") %>">Api/CreateParagraph</a>,
    <a href="<%= Url.Action("textdocumentapi/api/createtable") %>">Api/CreateTable</a>, <a href="<%= Url.Action("textdocumentapi/apidocument/push") %>">ApiDocument/Push</a>,
    <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/getelement") %>">ApiDocumentContent/GetElement</a>, <a href="<%= Url.Action("textdocumentapi/apiparagraph/addtext") %>">ApiParagraph/AddText</a>,
    <a href="<%= Url.Action("textdocumentapi/apitable/getrow") %>">ApiTable/GetRow</a>, <a href="<%= Url.Action("textdocumentapi/apitable/mergecells") %>">ApiTable/MergeCells</a>,
    <a href="<%= Url.Action("textdocumentapi/apitablecell/getcontent") %>">ApiTableCell/GetContent</a>, <a href="<%= Url.Action("textdocumentapi/apitablerow/getcell") %>">ApiTableRow/GetCell</a>);</li>
    <li>edit text style in the table (<a href="<%= Url.Action("textdocumentapi/apidocument/getstyle") %>">ApiDocument/GetStyle</a>, <a href="<%= Url.Action("textdocumentapi/apirun/setcolor") %>">ApiRun/SetColor</a>,
    <a href="<%= Url.Action("textdocumentapi/apirun/setstrikeout") %>">ApiRun/SetStrikeout</a>).</li>
</ul>

<div class="header-gray">Script</div>
</br >

<textarea disabled="disabled" id="builderScript" name="builderScript" class="builder-code">
    builder.OpenFile("sample1.docx");

    var oDocument = Api.GetDocument();
    GlobalVariable["CommentsReport"] = oDocument.GetCommentsReport();
    GlobalVariable["ReviewReport"] = oDocument.GetReviewReport();

    builder.CloseFile();

    builder.CreateFile("docx");

    var oCommentsReport = GlobalVariable["CommentsReport"];
    var oReviewReport = GlobalVariable["ReviewReport"];

    var oDocument = Api.GetDocument();
    var oParagraph = Api.CreateParagraph();
    oDocument.Push(oParagraph);
    oParagraph.AddText("Comments report");

    var nRows = 1;
    for (var sUserName in oCommentsReport)
    {
    	nRows += oCommentsReport[sUserName].length;
    }

    var nCols = 6;
    var oTable = Api.CreateTable(nCols, nRows);
    oDocument.Push(oTable);

    function privateFillCell(nCurRow, nCurCol, sText)
    {
    	var oRow         = oTable.GetRow(nCurRow);
    	var oCell        = oRow.GetCell(nCurCol);
    	var oCellContent = oCell.GetContent();
    	var oRun         = oCellContent.GetElement(0).AddText(sText);
    	return {Cell : oCell, Run : oRun};
    }

    privateFillCell(0, 0, "Name");
    privateFillCell(0, 1, "Date");
    privateFillCell(0, 2, "");
    privateFillCell(0, 3, "Solved");
    privateFillCell(0, 4, "Text");
    privateFillCell(0, 5, "Quote text");

    var nCurRow = 1;
    for (sUserName in oCommentsReport)
    {
    	var arrUserComments = oCommentsReport[sUserName];
    	var arrCells = [];
    	for (var nIndex = 0, nCount = arrUserComments.length; nIndex < nCount; ++nIndex, ++nCurRow)
    	{
    		var oCommentInfo = oCommentsReport[sUserName][nIndex];
    		arrCells.push(privateFillCell(nCurRow, 0, "").Cell);
    		privateFillCell(nCurRow, 1, (new Date(oCommentInfo["Date"])).toString());
    		privateFillCell(nCurRow, 2, oCommentInfo["IsAnswer"] === true ? "answer" : "comment");

    		if (oCommentInfo["IsAnswer"] !== true)
    		{
    			if (oCommentInfo["IsSolved"] === true)
    				privateFillCell(nCurRow, 3, "yes").Run.SetColor(0, 255, 0);
    			else
    				privateFillCell(nCurRow, 3, "no").Run.SetColor(255, 0, 0);
    		}

    		privateFillCell(nCurRow, 4, oCommentInfo["CommentMessage"] ? oCommentInfo["CommentMessage"] : "");
    		privateFillCell(nCurRow, 5, oCommentInfo["QuoteText"] ? oCommentInfo["QuoteText"] : "");
    	}

    	var oMergedCell = oTable.MergeCells(arrCells);
    	if (oMergedCell)
    	{
    		var oCellContent = oMergedCell.GetContent();
    		oCellContent.GetElement(0).AddText(sUserName);
    	}
    	else if (arrCells.length > 0)
    	{
    		oCellContent = arrCells[0].GetContent();
    		oCellContent.GetElement(0).AddText(sUserName);
    	}
    }
    oTable.SetStyle(oDocument.GetStyle("Bordered"));


    oParagraph = Api.CreateParagraph();
    oDocument.Push(oParagraph);
    oParagraph.AddText("Review report");

    nRows = 1;
    for (sUserName in oReviewReport)
    {
    	nRows += oReviewReport[sUserName].length;
    }

    nCols = 4;
    oTable = Api.CreateTable(nCols, nRows);
    oDocument.Push(oTable);

    privateFillCell(0, 0, "Name");
    privateFillCell(0, 1, "Date");
    privateFillCell(0, 2, "Action");
    privateFillCell(0, 3, "");

    nCurRow = 1;
    for (sUserName in oReviewReport)
    {
    	var arrUserChanges = oReviewReport[sUserName];
    	arrCells = [];
    	for (nIndex = 0, nCount = arrUserChanges.length; nIndex < nCount; ++nIndex, ++nCurRow)
    	{
    		var oChangeInfo = arrUserChanges[nIndex];
    		arrCells.push(privateFillCell(nCurRow, 0, "").Cell);
    		privateFillCell(nCurRow, 1, (new Date(oChangeInfo["Date"])).toString());

    		var sType = oChangeInfo["Type"];
    		if ("TextAdd" === sType)
    		{
    			privateFillCell(nCurRow, 2, "Added text");
    			privateFillCell(nCurRow, 3, oChangeInfo["Value"]);
    		}
    		else if ("TextRem" === sType)
    		{
    			privateFillCell(nCurRow, 2, "Removed text");
    			privateFillCell(nCurRow, 3, oChangeInfo["Value"]).Run.SetStrikeout(true);
    		}
    		else if ("TextPr" === sType)
    		{
    			privateFillCell(nCurRow, 2, "Formatted text");
    		}
    		else if ("ParaAdd" === sType)
    		{
    			privateFillCell(nCurRow, 2, "Added paragraph");
    		}
    		else if ("ParaRem" === sType)
    		{
    			privateFillCell(nCurRow, 2, "Removed paragraph");
    		}
    		else if ("ParaPr" === sType)
    		{
    			privateFillCell(nCurRow, 2, "Formatted paragraph");
    		}
    		else
    		{
    			privateFillCell(nCurRow, 2, "Unknown change");
    		}
    	}

    	oMergedCell = oTable.MergeCells(arrCells);
    	if (oMergedCell)
    	{
    		oCellContent = oMergedCell.GetContent();
    		oCellContent.GetElement(0).AddText(sUserName);
    	}
    	else if (arrCells.length > 0)
    	{
    		var oCellContent = arrCells[0].GetContent();
    		oCellContent.GetElement(0).AddText(sUserName);
    	}
    }
    oTable.SetStyle(oDocument.GetStyle("Bordered"));

    builder.SaveFile("docx", "sample6.docx");
    builder.CloseFile();
</textarea>

<a style="text-decoration: none;" href="<%= Url.Content("~/content/img/docbuilder/document-samples/sample6.docx") %>", download="" />
    <button type="submit" id="generateButton" class="builder-run">
        Generate<br />
        document
    </button>
</a>

<div class="header-gray">Result</div>
</br >
<img alt="Reports" src="<%= Url.Content("~/content/img/docbuilder/reports.png") %>" />
