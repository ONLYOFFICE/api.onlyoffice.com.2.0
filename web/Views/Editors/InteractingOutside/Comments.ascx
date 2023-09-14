<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("interactingoutside/") %>"></a>
    <span class="hdr">Working with comments</span>
</h1>

<p class="dscr">Collects all the comments from the document and displays them in the custom interface.</p>

<div id="commentsBlock" name="commentsBlock" data-easy="true" class="docbuilder-script" spellcheck="false" hidden>
    <div id="comment" class="comment">
        <div class="comment-author" title="Author"></div>
        <div class="comment-date" title="Date"></div>
        <div class="comment-message" title="Message"></div>
    </div>
    <div id="replies"></div>
    <textarea id="addReplyArea" name="addReplyArea" class="add-reply-area" placeholder="Enter your reply here" hidden></textarea>
    <div id="empty-comment" hidden>There are no comments in the document.</div>
</div>

<textarea id="addCommentArea" name="addCommentArea" class="add-comment-area" placeholder="Enter your comment here" hidden></textarea>

<ul class="list-buttons doc-builder-list-buttons">
    <li>
        <a id="addReply" class="button disabled">ADD REPLY</a>
    </li>
    <li>
        <a id="deleteComment" class="button disabled">DELETE</a>
    </li>
    <li>
        <a id="addComment" class="button disabled">ADD COMMENT</a>
    </li>
    <li>
        <a id="prevComment" class="button disabled"><</a>
    </li>
    <li>
        <a id="nextComment" class="button disabled">></a>
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
        <p>When the user opens a document, the <a href="<%= Url.Action("executemethod/text/getallcomments", "plugin") %>">GetAllComments</a> method is executed
        to collect all the comments from the document and display them in the custom interface.
        The following comment data is displayed: the comment author, the time when the comment was posted, the comment text, and the comment replies:</p>
        <pre>
var comments = [];

var onDocumentReady = function () {
    window.connector = docEditor.createConnector();

    ...

    connector.executeMethod("GetAllComments", null, function (data) {
        comments = data;
    });

    ...

}
</pre>
    </li>
    <li>
        <p>When the user clicks the <b>Add comment</b> button in the custom interface, the <a href="<%= Url.Action("executemethod/text/addcomment", "plugin") %>">AddComment</a> method
        is executed to add a new comment to the document. After this method is called, the <a href="<%= Url.Action("events/onaddcomment", "plugin") %>">onAddComment</a> event
        is fired to add a new comment to an array with all the document comments:</p>
        <pre>
var onDocumentReady = function () {

    ...

    connector.attachEvent("onAddComment", function (val) {
        var index = comments.findIndex((comment) => comment["Id"] === val["Id"]);

        if (index == -1) {
            comments = [val, ...comments];
        }
    });

    ...
}

...

$("#addComment").on("click", function () {

    ...

    var comment = $("#addCommentArea").val();

    if (Boolean(comment)) {
        var currentdate = Date.now();
        var datetime = "" + currentdate;

        connector.executeMethod("AddComment", [{ 
                Text: comment, 
                UserName: "John Smith", 
                Time: datetime 
            }]
        );
    }

    ...

});
</pre>
    </li>
    <li>
        <p>When the user clicks the <b>Remove comment</b> button in the custom interface, the <a href="<%= Url.Action("executemethod/text/removecomments", "plugin") %>">RemoveComments</a> method
        is executed to remove a comment from the document. After this method is called, the <a href="<%= Url.Action("events/onremovecomment", "plugin") %>">onRemoveComment</a> event
        is fired to remove a comment from an array with all the document comments:</p>
        <pre>
var onDocumentReady = function () {

    ...

    connector.attachEvent("onRemoveComment", function (val) {
        const index = comments.findIndex((comment) => comment["Id"] === val["Id"]);

        if (index !== -1) {
            comments.splice(index, 1);
        }

        ...

    });

    ...
}

$("#deleteComment").on("click", function () {

    ...

    connector.executeMethod("RemoveComments", [[comments[indexComment]["Id"]]]);

    ...

});
</pre>
    </li>
    <li>
        <p>When the user clicks the arrow buttons in the custom interface, the <a href="<%= Url.Action("executemethod/text/movetocomment", "plugin") %>">MoveToComment</a> method
        is executed to move between the comments in the document:</p>
        <pre>

...

connector.executeMethod("MoveToComment", [comments[indexComment]["Id"]]);

...

</pre>
    </li>
    <li>
    <p>When the user clicks the <b>Add reply</b> button in the custom interface, the <a href="<%= Url.Action("executemethod/text/changecomment", "plugin") %>">ChangeComment</a> method
        is executed to add a reply to the existing comment by changing the <em>CommentData</em> object. After this method is called, the <a href="<%= Url.Action("events/onchangecommentdata", "plugin") %>">onChangeCommentData</a> event
        is fired to add a new comment reply to an array with all the document comments:</p>
        <pre>
var onDocumentReady = function () {

    ...

    connector.attachEvent("onChangeCommentData", function (val) {
        const index = comments.findIndex((comment) => comment["Id"] === val["Id"]);

        if (index !== -1) {
            comments[index]["Data"] = val["Data"];
        }
    });

    ...

}

$("#addReply").on("click", function () {

    ...

    var reply = $("#addReplyArea").val();

    if (Boolean(reply)) {
        var currentdate = Date.now();
        var datetime = "" + currentdate;

        comments[indexComment]["Data"]["Replies"].push({
            Text: reply
            Time: datetime,
            UserName: "John Smith"
        });

        connector.executeMethod(
            "ChangeComment", 
            [comments[indexComment]["Id"],
            comments[indexComment]["Data"]]
        );
    }

    ...

});
</pre>
    </li>
