<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    WOPI discovery
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">WOPI discovery</span>
    </h1>

    <p class="dscr">
        <a href="https://wopi.readthedocs.io/en/latest/discovery.html" target="_blank">WOPI discovery</a> is a process which helps the WOPI server discover a WOPI client by requesting the discovery XML from an online office. 
        WOPI hosts use the discovery XML to specify how to interact with the online office.
    </p>


    <h2 id="actions" class="copy-link">WOPI discovery actions</h2>

    <p>The <b>action</b> element of the discovery XML provides the important characteristics about the online office. This element represents:</p>
    <ul>
        <li>available document operations in the online office,</li>
        <li>supported file formats (extensions).</li>
    </ul>

    <div class="header-gray">Attributes</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Name</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>requires</td>
                <td>The WOPI REST endpoints required to use the actions.</td>
            </tr>
            <tr>
                <td>urlsrc</td>
                <td>The URL that you navigate to in order to invoke the action on a particular file.</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">Example</div>
    <pre>
&lt;action name="edit" ext="docx" requires="locks,update"
    urlsrc="https://word-edit.officeapps.live.com/we/wordeditorframe.aspx?
&lt;ui=UI_LLCC&&gt;&lt;rs=DC_LLCC&&gt;&lt;showpagestats=PERFSTATS&&gt;"/&gt;
</pre>

    <p><b>Discovery query parameters</b> are the parameters that can be exposed by file storage in the <em>urlsrc</em> attribute to customize the editor behavior. 
        For example, change a language, theme or chat. These parameters must be in the following format:</p>
    <pre>
&lt;name=PLACEHOLDER_VALUE[&]&gt;
</pre>
    <p>where</p>
    <p><b>name</b> is the query name,</p>
    <p><b>PLACEHOLDER_VALUE</b> is a capitalized value that can be replaced by the host.</p>


    <h2 id="wopi-standart" class="copy-link">WOPI standart</h2>

    <div class="header-gray">Parameters</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col />
            <col class="table-example" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Name</td>
                <td>Placeholder</td>
                <td>Description</td>
                <td>Example</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>ui</td>
                <td>UI_LLCC</td>
                <td>Indicates that the WOPI server includes the preferred UI language in the format described in <a href="https://datatracker.ietf.org/doc/html/rfc1766.html" target="_blank">[RFC1766]</a>.</td>
                <td>&lt;ui="en-us"&&gt;</td>
            </tr>
            <tr>
                <td>rs</td>
                <td>DC_LLCC</td>
                <td>Indicates that the WOPI server includes preferred data language in the format described in <a href="https://datatracker.ietf.org/doc/html/rfc1766.html" target="_blank">[RFC1766]</a> for cases 
                    where the language can affect data calculation (in SSE).</td>
                <td>&lt;rs="en-us"&&gt;</td>
            </tr>
            <tr>
                <td>thm</td>
                <td>THEME_ID</td>
                <td>Indicates that the WOPI server includes a value to designate the theme used. The current values are <em>"1"</em> to indicate a light-colored theme 
                    and <em>"2"</em> to indicate a dark-colored theme.</td>
                <td>&lt;thm="1"&&gt;</td>
            </tr>
            <tr>
                <td>dchat</td>
                <td>DISABLE_CHAT</td>
                <td>Indicates that the WOPI server includes the value <em>"1"</em> to load a view of the document that does not create or join a chat session.</td>
                <td>&lt;dchat="1"&&gt;</td>
            </tr>
        </tbody>
    </table>

</asp:Content>
