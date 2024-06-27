﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<div class="help-wrapper">
    <h3 class="help-title">Get help</h3>

    <ul class="help-list">
        <li>If you have any questions about ONLYOFFICE Workspace, try the <a href="<%= Url.Action("backend/faq") %>">FAQ</a> section first.</li>
        <li>You can request a feature or report a bug by posting an issue on <a href="https://github.com/ONLYOFFICE/CommunityServer/issues" target="_blank">GitHub</a>.</li>
        <li>You can also ask our developers on <a href="https://forum.onlyoffice.com/c/workspace/33" target="_blank">ONLYOFFICE forum</a> (registration required).</li>
    </ul>
</div>