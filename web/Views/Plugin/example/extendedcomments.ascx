<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("example/") %>"></a>
    <span class="hdr">Extended comments</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">Pastes, edits, and removes comments and replies (with user data) in a document.</p>
<p><b>Plugin type:</b> visual, non-system.</p>
<p><b>Supported editors:</b> documents.</p>

<img alt="ExtendedComments" src="<%= Url.Content("~/content/img/plugins/gifs/extended-comments.gif") %>" />


<div class="header-gray">Installation</div>
<p>Download this plugin from <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_extended_comments" target="_blank">GitHub</a> and install it following the
<a href="<%= Url.Action("installation/desktop") %>">desktop</a>, <a href="<%= Url.Action("installation/onpremises") %>">on-premises</a>,
or <a href="<%= Url.Action("installation/cloud") %>">cloud</a> installation instructions.</p>


<div class="header-gray">Usage</div>

<ol>
    <li>Open the <b>Plugins</b> tab and press <b>Extended comments</b>.</li>
    <li>Select the text you want to comment on. Enter the comment text and the author name in the fields. Define the <b>Problem Category</b>, <b>Severity</b>, and <b>Submitted by</b> fields for the comment and click the <b>Comment</b> button to add the comment into the document.</li>
    <li>All the document comments will be displayed in the lower plugin window.</li>
    <li>To delete any comment, select it in the lower plugin window and click the <b>Delete</b> button.</li>
    <li>To reply to any comment, select it in the lower plugin window and click the <b>Add reply</b> button. Enter a reply text, check if the comment is accepted or not, and click the <b>Reply</b> button.</li>
    <li>To edit any comment, click the <b>Edit</b> button, enter new text or change the comment properties, and click the <b>Ok</b> button.</li>
</ol>


<div class="header-gray">Plugin structure</div>

<p>Repository on GitHub: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_extended_comments" target="_blank">https://github.com/ONLYOFFICE/sdkjs-plugins/tree/master/example_extended_comments</a>.</p>
<ol>
    <li><em>config.json</em>, <em>index.html</em>, and <em>code.js</em></li>
    <li>Icons</li>
    <li>Third-party services:
        <ul>
            <li><a href="https://jquery.com" target="_blank">jQuery</a> - a fast and concise JavaScript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development. License: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/example_extended_comments/licenses/jQuery.license" target="_blank">MIT License</a>.</li>
            <li><a href="https://select2.org/" target="_blank">Select2</a> gives you a customizable select box with support for searching, tagging, remote data sets, infinite scrolling, and many other highly used options. License: <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/blob/master/example_extended_comments/licenses/Select2.license" target="_blank">MIT</a>.</li>
        </ul>
    </li>
</ol>


<div class="header-gray">Config</div>
<pre>
{
    "name" : "Extended comments",
    "guid" : "asc.{91EAC419-EF8B-440C-A960-B451C7DF3A37}",

    "variations" : [
        {
            "description" : "Extended comments",
            "url"         : "index.html",

            "icons": [ "resources/light/icon.png", "resources/light/icon@2x.png" ],
            "icons2": [
                {
                    "style" : "light",
                    
                    "100%": {
                        "normal": "resources/light/icon.png"
                    },
                    "125%": {
                        "normal": "resources/light/icon@1.25x.png"
                    },
                    "150%": {
                        "normal": "resources/light/icon@1.5x.png"
                    },
                    "175%": {
                        "normal": "resources/light/icon@1.75x.png"
                    },
                    "200%": {
                        "normal": "resources/light/icon@2x.png"
                    }
                },
                {
                    "style" : "dark",
                    
                    "100%": {
                        "normal": "resources/dark/icon.png"
                    },
                    "125%": {
                        "normal": "resources/dark/icon@1.25x.png"
                    },
                    "150%": {
                        "normal": "resources/dark/icon@1.5x.png"
                    },
                    "175%": {
                        "normal": "resources/dark/icon@1.75x.png"
                    },
                    "200%": {
                        "normal": "resources/dark/icon@2x.png"
                    }
                }
            ],
            "isViewer"        : false,
            "EditorsSupport"  : ["word"],

            "isVisual"        : true,
            "isModal"         : false,
            "isInsideMode"    : true,

            "initDataType"    : "none",
            "initData"        : "",

            "buttons"         : [],
            "events" : ["onAddComment", "onRemoveComment", "onChangeCommentData"]

        }
    ]
}
</pre>


<div class="header-gray">Methods and events</div>

<ul class="columns-2">
    <li><a href="<%= Url.Action("events/button") %>">button</a></li>
    <li><a href="<%= Url.Action("events/init") %>">init</a></li>
    <li><a href="<%= Url.Action("events/onaddcomment") %>">onAddComment</a></li>
    <li><a href="<%= Url.Action("events/onchangecommentData") %>">onChangeCommentData</a></li>
    <li><a href="<%= Url.Action("events/onremovecomment") %>">onRemoveComment</a></li>
    <li><a href="<%= Url.Action("executecommand") %>">executeCommand</a></li>
    <li><a href="<%= Url.Action("executemethod/text/addcomment") %>">executeMethod ("AddComment")</a></li>
    <li><a href="<%= Url.Action("executemethod/text/changecomment") %>">executeMethod ("ChangeComment")</a></li>
    <li><a href="<%= Url.Action("executemethod/text/getallcomments") %>">executeMethod ("GetAllComments")</a></li>
    <li><a href="<%= Url.Action("executemethod/text/movetocomment") %>">executeMethod ("MoveToComment")</a></li>
    <li><a href="<%= Url.Action("executemethod/text/removecomments") %>">executeMethod ("RemoveComments")</a></li>
</ul>


<div class="header-gray">Support</div>

<p>If you want to request a feature or report a bug regarding this plugin, use the issues section on <a href="https://github.com/ONLYOFFICE/sdkjs-plugins/issues" target="_blank">GitHub</a>.</p>