</ol>
<note>
    <p>Please note that the connector is available only for <b>ONLYOFFICE Developer Edition</b>.</p>
    <p>This class is an additional feature which is available at extra cost. If you have any questions, please contact our sales team at <a href="mailto:sales@onlyoffice.com" target="_blank">sales@onlyoffice.com</a>.</p>
</note>

<script type="text/javascript">
    var comments = [];
    var indexComment = 0;

    var config = <%= Config.Serialize(
        new Config
            {
                Document = new Config.DocumentConfig
                    {
                        FileType = "docx",
                        Key = "apiwh" + Guid.NewGuid(),
                        Permissions = new Config.DocumentConfig.PermissionsConfig(),
                        Title = "Example Title.docx",
                        Url = ConfigurationManager.AppSettings["storage_demo_url"] + "withcomments.docx"
                    },
                DocumentType = "word",
                EditorConfig = new Config.EditorConfigConfiguration
                    {
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

        connector.executeMethod("GetAllComments", null, function (data) {
            comments = data;
            renderComment();
        });

        connector.attachEvent("onAddComment", function (val) {
            var index = comments.findIndex((comment) => comment["Id"] === val["Id"])

            if (index == -1) {
                comments = [val, ...comments];
            }

            indexComment = 0;
            renderComment();
        });

        connector.attachEvent("onRemoveComment", function (val) {
            const index = comments.findIndex((comment) => comment["Id"] === val["Id"]);

            if (index !== -1) {
                comments.splice(index, 1);
            }

            if (indexComment >= comments.length && indexComment != 0) indexComment--;

            renderComment();
        });

            connector.attachEvent("onChangeCommentData", function (val) {
            const index = comments.findIndex((comment) => comment["Id"] === val["Id"]);

            if (index !== -1) {
                indexComment = index;
                comments[index]["Data"] = val["Data"];
                renderComment();
            }
        });
    };

    config.events = {
        onDocumentReady: onDocumentReady,
    };

    window.docEditor = new DocsAPI.DocEditor("placeholder", config);

    var renderComment = function () {
        var comment = $("#comment");
        var replies = $("#replies");

        replies.empty();

        if (comments.length == 0) {
            $("#comment div").html("");
            $(".list-buttons a").addClass("disabled");
            $("#addComment").removeClass("disabled");
            $("#comment").hide();
            $("#empty-comment").show();
        } else {
            $("#commentsBlock").show();
            $("#comment").show();
            $("#empty-comment").hide();
            $(".list-buttons a").removeClass("disabled");

            postСomment(
                comment,
                comments[indexComment]["Data"]["UserName"],
                comments[indexComment]["Data"]["Time"],
                comments[indexComment]["Data"]["Text"]
            );

            connector.executeMethod("MoveToComment", [comments[indexComment]["Id"]]);

            for (const element of comments[indexComment]["Data"]["Replies"]) {
                var reply = comment.clone().removeAttr('id').addClass("reply");

                postСomment(
                    reply,
                    element["UserName"],
                    element["Time"],
                    element["Text"]
                )

                replies.append(reply);
            }
        }
    };

    var postСomment = function (parrent, userName, time, text) {
        var author = parrent.find(".comment-author");
        var date = parrent.find(".comment-date");
        var message = parrent.find(".comment-message");

        author.text(author.attr("title") + ": " + userName);
        date.text(date.attr("title") + ": " + new Date(parseInt(time, 10)).toLocaleString());
        message.text(message.attr("title") + ": " + text);
    };

    $("#addReply").on("click", function () {
        if ($(this).hasClass("disabled")) { return; }

        if ($(this).hasClass("active")) {
            var reply = $("#addReplyArea").val();

            if (Boolean(reply)) {
                var currentdate = Date.now();
                var datetime = "" + currentdate;

                comments[indexComment]["Data"]["Replies"].push({ Text: reply, Time: datetime, UserName: "John Smith" });

                connector.executeMethod("ChangeComment", [comments[indexComment]["Id"], comments[indexComment]["Data"]]);
                $("#addReplyArea").val("");
            }

            $(this).removeClass("active");
            $("#addReplyArea").hide();
        } else {
            $(this).addClass("active");
            $("#addReplyArea").show();
        }
    });

    $("#addComment").on("click", function () {
        if ($(this).hasClass("active")) {
            var comment = $("#addCommentArea").val();

            if (Boolean(comment)) {
                var currentdate = Date.now();
                var datetime = "" + currentdate;

                connector.executeMethod("AddComment", [{ Text: comment, UserName: "John Smith", Time: datetime }]);
                $("#addCommentArea").val("");
            }

            $(this).removeClass("active");
            $("#commentsBlock").show();
            $("#addCommentArea").hide();
            $(".list-buttons a").removeClass("disabled");
        } else {
            $(this).addClass("active");

            $("#commentsBlock").hide();
            $("#addReplyArea").hide();
            $("#addCommentArea").show();

            $(".list-buttons a").addClass("disabled");

            $("#addReply").removeClass("active");
            $(this).removeClass("disabled");
        }
    });

    $("#deleteComment").on("click", function () {
        if ($(this).hasClass("disabled")) { return; }

        connector.executeMethod("RemoveComments", [[comments[indexComment]["Id"]]]);
        renderComment();
    });

    $("#nextComment").on("click", function () {
        if ($(this).hasClass("disabled")) { return; }

        if (indexComment < comments.length - 1) indexComment++;
        renderComment();
    });

    $("#prevComment").on("click", function () {
        if ($(this).hasClass("disabled")) { return; }

        if (indexComment > 0) {
            indexComment--;
        }

        renderComment();
    });
</script>
