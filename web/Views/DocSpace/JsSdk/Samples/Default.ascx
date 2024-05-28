<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl"%>

<h1>
    <span class="hdr">DocSpace JS SDK samples</span>
</h1>

<ul class="sample-block">
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a href="<%= Url.Action("jssdk/samples/sampleopenfile")%>">
            <div class="example-sample-img create-formal-document"></div>
        </a>
        <div class="sample-info">
            <p class="name-example-sample"><a href="<%= Url.Action("jssdk/samples/sampleopenfile")%>">Open file in ONLYOFFICE editors</a></p>
            <p>Open a file in ONLYOFFICE editors using FileSelector.</p>
        </div>
        <p class="block_more-sample"><a href="<%= Url.Action("jssdk/samples/sampleopenfile")%>">More</a></p>
    </li>
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a href="<%= Url.Action("jssdk/samples/authorization")%>">
            <div class="example-sample-img create-formal-document"></div>
        </a>
        <div class="sample-info">
            <p class="name-example-sample"><a href="<%= Url.Action("jssdk/samples/authorization")%>">Log in to DocSpace account</a></p>
            <p>Logs in to the DocSpace account using the specified email and password hash.</p>
        </div>
        <p class="block_more-sample"><a href="<%= Url.Action("jssdk/samples/authorization")%>">More</a></p>
    </li>
    <li class="sample-example" data-types="text-editor,spreadsheet,presentation,visual,non-system,ole-object">
        <a href="<%= Url.Action("jssdk/samples/createfileinselectedfolder")%>">
            <div class="example-sample-img create-formal-document"></div>
        </a>
        <div class="sample-info">
            <p class="name-example-sample"><a href="<%= Url.Action("jssdk/samples/createfileinselectedfolder")%>">Create file in selected folder</a></p>
            <p>Create file in selected folder and open it in editors.</p>
        </div>
        <p class="block_more-sample"><a href="<%= Url.Action("jssdk/samples/createfileinselectedfolder")%>">More</a></p>
    </li>
</ul>