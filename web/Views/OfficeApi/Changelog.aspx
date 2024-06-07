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

    <p class="dscr">The list of changes for Office JavaScript API.</p>
    <h2 id="81" class="copy-link">Version 8.1</h2>
    <p><b>Date form methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidateform") %>">ApiDateForm</a> class to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("formapi/api/createdateform") %>">Api/CreateDateForm</a> method to Form API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidateform/clear") %>">ApiDateForm/Clear</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidateform/copy") %>">ApiDateForm/Copy</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidateform/getclasstype") %>">ApiDateForm/GetClassType</a> method to Text document API.</li>
    </ul>
    <p class="spoiler_heading spoiler_changelog">More</p>
    <ul class="spoiler_code">
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidateform/getformat") %>">ApiDateForm/GetFormat</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidateform/getformkey") %>">ApiDateForm/GetFormKey</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidateform/getformtype") %>">ApiDateForm/GetFormType</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidateform/getlanguage") %>">ApiDateForm/GetLanguage</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidateform/gettext") %>">ApiDateForm/GetText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidateform/gettextpr") %>">ApiDateForm/GetTextPr</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidateform/gettime") %>">ApiDateForm/GetTime</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidateform/gettiptext") %>">ApiDateForm/GetTipText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidateform/getwrappershape") %>">ApiDateForm/GetWrapperShape</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidateform/isfixed") %>">ApiDateForm/IsFixed</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidateform/isrequired") %>">ApiDateForm/IsRequired</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidateform/setbackgroundcolor") %>">ApiDateForm/SetBackgroundColor</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidateform/setbordercolor") %>">ApiDateForm/SetBorderColor</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidateform/setformat") %>">ApiDateForm/SetFormat</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidateform/setformkey") %>">ApiDateForm/SetFormKey</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidateform/setlanguage") %>">ApiDateForm/SetLanguage</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidateform/setplaceholdertext") %>">ApiDateForm/SetPlaceholderText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidateform/setrequired") %>">ApiDateForm/SetRequired</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidateform/settextpr") %>">ApiDateForm/SetTextPr</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidateform/settime") %>">ApiDateForm/SetTime</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidateform/settiptext") %>">ApiDateForm/SetTipText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidateform/tofixed") %>">ApiDateForm/ToFixed</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("global") %>#DateFormPr">DateFormPr</a> type to the simple type definitions.</li>
        <li>Added the <a href="<%= Url.Action("global") %>#DateFormPrBase">DateFormPrBase</a> type to the simple type definitions.</li>
    </ul>
    <br />

    <p><b>Methods for setting text properties</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextpr/getbold") %>">ApiTextPr/GetBold</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextpr/getcaps") %>">ApiTextPr/GetCaps</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextpr/getcolor") %>">ApiTextPr/GetColor</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextpr/getdoublestrikeout") %>">ApiTextPr/GetDoubleStrikeout</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextpr/getfontfamily") %>">ApiTextPr/GetFontFamily</a> method to Text document API.</li>
    </ul>
    <p class="spoiler_heading spoiler_changelog">More</p>
    <ul class="spoiler_code">
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextpr/getfontsize") %>">ApiTextPr/GetFontSize</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextpr/gethighlight") %>">ApiTextPr/GetHighlight</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextpr/getitalic") %>">ApiTextPr/GetItalic</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextpr/getlanguage") %>">ApiTextPr/GetLanguage</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextpr/getposition") %>">ApiTextPr/GetPosition</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextpr/getshd") %>">ApiTextPr/GetShd</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextpr/getsmallcaps") %>">ApiTextPr/GetSmallCaps</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextpr/getspacing") %>">ApiTextPr/GetSpacing</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextpr/getstrikeout") %>">ApiTextPr/GetStrikeout</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextpr/getstyle") %>">ApiTextPr/GetStyle</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextpr/getunderline") %>">ApiTextPr/GetUnderline</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apitextpr/getvertalign") %>">ApiTextPr/GetVertAlign</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apitextpr/getbold") %>">ApiTextPr/GetBold</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apitextpr/getcaps") %>">ApiTextPr/GetCaps</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apitextpr/getdoublestrikeout") %>">ApiTextPr/GetDoubleStrikeout</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apitextpr/getfill") %>">ApiTextPr/GetFill</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apitextpr/getfontfamily") %>">ApiTextPr/GetFontFamily</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apitextpr/getfontsize") %>">ApiTextPr/GetFontSize</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apitextpr/getitalic") %>">ApiTextPr/GetItalic</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apitextpr/getoutline") %>">ApiTextPr/GetOutLine</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apitextpr/getsmallcaps") %>">ApiTextPr/GetSmallCaps</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apitextpr/getspacing") %>">ApiTextPr/GetSpacing</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apitextpr/getstrikeout") %>">ApiTextPr/GetStrikeout</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apitextpr/gettextfill") %>">ApiTextPr/GetTextFill</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apitextpr/getunderline") %>">ApiTextPr/GetUnderline</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitextpr/getbold") %>">ApiTextPr/GetBold</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitextpr/getcaps") %>">ApiTextPr/GetCaps</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitextpr/getdoublestrikeout") %>">ApiTextPr/GetDoubleStrikeout</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitextpr/getfill") %>">ApiTextPr/GetFill</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitextpr/getfontfamily") %>">ApiTextPr/GetFontFamily</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitextpr/getfontsize") %>">ApiTextPr/GetFontSize</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitextpr/gethighlight") %>">ApiTextPr/GetHighlight</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitextpr/getitalic") %>">ApiTextPr/GetItalic</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitextpr/getoutline") %>">ApiTextPr/GetOutLine</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitextpr/getsmallcaps") %>">ApiTextPr/GetSmallCaps</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitextpr/getspacing") %>">ApiTextPr/GetSpacing</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitextpr/getstrikeout") %>">ApiTextPr/GetStrikeout</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitextpr/gettextfill") %>">ApiTextPr/GetTextFill</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apitextpr/getunderline") %>">ApiTextPr/GetUnderline</a> method to Presentation API.</li>
    </ul>
    <br />

    <p><b>Worksheet function methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction") %>">ApiWorksheetFunction</a> class to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/api/GetWorksheetFunction") %>">Api/GetWorksheetFunction</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/abs") %>">ApiWorksheetFunction/ABS</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/accrint") %>">ApiWorksheetFunction/ACCRINT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/accrintm") %>">ApiWorksheetFunction/ACCRINTM</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/acos") %>">ApiWorksheetFunction/ACOS</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/acosh") %>">ApiWorksheetFunction/ACOSH</a> method to Spreadsheet API.</li>
    </ul>
    <p class="spoiler_heading spoiler_changelog">More</p>
    <ul class="spoiler_code">
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/acot") %>">ApiWorksheetFunction/ACOT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/acoth") %>">ApiWorksheetFunction/ACOTH</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/aggregate") %>">ApiWorksheetFunction/AGGREGATE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/amordegrc") %>">ApiWorksheetFunction/AMORDEGRC</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/amorlinc") %>">ApiWorksheetFunction/AMORLINC</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/and") %>">ApiWorksheetFunction/AND</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/arabic") %>">ApiWorksheetFunction/ARABIC</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/asc") %>">ApiWorksheetFunction/ASC</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/asin") %>">ApiWorksheetFunction/ASIN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/asinh") %>">ApiWorksheetFunction/ASINH</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/atan") %>">ApiWorksheetFunction/ATAN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/atan2") %>">ApiWorksheetFunction/ATAN2</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/atanh") %>">ApiWorksheetFunction/ATANH</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/avedev") %>">ApiWorksheetFunction/AVEDEV</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/average") %>">ApiWorksheetFunction/AVERAGE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/averagea") %>">ApiWorksheetFunction/AVERAGEA</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/averageif") %>">ApiWorksheetFunction/AVERAGEIF</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/averageifs") %>">ApiWorksheetFunction/AVERAGEIFS</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/base") %>">ApiWorksheetFunction/BASE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/besseli") %>">ApiWorksheetFunction/BESSELI</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/besselj") %>">ApiWorksheetFunction/BESSELJ</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/besselk") %>">ApiWorksheetFunction/BESSELK</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/bessely") %>">ApiWorksheetFunction/BESSELY</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/beta_dist") %>">ApiWorksheetFunction/BETA_DIST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/beta_inv") %>">ApiWorksheetFunction/BETA_INV</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/betadist") %>">ApiWorksheetFunction/BETADIST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/betainv") %>">ApiWorksheetFunction/BETAINV</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/bin2dec") %>">ApiWorksheetFunction/BIN2DEC</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/bin2hex") %>">ApiWorksheetFunction/BIN2HEX</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/bin2oct") %>">ApiWorksheetFunction/BIN2OCT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/binom_dist") %>">ApiWorksheetFunction/BINOM_DIST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/binom_dist_range") %>">ApiWorksheetFunction/BINOM_DIST_RANGE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/binom_inv") %>">ApiWorksheetFunction/BINOM_INV</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/binomdist") %>">ApiWorksheetFunction/BINOMDIST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/bitand") %>">ApiWorksheetFunction/BITAND</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/bitlshift") %>">ApiWorksheetFunction/BITLSHIFT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/bitor") %>">ApiWorksheetFunction/BITOR</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/bitrshift") %>">ApiWorksheetFunction/BITRSHIFT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/bitxor") %>">ApiWorksheetFunction/BITXOR</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/ceiling") %>">ApiWorksheetFunction/CEILING</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/ceiling_math") %>">ApiWorksheetFunction/CEILING_MATH</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/ceiling_precise") %>">ApiWorksheetFunction/CEILING_PRECISE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/char") %>">ApiWorksheetFunction/CHAR</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/chisq_dist") %>">ApiWorksheetFunction/CHISQ_DIST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/chisq_dist_rt") %>">ApiWorksheetFunction/CHISQ_DIST_RT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/chisq_inv") %>">ApiWorksheetFunction/CHISQ_INV</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/chisq_inv_rt") %>">ApiWorksheetFunction/CHISQ_INV_RT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/chidist") %>">ApiWorksheetFunction/CHIDIST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/chiinv") %>">ApiWorksheetFunction/CHIINV</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/choose") %>">ApiWorksheetFunction/CHOOSE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/clean") %>">ApiWorksheetFunction/CLEAN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/code") %>">ApiWorksheetFunction/CODE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/columns") %>">ApiWorksheetFunction/COLUMNS</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/combin") %>">ApiWorksheetFunction/COMBIN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/combina") %>">ApiWorksheetFunction/COMBINA</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/complex") %>">ApiWorksheetFunction/COMPLEX</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/concatenate") %>">ApiWorksheetFunction/CONCATENATE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/confidence") %>">ApiWorksheetFunction/CONFIDENCE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/confidence_norm") %>">ApiWorksheetFunction/CONFIDENCE_NORM</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/confidence_t") %>">ApiWorksheetFunction/CONFIDENCE_T</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/convert") %>">ApiWorksheetFunction/CONVERT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/cos") %>">ApiWorksheetFunction/COS</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/cosh") %>">ApiWorksheetFunction/COSH</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/cot") %>">ApiWorksheetFunction/COT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/coth") %>">ApiWorksheetFunction/COTH</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/count") %>">ApiWorksheetFunction/COUNT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/counta") %>">ApiWorksheetFunction/COUNTA</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/countblank") %>">ApiWorksheetFunction/COUNTBLANK</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/countif") %>">ApiWorksheetFunction/COUNTIF</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/countifs") %>">ApiWorksheetFunction/COUNTIFS</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/coupdaybs") %>">ApiWorksheetFunction/COUPDAYBS</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/coupdays") %>">ApiWorksheetFunction/COUPDAYS</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/coupdaysnc") %>">ApiWorksheetFunction/COUPDAYSNC</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/coupncd") %>">ApiWorksheetFunction/COUPNCD</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/coupnum") %>">ApiWorksheetFunction/COUPNUM</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/couppcd") %>">ApiWorksheetFunction/COUPPCD</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/critbinom") %>">ApiWorksheetFunction/CRITBINOM</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/csc") %>">ApiWorksheetFunction/CSC</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/csch") %>">ApiWorksheetFunction/CSCH</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/cumipmt") %>">ApiWorksheetFunction/CUMIPMT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/cumprinc") %>">ApiWorksheetFunction/CUMPRINC</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/date") %>">ApiWorksheetFunction/DATE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/datevalue") %>">ApiWorksheetFunction/DATEVALUE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/daverage") %>">ApiWorksheetFunction/DAVERAGE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/day") %>">ApiWorksheetFunction/DAY</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/days") %>">ApiWorksheetFunction/DAYS</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/days360") %>">ApiWorksheetFunction/DAYS360</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/db") %>">ApiWorksheetFunction/DB</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/dcount") %>">ApiWorksheetFunction/DCOUNT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/dcounta") %>">ApiWorksheetFunction/DCOUNTA</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/ddb") %>">ApiWorksheetFunction/DDB</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/dec2bin") %>">ApiWorksheetFunction/DEC2BIN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/dec2hex") %>">ApiWorksheetFunction/DEC2HEX</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/dec2oct") %>">ApiWorksheetFunction/DEC2OCT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/decimal") %>">ApiWorksheetFunction/DECIMAL</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/degrees") %>">ApiWorksheetFunction/DEGREES</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/delta") %>">ApiWorksheetFunction/DELTA</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/devsq") %>">ApiWorksheetFunction/DEVSQ</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/dget") %>">ApiWorksheetFunction/DGET</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/disc") %>">ApiWorksheetFunction/DISC</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/dmax") %>">ApiWorksheetFunction/DMAX</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/dmin") %>">ApiWorksheetFunction/DMIN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/dollar") %>">ApiWorksheetFunction/DOLLAR</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/dollarde") %>">ApiWorksheetFunction/DOLLARDE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/dollarfr") %>">ApiWorksheetFunction/DOLLARFR</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/dproduct") %>">ApiWorksheetFunction/DPRODUCT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/dstdev") %>">ApiWorksheetFunction/DSTDEV</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/dstdevp") %>">ApiWorksheetFunction/DSTDEVP</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/dsum") %>">ApiWorksheetFunction/DSUM</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/duration") %>">ApiWorksheetFunction/DURATION</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/dvar") %>">ApiWorksheetFunction/DVAR</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/dvarp") %>">ApiWorksheetFunction/DVARP</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/ecma_ceiling") %>">ApiWorksheetFunction/ECMA_CEILING</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/edate") %>">ApiWorksheetFunction/EDATE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/effect") %>">ApiWorksheetFunction/EFFECT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/eomonth") %>">ApiWorksheetFunction/EOMONTH</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/erf") %>">ApiWorksheetFunction/ERF</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/erf_precise") %>">ApiWorksheetFunction/ERF_PRECISE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/erfc") %>">ApiWorksheetFunction/ERFC</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/erfc_precise") %>">ApiWorksheetFunction/ERFC_PRECISE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/error_type") %>">ApiWorksheetFunction/ERROR_TYPE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/even") %>">ApiWorksheetFunction/EVEN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/exact") %>">ApiWorksheetFunction/EXACT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/exp") %>">ApiWorksheetFunction/EXP</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/expon_dist") %>">ApiWorksheetFunction/EXPON_DIST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/expondist") %>">ApiWorksheetFunction/EXPONDIST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/f_dist") %>">ApiWorksheetFunction/F_DIST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/f_dist_rt") %>">ApiWorksheetFunction/F_DIST_RT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/f_inv") %>">ApiWorksheetFunction/F_INV</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/f_inv_rt") %>">ApiWorksheetFunction/F_INV_RT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/fact") %>">ApiWorksheetFunction/FACT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/factdouble") %>">ApiWorksheetFunction/FACTDOUBLE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/false") %>">ApiWorksheetFunction/FALSE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/fdist") %>">ApiWorksheetFunction/FDIST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/find") %>">ApiWorksheetFunction/FIND</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/findb") %>">ApiWorksheetFunction/FINDB</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/finv") %>">ApiWorksheetFunction/FINV</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/fisher") %>">ApiWorksheetFunction/FISHER</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/fisherinv") %>">ApiWorksheetFunction/FISHERINV</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/fixed") %>">ApiWorksheetFunction/FIXED</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/floor") %>">ApiWorksheetFunction/FLOOR</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/floor_math") %>">ApiWorksheetFunction/FLOOR_MATH</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/floor_precise") %>">ApiWorksheetFunction/FLOOR_PRECISE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/forecast_ets") %>">ApiWorksheetFunction/FORECAST_ETS</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/forecast_ets_confint") %>">ApiWorksheetFunction/FORECAST_ETS_CONFINT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/forecast_ets_seasonality") %>">ApiWorksheetFunction/FORECAST_ETS_SEASONALITY</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/forecast_ets_stat") %>">ApiWorksheetFunction/FORECAST_ETS_STAT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/frequency") %>">ApiWorksheetFunction/FREQUENCY</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/fv") %>">ApiWorksheetFunction/FV</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/fvschedule") %>">ApiWorksheetFunction/FVSCHEDULE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/gamma") %>">ApiWorksheetFunction/GAMMA</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/gamma_dist") %>">ApiWorksheetFunction/GAMMA_DIST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/gamma_inv") %>">ApiWorksheetFunction/GAMMA_INV</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/gammadist") %>">ApiWorksheetFunction/GAMMADIST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/gammainv") %>">ApiWorksheetFunction/GAMMAINV</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/gammaln") %>">ApiWorksheetFunction/GAMMALN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/gammaln_precise") %>">ApiWorksheetFunction/GAMMALN_PRECISE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/gauss") %>">ApiWorksheetFunction/GAUSS</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/gcd") %>">ApiWorksheetFunction/GCD</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/geomean") %>">ApiWorksheetFunction/GEOMEAN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/gestep") %>">ApiWorksheetFunction/GESTEP</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/growth") %>">ApiWorksheetFunction/GROWTH</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/harmean") %>">ApiWorksheetFunction/HARMEAN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/hex2bin") %>">ApiWorksheetFunction/HEX2BIN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/hex2dec") %>">ApiWorksheetFunction/HEX2DEC</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/hex2oct") %>">ApiWorksheetFunction/HEX2OCT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/hlookup") %>">ApiWorksheetFunction/HLOOKUP</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/hour") %>">ApiWorksheetFunction/HOUR</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/hyperlink") %>">ApiWorksheetFunction/HYPERLINK</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/hypgeom_dist") %>">ApiWorksheetFunction/HYPGEOM_DIST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/hypgeomdist") %>">ApiWorksheetFunction/HYPGEOMDIST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/if") %>">ApiWorksheetFunction/IF</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/iferror") %>">ApiWorksheetFunction/IFERROR</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/ifna") %>">ApiWorksheetFunction/IFNA</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/imabs") %>">ApiWorksheetFunction/IMABS</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/imaginary") %>">ApiWorksheetFunction/IMAGINARY</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/imargument") %>">ApiWorksheetFunction/IMARGUMENT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/inconjugate") %>">ApiWorksheetFunction/IMCONJUGATE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/imcos") %>">ApiWorksheetFunction/IMCOS</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/imcosh") %>">ApiWorksheetFunction/IMCOSH</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/imcot") %>">ApiWorksheetFunction/IMCOT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/imcsc") %>">ApiWorksheetFunction/IMCSC</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/imcsch") %>">ApiWorksheetFunction/IMCSCH</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/imdiv") %>">ApiWorksheetFunction/IMDIV</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/imexp") %>">ApiWorksheetFunction/IMEXP</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/imln") %>">ApiWorksheetFunction/IMLN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/imlog10") %>">ApiWorksheetFunction/IMLOG10</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/imlog2") %>">ApiWorksheetFunction/IMLOG2</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/impower") %>">ApiWorksheetFunction/IMPOWER</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/improduct") %>">ApiWorksheetFunction/IMPRODUCT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/imreal") %>">ApiWorksheetFunction/IMREAL</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/imsec") %>">ApiWorksheetFunction/IMSEC</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/imsech") %>">ApiWorksheetFunction/IMSECH</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/imsin") %>">ApiWorksheetFunction/IMSIN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/imsinh") %>">ApiWorksheetFunction/IMSINH</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/imsqrt") %>">ApiWorksheetFunction/IMSQRT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/imsub") %>">ApiWorksheetFunction/IMSUB</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/imsum") %>">ApiWorksheetFunction/IMSUM</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/imtan") %>">ApiWorksheetFunction/IMTAN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/index") %>">ApiWorksheetFunction/INDEX</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/int") %>">ApiWorksheetFunction/INT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/intrate") %>">ApiWorksheetFunction/INTRATE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/ipmt") %>">ApiWorksheetFunction/IPMT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/irr") %>">ApiWorksheetFunction/IRR</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/iserr") %>">ApiWorksheetFunction/ISERR</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/iserror") %>">ApiWorksheetFunction/ISERROR</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/iseven") %>">ApiWorksheetFunction/ISEVEN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/isformula") %>">ApiWorksheetFunction/ISFORMULA</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/islogical") %>">ApiWorksheetFunction/ISLOGICAL</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/isna") %>">ApiWorksheetFunction/ISNA</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/isnontext") %>">ApiWorksheetFunction/ISNONTEXT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/isnumber") %>">ApiWorksheetFunction/ISNUMBER</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/iso_ceiling") %>">ApiWorksheetFunction/ISO_CEILING</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/isodd") %>">ApiWorksheetFunction/ISODD</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/isoweeknum") %>">ApiWorksheetFunction/ISOWEEKNUM</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/ispmt") %>">ApiWorksheetFunction/ISPMT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/isref") %>">ApiWorksheetFunction/ISREF</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/istext") %>">ApiWorksheetFunction/ISTEXT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/kurt") %>">ApiWorksheetFunction/KURT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/large") %>">ApiWorksheetFunction/LARGE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/lcm") %>">ApiWorksheetFunction/LCM</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/left") %>">ApiWorksheetFunction/LEFT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/leftb") %>">ApiWorksheetFunction/LEFTB</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/len") %>">ApiWorksheetFunction/LEN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/lenb") %>">ApiWorksheetFunction/LENB</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/linest") %>">ApiWorksheetFunction/LINEST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/ln") %>">ApiWorksheetFunction/LN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/log") %>">ApiWorksheetFunction/LOG</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/log10") %>">ApiWorksheetFunction/LOG10</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/logest") %>">ApiWorksheetFunction/LOGEST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/loginv") %>">ApiWorksheetFunction/LOGINV</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/lognorm_dist") %>">ApiWorksheetFunction/LOGNORM_DIST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/lognorm_inv") %>">ApiWorksheetFunction/LOGNORM_INV</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/lognormdist") %>">ApiWorksheetFunction/LOGNORMDIST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/lookup") %>">ApiWorksheetFunction/LOOKUP</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/lower") %>">ApiWorksheetFunction/LOWER</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/match") %>">ApiWorksheetFunction/MATCH</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/max") %>">ApiWorksheetFunction/MAX</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/maxa") %>">ApiWorksheetFunction/MAXA</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/mduration") %>">ApiWorksheetFunction/MDURATION</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/median") %>">ApiWorksheetFunction/MEDIAN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/mid") %>">ApiWorksheetFunction/MID</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/midb") %>">ApiWorksheetFunction/MIDB</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/min") %>">ApiWorksheetFunction/MIN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/mina") %>">ApiWorksheetFunction/MINA</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/minute") %>">ApiWorksheetFunction/MINUTE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/mirr") %>">ApiWorksheetFunction/MIRR</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/mod") %>">ApiWorksheetFunction/MOD</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/month") %>">ApiWorksheetFunction/MONTH</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/mround") %>">ApiWorksheetFunction/MROUND</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/multinomial") %>">ApiWorksheetFunction/MULTINOMIAL</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/munit") %>">ApiWorksheetFunction/MUNIT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/n") %>">ApiWorksheetFunction/N</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/na") %>">ApiWorksheetFunction/NA</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/negbinom_dist") %>">ApiWorksheetFunction/NEGBINOM_DIST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/negbinomdist") %>">ApiWorksheetFunction/NEGBINOMDIST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/networkdays") %>">ApiWorksheetFunction/NETWORKDAYS</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/networkdays_intl") %>">ApiWorksheetFunction/NETWORKDAYS_INTL</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/nominal") %>">ApiWorksheetFunction/NOMINAL</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/norm_dist") %>">ApiWorksheetFunction/NORM_DIST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/norm_inv") %>">ApiWorksheetFunction/NORM_INV</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/norm_s_dist") %>">ApiWorksheetFunction/NORM_S_DIST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/norm_s_inv") %>">ApiWorksheetFunction/NORM_S_INV</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/normdist") %>">ApiWorksheetFunction/NORMDIST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/norminv") %>">ApiWorksheetFunction/NORMINV</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/normsdist") %>">ApiWorksheetFunction/NORMSDIST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/normsinv") %>">ApiWorksheetFunction/NORMSINV</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/not") %>">ApiWorksheetFunction/NOT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/now") %>">ApiWorksheetFunction/NOW</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/nper") %>">ApiWorksheetFunction/NPER</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/npv") %>">ApiWorksheetFunction/NPV</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/numbervalue") %>">ApiWorksheetFunction/NUMBERVALUE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/oct2bin") %>">ApiWorksheetFunction/OCT2BIN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/oct2dec") %>">ApiWorksheetFunction/OCT2DEC</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/oct2hex") %>">ApiWorksheetFunction/OCT2HEX</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/odd") %>">ApiWorksheetFunction/ODD</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/oddfprice") %>">ApiWorksheetFunction/ODDFPRICE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/oddfyield") %>">ApiWorksheetFunction/ODDFYIELD</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/oddlprice") %>">ApiWorksheetFunction/ODDLPRICE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/oddlyield") %>">ApiWorksheetFunction/ODDLYIELD</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/or") %>">ApiWorksheetFunction/OR</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/pduration") %>">ApiWorksheetFunction/PDURATION</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/percentile") %>">ApiWorksheetFunction/PERCENTILE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/percentile_exc") %>">ApiWorksheetFunction/PERCENTILE_EXC</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/percentile_inc") %>">ApiWorksheetFunction/PERCENTILE_INC</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/percentrank") %>">ApiWorksheetFunction/PERCENTRANK</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/percentrank_exc") %>">ApiWorksheetFunction/PERCENTRANK_EXC</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/percentrank_inc") %>">ApiWorksheetFunction/PERCENTRANK_INC</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/permut") %>">ApiWorksheetFunction/PERMUT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/permutationa") %>">ApiWorksheetFunction/PERMUTATIONA</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/phi") %>">ApiWorksheetFunction/PHI</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/pi") %>">ApiWorksheetFunction/PI</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/pmt") %>">ApiWorksheetFunction/PMT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/poisson") %>">ApiWorksheetFunction/POISSON</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/poisson_dist") %>">ApiWorksheetFunction/POISSON_DIST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/power") %>">ApiWorksheetFunction/POWER</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/ppmt") %>">ApiWorksheetFunction/PPMT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/price") %>">ApiWorksheetFunction/PRICE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/pricedisc") %>">ApiWorksheetFunction/PRICEDISC</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/pricemat") %>">ApiWorksheetFunction/PRICEMAT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/product") %>">ApiWorksheetFunction/PRODUCT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/proper") %>">ApiWorksheetFunction/PROPER</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/pv") %>">ApiWorksheetFunction/PV</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/quartile") %>">ApiWorksheetFunction/QUARTILE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/quartile_exc") %>">ApiWorksheetFunction/QUARTILE_EXC</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/quartile_inc") %>">ApiWorksheetFunction/QUARTILE_INC</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/quotient") %>">ApiWorksheetFunction/QUOTIENT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/radians") %>">ApiWorksheetFunction/RADIANS</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/rand") %>">ApiWorksheetFunction/RAND</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/randbetween") %>">ApiWorksheetFunction/RANDBETWEEN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/rank") %>">ApiWorksheetFunction/RANK</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/rank_avg") %>">ApiWorksheetFunction/RANK_AVG</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/rank_eq") %>">ApiWorksheetFunction/RANK_EQ</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/rate") %>">ApiWorksheetFunction/RATE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/received") %>">ApiWorksheetFunction/RECEIVED</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/replace") %>">ApiWorksheetFunction/REPLACE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/replaceb") %>">ApiWorksheetFunction/REPLACEB</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/rept") %>">ApiWorksheetFunction/REPT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/right") %>">ApiWorksheetFunction/RIGHT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/rightb") %>">ApiWorksheetFunction/RIGHTB</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/roman") %>">ApiWorksheetFunction/ROMAN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/round") %>">ApiWorksheetFunction/ROUND</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/rounddown") %>">ApiWorksheetFunction/ROUNDDOWN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/roundup") %>">ApiWorksheetFunction/ROUNDUP</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/rows") %>">ApiWorksheetFunction/ROWS</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/rri") %>">ApiWorksheetFunction/RRI</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/search") %>">ApiWorksheetFunction/SEARCH</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/searchb") %>">ApiWorksheetFunction/SEARCHB</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/sec") %>">ApiWorksheetFunction/SEC</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/sech") %>">ApiWorksheetFunction/SECH</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/second") %>">ApiWorksheetFunction/SECOND</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/seriessum") %>">ApiWorksheetFunction/SERIESSUM</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/sheet") %>">ApiWorksheetFunction/SHEET</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/sheets") %>">ApiWorksheetFunction/SHEETS</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/sign") %>">ApiWorksheetFunction/SIGN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/sin") %>">ApiWorksheetFunction/SIN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/sinh") %>">ApiWorksheetFunction/SINH</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/skew") %>">ApiWorksheetFunction/SKEW</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/skew_p") %>">ApiWorksheetFunction/SKEW_P</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/sln") %>">ApiWorksheetFunction/SLN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/small") %>">ApiWorksheetFunction/SMALL</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/sqrt") %>">ApiWorksheetFunction/SQRT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/sqrtpi") %>">ApiWorksheetFunction/SQRTPI</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/standardize") %>">ApiWorksheetFunction/STANDARDIZE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/stdev") %>">ApiWorksheetFunction/STDEV</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/stdev_p") %>">ApiWorksheetFunction/STDEV_P</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/stdev_s") %>">ApiWorksheetFunction/STDEV_S</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/stdeva") %>">ApiWorksheetFunction/STDEVA</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/stdevp") %>">ApiWorksheetFunction/STDEVP</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/stdevpa") %>">ApiWorksheetFunction/STDEVPA</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/substitute") %>">ApiWorksheetFunction/SUBSTITUTE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/subtotal") %>">ApiWorksheetFunction/SUBTOTAL</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/sum") %>">ApiWorksheetFunction/SUM</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/sumif") %>">ApiWorksheetFunction/SUMIF</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/sumifs") %>">ApiWorksheetFunction/SUMIFS</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/sumsq") %>">ApiWorksheetFunction/SUMSQ</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/syd") %>">ApiWorksheetFunction/SYD</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/t") %>">ApiWorksheetFunction/T</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/t_dist") %>">ApiWorksheetFunction/T_DIST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/t_dist_2t") %>">ApiWorksheetFunction/T_DIST_2T</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/t_dist_rt") %>">ApiWorksheetFunction/T_DIST_RT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/t_inv") %>">ApiWorksheetFunction/T_INV</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/t_inv_2t") %>">ApiWorksheetFunction/T_INV_2T</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/tan") %>">ApiWorksheetFunction/TAN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/tanh") %>">ApiWorksheetFunction/TANH</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/tbilleq") %>">ApiWorksheetFunction/TBILLEQ</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/tbillprice") %>">ApiWorksheetFunction/TBILLPRICE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/tbillyield") %>">ApiWorksheetFunction/TBILLYIELD</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/tdist") %>">ApiWorksheetFunction/TDIST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/text") %>">ApiWorksheetFunction/TEXT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/time") %>">ApiWorksheetFunction/TIME</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/timevalue") %>">ApiWorksheetFunction/TIMEVALUE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/tinv") %>">ApiWorksheetFunction/TINV</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/today") %>">ApiWorksheetFunction/TODAY</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/transpose") %>">ApiWorksheetFunction/TRANSPOSE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/trend") %>">ApiWorksheetFunction/TREND</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/trim") %>">ApiWorksheetFunction/TRIM</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/trimmean") %>">ApiWorksheetFunction/TRIMMEAN</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/true") %>">ApiWorksheetFunction/TRUE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/trunc") %>">ApiWorksheetFunction/TRUNC</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/type") %>">ApiWorksheetFunction/TYPE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/unichar") %>">ApiWorksheetFunction/UNICHAR</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/unicode") %>">ApiWorksheetFunction/UNICODE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/upper") %>">ApiWorksheetFunction/UPPER</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/value") %>">ApiWorksheetFunction/VALUE</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/var") %>">ApiWorksheetFunction/VAR</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/var_p") %>">ApiWorksheetFunction/VAR_P</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/var_s") %>">ApiWorksheetFunction/VAR_S</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/vara") %>">ApiWorksheetFunction/VARA</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/varp") %>">ApiWorksheetFunction/VARP</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/varpa") %>">ApiWorksheetFunction/VARPA</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/vdb") %>">ApiWorksheetFunction/VDB</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/vlookup") %>">ApiWorksheetFunction/VLOOKUP</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/weekday") %>">ApiWorksheetFunction/WEEKDAY</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/weeknum") %>">ApiWorksheetFunction/WEEKNUM</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/weibull") %>">ApiWorksheetFunction/WEIBULL</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/weibull_dist") %>">ApiWorksheetFunction/WEIBULL_DIST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/workday") %>">ApiWorksheetFunction/WORKDAY</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/workday_intl") %>">ApiWorksheetFunction/WORKDAY_INTL</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/xirr") %>">ApiWorksheetFunction/XIRR</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/xnpv") %>">ApiWorksheetFunction/XNPV</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/xor") %>">ApiWorksheetFunction/XOR</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/year") %>">ApiWorksheetFunction/YEAR</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/yearfrac") %>">ApiWorksheetFunction/YEARFRAC</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/yield") %>">ApiWorksheetFunction/YIELD</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/yielddisc") %>">ApiWorksheetFunction/YIELDDISC</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/yieldmat") %>">ApiWorksheetFunction/YIELDMAT</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/z_test") %>">ApiWorksheetFunction/Z_TEST</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheetfunction/ztest") %>">ApiWorksheetFunction/ZTEST</a> method to Spreadsheet API.</li>
        <li>Added the <em>WorksheetFunction</em> property to the <a href="<%= Url.Action("spreadsheetapi/api") %>">Api</a> object of Spreadsheet API.</li>
    </ul>
    <br />

    <p><b>Protected range methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiprotectedrange") %>">ApiProtectedRange</a> class to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiprotectedrange/adduser") %>">ApiProtectedRange/AddUser</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiprotectedrange/deleteuser") %>">ApiProtectedRange/DeleteUser</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiprotectedrange/getallusers") %>">ApiProtectedRange/GetAllUsers</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiprotectedrange/getuser") %>">ApiProtectedRange/GetUser</a> method to Spreadsheet API.</li>
    </ul>
    <p class="spoiler_heading spoiler_changelog">More</p>
    <ul class="spoiler_code">
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiprotectedrange/setanyonetype") %>">ApiProtectedRange/SetAnyoneType</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiprotectedrange/setrange") %>">ApiProtectedRange/SetRange</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiprotectedrange/settitle") %>">ApiProtectedRange/SetTitle</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiprotectedrangeuserinfo") %>">ApiProtectedRangeUserInfo</a> class to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiprotectedrangeuserinfo/getid") %>">ApiProtectedRangeUserInfo/GetId</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiprotectedrangeuserinfo/getname") %>">ApiProtectedRangeUserInfo/GetName</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiprotectedrangeuserinfo/gettype") %>">ApiProtectedRangeUserInfo/GetType</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheet/addprotectedrange") %>">ApiWorksheet/AddProtectedRange</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheet/getallprotectedranges") %>">ApiWorksheet/GetAllProtectedRanges</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheet/getprotectedrange") %>">ApiWorksheet/GetProtectedRange</a> method to Spreadsheet API.</li>
        <li>Added the <em>AllProtectedRanges</em> property to the <a href="<%= Url.Action("spreadsheetapi/apiworksheet") %>">ApiWorksheet</a> object of Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("global") %>#ProtectedRangeUserType">ProtectedRangeUserType</a> type to the simple type definitions.</li>
    </ul>
    <br />

    <p><b>Reference style methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/api/getreferencestyle") %>">Api/GetReferenceStyle</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/api/setreferencestyle") %>">Api/SetReferenceStyle</a> method to Spreadsheet API.</li>
        <li>Added the <em>ReferenceStyle</em> property to the <a href="<%= Url.Action("spreadsheetapi/api") %>">Api</a> object of Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("global") %>#ReferenceStyle">ReferenceStyle</a> type to the simple type definitions.</li>
    </ul>
    <br />

    <p><b>Methods for pasting / cutting ranges</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/cut") %>">ApiRange/Cut</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apirange/pastespecial") %>">ApiRange/PasteSpecial</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheet/paste") %>">ApiWorksheet/Paste</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("global") %>#PasteSpecialOperation">PasteSpecialOperation</a> type to the simple type definitions.</li>
        <li>Added the <a href="<%= Url.Action("global") %>#PasteType">PasteType</a> type to the simple type definitions.</li>
    </ul>
    <br />

    <p><b>Methods for moving a cursor</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiblocklvlsdt/movecursoroutside") %>">ApiBlockLvlSdt/MoveCursorOutside</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiformbase/movecursoroutside") %>">ApiFormBase/MoveCursorOutside</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiinlinelvlsdt/movecursoroutside") %>">ApiInlineLvlSdt/MoveCursorOutside</a> method to Text document API.</li>
    </ul>
    <br />

    <p><b>Other methods</b></p>
    <ul>
        <li>Added the <em>form</em> <a href="<%= Url.Action("integrationapi/default") %>#format-types">format type</a>.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/api/addcustomfunction") %>">Api/AddCustomFunction</a> method to Spreadsheet API.</li>
        <li>Added the <em>nWidth</em> and <em>nHeight</em> parameters to the <a href="<%= Url.Action("textdocumentapi/apipictureform/setimage") %>">ApiPictureForm/SetImage</a> method of Text document API.</li>
    </ul>
    <br />

    <h2 id="80" class="copy-link">Version 8.0</h2>
    <p><b>Form methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/getformsdata") %>">ApiDocument/GetFormsData</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/setformsdata") %>">ApiDocument/SetFormsData</a> method to Text document API.</li>
    </ul>
    <br />

    <p><b>Freeze panes methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/api/getfreezepanestype") %>">Api/GetFreezePanesType</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/api/setfreezepanestype") %>">Api/SetFreezePanesType</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apifreezepanes") %>">ApiFreezePanes</a> class to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apifreezepanes/freezeat") %>">ApiFreezePanes/FreezeAt</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apifreezepanes/freezecolumns") %>">ApiFreezePanes/FreezeColumns</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apifreezepanes/freezerows") %>">ApiFreezePanes/FreezeRows</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apifreezepanes/getlocation") %>">ApiFreezePanes/GetLocation</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apifreezepanes/unfreeze") %>">ApiFreezePanes/Unfreeze</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheet/getfreezepanes") %>">ApiWorksheet/GetFreezePanes</a> method to Spreadsheet API.</li>
        <li>Added the <em>FreezePanes</em> property to the <a href="<%= Url.Action("spreadsheetapi/api") %>">Api</a> object of Spreadsheet API.</li>
        <li>Added the <em>FreezePanes</em> property to the <a href="<%= Url.Action("spreadsheetapi/apiworksheet") %>">ApiWorksheet</a> object of Spreadsheet API.</li>
    </ul>
    <br />

    <p><b>Comment methods</b></p>
    <ul>
        <li>Added the <em>sUserId</em> parameter to the <a href="<%= Url.Action("textdocumentapi/api/addcomment") %>">Api/AddComment</a> method of Text document API.</li>
        <li>Added the <em>sUserId</em> parameter to the <a href="<%= Url.Action("textdocumentapi/apiblocklvlsdt/addcomment") %>">ApiBlockLvlSdt/AddComment</a> method of Text document API.</li>
        <li>Added the <em>sUserId</em> parameter to the <a href="<%= Url.Action("textdocumentapi/apidocument/addcomment") %>">ApiDocument/AddComment</a> method of Text document API.</li>
        <li>Added the <em>sUserId</em> parameter to the <a href="<%= Url.Action("textdocumentapi/apiinlinelvlsdt/addcomment") %>">ApiInlineLvlSdt/AddComment</a> method of Text document API.</li>
        <li>Added the <em>sUserId</em> parameter to the <a href="<%= Url.Action("textdocumentapi/apiparagraph/addcomment") %>">ApiParagraph/AddComment</a> method of Text document API.</li>
        <li>Added the <em>sUserId</em> parameter to the <a href="<%= Url.Action("textdocumentapi/apirange/addcomment") %>">ApiRange/AddComment</a> method of Text document API.</li>
        <li>Added the <em>sUserId</em> parameter to the <a href="<%= Url.Action("textdocumentapi/apirun/addcomment") %>">ApiRun/AddComment</a> method of Text document API.</li>
        <li>Added the <em>sUserId</em> parameter to the <a href="<%= Url.Action("textdocumentapi/apitable/addcomment") %>">ApiTable/AddComment</a> method of Text document API.</li>
    </ul>
    <p class="spoiler_heading spoiler_changelog">More</p>
    <ul class="spoiler_code">
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/api/getallcomments") %>">Api/GetAllComments</a> method to Spreadsheet API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apicomment/addreply") %>">ApiComment/AddReply</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apicomment/delete") %>">ApiComment/Delete</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apicomment/getauthorname") %>">ApiComment/GetAuthorName</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apicomment/getclasstype") %>">ApiComment/GetClassType</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apicomment/getquotetext") %>">ApiComment/GetQuoteText</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apicomment/getrepliescount") %>">ApiComment/GetRepliesCount</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apicomment/gettext") %>">ApiComment/GetText</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apicomment/gettime") %>">ApiComment/GetTime</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apicomment/gettimeutc") %>">ApiComment/GetTimeUTC</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apicomment/issolved") %>">ApiComment/IsSolved</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apicomment/removereplies") %>">ApiComment/RemoveReplies</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apicomment/setauthorname") %>">ApiComment/SetAuthorName</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apicomment/setsolved") %>">ApiComment/SetSolved</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apicomment/settext") %>">ApiComment/SetText</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apicomment/settime") %>">ApiComment/SetTime</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apicomment/settimeutc") %>">ApiComment/SetTimeUTC</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apicomment/setuserid") %>">ApiComment/SetUserId</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apicommentreply/getauthorname") %>">ApiCommentReply/GetAuthorName</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apicommentreply/getclasstype") %>">ApiCommentReply/GetClassType</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apicommentreply/gettext") %>">ApiCommentReply/GetText</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apicommentreply/setauthorname") %>">ApiCommentReply/SetAuthorName</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apicommentreply/settext") %>">ApiCommentReply/SetText</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apicommentreply/setuserid") %>">ApiCommentReply/SetUserId</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apipresentation/getallcomments") %>">ApiPresentation/GetAllComments</a> method to Presentation API.</li>
    </ul>
    <br />

    <p><b>Section methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apisection/getpageheight") %>">ApiSection/GetPageHeight</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apisection/getpagewidth") %>">ApiSection/GetPageWidth</a> method to Text document API.</li>
    </ul>
    <br />

    <p><b>Simple types</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("global") %>#FormData">FormData</a> object to the simple type definitions.</li>
        <li>Added the <a href="<%= Url.Action("global") %>#FormSpecificType">FormSpecificType</a> type to the simple type definitions.</li>
        <li>Added the <a href="<%= Url.Action("global") %>#FreezePaneType">FreezePaneType</a> type to the simple type definitions.</li>
    </ul>
    <br />

    <p><b>Other methods</b></p>
    <ul>
        <li>Removed the <em>ApiBlockLvlSdt/SetBackgroundColor</em> method from Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/adddrawingtopage") %>">ApiDocument/AddDrawingToPage</a> method to Text document API.</li>
        <li>Added the <em>bWithotPaddings</em> parameter to the <a href="<%= Url.Action("spreadsheetapi/apiworksheet/setcolumnwidth") %>">ApiWorksheet/SetColumnWidth</a> method of Spreadsheet API.</li>
    </ul>
    <br />

    <h2 id="75" class="copy-link">Version 7.5</h2>
    <p><b>Methods of combo box / dropdown list content control</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiblocklvlsdt/getdropdownlist") %>">ApiBlockLvlSdt/GetDropdownList</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicontentcontrollist") %>">ApiContentControlList</a> class to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicontentcontrollist/add") %>">ApiContentControlList/Add</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicontentcontrollist/clear") %>">ApiContentControlList/Clear</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicontentcontrollist/getallitems") %>">ApiContentControlList/GetAllItems</a> method to Text document API.</li>
    </ul>
    <p class="spoiler_heading spoiler_changelog">More</p>
    <ul class="spoiler_code">
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicontentcontrollist/getclasstype") %>">ApiContentControlList/GetClassType</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicontentcontrollist/getelementscount") %>">ApiContentControlList/GetElementsCount</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicontentcontrollist/getitem") %>">ApiContentControlList/GetItem</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicontentcontrollist/getparent") %>">ApiContentControlList/GetParent</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicontentcontrollistentry") %>">ApiContentControlListEntry</a> class to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicontentcontrollistentry/delete") %>">ApiContentControlListEntry/Delete</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicontentcontrollistentry/getclasstype") %>">ApiContentControlListEntry/GetClassType</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicontentcontrollistentry/getindex") %>">ApiContentControlListEntry/GetIndex</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicontentcontrollistentry/getparent") %>">ApiContentControlListEntry/GetParent</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicontentcontrollistentry/gettext") %>">ApiContentControlListEntry/GetText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicontentcontrollistentry/getvalue") %>">ApiContentControlListEntry/GetValue</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicontentcontrollistentry/movedown") %>">ApiContentControlListEntry/MoveDown</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicontentcontrollistentry/moveup") %>">ApiContentControlListEntry/MoveUp</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicontentcontrollistentry/select") %>">ApiContentControlListEntry/Select</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicontentcontrollistentry/setindex") %>">ApiContentControlListEntry/SetIndex</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicontentcontrollistentry/settext") %>">ApiContentControlListEntry/SetText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicontentcontrollistentry/setvalue") %>">ApiContentControlListEntry/SetValue</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiinlinelvlsdt/getdropdownlist") %>">ApiInlineLvlSdt/GetDropdownList</a> method to Text document API.</li>
    </ul>
    <br />

    <p><b>Watermark methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/getwatermarksettings") %>">ApiDocument/GetWatermarkSettings</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/removewatermark") %>">ApiDocument/RemoveWatermark</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apidocument/setwatermarksettings") %>">ApiDocument/SetWatermarkSettings</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiwatermarksettings") %>">ApiWatermarkSettings</a> class to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiwatermarksettings/getclasstype") %>">ApiWatermarkSettings/GetClassType</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiwatermarksettings/getdirection") %>">ApiWatermarkSettings/GetDirection</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiwatermarksettings/getimageheight") %>">ApiWatermarkSettings/GetImageHeight</a> method to Text document API.</li>
    </ul>
    <p class="spoiler_heading spoiler_changelog">More</p>
    <ul class="spoiler_code">
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiwatermarksettings/getimageurl") %>">ApiWatermarkSettings/GetImageURL</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiwatermarksettings/getimagewidth") %>">ApiWatermarkSettings/GetImageWidth</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiwatermarksettings/getopacity") %>">ApiWatermarkSettings/GetOpacity</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiwatermarksettings/gettext") %>">ApiWatermarkSettings/GetText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiwatermarksettings/gettextpr") %>">ApiWatermarkSettings/GetTextPr</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiwatermarksettings/gettype") %>">ApiWatermarkSettings/GetType</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiwatermarksettings/setdirection") %>">ApiWatermarkSettings/SetDirection</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiwatermarksettings/setimagesize") %>">ApiWatermarkSettings/SetImageSize</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiwatermarksettings/setimageurl") %>">ApiWatermarkSettings/SetImageURL</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiwatermarksettings/setopacity") %>">ApiWatermarkSettings/SetOpacity</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiwatermarksettings/settext") %>">ApiWatermarkSettings/SetText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiwatermarksettings/settextpr") %>">ApiWatermarkSettings/SetTextPr</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apiwatermarksettings/settype") %>">ApiWatermarkSettings/SetType</a> method to Text document API.</li>
    </ul>
    <br />

    <p><b>Simple types</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("global") %>#SearchData">SearchData</a> object to the simple type definitions.</li>
        <li>Added the <a href="<%= Url.Action("global") %>#ReplaceData">ReplaceData</a> object to the simple type definitions.</li>
    </ul>
    <br />

    <p><b>Slide methods</b></p>
    <ul>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/getvisible") %>">ApiSlide/GetVisible</a> method to Presentation API.</li>
        <li>Added the <a href="<%= Url.Action("presentationapi/apislide/setvisible") %>">ApiSlide/SetVisible</a> method to Presentation API.</li>
    </ul>
    <br />

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
        <li>Added the <a href="<%= Url.Action("spreadsheetapi/apiworksheet/move") %>">ApiWorksheet/Move</a> method to Spreadsheet API.</li>
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
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment/getauthorname") %>">ApiComment/GetAuthorName</a> method to Text document API.</li>
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
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment/setauthorname") %>">ApiComment/SetAuthorName</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment/setsolved") %>">ApiComment/SetSolved</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment/settext") %>">ApiComment/SetText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment/settime") %>">ApiComment/SetTime</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment/settimeutc") %>">ApiComment/SetTimeUTC</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicomment/setuserid") %>">ApiComment/SetUserId</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicommentreply") %>">ApiCommentReply</a> class to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicommentreply/getauthorname") %>">ApiCommentReply/GetAuthorName</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicommentreply/getclasstype") %>">ApiCommentReply/GetClassType</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicommentreply/gettext") %>">ApiCommentReply/GetText</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicommentreply/getuserid") %>">ApiCommentReply/GetUserId</a> method to Text document API.</li>
        <li>Added the <a href="<%= Url.Action("textdocumentapi/apicommentreply/setauthorname") %>">ApiCommentReply/SetAuthorName</a> method to Text document API.</li>
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
        <li>Added the <a href="<%= Url.Action("global") %>#SortOrientation">SortOrientation</a> simple type.</li>
        <li>Added the <a href="<%= Url.Action("global") %>#SortHeader">SortHeader</a> simple type.</li>
        <li>Added the <a href="<%= Url.Action("global") %>#SortOrder">SortOrder</a> simple type.</li>
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