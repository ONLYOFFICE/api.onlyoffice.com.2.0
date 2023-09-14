<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Security
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Security</span>
    </h1>
    <p class="dscr">To prevent the substitution of important parameters in ONLYOFFICE Document Server requests an encrypted signature is added to it in the form of <b>token</b>.</p>
    <p>The <b>token</b> is added in the configuration when initializing <b>Document Editor</b> and during the exchange of commands between <b>document storage service</b> and <b>document editing service</b>, <b>document command service</b>, <b>document conversion service</b> and <b>document builder service</b>.</p>

    <p>
        The <b>token</b> is generated using the <em>JWT</em> (<a href="https://jwt.io/" target="_blank">JSON Web Tokens</a>) standard.
        The tokens are signed by the server's key, so the client is able to verify that the token is legitimate.
    </p>

    <p>
        <em>JSON Web Tokens</em> consist of three parts separated by dots (.), which are: <em>header</em>, <em>payload</em>, <em>signature</em>.
        The <em>header</em> consists of two parts: the type of the token (<em>JWT</em>), and the hashing algorithm (<em>HMAC SHA256</em>).
        The second part of the token is the <em>payload</em>, which contains the claims in JSON format.
        To create the signature part you have to take the encoded header, the encoded payload, a secret, the algorithm specified in the header, and sign that.
    </p>

    <p>
        <b>ONLYOFFICE Document Server</b> validates the <b>token</b>.
        The data from the <em>payload</em> is considered valid and is used instead of the corresponding data from the main parameters.
        If the <b>token</b> is invalid, the command is not executed.<p>

    <p>See the <a href="<%= Url.Action("signature/") %>">Signature</a> configuration section to find more.</p>

    <note>
        <p>
            Please note that using the <b>local links</b> by the integrator requires the <em>JWT</em> in the config.
            Otherwise, an error will occur.
        </p>
        <p>
            Be sure to add a token when using local links in the following methods: <a href="<%= Url.Action("methods") %>#insertImage">insertImage</a>, 
            <a href="<%= Url.Action("methods") %>#setHistoryData">setHistoryData</a>, <a href="<%= Url.Action("methods") %>#setMailMergeRecipients">setMailMergeRecipients</a>,
            <a href="<%= Url.Action("methods") %>#setReferenceData">setReferenceData</a>, <a href="<%= Url.Action("methods") %>#setRevisedFile">setRevisedFile</a>.
            Moreover, it is necessary when defining the local url for <a href="<%= Url.Action("config/document") %>#url">opening</a> or <a href="<%= Url.Action("conversionapi") %>#url">conversion</a>.
        </p>
    </note>
</asp:Content>
