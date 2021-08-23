<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Configuration
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">Configuration</span>
    </h1>

    <p class="dscr">Here you can find configuration file parameters that can be changed by the integrator using the WOPI protocol. 
        The full list of configuration parameters can be found <a href="<%= Url.Action("advanced") %>">on this page</a>.</p>

    <pre>
<a href="<%= Url.Action("config/") %>">config</a> = {
    "<a href="<%= Url.Action("config/") %>#documentType">documentType</a>": "word",
    "<a href="<%= Url.Action("config/") %>#token">token</a>": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.t-IDcSemACt8x4iTMCda8Yhe3iZaWbvV5XKSTbuAn0M",
    "<a href="<%= Url.Action("config/document") %>">document</a>": {
        "<a href="<%= Url.Action("config/document") %>#title">title</a>": "Example Document Title.docx",
        "<a href="<%= Url.Action("config/document") %>#url">url</a>": "https://example.com/url-to-example-document.docx",
        "<a href="<%= Url.Action("config/document") %>#fileType">fileType</a>": "docx",
        "<a href="<%= Url.Action("config/document") %>#key">key</a>": "Khirz6zTPdfd7",
        "<a href="<%= Url.Action("config/document/info") %>">info</a>": {
            "<a href="<%= Url.Action("config/document/info") %>#folder">folder</a>": "Example Files"
        },
        "<a href="<%= Url.Action("config/document/permissions") %>">permissions</a>": {
            "<a href="<%= Url.Action("config/document/permissions") %>#edit">edit</a>": true,
            "<a href="<%= Url.Action("config/document/permissions") %>#review">review</a>": true,
            "<a href="<%= Url.Action("config/document/permissions") %>#copy">copy</a>": true,
            "<a href="<%= Url.Action("config/document/permissions") %>#print">print</a>": true
        },
    },
    "<a href="<%= Url.Action("config/editor") %>">editorConfig</a>": {
        "<a href="<%= Url.Action("config/editor") %>#mode">mode</a>": "edit",
        "<a href="<%= Url.Action("config/editor") %>#lang">lang</a>": "en",
        "<a href="<%= Url.Action("config/editor") %>#region">region</a>": "en-US",
        "<a href="<%= Url.Action("config/editor") %>#callbackUrl">callbackUrl</a>": "https://example.com/url-to-callback.ashx",
        "<a href="<%= Url.Action("config/editor") %>#user">user</a>": {
            "group": "Group1",
            "id": "78e1e841",
            "name": "John Smith"
        },
        "<a href="<%= Url.Action("config/editor/customization") %>">customization</a>": {
            "<a href="<%= Url.Action("config/editor/customization") %>#chat">chat</a>": true,
            "<a href="<%= Url.Action("config/editor/customization") %>#uiTheme">uiTheme</a>": "theme-dark",
            "<a href="<%= Url.Action("config/editor/customization") %>#goback">goback</a>": {
                "url": "https://example.com"
            },
            "<a href="<%= Url.Action("config/editor/customization") %>#customer">customer</a>": {
                "name": "John Smith and Co.",
                "www": "example.com"
            }
        }
    },
    "<a href="<%= Url.Action("config/events") %>">events</a>": {
        "<a href="<%= Url.Action("config/events") %>#onAppReady">onAppReady</a>": onAppReady,
        "<a href="<%= Url.Action("config/events") %>#onDocumentStateChange">onDocumentStateChange</a>": onDocumentStateChange,
        "<a href="<%= Url.Action("config/events") %>#onRequestEditRights">onRequestEditRights</a>": onRequestEditRights,
        "<a href="<%= Url.Action("config/events") %>#onRequestClose">onRequestClose</a>": onRequestClose,
        "<a href="<%= Url.Action("config/events") %>#onRequestRename">onRequestRename</a>": onRequestRename,
        "<a href="<%= Url.Action("config/events") %>#onRequestSaveAs">onRequestSaveAs</a>": onRequestSaveAs,
        "<a href="<%= Url.Action("config/events") %>#onRequestHistory">onRequestHistory</a>": onRequestHistory
    }
};
</pre>

</asp:Content>
