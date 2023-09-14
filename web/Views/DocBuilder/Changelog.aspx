<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Changelog
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Changelog</span>
    </h1>

    <p class="dscr">The list of changes for ONLYOFFICE Document Builder API.</p>
    <h2 id="74" class="copy-link">Version 7.4</h2>
    <p><b>Characters methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apicharacters") %>">ApiCharacters</a> class to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apicharacters/delete") %>">ApiCharacters/Delete</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apicharacters/getcaption") %>">ApiCharacters/GetCaption</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apicharacters/getcount") %>">ApiCharacters/GetCount</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apicharacters/getfont") %>">ApiCharacters/GetFont</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apicharacters/getparent") %>">ApiCharacters/GetParent</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apicharacters/gettext") %>">ApiCharacters/GetText</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apicharacters/insert") %>">ApiCharacters/Insert</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apicharacters/setcaption") %>">ApiCharacters/SetCaption</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apicharacters/settext") %>">ApiCharacters/SetText</a> method to Spreadsheet API.</li>
    </ul>
    <br />

    <p><b>Font methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apifont") %>">ApiFont</a> class to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apifont/getbold") %>">ApiFont/GetBold</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apifont/getcolor") %>">ApiFont/GetColor</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apifont/getitalic") %>">ApiFont/GetItalic</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apifont/getname") %>">ApiFont/GetName</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apifont/getparent") %>">ApiFont/GetParent</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apifont/getsize") %>">ApiFont/GetSize</a> method to Spreadsheet API.</li>
    </ul>
    <p class="spoiler_heading spoiler_changelog">More</p>
    <ul class="spoiler_code">
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apifont/getstrikethrough") %>">ApiFont/GetStrikethrough</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apifont/getsubscript") %>">ApiFont/GetSubscript</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apifont/getsuperscript") %>">ApiFont/GetSuperscript</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apifont/getunderline") %>">ApiFont/GetUnderline</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apifont/setbold") %>">ApiFont/SetBold</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apifont/setcolor") %>">ApiFont/SetColor</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apifont/setitalic") %>">ApiFont/SetItalic</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apifont/setname") %>">ApiFont/SetName</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apifont/setsize") %>">ApiFont/SetSize</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apifont/setstrikethrough") %>">ApiFont/SetStrikethrough</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apifont/setsubscript") %>">ApiFont/SetSubscript</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apifont/setsuperscript") %>">ApiFont/SetSuperscript</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apifont/setunderline") %>">ApiFont/SetUnderline</a> method to Spreadsheet API.</li>
    </ul>
    <br />

    <p><b>Range methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/find") %>">ApiRange/Find</a> class to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/findnext") %>">ApiRange/FindNext</a> class to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/findprevious") %>">ApiRange/FindPrevious</a> class to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/getcharacters") %>">ApiRange/GetCharacters</a> class to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/replace") %>">ApiRange/Replace</a> class to Spreadsheet API.</li>
    </ul>
    <br />

    <p><b>Other methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment/getid") %>">ApiComment/GetId</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/getallstyles") %>">ApiDocument/GetAllStyles</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiparagraph/getsection") %>">ApiParagraph/GetSection</a> method to Text document API.</li>
        <li>Added the resulting string display properties to the <a href="<%= Url.Action("textdocumentapi/apiparagraph/gettext") %>">ApiParagraph/GetText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiparagraph/setsection") %>">ApiParagraph/SetSection</a> method to Text document API.</li>
        <li>Added the resulting string display properties to the <a href="<%= Url.Action("textdocumentapi/apirange/gettext") %>">ApiRange/GetText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apirun/gettext") %>">ApiRun/GetText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitable/addcaption") %>">ApiTable/AddCaption</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiblocklvlsdt/addcaption") %>">ApiBlockLvlSdt/AddCaption</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/api/getfullname") %>">Api/GetFullName</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/api/getfullname") %>">Api/GetFullName</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/getnumberformat") %>">ApiRange/GetNumberFormat</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheet/move") %>">ApiWorksheet/Move</a> class to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/api/getfullname") %>">Api/GetFullName</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("formapi/apidocument/inserttextform") %>">ApiDocument/InsertTextForm</a> method to Form API.</li>
    </ul>


    <h2 id="73" class="copy-link">Version 7.3</h2>
    <p><b>Comment methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiblocklvlsdt/addcomment") %>">ApiBlockLvlSdt/AddComment</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment") %>">ApiComment</a> class to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment/addreply") %>">ApiComment/AddReply</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment/delete") %>">ApiComment/Delete</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment/getautorname") %>">ApiComment/GetAutorName</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment/getclasstype") %>">ApiComment/GetClassType</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment/getquotetext") %>">ApiComment/GetQuoteText</a> method to Text document API.</li>
    </ul>
    <p class="spoiler_heading spoiler_changelog">More</p>
    <ul class="spoiler_code">
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment/getrepliescount") %>">ApiComment/GetRepliesCount</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment/getreply") %>">ApiComment/GetReply</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment/gettext") %>">ApiComment/GetText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment/gettime") %>">ApiComment/GetTime</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment/gettimeutc") %>">ApiComment/GetTimeUTC</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment/getuserid") %>">ApiComment/GetUserId</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment/issolved") %>">ApiComment/IsSolved</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment/removereplies") %>">ApiComment/RemoveReplies</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment/setautorname") %>">ApiComment/SetAutorName</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment/setsolved") %>">ApiComment/SetSolved</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment/settext") %>">ApiComment/SetText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment/settime") %>">ApiComment/SetTime</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment/settimeutc") %>">ApiComment/SetTimeUTC</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment/setuserid") %>">ApiComment/SetUserId</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicommentreply") %>">ApiCommentReply</a> class to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicommentreply/getautorname") %>">ApiCommentReply/GetAutorName</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicommentreply/getclasstype") %>">ApiCommentReply/GetClassType</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicommentreply/gettext") %>">ApiCommentReply/GetText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicommentreply/getuserid") %>">ApiCommentReply/GetUserId</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicommentreply/setautorname") %>">ApiCommentReply/SetAutorName</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicommentreply/settext") %>">ApiCommentReply/SetText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicommentreply/setuserid") %>">ApiCommentReply/SetUserId</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/getallcomments") %>">ApiDocument/GetAllComments</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/getcommentbyid") %>">ApiDocument/GetCommentById</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiinlinelvlsdt/addcomment") %>">ApiInlineLvlSdt/AddComment</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apirange/addcomment") %>">ApiRange/AddComment</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apirun/addcomment") %>">ApiRun/AddComment</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitable/addcomment") %>">ApiTable/AddComment</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/api/getcomments") %>">Api/GetComments</a> method to Spreadsheet API.</li>
    </ul>
    <br />

    <p><b>Table of contents/figures methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/addtableofcontents") %>">ApiDocument/AddTableOfContents</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/addtableoffigures") %>">ApiDocument/AddTableOfFigures</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiparagraph/addcaption") %>">ApiParagraph/AddCaption</a> method to Text document API.</li>
    </ul>
    <br />

    <p><b>Other methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiblocklvlsdt/setbackgroundcolor") %>">ApiBlockLvlSdt/SetBackgroundColor</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/getpagecount") %>">ApiDocument/GetPageCount</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/getstatistics") %>">ApiDocument/GetStatistics</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/setcontrolshighlight") %>">ApiDocument/SetControlsHighlight</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apirange/getrange") %>">ApiRange/GetRange</a> method to Text document API.</li>
    </ul>


    <h2 id="72" class="copy-link">Version 7.2</h2>
    <p><b>Events</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/api/attachEvent") %>">Api/attachEvent</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/api/detachEvent") %>">Api/detachEvent</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/api/attachEvent") %>">Api/attachEvent</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/api/detachEvent") %>">Api/detachEvent</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/api/onworksheetchange") %>">Api/onWorksheetChange</a> event to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/api/attachEvent") %>">Api/attachEvent</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/api/detachEvent") %>">Api/detachEvent</a> method to Presentation API.</li>
    </ul>
    <br />

    <p><b>Integration API</b></p>
    <ul>
        <li>Updated the <a href="<%= Url.Action("integrationapi/c") %>">C++</a> wrapper for ONLYOFFICE Document Builder.</li>
        <li>Added the <a href="<%= Url.Action("integrationapi/net") %>">.Net</a> wrapper for ONLYOFFICE Document Builder.</li>
    </ul>
    <br />
    
    <p><b>Form methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomplexform") %>">ApiComplexForm</a> class to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/gettagsofallcontentcontrols") %>">ApiDocument/GetTagsOfAllContentControls</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/gettagsofallforms") %>">ApiDocument/GetTagsOfAllForms</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/getcontentcontrolsbytag") %>">ApiDocument/GetContentControlsByTag</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/getformsbytag") %>">ApiDocument/GetFormsByTag</a> method to Text document API.</li>
    </ul>
    <br />

    <p><b>Methods for converting to/from JSON</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/api/fromjson") %>">Api/FromJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiblocklvlsdt/tojson") %>">ApiBlockLvlSdt/ToJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/tojson") %>">ApiDocument/ToJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/tojson") %>">ApiDocumentContent/ToJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidrawing/tojson") %>">ApiDrawing/ToJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apifill/tojson") %>">ApiFill/ToJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apigradientstop/tojson") %>">ApiGradientStop/ToJSON</a> method to Text document API.</li>
    </ul>
    <p class="spoiler_heading spoiler_changelog">More</p>
    <ul class="spoiler_code">
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apihyperlink/tojson") %>">ApiHyperlink/ToJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiinlinelvlsdt/tojson") %>">ApiInlineLvlSdt/ToJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apinumbering/tojson") %>">ApiNumbering/ToJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiparagraph/tojson") %>">ApiParagraph/ToJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiparapr/tojson") %>">ApiParaPr/ToJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipresetcolor/tojson") %>">ApiPresetColor/ToJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apirange/tojson") %>">ApiRange/ToJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apirgbcolor/tojson") %>">ApiRGBColor/ToJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apirun/tojson") %>">ApiRun/ToJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apischemecolor/tojson") %>">ApiSchemeColor/ToJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apisection/tojson") %>">ApiSection/ToJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apistroke/tojson") %>">ApiStroke/ToJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apistyle/tojson") %>">ApiStyle/ToJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitable/tojson") %>">ApiTable/ToJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitablecell/tojson") %>">ApiTableCell/ToJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitablecellpr/tojson") %>">ApiTableCellPr/ToJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitablepr/tojson") %>">ApiTablePr/ToJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitablerow/tojson") %>">ApiTableRow/ToJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitablerowpr/tojson") %>">ApiTableRowPr/ToJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitablestylepr/tojson") %>">ApiTableStylePr/ToJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextpr/tojson") %>">ApiTextPr/ToJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiunicolor/tojson") %>">ApiUniColor/ToJSON</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/api/fromjson") %>">Api/FromJSON</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apidrawing/tojson") %>">ApiDrawing/ToJSON</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/tojson") %>">ApiLayout/ToJSON</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/tojson") %>">ApiMaster/ToJSON</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apipresentation/slidestojson") %>">ApiPresentation/SlidesToJSON</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apipresentation/tojson") %>">ApiPresentation/ToJSON</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/tojson") %>">ApiSlide/ToJSON</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitable/tojson") %>">ApiTable/ToJSON</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemecolorscheme/tojson") %>">ApiThemeColorScheme/ToJSON</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemefontscheme/tojson") %>">ApiThemeFontScheme/ToJSON</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemeformatscheme/tojson") %>">ApiThemeFormatScheme/ToJSON</a> method to Presentation API.</li>
    </ul>
    <br />

    <p><b>Word Art methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/api/createwordart") %>">Api/CreateWordArt</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheet/addwordart") %>">ApiWorksheet/AddWordArt</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/api/createwordart") %>">Api/CreateWordArt</a> method to Presentation API.</li>
    </ul>
    <br />

    <p><b>Table of contents/figures methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/updatealltoc") %>">ApiDocument/UpdateAllTOC</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/updatealltof") %>">ApiDocument/UpdateAllTOF</a> method to Text document API.</li>
    </ul>
    <br />

    <p><b>Footnote/endnote methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/addendnote") %>">ApiDocument/AddEndnote</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/addfootnote") %>">ApiDocument/AddFootnote</a> method to Text document API.</li>
    </ul>
    <br />

    <p><b>Chart methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apichart/applychartstyle") %>">ApiChart/ApplyChartStyle</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apichart/removeseria") %>">ApiChart/RemoveSeria</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apichart/setaxienumformat") %>">ApiChart/SetAxieNumFormat</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apichart/setcategoryname") %>">ApiChart/SetCategoryName</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apichart/setdatapointfill") %>">ApiChart/SetDataPointFill</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apichart/setdatapointnumformat") %>">ApiChart/SetDataPointNumFormat</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apichart/setdatapointoutline") %>">ApiChart/SetDataPointOutLine</a> method to Text document API.</li>
    </ul>
    <p class="spoiler_heading spoiler_changelog">More</p>
    <ul class="spoiler_code">
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apichart/setlegendfill") %>">ApiChart/SetLegendFill</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apichart/setlegendoutline") %>">ApiChart/SetLegendOutLine</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apichart/setmarkerfill") %>">ApiChart/SetMarkerFill</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apichart/setmarkeroutline") %>">ApiChart/SetMarkerOutLine</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apichart/setplotareafill") %>">ApiChart/SetPlotAreaFill</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apichart/setplotareaoutline") %>">ApiChart/SetPlotAreaOutLine</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apichart/setserianame") %>">ApiChart/SetSeriaName</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apichart/setserianumformat") %>">ApiChart/SetSeriaNumFormat</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apichart/setseriavalues") %>">ApiChart/SetSeriaValues</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apichart/setseriesfill") %>">ApiChart/SetSeriesFill</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apichart/setseriesoutline") %>">ApiChart/SetSeriesOutLine</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apichart/settitlefill") %>">ApiChart/SetTitleFill</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apichart/settitleoutline") %>">ApiChart/SetTitleOutLine</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apichart/setxvalues") %>">ApiChart/SetXValues</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apichart/addseria") %>">ApiChart/AddSeria</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apichart/removeseria") %>">ApiChart/RemoveSeria</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apichart/setaxienumformat") %>">ApiChart/SetAxieNumFormat</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apichart/setcatformula") %>">ApiChart/SetCatFormula</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apichart/setdatapointfill") %>">ApiChart/SetDataPointFill</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apichart/setdatapointoutline") %>">ApiChart/SetDataPointOutLine</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apichart/setlegendfill") %>">ApiChart/SetLegendFill</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apichart/setlegendoutline") %>">ApiChart/SetLegendOutLine</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apichart/setmarkerfill") %>">ApiChart/SetMarkerFill</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apichart/setmarkeroutline") %>">ApiChart/SetMarkerOutLine</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apichart/setplotareafill") %>">ApiChart/SetPlotAreaFill</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apichart/setplotareaoutline") %>">ApiChart/SetPlotAreaOutLine</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apichart/setserianame") %>">ApiChart/SetSeriaName</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apichart/setseriavalues") %>">ApiChart/SetSeriaValues</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apichart/setseriaxvalues") %>">ApiChart/SetSeriaXValues</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apichart/setseriesfill") %>">ApiChart/SetSeriesFill</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apichart/setseriesoutline") %>">ApiChart/SetSeriesOutLine</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apichart/settitlefill") %>">ApiChart/SetTitleFill</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apichart/settitleoutline") %>">ApiChart/SetTitleOutLine</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apichart/applychartstyle") %>">ApiChart/ApplyChartStyle</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apichart/removeseria") %>">ApiChart/RemoveSeria</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apichart/setaxienumformat") %>">ApiChart/SetAxieNumFormat</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apichart/setcategoryname") %>">ApiChart/SetCategoryName</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apichart/setdatapointfill") %>">ApiChart/SetDataPointFill</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apichart/setdatapointnumformat") %>">ApiChart/SetDataPointNumFormat</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apichart/setdatapointoutline") %>">ApiChart/SetDataPointOutLine</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apichart/setlegendfill") %>">ApiChart/SetLegendFill</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apichart/setlegendoutline") %>">ApiChart/SetLegendOutLine</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apichart/setmarkerfill") %>">ApiChart/SetMarkerFill</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apichart/setmarkeroutline") %>">ApiChart/SetMarkerOutLine</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apichart/setplotareafill") %>">ApiChart/SetPlotAreaFill</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apichart/setplotareaoutline") %>">ApiChart/SetPlotAreaOutLine</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apichart/setserianame") %>">ApiChart/SetSeriaName</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apichart/setserianumformat") %>">ApiChart/SetSeriaNumFormat</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apichart/setseriavalues") %>">ApiChart/SetSeriaValues</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apichart/setseriesfill") %>">ApiChart/SetSeriesFill</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apichart/setseriesoutline") %>">ApiChart/SetSeriesOutLine</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apichart/settitlefill") %>">ApiChart/SetTitleFill</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apichart/settitleoutline") %>">ApiChart/SetTitleOutLine</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apichart/setxvalues") %>">ApiChart/SetXValues</a> method to Presentation API.</li>
    </ul>
    <br />

    <p><b>Drawing methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/getselecteddrawings") %>">ApiDocument/GetSelectedDrawings</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/replacedrawing") %>">ApiDocument/ReplaceDrawing</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/getallcharts") %>">ApiDocumentContent/GetAllCharts</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/getalldrawingobjects") %>">ApiDocumentContent/GetAllDrawingObjects</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/getallimages") %>">ApiDocumentContent/GetAllImages</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/getallshapes") %>">ApiDocumentContent/GetAllShapes</a> method to Text document API.</li>
    </ul>
    <p class="spoiler_heading spoiler_changelog">More</p>
    <ul class="spoiler_code">
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidrawing/getheight") %>">ApiDrawing/GetHeight</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidrawing/getlockvalue") %>">ApiDrawing/GetLockValue</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidrawing/getwidth") %>">ApiDrawing/GetWidth</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidrawing/setdrawingprfromdrawing") %>">ApiDrawing/SetDrawingPrFromDrawing</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidrawing/setlockvalue") %>">ApiDrawing/SetLockValue</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apidrawing/getheight") %>">ApiDrawing/GetHeight</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apidrawing/getlockvalue") %>">ApiDrawing/GetLockValue</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apidrawing/getwidth") %>">ApiDrawing/GetWidth</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apidrawing/setlockvalue") %>">ApiDrawing/SetLockValue</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apidrawing/getheight") %>">ApiDrawing/GetHeight</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apidrawing/getlockvalue") %>">ApiDrawing/GetLockValue</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apidrawing/getwidth") %>">ApiDrawing/GetWidth</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apidrawing/setlockvalue") %>">ApiDrawing/SetLockValue</a> method to Presentation API.</li>
    </ul>
    <br />

    <p><b>OLE object methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apioleobject") %>">ApiOleObject</a> class to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/api/createoleobject") %>">Api/CreateOleObject</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/getalloleobjects") %>">ApiDocument/GetAllOleObjects</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/getalloleobjects") %>">ApiDocumentContent/GetAllOleObjects</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apioleobject/getapplicationid") %>">ApiOleObject/GetApplicationId</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apioleobject/getclasstype") %>">ApiOleObject/GetClassType</a> method to Text document API.</li> 
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apioleobject/getdata") %>">ApiOleObject/GetData</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apioleobject/setapplicationid") %>">ApiOleObject/SetApplicationId</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apioleobject/setdata") %>">ApiOleObject/SetData</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiparagraph/getalloleobjects") %>">ApiParagraph/GetAllOleObjects</a> method to Text document API.</li>
    </ul>
    <p class="spoiler_heading spoiler_changelog">More</p>
    <ul class="spoiler_code">
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apioleobject") %>">ApiOleObject</a> class to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheet/addoleobject") %>">ApiWorksheet/AddOleObject</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheet/getalloleobjects") %>">ApiWorksheet/GetAllOleObjects</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apioleobject/getapplicationid") %>">ApiOleObject/GetApplicationId</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apioleobject/getclasstype") %>">ApiOleObject/GetClassType</a> method to Spreadsheet API.</li> 
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apioleobject/getdata") %>">ApiOleObject/GetData</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apioleobject/setapplicationid") %>">ApiOleObject/SetApplicationId</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apioleobject/setdata") %>">ApiOleObject/SetData</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apioleobject") %>">ApiOleObject</a> class to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/api/createoleobject") %>">Api/CreateOleObject</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/getalloleobjects") %>">ApiMaster/GetAllOleObjects</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/getalloleobjects") %>">ApiLayout/GetAllOleObjects</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/getalloleobjects") %>">ApiSlide/GetAllOleObjects</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apioleobject/getapplicationid") %>">ApiOleObject/GetApplicationId</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apioleobject/getclasstype") %>">ApiOleObject/GetClassType</a> method to Presentation API.</li> 
        <li>Added the <a href="<%= Url.Action("presentationapi/apioleobject/getdata") %>">ApiOleObject/GetData</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apioleobject/setapplicationid") %>">ApiOleObject/SetApplicationId</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apioleobject/setdata") %>">ApiOleObject/SetData</a> method to Presentation API.</li>
    </ul>
    <br />

    <p><b>Table methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitable/getposinparent") %>">ApiTable/GetPosInParent</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitable/gettabledescription") %>">ApiTable/GetTableDescription</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitable/gettabletitle") %>">ApiTable/GetTableTitle</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitable/replacebyelement") %>">ApiTable/ReplaceByElement</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitable/settabledescription") %>">ApiTable/SetTableDescription</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitable/settabletitle") %>">ApiTable/SetTableTitle</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitablepr/gettabledescription") %>">ApiTablePr/GetTableDescription</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitablepr/gettabletitle") %>">ApiTablePr/GetTableTitle</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitablepr/settabledescription") %>">ApiTablePr/SetTableDescription</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitablepr/settabletitle") %>">ApiTablePr/SetTableTitle</a> method to Text document API.</li>
    </ul>
    <br />

    <p><b>Run methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apirun/getfontnames") %>">ApiRun/GetFontNames</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apirun/setoutline") %>">ApiRun/SetOutLine</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apirun/settextfill") %>">ApiRun/SetTextFill</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirun/getfontnames") %>">ApiRun/GetFontNames</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirun/setoutline") %>">ApiRun/SetOutLine</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirun/settextfill") %>">ApiRun/SetTextFill</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apirun/getfontnames") %>">ApiRun/GetFontNames</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apirun/setoutline") %>">ApiRun/SetOutLine</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apirun/settextfill") %>">ApiRun/SetTextFill</a> method to Presentation API.</li>
    </ul>
    <br />

    <p><b>Methods for setting text properties</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextpr/setoutline") %>">ApiTextPr/SetOutLine</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextpr/settextfill") %>">ApiTextPr/SetTextFill</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apitextpr/setoutline") %>">ApiTextPr/SetOutLine</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apitextpr/settextfill") %>">ApiTextPr/SetTextFill</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitextpr/sethighlight") %>">ApiTextPr/SetHighlight</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitextpr/setoutline") %>">ApiTextPr/SetOutLine</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitextpr/settextfill") %>">ApiTextPr/SetTextFill</a> method to Presentation API.</li>
    </ul>
    <br />

    <p><b>Other methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/api/createtextpr") %>">Api/CreateTextPr</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiblocklvlsdt/getposinparent") %>">ApiBlockLvlSdt/GetPosInParent</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiblocklvlsdt/replacebyelement") %>">ApiBlockLvlSdt/ReplaceByElement</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/getcontent") %>">ApiDocument/GetContent</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/replacecurrentimage") %>">ApiDocument/ReplaceCurrentImage</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/getcontent") %>">ApiDocumentContent/GetContent</a> method to Text document API.</li>
    </ul>
    <p class="spoiler_heading spoiler_changelog">More</p>
    <ul class="spoiler_code">
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiparagraph/getfontnames") %>">ApiParagraph/GetFontNames</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiparagraph/getposinparent") %>">ApiParagraph/GetPosInParent</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiparagraph/replacebyelement") %>">ApiParagraph/ReplaceByElement</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/api/createtextpr") %>">Api/CreateTextPr</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheet/getallcharts") %>">ApiWorksheet/GetAllCharts</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheet/getalldrawings") %>">ApiWorksheet/GetAllDrawings</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheet/getallimages") %>">ApiWorksheet/GetAllImages</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheet/getallshapes") %>">ApiWorksheet/GetAllShapes</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/api/createtextpr") %>">Api/CreateTextPr</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apiparagraph/sethighlight") %>">ApiParagraph/SetHighlight</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apipresentation/getheight") %>">ApiPresentation/GetHeight</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apipresentation/getwidth") %>">ApiPresentation/GetWidth</a> method to Presentation API.</li>
    </ul>


    <h2 id="71" class="copy-link">Version 7.1</h2>
    <p><b>Form methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("formapi") %>">Form API</a>.</li>
        <li>Added the <a href="<%= Url.Action("formapi/api/createcheckboxform") %>">Api/CreateCheckBoxForm</a> method to Form API.</li>
        <li>Added the <a href="<%= Url.Action("formapi/api/createcomboboxform") %>">Api/CreateComboBoxForm</a> method to Form API.</li>
        <li>Added the <a href="<%= Url.Action("formapi/api/createpictureform") %>">Api/CreatePictureForm</a> method to Form API.</li>
        <li>Added the <a href="<%= Url.Action("formapi/api/createtextform") %>">Api/CreateTextForm</a> method to Form API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiblocklvlsdt/getplaceholdertext") %>">ApiBlockLvlSdt/GetPlaceholderText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiblocklvlsdt/setplaceholdertext") %>">ApiBlockLvlSdt/SetPlaceholderText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform") %>">ApiCheckBoxForm</a> class to Text document API.</li>
    </ul>
    <p class="spoiler_heading spoiler_changelog">More</p>
    <ul class="spoiler_code">
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/clear") %>">ApiCheckBoxForm/Clear</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/copy") %>">ApiCheckBoxForm/Copy</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/getclasstype") %>">ApiCheckBoxForm/GetClassType</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/getformkey") %>">ApiCheckBoxForm/GetFormKey</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/getformtype") %>">ApiCheckBoxForm/GetFormType</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/getradiogroup") %>">ApiCheckBoxForm/GetRadioGroup</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/gettext") %>">ApiCheckBoxForm/GetText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/gettextpr") %>">ApiCheckBoxForm/GetTextPr</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/gettiptext") %>">ApiCheckBoxForm/GetTipText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/getwrappershape") %>">ApiCheckBoxForm/GetWrapperShape</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/ischecked") %>">ApiCheckBoxForm/IsChecked</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/isfixed") %>">ApiCheckBoxForm/IsFixed</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/isradiobutton") %>">ApiCheckBoxForm/IsRadioButton</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/isrequired") %>">ApiCheckBoxForm/IsRequired</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/setbackgroundcolor") %>">ApiCheckBoxForm/SetBackgroundColor</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/setbordercolor") %>">ApiCheckBoxForm/SetBorderColor</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/setchecked") %>">ApiCheckBoxForm/SetChecked</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/setformkey") %>">ApiCheckBoxForm/SetFormKey</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/setplaceholdertext") %>">ApiCheckBoxForm/SetPlaceholderText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/setradiogroup") %>">ApiCheckBoxForm/SetRadioGroup</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/setrequired") %>">ApiCheckBoxForm/SetRequired</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/settextpr") %>">ApiCheckBoxForm/SetTextPr</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/settiptext") %>">ApiCheckBoxForm/SetTipText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/tofixed") %>">ApiCheckBoxForm/ToFixed</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicheckboxform/toinline") %>">ApiCheckBoxForm/ToInline</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform") %>">ApiComboBoxForm</a> class to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/clear") %>">ApiComboBoxForm/Clear</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/copy") %>">ApiComboBoxForm/Copy</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/getclasstype") %>">ApiComboBoxForm/GetClassType</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/getformkey") %>">ApiComboBoxForm/GetFormKey</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/getformtype") %>">ApiComboBoxForm/GetFormType</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/getlistvalues") %>">ApiComboBoxForm/GetListValues</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/gettext") %>">ApiComboBoxForm/GetText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/gettextpr") %>">ApiComboBoxForm/GetTextPr</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/gettiptext") %>">ApiComboBoxForm/GetTipText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/getwrappershape") %>">ApiComboBoxForm/GetWrapperShape</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/iseditable") %>">ApiComboBoxForm/IsEditable</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/isfixed") %>">ApiComboBoxForm/IsFixed</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/isrequired") %>">ApiComboBoxForm/IsRequired</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/selectlistvalue") %>">ApiComboBoxForm/SelectListValue</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/setbackgroundcolor") %>">ApiComboBoxForm/SetBackgroundColor</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/setbordercolor") %>">ApiComboBoxForm/SetBorderColor</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/setformkey") %>">ApiComboBoxForm/SetFormKey</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/setlistvalues") %>">ApiComboBoxForm/SetListValues</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/setplaceholdertext") %>">ApiComboBoxForm/SetPlaceholderText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/setrequired") %>">ApiComboBoxForm/SetRequired</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/settext") %>">ApiComboBoxForm/SetText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/settextpr") %>">ApiComboBoxForm/SetTextPr</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/settiptext") %>">ApiComboBoxForm/SetTipText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/tofixed") %>">ApiComboBoxForm/ToFixed</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomboboxform/toinline") %>">ApiComboBoxForm/ToInline</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/clearallfields") %>">ApiDocument/ClearAllFields</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/clearallforms") %>">ApiDocument/ClearAllForms</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/getallforms") %>">ApiDocument/GetAllForms</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/setformshighlight") %>">ApiDocument/SetFormsHighlight</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase") %>">ApiFormBase</a> class to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/clear") %>">ApiFormBase/Clear</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/copy") %>">ApiFormBase/Copy</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/getclasstype") %>">ApiFormBase/GetClassType</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/getformkey") %>">ApiFormBase/GetFormKey</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/getformtype") %>">ApiFormBase/GetFormType</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/gettext") %>">ApiFormBase/GetText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/gettextpr") %>">ApiFormBase/GetTextPr</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/gettiptext") %>">ApiFormBase/GetTipText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/getwrappershape") %>">ApiFormBase/GetWrapperShape</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/isfixed") %>">ApiFormBase/IsFixed</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/isrequired") %>">ApiFormBase/IsRequired</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/setbackgroundcolor") %>">ApiFormBase/SetBackgroundColor</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/setbordercolor") %>">ApiFormBase/SetBorderColor</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/setformkey") %>">ApiFormBase/SetFormKey</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/setplaceholdertext") %>">ApiFormBase/SetPlaceholderText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/setrequired") %>">ApiFormBase/SetRequired</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/settextpr") %>">ApiFormBase/SetTextPr</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/settiptext") %>">ApiFormBase/SetTipText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/tofixed") %>">ApiFormBase/ToFixed</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/toinline") %>">ApiFormBase/ToInline</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiinlinelvlsdt/getplaceholdertext") %>">ApiInlineLvlSdt/GetPlaceholderText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiinlinelvlsdt/isform") %>">ApiInlineLvlSdt/IsForm</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiinlinelvlsdt/setplaceholdertext") %>">ApiInlineLvlSdt/SetPlaceholderText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform") %>">ApiPictureForm</a> class to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/clear") %>">ApiPictureForm/Clear</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/copy") %>">ApiPictureForm/Copy</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/getclasstype") %>">ApiPictureForm/GetClassType</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/getformkey") %>">ApiPictureForm/GetFormKey</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/getformtype") %>">ApiPictureForm/GetFormType</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/getimage") %>">ApiPictureForm/GetImage</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/getpictureposition") %>">ApiPictureForm/GetPicturePosition</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/getscaleflag") %>">ApiPictureForm/GetScaleFlag</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/gettext") %>">ApiPictureForm/GetText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/gettextpr") %>">ApiPictureForm/GetTextPr</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/gettiptext") %>">ApiPictureForm/GetTipText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/getwrappershape") %>">ApiPictureForm/GetWrapperShape</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/isfixed") %>">ApiPictureForm/IsFixed</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/islockaspectratio") %>">ApiPictureForm/IsLockAspectRatio</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/isrequired") %>">ApiPictureForm/IsRequired</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/isrespectborders") %>">ApiPictureForm/IsRespectBorders</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/setbackgroundcolor") %>">ApiPictureForm/SetBackgroundColor</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/setbordercolor") %>">ApiPictureForm/SetBorderColor</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/setformkey") %>">ApiPictureForm/SetFormKey</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/setimage") %>">ApiPictureForm/SetImage</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/setlockaspectratio") %>">ApiPictureForm/SetLockAspectRatio</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/setpictureposition") %>">ApiPictureForm/SetPicturePosition</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/setplaceholdertext") %>">ApiPictureForm/SetPlaceholderText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/setrequired") %>">ApiPictureForm/SetRequired</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/setrespectborders") %>">ApiPictureForm/SetRespectBorders</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/setscaleflag") %>">ApiPictureForm/SetScaleFlag</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/settextpr") %>">ApiPictureForm/SetTextPr</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/settiptext") %>">ApiPictureForm/SetTipText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/tofixed") %>">ApiPictureForm/ToFixed</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apipictureform/toinline") %>">ApiPictureForm/ToInline</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform") %>">ApiTextForm</a> class to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/clear") %>">ApiTextForm/Clear</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/copy") %>">ApiTextForm/Copy</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/getcharacterslimit") %>">ApiTextForm/GetCharactersLimit</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/getclasstype") %>">ApiTextForm/GetClassType</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/getformkey") %>">ApiTextForm/GetFormKey</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/getformtype") %>">ApiTextForm/GetFormType</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/gettext") %>">ApiTextForm/GetText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/gettextpr") %>">ApiTextForm/GetTextPr</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/gettiptext") %>">ApiTextForm/GetTipText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/getwrappershape") %>">ApiTextForm/GetWrapperShape</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/isautofit") %>">ApiTextForm/IsAutoFit</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/iscomb") %>">ApiTextForm/IsComb</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/isfixed") %>">ApiTextForm/IsFixed</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/ismultiline") %>">ApiTextForm/IsMultiline</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/isrequired") %>">ApiTextForm/IsRequired</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/setautofit") %>">ApiTextForm/SetAutoFit</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/setbackgroundcolor") %>">ApiTextForm/SetBackgroundColor</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/setbordercolor") %>">ApiTextForm/SetBorderColor</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/setcellwidth") %>">ApiTextForm/SetCellWidth</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/setcharacterslimit") %>">ApiTextForm/SetCharactersLimit</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/setcomb") %>">ApiTextForm/SetComb</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/setformkey") %>">ApiTextForm/SetFormKey</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/setmultiline") %>">ApiTextForm/SetMultiline</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/setplaceholdertext") %>">ApiTextForm/SetPlaceholderText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/setrequired") %>">ApiTextForm/SetRequired</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/settext") %>">ApiTextForm/SetText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/settextpr") %>">ApiTextForm/SetTextPr</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/settiptext") %>">ApiTextForm/SetTipText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/tofixed") %>">ApiTextForm/ToFixed</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextform/toinline") %>">ApiTextForm/ToInline</a> method to Text document API.</li>
    </ul>
    <br />

    <p><b>Cross-reference methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/getallbookmarksnames") %>">ApiDocument/GetAllBookmarksNames</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/getallcaptionparagraphs") %>">ApiDocument/GetAllCaptionParagraphs</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/getallheadingparagraphs") %>">ApiDocument/GetAllHeadingParagraphs</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/getallnumberedparagraphs") %>">ApiDocument/GetAllNumberedParagraphs</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/getendnotesfirstparagraphs") %>">ApiDocument/GetEndNotesFirstParagraphs</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/getfootnotesfirstparagraphs") %>">ApiDocument/GetFootnotesFirstParagraphs</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiparagraph/addbookmarkcrossref") %>">ApiParagraph/AddBookmarkCrossRef</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiparagraph/addcaptioncrossref") %>">ApiParagraph/AddCaptionCrossRef</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiparagraph/addendnotecrossref") %>">ApiParagraph/AddEndnoteCrossRef</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiparagraph/addfootnotecrossref") %>">ApiParagraph/AddFootnoteCrossRef</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiparagraph/addheadingcrossref") %>">ApiParagraph/AddHeadingCrossRef</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiparagraph/addnumberedcrossref") %>">ApiParagraph/AddNumberedCrossRef</a> method to Text document API.</li>
    </ul>
    <br />

    <p><b>Review methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/acceptallrevisionchanges") %>">ApiDocument/AcceptAllRevisionChanges</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/rejectallrevisionchanges") %>">ApiDocument/RejectAllRevisionChanges</a> method to Text document API.</li>
    </ul>
    <br />

    <p><b>Table background methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitable/setbackgroundcolor") %>">ApiTable/SetBackgroundColor</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitablecell/setbackgroundcolor") %>">ApiTableCell/SetBackgroundColor</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitablecell/setcolumnbackgroundcolor") %>">ApiTableCell/SetColumnBackgroundColor</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitablerow/setbackgroundcolor") %>">ApiTableRow/SetBackgroundColor</a> method to Text document API.</li>
    </ul>
    <br />

    <p><b>Areas methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiareas") %>">ApiAreas</a> class to Spreadsheet API.</li>
        <li>Added the <em>Areas</em> property to the <a href="<%= Url.Action("spreadsheetapi/apirange") %>">ApiRange</a> object of Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiareas/getcount") %>">ApiAreas/GetCount</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiareas/getitem") %>">ApiAreas/GetItem</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiareas/getparent") %>">ApiAreas/GetParent</a> method to Spreadsheet API.</li>
    </ul>
    <br />

    <p><b>Range methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/autofit") %>">ApiRange/AutoFit</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/copy") %>">ApiRange/Copy</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/delete") %>">ApiRange/Delete</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/getareas") %>">ApiRange/GetAreas</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/insert") %>">ApiRange/Insert</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/paste") %>">ApiRange/Paste</a> method to Spreadsheet API.</li>
        <li>Changed the <em>data</em> parameter type of the <a href="<%= Url.Action("spreadsheetapi/apirange/setvalue") %>">ApiRange/SetValue</a> method of Spreadsheet API.</li>
    </ul>
    <br />

    <p><b>Layout methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("presentationapi/api/createlayout") %>">Api/CreateLayout</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout") %>">ApiLayout</a> class to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/addobject") %>">ApiLayout/AddObject</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/clearbackground") %>">ApiLayout/ClearBackground</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/copy") %>">ApiLayout/Copy</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/delete") %>">ApiLayout/Delete</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/duplicate") %>">ApiLayout/Duplicate</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/followmasterbackground") %>">ApiLayout/FollowMasterBackground</a> method to Presentation API.</li>
    </ul>
    <p class="spoiler_heading spoiler_changelog">More</p>
    <ul class="spoiler_code">
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/getallcharts") %>">ApiLayout/GetAllCharts</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/getalldrawings") %>">ApiLayout/GetAllDrawings</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/getallimages") %>">ApiLayout/GetAllImages</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/getallshapes") %>">ApiLayout/GetAllShapes</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/getclasstype") %>">ApiLayout/GetClassType</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/getmaster") %>">ApiLayout/GetMaster</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/moveto") %>">ApiLayout/MoveTo</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/removeobject") %>">ApiLayout/RemoveObject</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/setbackground") %>">ApiLayout/SetBackground</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apilayout/setname") %>">ApiLayout/SetName</a> method to Presentation API.</li>
    </ul>
    <br />

    <p><b>Master methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("presentationapi/api/createmaster") %>">Api/CreateMaster</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster") %>">ApiMaster</a> class to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/addlayout") %>">ApiMaster/AddLayout</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/addobject") %>">ApiMaster/AddObject</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/clearbackground") %>">ApiMaster/ClearBackground</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/copy") %>">ApiMaster/Copy</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/delete") %>">ApiMaster/Delete</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/duplicate") %>">ApiMaster/Duplicate</a> method to Presentation API.</li>
    </ul>
    <p class="spoiler_heading spoiler_changelog">More</p>
    <ul class="spoiler_code">
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/getallcharts") %>">ApiMaster/GetAllCharts</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/getalldrawings") %>">ApiMaster/GetAllDrawings</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/getallimages") %>">ApiMaster/GetAllImages</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/getallshapes") %>">ApiMaster/GetAllShapes</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/getclasstype") %>">ApiMaster/GetClassType</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/getlayout") %>">ApiMaster/GetLayout</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/getlayoutscount") %>">ApiMaster/GetLayoutsCount</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/gettheme") %>">ApiMaster/GetTheme</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/removelayout") %>">ApiMaster/RemoveLayout</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/removeobject") %>">ApiMaster/RemoveObject</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/setbackground") %>">ApiMaster/SetBackground</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apimaster/settheme") %>">ApiMaster/SetTheme</a> method to Presentation API.</li>
    </ul>
    <br />

    <p><b>Placeholder methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("presentationapi/api/createplaceholder") %>">Api/CreatePlaceholder</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apiplaceholder") %>">ApiPlaceholder</a> class to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apiplaceholder/getclasstype") %>">ApiPlaceholder/GetClassType</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apiplaceholder/settype") %>">ApiPlaceholder/SetType</a> method to Presentation API.</li>
    </ul>
    <br />

    <p><b>Theme methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("presentationapi/api/createtheme") %>">Api/CreateTheme</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/api/createthemecolorscheme") %>">Api/CreateThemeColorScheme</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/api/createthemefontscheme") %>">Api/CreateThemeFontScheme</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/api/createthemeformatscheme") %>">Api/CreateThemeFormatScheme</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitheme") %>">ApiTheme</a> class to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitheme/getclasstype") %>">ApiTheme/GetClassType</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitheme/getcolorscheme") %>">ApiTheme/GetColorScheme</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitheme/getfontscheme") %>">ApiTheme/GetFontScheme</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitheme/getformatscheme") %>">ApiTheme/GetFormatScheme</a> method to Presentation API.</li>
    </ul>
    <p class="spoiler_heading spoiler_changelog">More</p>
    <ul class="spoiler_code">
        <li>Added the <a href="<%= Url.Action("presentationapi/apitheme/getmaster") %>">ApiTheme/GetMaster</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitheme/setcolorscheme") %>">ApiTheme/SetColorScheme</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitheme/setfontscheme") %>">ApiTheme/SetFontScheme</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitheme/setformatscheme") %>">ApiTheme/SetFormatScheme</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemecolorscheme") %>">ApiThemeColorScheme</a> class to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemecolorscheme/changecolor") %>">ApiThemeColorScheme/ChangeColor</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemecolorscheme/copy") %>">ApiThemeColorScheme/Copy</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemecolorscheme/getclasstype") %>">ApiThemeColorScheme/GetClassType</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemecolorscheme/setschemename") %>">ApiThemeColorScheme/SetSchemeName</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemefontscheme") %>">ApiThemeFontScheme</a> class to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemefontscheme/copy") %>">ApiThemeFontScheme/Copy</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemefontscheme/getclasstype") %>">ApiThemeFontScheme/GetClassType</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemefontscheme/setfonts") %>">ApiThemeFontScheme/SetFonts</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemefontscheme/setschemename") %>">ApiThemeFontScheme/SetSchemeName</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemeformatscheme") %>">ApiThemeFormatScheme</a> class to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemeformatscheme/copy") %>">ApiThemeFormatScheme/Copy</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemeformatscheme/changebgfillstyles") %>">ApiThemeFormatScheme/ChangeBgFillStyles</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemeformatscheme/changeeffectstyles") %>">ApiThemeFormatScheme/ChangeEffectStyles</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemeformatscheme/changefillstyles") %>">ApiThemeFormatScheme/ChangeFillStyles</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemeformatscheme/changelinestyles") %>">ApiThemeFormatScheme/ChangeLineStyles</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemeformatscheme/getclasstype") %>">ApiThemeFormatScheme/GetClassType</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apithemeformatscheme/setschemename") %>">ApiThemeFormatScheme/SetSchemeName</a> method to Presentation API.</li>
    </ul>
    <br />

    <p><b>Drawing methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("presentationapi/apidrawing/copy") %>">ApiDrawing/Copy</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apidrawing/delete") %>">ApiDrawing/Delete</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apidrawing/getparent") %>">ApiDrawing/GetParent</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apidrawing/getparentlayout") %>">ApiDrawing/GetParentLayout</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apidrawing/getparentmaster") %>">ApiDrawing/GetParentMaster</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apidrawing/getparentslide") %>">ApiDrawing/GetParentSlide</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apidrawing/getplaceholder") %>">ApiDrawing/GetPlaceholder</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apidrawing/setplaceholder") %>">ApiDrawing/SetPlaceholder</a> method to Presentation API.</li>
    </ul>
    <br />

    <p><b>Slide methods</b></p>
    <ul>
        <li>Changed the return value for the <a href="<%= Url.Action("presentationapi/apislide/addobject") %>">ApiSlide/AddObject</a> method of Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/applylayout") %>">ApiSlide/ApplyLayout</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/applytheme") %>">ApiSlide/ApplyTheme</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/clearbackground") %>">ApiSlide/ClearBackground</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/copy") %>">ApiSlide/Copy</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/delete") %>">ApiSlide/Delete</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/duplicate") %>">ApiSlide/Duplicate</a> method to Presentation API.</li>
    </ul>
    <p class="spoiler_heading spoiler_changelog">More</p>
    <ul class="spoiler_code">
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/followlayoutbackground") %>">ApiSlide/FollowLayoutBackground</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/followmasterbackground") %>">ApiSlide/FollowMasterBackground</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/getallcharts") %>">ApiSlide/GetAllCharts</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/getalldrawings") %>">ApiSlide/GetAllDrawings</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/getallimages") %>">ApiSlide/GetAllImages</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/getallshapes") %>">ApiSlide/GetAllShapes</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/getlayout") %>">ApiSlide/GetLayout</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/getslideindex") %>">ApiSlide/GetSlideIndex</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/gettheme") %>">ApiSlide/GetTheme</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/moveto") %>">ApiSlide/MoveTo</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/removeobject") %>">ApiSlide/RemoveObject</a> method to Presentation API.</li>
    </ul>
    <br />

    <p><b>Presentation methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("presentationapi/apipresentation/addmaster") %>">ApiPresentation/AddMaster</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apipresentation/applytheme") %>">ApiPresentation/ApplyTheme</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apipresentation/getmaster") %>">ApiPresentation/GetMaster</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apipresentation/getmasterscount") %>">ApiPresentation/GetMastersCount</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apipresentation/getslidescount") %>">ApiPresentation/GetSlidesCount</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apipresentation/removeslides") %>">ApiPresentation/RemoveSlides</a> method to Presentation API.</li>
    </ul>
    <br />

    <p><b>Other methods</b></p>
    <ul>
        <li>Added the <em>sParaTab</em> and <em>sParaNewLine</em> parameters to the <a href="<%= Url.Action("textdocumentapi/api/replacetextsmart") %>">Api/ReplaceTextSmart</a> method of Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiinlinelvlsdt/getparentparagraph") %>">ApiInlineLvlSdt/GetParentParagraph</a> method to Text document API.</li>
        <li>Removed the <em>ApiShape/GetDocContent</em> method from Spreadsheet API.</li>
    </ul>

    <h2 id="70" class="copy-link">Version 7.0</h2>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apirun/getprevious") %>">ApiRun/GetPrevious</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apirun/getnext") %>">ApiRun/GetNext</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/api/convertdocument") %>">Api/ConvertDocument</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/tohtml") %>">ApiDocument/ToHtml</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/tomarkdown") %>">ApiDocument/ToMarkdown</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("global") %>#SortOrientation">SortOrientation</a> global type.</li>
        <li>Added the <a href="<%= Url.Action("global") %>#SortHeader">SortHeader</a> global type.</li>
        <li>Added the <a href="<%= Url.Action("global") %>#SortOrder">SortOrder</a> global type.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/setsort") %>">ApiRange/SetSort</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/api/recalculateallformulas") %>">Api/RecalculateAllFormulas</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apipresentation/setlanguage") %>">ApiPresentation/SetLanguage</a> method to Presentation API.</li>
    </ul>
    <br />

    <h2 id="64" class="copy-link">Version 6.4</h2>
    <ul>
        <li>Changed the return value of the <a href="<%= Url.Action("textdocumentapi/api/createrange") %>">Api/CreateRange</a> method of Text document API.</li>
        <li>Removed the <em>Api/GetFirstRunInArray</em> method from Text document API.</li>
        <li>Removed the <em>Api/GetLastRunInArray</em> method from Text document API.</li>
        <li>Added parameters to the <a href="<%= Url.Action("textdocumentapi/apichart/setlegendfontsize") %>">ApiChart/SetLegendFontSize</a> method of Text document API.</li>
        <li>Added parameters to the <a href="<%= Url.Action("textdocumentapi/apidocument/getelement") %>">ApiDocument/GetElement</a> method of Text document API.</li>
        <li>Added the return value to the <a href="<%= Url.Action("textdocumentapi/apidocument/push") %>">ApiDocument/Push</a> method of Text document API.</li>
        <li>Added parameters to the <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/getelement") %>">ApiDocumentContent/GetElement</a> method of Text document API.</li>
        <li>Added the return value to the <a href="<%= Url.Action("textdocumentapi/apidocumentcontent/push") %>">ApiDocumentContent/Push</a> method of Text document API.</li>
        <li>Removed parameters from the <a href="<%= Url.Action("textdocumentapi/apirange/select") %>">ApiRange/Select</a> method of Text document API.</li>
        <li>Added the <em>oCell</em> parameter to the <a href="<%= Url.Action("textdocumentapi/apitable/addelement") %>">ApiTable/AddElement</a> method of Text document API.</li>
        <li>Added parameters to the <a href="<%= Url.Action("spreadsheetapi/api/getrange") %>">Api/GetRange</a> method of Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apicomment/getclasstype") %>">ApiComment/GetClassType</a> method to Spreadsheet API.</li>
        <li>Removed the <em>ApiDocument/Last</em> method from Spreadsheet and Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/getcols") %>">ApiRange/GetCols</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/end") %>">ApiRange/End</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/getcells") %>">ApiRange/GetCells</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/getorientation") %>">ApiRange/GetOrientation</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/setorientation") %>">ApiRange/SetOrientation</a> method to Spreadsheet API.</li>
        <li>Added the <em>Cols</em> and <em>Orientation</em> properties to the <a href="<%= Url.Action("spreadsheetapi/apirange") %>">ApiRange</a> object of Spreadsheet API.</li>
        <li>Added parameters to the <a href="<%= Url.Action("spreadsheetapi/apiworksheet/getcells") %>">ApiWorksheet/GetCells</a> method of Spreadsheet API.</li>
        <li>Added parameters to the <a href="<%= Url.Action("presentationapi/api/creategroup") %>">Api/CreateGroup</a> method of Presentation API.</li>
        <li>Added parameters to the <a href="<%= Url.Action("presentationapi/apichart/setlegendfontsize") %>">ApiChart/SetLegendFontSize</a> method of Presentation API.</li>
        <li>Added parameters to the <a href="<%= Url.Action("presentationapi/apipresentation/replacecurrentimage") %>">ApiPresentation/ReplaceCurrentImage</a> method of Presentation API.</li>
    </ul>

</asp:Content>