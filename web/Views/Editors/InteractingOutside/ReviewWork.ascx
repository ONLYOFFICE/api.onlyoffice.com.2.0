<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("interactingoutside/") %>"></a>
    <span class="hdr">Working with review changes</span>
</h1>

<p class="dscr">Manages review process from an external source.</p>

<ul class="list-buttons doc-builder-list-buttons">
    <li>
        <a id="accept" class="button disabled">ACCEPT</a>
    </li>
    <li>
        <a id="reject" class="button disabled">REJECT</a>
    </li>
    <li>
        <a id="prev" class="button disabled"><</a>
    </li>
    <li>
        <a id="next" class="button disabled">></a>
    </li>
</ul>

<script id="scriptApi" type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_url"] ?? "" %>/web-apps/apps/api/documents/api.js"></script>

<div id="editorSpace">
    <div id="placeholder"></div>
</div>

<br/ >
<h1>How it works</h1>

<ol>
    <li>
        <p>When the user clicks the <b>Accept / Reject</b> buttons in the custom interface,
        the <a href="<%= Url.Action("executemethod/text/acceptreviewchanges", "plugin") %>">AcceptReviewChanges</a> / <a href="<%= Url.Action("executemethod/text/rejectreviewchanges", "plugin") %>">RejectReviewChanges</a> methods
        are executed to accept / reject the selected change in the editor:</p>
        <pre>
$("#accept").on("click", function () {
    connector.executeMethod("AcceptReviewChanges");
});

$("#reject").on("click", function () {
    connector.executeMethod("RejectReviewChanges");
});
</pre>
    </li>
    <li>
        <p>When the user clicks the arrow buttons in the custom interface, the <a href="<%= Url.Action("executemethod/text/movetonextreviewchange", "plugin") %>">MoveToNextReviewChange</a>
        method is executed to move between the next and previous review changes:</p>
        <pre>
$("#prev").on("click", function () {
    connector.executeMethod("MoveToNextReviewChange", [false]);
});

$("#next").on("click", function () {
    connector.executeMethod("MoveToNextReviewChange");
});
</pre>
    </li>
</ol>
<note>
    <p>Please note that the connector is available only for <b>ONLYOFFICE Developer Edition</b>.</p>
    <p>This class is an additional feature which is available at extra cost. If you have any questions, please contact our sales team at <a href="mailto:sales@onlyoffice.com" target="_blank">sales@onlyoffice.com</a>.</p>
</note>

<script type="text/javascript">
    var contentControls = [];
    var indexComment = 0;

    var config = <%= Config.Serialize(
        new Config
            {
                Document = new Config.DocumentConfig
                    {
                        FileType = "docx",
                        Key = "apiwh" + Guid.NewGuid(),
                        Permissions = new Config.DocumentConfig.PermissionsConfig
                        {
                                Edit = false,
                                Review = true
                        },
                        Title = "Demo.docx",
                        Url = ConfigurationManager.AppSettings["storage_demo_url"] + "review.docx"
                    },
                DocumentType = "word",
                EditorConfig = new Config.EditorConfigConfiguration
                    {
                        Mode = "edit",
                        CallbackUrl = Url.Action("callback", "editors", null, Request.Url.Scheme),
                        Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                            {
                                HideRightMenu = true,
                                HideRulers = true,
                                IntegrationMode = "embed",
                            }
                    },
                Height = "550px",
                Width = "100%"
            }) %>;

    var onDocumentReady = function () {
        window.connector = docEditor.createConnector();

        $(".list-buttons a").removeClass("disabled");
    };

    config.events = {
        onDocumentReady: onDocumentReady,
    };

    window.docEditor = new DocsAPI.DocEditor("placeholder", config);

    $("#accept").on("click", function () {
        connector.executeMethod("AcceptReviewChanges");
    });

    $("#reject").on("click", function () {
        connector.executeMethod("RejectReviewChanges");
    });

    $("#prev").on("click", function () {
        connector.executeMethod("MoveToNextReviewChange", [false]);
    });

    $("#next").on("click", function () {
        connector.executeMethod("MoveToNextReviewChange");
    });
</script>
