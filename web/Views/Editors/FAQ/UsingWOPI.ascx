<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Document Server FAQ: <br />
        Using WOPI</span>
</h1>

<% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="wopi_1">
    <dt>How to enable WOPI?</dt>
    <dd>
        <p>To enable WOPI, set the <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#wopi-enable" target="_blank">wopi.enable</a> parameter in the Document Server config to <b>true</b>.</p>
        <div class="header-gray">Parameters</div>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Name</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Example</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>wopi.enable</td>
                    <td>Defines if WOPI is enabled or not. The default value is <b>false</b>.</td>
                    <td>boolean</td>
                    <td>true</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>

        <div class="header-gray">Example</div>
        <pre>
{
    "wopi": {
        "enable": true
    }
}
</pre>
    </dd>
</dl>
<dl class="faq_block" id="wopi_2">
    <dt>How can I configure the Document Server to accept WOPI requests only from the trusted integrator?</dt>
    <dd>
        <p>The IP address of such the trusted integrator must be included in the <a href="https://docs.microsoft.com/en-us/microsoft-365/cloud-storage-partner-program/online/build-test-ship/settings#wopi-domain-allow-list" target="_blank">WOPI domain allow list</a>. 
        At the same time, access for all the other integrators must be denied.</p>
        <p>Follow the steps <a href="<%= Url.Action("wopi/") %>#ip-filter">in this section</a> to configure the Document Server IP filter.</p>
    </dd>
</dl>
<dl class="faq_block" id="wopi_3">
    <dt>Why do I need the discovery XML and how can I get it?</dt>
    <dd>
        <p><a href="https://docs.microsoft.com/en-us/microsoft-365/cloud-storage-partner-program/online/discovery" target="_blank">WOPI discovery</a> is a process which helps the WOPI server discover a WOPI client by requesting the discovery XML from an online office. 
        WOPI hosts use the discovery XML to specify how to interact with the online office. The <b>action</b> element of the discovery XML represents:</p>
        <ul>
            <li>available document operations in the online office,</li>
            <li>supported file formats (extensions).</li>
        </ul>
        <p>The requests are sent to the <span class="fakelink">https://documentserver/hosting/discovery</span> address where the <b>documentserver</b> is the name of the server with the ONLYOFFICE Docs installed.</p>
        <p>More information about WOPI discovery can be found <a href="<%= Url.Action("wopi/discovery") %>">here</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="wopi_4">
    <dt>How to customize the editor behavior via WOPI?</dt>
    <dd>
        <p>Every WOPI discovery action has two attributes:</p>
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
        <p>The editor behavior such as language, theme or chat can be customized via the <b>discovery query parameters</b> which are the parameters 
        that can be exposed by file storage in the <em>urlsrc</em> attribute.</p>
        <p>All the available discovery query parameters can be found <a href="<%= Url.Action("wopi/discovery") %>#wopi-standart">here</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="wopi_5">
    <dt>How to create an online office session within the application?</dt>
    <dd>
        <p>In order to create an online office session within your application, a host must create an HTML page that will host an iframe element within it pointing 
    to a particular <a href="<%= Url.Action("wopi/discovery") %>#actions">WOPI action URL</a>.</p>

        <p>The host page must contain the following elements:</p>
        <ul>
            <li>A <em>form</em> element via which the host must <em>POST</em> the <em>access_token</em> and <em>access_token_ttl</em> parameters to the online office iframe for security purposes.</li>
            <li>JavaScript code for interacting with the online office iframe using <a href="<%= Url.Action("wopi/postmessage") %>">PostMessage</a>.</li>
            <li>Specific CSS styles for the body element and online office to avoid visual bags. In addition, the host page should set an appropriate favicon 
            for the page using the favicon URL provided in <a href="<%= Url.Action("wopi/discovery") %>">WOPI discovery</a>.</li>
            <li>A <em>viewport</em> meta tag to avoid visual and functional problems in mobile browsers.</li>
        </ul>
        <p>An example of the host page code can be found <a href="<%= Url.Action("wopi/hostpage") %>">on this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="wopi_6">
    <dt>How to restrict public access to the data via WOPI?</dt>
    <dd>
        <p>To restrict public access to your data, a secure exchange of requests between an online office and an integrator must be configured.</p>

        <p>The integrator must check that the request is received from ONLYOFFICE Docs. It uses <a href="https://docs.microsoft.com/en-us/microsoft-365/cloud-storage-partner-program/online/scenarios/proofkeys" target="_blank">proof keys</a> for this purpose. 
        Document Server signs the request with a private key. The corresponding public key is written in the proof-key element in the <a href="<%= Url.Action("wopi/discovery") %>">WOPI discovery XML</a>. 
        The integrator checks the private key with the public key. The signature is sent with every request in the <b>X-WOPI-Proof</b> and <b>X-WOPI-ProofOld</b> HTTP headers.</p>
        <p>More information about proof keys can be found <a href="<%= Url.Action("wopi/proofkeys") %>">on this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="wopi_7">
    <dt>Where can I find possible WOPI error codes and their descriptions?</dt>
    <dd>
        <p>Possible WOPI error codes and their description you can find <a href="<%= Url.Action("wopi/restapi") %>">on this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="wopi_8">
    <dt>Which WOPI REST API operations are supported by ONLYOFFICE Docs?</dt>
    <dd>
        <p>ONLYOFFICE Docs uses the following WOPI operations: <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>">CheckFileInfo</a>,
        <a href="<%= Url.Action("wopi/restapi/getfile") %>">GetFile</a>, <a href="<%= Url.Action("wopi/restapi/lock") %>">Lock</a>,
        <a href="<%= Url.Action("wopi/restapi/refreshlock") %>">RefreshLock</a>, <a href="<%= Url.Action("wopi/restapi/unlock") %>">Unlock</a>,
        <a href="<%= Url.Action("wopi/restapi/putfile") %>">PutFile</a>, <a href="<%= Url.Action("wopi/restapi/renamefile") %>">RenameFile</a>.
        For more information about these operations, see the corresponding pages.</p>
    </dd>
