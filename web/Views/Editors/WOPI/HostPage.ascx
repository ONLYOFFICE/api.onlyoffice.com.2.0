<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

    <h1>
        <a class="up" href="<%= Url.Action("wopi/") %>"></a>
        <span class="hdr">Host page</span>
    </h1>

    <p class="dscr">In order to create an online office session within your application, a host must create an HTML page that will host an iframe element within it pointing 
    to a particular <a href="<%= Url.Action("wopi/discovery") %>#actions">WOPI action URL</a>.</p>

    <p>The host page must contain the following elements:</p>
    <ul>
        <li>A <em>form</em> element via which the host must <em>POST</em> the <em>access_token</em> and <em>access_token_ttl</em> parameters to the online office iframe for security purposes.</li>
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
        &lt;input name="access_token" value="&lt;%= token %&gt;&lt;%= params %&gt;" type="hidden" /&gt;
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

        office_frame.setAttribute('sandbox', 'allow-scripts allow-same-origin allow-forms allow-popups allow-top-navigation allow-popups-to-escape-sandbox');
        frameholder.appendChild(office_frame);

        document.getElementById('office_form').submit();
    &lt;/script&gt;

&lt;/body&gt;

&lt;/html&gt;
</pre>

    <p>Further information about building a host page can be found <a href="https://wopi.readthedocs.io/en/latest/hostpage.html" target="_blank">here</a>.</p>
