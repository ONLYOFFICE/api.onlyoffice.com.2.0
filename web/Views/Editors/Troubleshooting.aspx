<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Troubleshooting
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Troubleshooting</span>
    </h1>
    <p class="dscr">The most common problems with the editors integration and the ways to solve them.</p>

    <h2 id="download" class="copy-link">Download failed</h2>
    <img class="screenshot max-width-832" alt="Download failed" src="<%= Url.Content("~/content/img/editor/e-download.png") %>" />
    <p>The "Download failed" message is displayed at the editors loading process.</p>
    <p>The <b>Document editing service</b> cannot upload the file for editing.</p>
    <p>
        Check if the link to the file specified in the <a href="<%= Url.Action("config/document") %>#url">document.url</a> is correct.
        The link must be accessible from the <b>document editing service</b>.
    </p>

    <h2 id="callbackurl" class="copy-link">No changes</h2>
    <p>When closing the editor after the editing, the file is unchanged in the <b>document manager</b>.</p>
    <p>The <b>document editing service</b> could not send the data to the <b>document storage service</b>.</p>
    <p>
        Check if the <a href="<%= Url.Action("config/editor") %>#callbackUrl">editorConfig.callbackUrl</a> link is correct.
        The saving in the <b>document manager</b> must be implemented through the <a href="<%= Url.Action("callback") %>#implement">Callback handler</a>
    </p>

    <h2 id="error0" class="copy-link">Could not be saved</h2>
    <img class="screenshot max-width-832" alt="Could not be saved" src="<%= Url.Content("~/content/img/editor/e-error0.png") %>" />
    <p>The editor is loaded with the "The document could not be saved" message.</p>
    <p>The <b>document editing service</b> cannot connect to the <b>document storage service</b> at the <a href="<%= Url.Action("config/editor") %>#callbackUrl">editorConfig.callbackUrl</a> address.</p>
    <p>
        Check if the <a href="<%= Url.Action("callback") %>#implement">Callback handler</a> is working correctly.
        The <b>document storage service</b> must return <a href="<%= Url.Action("callback") %>#error-0">{"error": 0}</a> in response.
    </p>

    <h2 id="key" class="copy-link">The file version has been changed</h2>
    <img class="screenshot max-width-832" alt="The file version has been changed" src="<%= Url.Content("~/content/img/editor/e-key.png") %>" />
    <p>
        The editor is loaded with the "The file version has been changed.
        The page will be reloaded" message.
    </p>
    <p>The <b>document editing service</b> cannot open the previously edited and saved file for editing.</p>
    <p>Do not forget that every time the document is edited and saved, the <a href="<%= Url.Action("config/document") %>#key">document.key</a> must be generated anew.</p>

    <h2 id="changesUrl" class="copy-link">The file version cannot be opened</h2>
    <img class="screenshot max-width-832" alt="The file version cannot be opened" src="<%= Url.Content("~/content/img/editor/changes-url.png") %>" />
    <p>The <b>document editing service</b> cannot open the file version.</p>
    <p>Check if the <em>changesUrl</em> link from the <a href="<%= Url.Action("methods") %>#setHistoryData">setHistoryData</a> method corresponds to the <em>previous.url</em> parameter.</p>

    <h2 id="coedit" class="copy-link">No collaborative editing</h2>
    <img class="screenshot max-width-832" alt="No collaborative editing" src="<%= Url.Content("~/content/img/editor/e-coedit.png") %>" />
    <p>No co-editing is available when the document is opened for editing by different users.</p>
    <p>The <b>document editing service</b> opens <b>two different</b> files for editing.</p>
    <p>
        Check if the <a href="<%= Url.Action("config/document") %>#key">document.key</a> values coincide to be able to co-edit the same document.
        The <em>key</em> value must change after the save, must differ for different documents and coincide when co-editing one and the same document.
    </p>

    <h2 id="token" class="copy-link">Invalid token</h2>
    <img class="screenshot max-width-832" alt="Invalid token" src="<%= Url.Content("~/content/img/editor/e-token.png") %>" />
    <p>
        The editor is loaded with the "The document security token is not correctly formed.
        Please contact your Document Server administrator" message.
    </p>
    <p>The <b>document editing service</b> requests an encrypted <b>signature</b>.</p>
    <p>
        Check if the <a href="<%= Url.Action("config/") %>#token">token</a> is correct.
        The token must be generated in accordance with the <a href="<%= Url.Action("security") %>">JWT (JSON Web Tokens) standard</a> and present in <b>ONLYOFFICE Document Server</b> config.
    </p>
</asp:Content>