</dl>
<dl class="faq_block" id="wopi_9">
    <dt>How to restrict access to the use of ONLYOFFICE server via WOPI?</dt>
    <dd>
        <p>You cannot restrict access to the use of ONLYOFFICE server via WOPI. Editing access cotrol is available only via ONLYOFFICE Docs API and based on JWT signature.
        The secret key is required to generate a <a href="<%= Url.Action("signature/browser") %>">file open request</a>.</p>
        <p>More information about signature can be found <a href="<%= Url.Action("signature") %>">here</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="wopi_10">
    <dt>How to get information about the file properties, access rights and editor settings via WOPI?</dt>
    <dd>
        <p>To get information about the file properties, access rights and editor settings, use the <b>CheckFileInfo</b> method.
        All the available parameters you can find <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>">on this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="wopi_11">
    <dt>What actions are supported via WOPI?</dt>
    <dd>
        <p>In addition to the basic actions of viewing, editing and co-editing, you can also close the editor, switch from the viewing into the editing mode, rename a file,
        open a dialog of sharing access settings, open the document version history, insert images from the storage.</p>
        <p>Find out more about additional actions through event handling <a href="<%= Url.Action("wopi/postmessage") %>">on this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="wopi_12">
    <dt>Which access rights can I set to the document via WOPI?</dt>
    <dd>
        <p>You can set access rights for viewing, editing, renaming, reviewing and printing.</p>
        <p>Find out more about access rights <a href="<%= Url.Action("wopi/postmessage") %>">on this page</a>.</p>
    </dd>
</dl>
<dl class="faq_block" id="wopi_13">
    <dt>What are the difference between ONLYOFFICE Docs API and WOPI?</dt>
    <dd>
        <p>You can integrate <a href="https://www.onlyoffice.com/office-suite.aspx" target="_blank">ONLYOFFICE Docs</a> with any cloud service using either API or WOPI.</p>
        <p>The table <a href="<%= Url.Action("wopi/apivswopi") %>">on this page</a> will help you find out the difference between these options.</p>
    </dd>
</dl>
