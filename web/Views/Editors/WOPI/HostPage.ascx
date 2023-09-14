<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

    <h1>
        <span class="hdr">Host page</span>
    </h1>

    <p class="dscr">In order to create an online office session within your application, a host must create an HTML page that will host an iframe element within it pointing 
    to a particular <a href="<%= Url.Action("wopi/discovery") %>#actions">WOPI action URL</a>.</p>

    <p>The host page must contain the following elements:</p>
    <ul>
        <li>A <em>form</em> element via which the host must <em>POST</em> the <a href="#access_token">access_token</a> and <a href="#access_token_ttl">access_token_ttl</a> parameters to the online office iframe for security purposes.</li>
        <li>JavaScript code for interacting with the online office iframe using <a href="<%= Url.Action("wopi/postmessage") %>">PostMessage</a>.</li>
        <li>Specific CSS styles for the body element and online office to avoid visual bags. In addition, the host page should set an appropriate favicon 
        for the page using the favicon URL provided in <a href="<%= Url.Action("wopi/discovery") %>">WOPI discovery</a>.</li>
        <li>A <em>viewport</em> meta tag to avoid visual and functional problems in mobile browsers.</li>
    </ul>

    <div class="header-gray">Host page code</div>
    <pre>
&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"&gt;
&lt;html&gt;

&lt;head runat="server"&gt;
    &lt;meta http-equiv="Content-Type" content="text/html; charset=utf-8" /&gt;
    &lt;meta http-equiv="X-UA-Compatible" content="IE=edge" /&gt;
    &lt;meta name="viewport" content="width=device-width" /&gt;

    &lt;title&gt;ONLYOFFICE Document Editors&lt;/title&gt;
    &lt;link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon" /&gt;

    &lt;style type="text/css"&gt;
        body {
            margin: 0;
            padding: 0;
            overflow: hidden;
            -ms-content-zooming: none;
        }
        
        #office_frame {
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            margin: 0;
            border: none;
            display: block;
        }
    &lt;/style&gt;
&lt;/head&gt;

&lt;body&gt;

    &lt;form id="office_form" name="office_form" target="office_frame" action="&lt;%= actionUrl %&gt;" method="post"&gt;
        &lt;input name="access_token" value="&lt;%= token %&gt;" type="hidden" /&gt;
        &lt;input name="access_token_ttl" value="&lt;%= tokenTtl %&gt;" type="hidden" /&gt;
    &lt;/form&gt;

    &lt;span id="frameholder"&gt;&lt;/span&gt;

    &lt;script type="text/javascript"&gt;
        var frameholder = document.getElementById('frameholder');
        var office_frame = document.createElement('iframe');
        office_frame.name = 'office_frame';
        office_frame.id = 'office_frame';

        office_frame.title = 'Office Frame';
        office_frame.setAttribute('allowfullscreen', 'true');

        office_frame.setAttribute('sandbox', 'allow-scripts allow-same-origin allow-forms allow-popups allow-top-navigation allow-popups-to-escape-sandbox allow-downloads allow-modals');
        office_frame.setAttribute('allow', 'autoplay camera microphone display-capture');
        frameholder.appendChild(office_frame);

        document.getElementById('office_form').submit();
    &lt;/script&gt;

&lt;/body&gt;

&lt;/html&gt;
</pre>

    <note>Please note that the <em>"&lt;%= actionUrl %&gt;"</em>, <em>"&lt;%= token %&gt;"</em>, <em>"&lt;%= tokenTtl %&gt;"</em> strings will be rendered with the appropriate parameters.</note>
    <div class="header-gray">Parameters</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-type" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Name</td>
                <td>Description</td>
                <td>Type</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td id="access_token" class="copy-link">access_token</td>
                <td>An access token that the host will use to determine the identity and permissions of the issuer of a WOPI request.</td>
                <td>string</td>
            </tr>
            <tr>
                <td id="access_token_ttl" class="copy-link">access_token_ttl</td>
                <td>The time when an access token expires, represented as the number of milliseconds since January 1, 1970 UTC.
                It is recommended to set this parameter to 10 hours.</td>
                <td>integer</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>
    <p>Further information about building a host page can be found <a href="https://docs.microsoft.com/en-us/microsoft-365/cloud-storage-partner-program/online/hostpage" target="_blank">here</a>.</p>
