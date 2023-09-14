<%@ Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl" %>

<div class="nav-list">
    <div class="treeheader">Get Started</div>
    <ul class="side-nav root">
        <li>
            <a href="<%= Url.Action("basic") %>">Basic concepts</a>
        </li>
        <li>
            <a href="<%= Url.Action("getdocs") %>">Get ONLYOFFICE Docs</a>
        </li>
        <li>
            <a href="<%= Url.Action("try") %>">Try now</a>
        </li>
        <li>
            <a href="<%= Url.Action("demopreview") %>">Language-specific examples</a>
            <ul>
                <li>
                    <a href="<%= Url.Action("example/csharp") %>">.Net (C#) example</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/java") %>">Java example</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/javaspring") %>">Java Spring example</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/nodejs") %>">Node.js example</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/php") %>">PHP example</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/python") %>">Python example</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/ruby") %>">Ruby example</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="<%= Url.Action("frameworks") %>">Frontend frameworks</a>
            <ul>
                <li>
                    <a href="<%= Url.Action("angular") %>">Angular</a>
                </li>
                <li>
                    <a href="<%= Url.Action("react") %>">React</a>
                </li>
                <li>
                    <a href="<%= Url.Action("vue") %>">Vue</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="<%= Url.Action("plugins") %>">Ready-to-use connectors</a>
            <ul>
                <li>
                    <a href="<%= Url.Action("alfresco") %>">Alfresco integration</a>
                </li>
                <li>
                    <a href="<%= Url.Action("chamilo") %>">Chamilo integration</a>
                </li>
                <li>
                    <a href="<%= Url.Action("confluence") %>">Confluence integration</a>
                </li>
                <li>
                    <a href="<%= Url.Action("drupal") %>">Drupal integration</a>
                </li>
                <li>
                    <a href="<%= Url.Action("humhub") %>">HumHub integration</a>
                </li>
                <li>
                    <a href="<%= Url.Action("jira") %>">Jira integration</a>
                </li>
                <li>
                    <a href="<%= Url.Action("liferay") %>">Liferay integration</a>
                </li>
                <li>
                    <a href="<%= Url.Action("mattermost") %>">Mattermost integration</a>
                </li>
                <li>
                    <a href="<%= Url.Action("moodle") %>">Moodle integration</a>
                </li>
                <li>
                    <a href="<%= Url.Action("nextcloud") %>">Nextcloud integration</a>
                </li>
                <li>
                    <a href="<%= Url.Action("nuxeo") %>">Nuxeo integration</a>
                </li>
                <li>
                    <a href="<%= Url.Action("odoo") %>">Odoo integration</a>
                </li>
                <li>
                    <a href="<%= Url.Action("owncloud") %>">ownCloud integration</a>
                </li>
                <li>
                    <a href="<%= Url.Action("plone") %>">Plone integration</a>
                </li>
                <li>
                    <a href="<%= Url.Action("redmine") %>">Redmine integration</a>
                </li>
                <li>
                    <a href="<%= Url.Action("sharepoint") %>">SharePoint integration</a>
                </li>
                <li>
                    <a href="<%= Url.Action("strapi") %>">Strapi integration</a>
                </li>
                <li>
                    <a href="<%= Url.Action("suitecrm") %>">SuiteCRM integration</a>
                </li>
                <li>
                    <a href="<%= Url.Action("wordpress") %>">WordPress integration</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="<%= Url.Action("howitworks") %>">How it works</a>
            <ul>
                <li>
                    <a href="<%= Url.Action("open") %>">Opening file</a>
                </li>
                <li>
                    <a href="<%= Url.Action("save") %>">Saving file</a>
                </li>
                <li>
                    <a href="<%= Url.Action("coedit") %>">Co-editing</a>
                </li>
                <li>
                    <a href="<%= Url.Action("history") %>">Document history</a>
                </li>
                <li>
                    <a href="<%= Url.Action("actionlink") %>">Action link</a>
                </li>
                <li>
                    <a href="<%= Url.Action("mentions") %>">Mentions</a>
                </li>
                <li>
                    <a href="<%= Url.Action("rename") %>">Renaming files</a>
                </li>
                <li>
                    <a href="<%= Url.Action("review") %>">Reviewing</a>
                </li>
                <li>
                    <a href="<%= Url.Action("inlineeditors") %>">Inline editors</a>
                </li>
                <li>
                    <a href="<%= Url.Action("conversion") %>">Converting and downloading file</a>
                </li>
                <li>
                    <a href="<%= Url.Action("security") %>">Security</a>
                </li>
                <li>
                    <a href="<%= Url.Action("anonymoususers") %>">Anonymous users</a>
                </li>
                <li>
                    <a href="<%= Url.Action("commenting") %>">Commenting</a>
                </li>
                <li>
                    <a href="<%= Url.Action("comparing") %>">Comparing documents</a>
                </li>
                <li>
                    <a href="<%= Url.Action("viewing") %>">Viewing</a>
                </li>
                <li>
                    <a href="<%= Url.Action("mobileintegration") %>">Mobile integration</a>
                </li>
                <li>
                    <a href="<%= Url.Action("insertingexternaldata") %>">Inserting external data</a>
                </li>
                <li>
                    <a href="<%= Url.Action("embeddingforms") %>">Embedding forms into a web page</a>
                </li>
                <li>
                    <a href="<%= Url.Action("protectingranges") %>">Protecting ranges</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="<%= Url.Action("interactingoutside/") %>">External access to the document editing</a>
            <ul>
                <li>
                    <a href="<%= Url.Action("interactingoutside/comments") %>">Working with comments</a>
                </li>
                <li>
                    <a href="<%= Url.Action("interactingoutside/reviewwork") %>">Working with review changes</a>
                </li>
                <li>
                    <a href="<%= Url.Action("interactingoutside/fillingform") %>">Filling out the form</a>
                </li>
            </ul>
        </li>
    </ul>

    <div class="treeheader">Usage API</div>
    <ul class="side-nav root">
        <li>
            <a href="<%= Url.Action("advanced") %>">Advanced parameters</a>
        </li>
        <li>
            <a href="<%= Url.Action("config/") %>">Config</a>
            <ul>
                <li>
                    <a href="<%= Url.Action("config/document") %>">Document</a>
                    <ul class="">
                        <li>
                            <a href="<%= Url.Action("config/document/info") %>">Info</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("config/document/permissions") %>">Permissions</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="<%= Url.Action("config/editor") %>">Editor</a>
                    <ul>
                        <li>
                            <a href="<%= Url.Action("config/editor/customization") %>">Customization</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("config/editor/embedded") %>">Embedded</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("config/editor/plugins") %>">Plugins</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="<%= Url.Action("config/events") %>">Events</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="<%= Url.Action("methods") %>">Methods</a>
        </li>
        <li>
            <a href="<%= Url.Action("connector") %>">Automation API</a>
        </li>
        <li>
            <a href="<%= Url.Action("callback") %>">Callback handler</a>
        </li>
    </ul>

    <div class="treeheader">Using WOPI</div>
    <ul class="side-nav root">
        <li>
            <a href="<%= Url.Action("wopi/") %>">Overview</a>
        </li>
        <li>
            <a href="<%= Url.Action("wopi/discovery") %>">WOPI discovery</a>
        </li>
        <li>
            <a href="<%= Url.Action("wopi/hostpage") %>">Host page</a>
        </li>
        <li>
            <a href="<%= Url.Action("wopi/proofkeys") %>">Proof keys</a>
        </li>
        <li>
            <a href="<%= Url.Action("wopi/restapi") %>">WOPI REST API</a>
            <ul>
                <li>
                    <a href="<%= Url.Action("wopi/restapi/checkfileinfo") %>">CheckFileInfo</a>
                </li>
                <li>
                    <a href="<%= Url.Action("wopi/restapi/getfile") %>">GetFile</a>
                </li>
                <li>
                    <a href="<%= Url.Action("wopi/restapi/lock") %>">Lock</a>
                </li>
                <li>
                    <a href="<%= Url.Action("wopi/restapi/refreshlock") %>">RefreshLock</a>
                </li>
                <li>
                    <a href="<%= Url.Action("wopi/restapi/unlock") %>">Unlock</a>
                </li>
                <li>
                    <a href="<%= Url.Action("wopi/restapi/putfile") %>">PutFile</a>
                </li>
                <li>
                    <a href="<%= Url.Action("wopi/restapi/putrelativefile") %>">PutRelativeFile</a>
                </li>
                <li>
                    <a href="<%= Url.Action("wopi/restapi/renamefile") %>">RenameFile</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="<%= Url.Action("wopi/postmessage") %>">PostMessage</a>
        </li>
        <li>
            <a href="<%= Url.Action("wopi/conversionapi") %>">Conversion API</a>
        </li>
        <li>
            <a href="<%= Url.Action("wopi/editingbinary") %>">Editing binary documents</a>
        </li>
        <li>
            <a href="<%= Url.Action("wopi/apivswopi") %>">API vs WOPI</a>
        </li>
    </ul>

    <div class="treeheader">Additional API</div>
    <ul class="side-nav root">
        <li>
            <a href="<%= Url.Action("command/") %>">Command service</a>
            <ul>
                <li>
                    <a href="<%= Url.Action("command/drop") %>">drop</a>
                </li>
                <li>
                    <a href="<%= Url.Action("command/forcesave") %>">forcesave</a>
                </li>
                <li>
                    <a href="<%= Url.Action("command/info") %>">info</a>
                </li>
                <li>
                    <a href="<%= Url.Action("command/license") %>">license</a>
                </li>
                <li>
                    <a href="<%= Url.Action("command/meta") %>">meta</a>
                </li>
                <li>
                    <a href="<%= Url.Action("command/version") %>">version</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="<%= Url.Action("conversionapi") %>">Conversion API</a>
        </li>
        <li>
            <a href="<%= Url.Action("documentbuilderapi") %>">Document Builder API</a>
        </li>
        <li>
            <a href="<%= Url.Action("signature/") %>">Signature</a>
            <ul>
                <li>
                    <a href="<%= Url.Action("signature/browser") %>">Browser</a>
                </li>
                <li>
                    <a href="<%= Url.Action("signature/body") %>">Request</a>
                    <ul>
                        <li>
                            <a href="<%= Url.Action("signature/body") %>">Token in body</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("signature/request") %>">Token in header</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </li>
    </ul>

    <div class="treeheader">More information</div>
    <ul class="side-nav root">
        <li>
            <a href="<%= Url.Action("changelog") %>">Changelog</a>
        </li>
        <li>
            <a href="<%= Url.Action("faq") %>">FAQ</a>
            <ul>
                <li>
                    <a href="<%= Url.Action("faq/general") %>">General</a>
                </li>
                <li>
                    <a href="<%= Url.Action("faq/security") %>">Security</a>
                </li>
                <li>
                    <a href="<%= Url.Action("faq/sharing") %>">Sharing</a>
                </li>
                <li>
                    <a href="<%= Url.Action("faq/embedding") %>">Embedding</a>
                </li>
                <li>
                    <a href="<%= Url.Action("faq/coediting") %>">Co-editing</a>
                </li>
                <li>
                    <a href="<%= Url.Action("faq/customizing") %>">Customizing</a>
                </li>
                <li>
                    <a href="<%= Url.Action("faq/integrating") %>">Integrating</a>
                </li>
                <li>
                    <a href="<%= Url.Action("faq/editing") %>">Editing</a>
                </li>
                <li>
                    <a href="<%= Url.Action("faq/managingversions") %>">Managing versions</a>
                </li>
                <li>
                    <a href="<%= Url.Action("faq/saving") %>">Saving</a>
                </li>
                <li>
                    <a href="<%= Url.Action("faq/renaming") %>">Renaming</a>
                </li>
                <li>
                    <a href="<%= Url.Action("faq/usingwopi") %>">Using WOPI</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="<%= Url.Action("troubleshooting") %>">Troubleshooting</a>
        </li>
    </ul>
</div>