<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

    <h1>
        <span class="hdr">WOPI discovery</span>
    </h1>

    <p class="dscr">
        <a href="https://docs.microsoft.com/en-us/microsoft-365/cloud-storage-partner-program/online/discovery" target="_blank">WOPI discovery</a> is a process which helps the WOPI server discover a WOPI client by requesting the discovery XML from an online office. 
        WOPI hosts use the discovery XML to specify how to interact with the online office. 
        The requests are sent to the <span class="fakelink">https://documentserver/hosting/discovery</span> address where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Docs installed.
    </p>


    <h2 id="actions" class="copy-link">WOPI discovery actions</h2>

    <p>The <b>action</b> element of the discovery XML provides the important characteristics of the online office. This element represents:</p>
    <ul>
        <li>available document operations in the online office,</li>
        <li>supported file formats (extensions).</li>
    </ul>

    <div class="header-gray">WOPI actions</div>
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
                <td id="view" class="copy-link">view</td>
                <td>Renders a non-editable view of a document.</td>
            </tr>
            <tr>
                <td id="edit" class="copy-link">edit</td>
                <td>Allows users to edit a document.</td>
            </tr>
            <tr>
                <td id="editnew" class="copy-link">editnew</td>
                <td>Creates a new document using a blank file template appropriate to the file type and opens this file for editing in the online office.</td>
            </tr>
            <tr>
                <td id="embedview" class="copy-link">embedview</td>
                <td>Renders a non-editable view of a document that is optimized for embedding in a web page. This action is available starting from version 7.2.</td>
            </tr>
            <tr>
                <td id="convert" class="copy-link">convert</td>
                <td>Converts a document in a <a href="<%= Url.Action("wopi/editingbinary") %>">binary format</a> (<em>doc, ppt, xls</em>) into a modern format (<em>docx, pptx, xlsx</em>) so that it can be edited in the online office.</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

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
    <div class="mobile-content"></div>

    <div class="header-gray">Example</div>
    <pre>
&lt;action name="edit" ext="docx" requires="locks,update"
    urlsrc="https://word-edit.officeapps.live.com/we/wordeditorframe.aspx?
ui=en-us&thm=1&"/&gt;
</pre>

    <p><b>Discovery query parameters</b> are the parameters that can be exposed by file storage in the <em>urlsrc</em> attribute to customize the editor behavior. 
        For example, change a language, theme, or chat.</p>


    <h2 id="wopi-standart" class="copy-link">WOPI standard</h2>

    <div class="header-gray">Parameters</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-example" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Name</td>
                <td>Description</td>
                <td>Example</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td id="ui" class="copy-link">ui</td>
                <td>Indicates that the WOPI server includes the preferred UI language in the format described in <a href="https://datatracker.ietf.org/doc/html/rfc1766.html" target="_blank">[RFC1766]</a>.</td>
                <td>en-us</td>
            </tr>
            <tr>
                <td id="rs" class="copy-link">rs</td>
                <td>Indicates that the WOPI server includes preferred data language in the format described in <a href="https://datatracker.ietf.org/doc/html/rfc1766.html" target="_blank">[RFC1766]</a> for cases 
                    where the language can affect data calculation (in spreadsheet editor).</td>
                <td>en-us</td>
            </tr>
            <tr>
                <td id="thm" class="copy-link">thm</td>
                <td>Indicates that the WOPI server includes a value to designate the theme used. The current values are <em>"1"</em> to indicate a light-colored theme 
                    and <em>"2"</em> to indicate a dark-colored theme.</td>
                <td>1</td>
            </tr>
            <tr>
                <td id="dchat" class="copy-link">dchat</td>
                <td>Indicates that the WOPI server includes the value <em>"1"</em> to load a view of the document that does not create or join a chat session.</td>
                <td>1</td>
            </tr>
            <tr>
                <td id="embed" class="copy-link">embed</td>
                <td>Indicates that the output of the action will be embedded in a web page (<b>true</b>).</td>
                <td>true</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <h2 id="nextcloud-specific" class="copy-link">Nextcloud specific</h2>
    <div class="header-gray">Parameters</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-example" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Name</td>
                <td>Description</td>
                <td>Example</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td id="lang" class="copy-link">lang</td>
                <td>Indicates that the Nextcloud WOPI server includes the document language in the format described in <a href="https://datatracker.ietf.org/doc/html/rfc1766.html" target="_blank">[RFC1766]</a>.
                This language is used when creating a new document with the <a href="#editnew">editnew</a> action.</td>
                <td>en-us</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <h2 id="collabora-specific" class="copy-link">Collabora specific</h2>

    <p>Please pay attention to the <em>discovery.xml</em> structure of the Collabora connectors. 
    They open the editor via the MIME-type which is included in the <em>app</em> element of the following structure:</p>
    <pre>
&lt;app name="application/msword"&gt;
    &lt;action default="true" ext="" name="edit" urlsrc="http://159.89.20.129:9980/loleaflet/ba528af/loleaflet.html?"/&gt;
&lt;/app&gt;
</pre>
    <p>The <em>app</em> element like this:</p>
    <pre>
&lt;app name="Word" favIconUrl="http://localhost:8000/web-apps/apps/documenteditor/main/resources/img/favicon.ico"&gt;
</pre>
    <p>is ignored by the Collabora connectors.</p>
