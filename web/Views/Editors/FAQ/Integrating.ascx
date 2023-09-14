<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Document Server FAQ: <br />
        Integrating questions</span>
</h1>

<% Html.RenderPartial("FAQ/FAQShared/ExpandCollapse");%>
<dl class="faq_block" id="integrating_1">
    <dt>Where can I find integration examples for ONLYOFFICE Document Server?</dt>
    <dd>
        <p>The examples of integration of Document Server with your own website can be found <a href="<%= Url.Action("demopreview") %>">here</a>. You can choose among different web development programming languages:</p>
        <ul class="columns-2">
            <li><a href="<%= Url.Action("example/csharp") %>">.Net (C#) / .Net (C# MVC)</a></li>
            <li><a href="<%= Url.Action("example/java") %>">Java</a></li>
            <li><a href="<%= Url.Action("example/javaspring") %>">Java Spring</a></li>
            <li><a href="<%= Url.Action("example/nodejs") %>">Node.js</a></li>
            <li><a href="<%= Url.Action("example/php") %>">PHP</a></li>
            <li><a href="<%= Url.Action("example/python") %>">Python</a></li>
            <li><a href="<%= Url.Action("example/ruby") %>">Ruby</a></li>
        </ul>
        <p>The examples will show where to get the source codes, how to install and set up the working examples for integrating Document Server into your website written with the help of one of these programming languages.</p>
        <p>If you want to connect Document Server to one of the existing document management services, you can see the ready-made connectors for the following services:</p>
        <ul class="columns-2">
            <li><a href="<%= Url.Action("alfresco") %>">Alfresco</a></li>
            <li><a href="<%= Url.Action("chamilo") %>">Chamilo</a></li>
            <li><a href="<%= Url.Action("confluence") %>">Confluence</a></li>
            <li><a href="<%= Url.Action("drupal") %>">Drupal</a></li>
            <li><a href="<%= Url.Action("humhub") %>">HumHub</a></li>
            <li><a href="<%= Url.Action("liferay") %>">Liferay</a></li>
            <li><a href="<%= Url.Action("mattermost") %>">Mattermost</a></li>
            <li><a href="<%= Url.Action("moodle") %>">Moodle</a></li>
            <li><a href="<%= Url.Action("nextcloud") %>">Nextcloud</a></li>
            <li><a href="<%= Url.Action("nuxeo") %>">Nuxeo</a></li>
            <li><a href="<%= Url.Action("odoo") %>">Odoo</a></li>
            <li><a href="<%= Url.Action("owncloud") %>">ownCloud</a></li>
            <li><a href="<%= Url.Action("plone") %>">Plone</a></li>
            <li><a href="<%= Url.Action("redmine") %>">Redmine</a></li>
            <li><a href="<%= Url.Action("sharepoint") %>">SharePoint</a></li>
            <li><a href="<%= Url.Action("strapi") %>">Strapi</a></li>
            <li><a href="<%= Url.Action("suitecrm") %>">SuiteCRM</a></li>
            <li><a href="<%= Url.Action("wordpress") %>">WordPress</a></li>
        </ul>
        <p>Most of the connectors are available from the corresponding service application store and are easy to install. Just follow the step-by-step instructions at the <a href="<%= Url.Action("plugins") %>">connector page</a> and connect Document Server to your service.</p>
    </dd>
</dl>
<dl class="faq_block" id="integrating_2">
    <dt>Which paths should I specify when integrating Document Server with my website?</dt>
    <dd>
        <p>After you download and unpack the examples for integration Document Server with your website, you need to open the source codes and replace all the instances of the <b>https://documentserver/</b> string with the actual address of your installed Document Server.</p>
    </dd>
</dl>
<dl class="faq_block" id="integrating_3">
    <dt>What settings should be used when connecting ONLYOFFICE to ownClowd/Nextcloud via a local and public network?</dt>
    <dd>
        <p>When connecting your ownCloud/Nextcloud installation to Document Server, you need to make sure that the server with Document Server installed is accessible both for the internet browsers and ownCloud/Nextcloud installations, i.e. the requests can be sent to and the responses can be accepted from the computer with Document Server installed.</p>
        <p>The interaction scheme between ownCloud installation and Document Server is available <a href="<%= Url.Action("owncloud") %>#settings">here</a>. If you use Nextcloud, visit <a href="<%= Url.Action("nextcloud") %>#settings">this page</a> to see how you can properly set up your server.</p>
    </dd>
</dl>