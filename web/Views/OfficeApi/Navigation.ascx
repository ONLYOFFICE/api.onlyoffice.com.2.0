<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>
<%@ Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl" %>

<div class="nav-list">
    <div class="treeheader">Get Started</div>
    <ul class="side-nav root">
        <li>
            <a href="<%= Url.Action("basic") %>">Overview</a>
        </li>
    </ul>

    <div class="treeheader">Office API</div>
    <ul class="side-nav root">
        <li>
            <a href="<%= Url.Action("textdocumentapi") %>">Text document API</a>
            <ul>
                <% foreach (var entry in DocBuilderDocumentation.Instance.GetModule("word")) { %>
                    <li>
                        <a href="<%= Url.Action(string.Format("textdocumentapi/{0}", entry.Key.ToLower())) %>"> <%= entry.Key %></a>
                        <ul>
                            <% foreach (var method in entry.Value.Methods) { %>
                                <li>
                                    <a title=<%= method.Key %> href="<%= Url.Action(string.Format("textdocumentapi/{0}/{1}", entry.Key.ToLower(), method.Key.ToLower())) %>"><%= method.Key %></a>
                                </li>
                            <% } %>
                            <% if (entry.Value.Events != null && entry.Value.Events.Any()) { %>
                                <% foreach (var ev in entry.Value.Events) { %>
                                    <li>
                                        <a title=<%= ev.Key %> href="<%= Url.Action(string.Format("textdocumentapi/{0}/event-{1}", entry.Key.ToLower(), ev.Key.ToLower())) %>"><%= ev.Key %></a>
                                    </li>
                                <% } %>
                            <% } %>
                        </ul>
                    </li>
                <% } %>
            </ul>
        <li>
            <a href="<%= Url.Action("spreadsheetapi") %>">Spreadsheet API</a>
            <ul>
                <% foreach (var entry in DocBuilderDocumentation.Instance.GetModule("cell")) { %>
                    <li>
                        <a href="<%= Url.Action(string.Format("spreadsheetapi/{0}", entry.Key.ToLower())) %>"> <%= entry.Key %></a>
                        <ul>
                            <% foreach (var method in entry.Value.Methods) { %>
                                <li>
                                    <a title=<%= method.Key %> href="<%= Url.Action(string.Format("spreadsheetapi/{0}/{1}", entry.Key.ToLower(), method.Key.ToLower())) %>"><%= method.Key %></a>
                                </li>
                            <% } %>
                            <% if (entry.Value.Events != null && entry.Value.Events.Any()) { %>
                                <% foreach (var ev in entry.Value.Events) { %>
                                    <li>
                                        <a title=<%= ev.Key %> href="<%= Url.Action(string.Format("spreadsheetapi/{0}/event-{1}", entry.Key.ToLower(), ev.Key.ToLower())) %>"><%= ev.Key %></a>
                                    </li>
                                <% } %>
                            <% } %>
                        </ul>
                    </li>
                <% } %>
            </ul>
        </li>
        <li>
            <a href="<%= Url.Action("presentationapi") %>">Presentation API</a>
            <ul>
                <% foreach (var entry in DocBuilderDocumentation.Instance.GetModule("slide")) { %>
                    <li>
                        <a href="<%= Url.Action(string.Format("presentationapi/{0}", entry.Key.ToLower())) %>"> <%= entry.Key %></a>
                        <ul>
                            <% foreach (var method in entry.Value.Methods) { %>
                                <li>
                                    <a title=<%= method.Key %> href="<%= Url.Action(string.Format("presentationapi/{0}/{1}", entry.Key.ToLower(), method.Key.ToLower())) %>"><%= method.Key %></a>
                                </li>
                            <% } %>
                            <% if (entry.Value.Events != null && entry.Value.Events.Any()) { %>
                                <% foreach (var ev in entry.Value.Events) { %>
                                    <li>
                                        <a title=<%= ev.Key %> href="<%= Url.Action(string.Format("presentationapi/{0}/event-{1}", entry.Key.ToLower(), ev.Key.ToLower())) %>"><%= ev.Key %></a>
                                    </li>
                                <% } %>
                            <% } %>
                        </ul>
                    </li>
                <% } %>
            </ul>
        </li>
        <li>
            <a href="<%= Url.Action("formapi") %>">Form API</a>
            <ul>
                <% foreach (var entry in DocBuilderDocumentation.Instance.GetModule("form")) { %>
                    <li>
                        <a href="<%= Url.Action(string.Format("formapi/{0}", entry.Key.ToLower())) %>"> <%= entry.Key %></a>
                        <ul>
                            <% foreach (var method in entry.Value.Methods) { %>
                                <li>
                                    <a title=<%= method.Key %> href="<%= Url.Action(string.Format("formapi/{0}/{1}", entry.Key.ToLower(), method.Key.ToLower())) %>"><%= method.Key %></a>
                                </li>
                            <% } %>
                        </ul>
                    </li>
                <% } %>
            </ul>
        </li>
        <li>
            <a href="<%= Url.Action("global") %>">Simple types</a>
        </li>
        <li>
            <a href="<%= Url.Action("buildersamples") %>">Builder samples</a>
            <ul>
                <li>
                    <a href="<%= Url.Action("buildersamples/createformaldocument") %>">Creating formal document</a>
                </li>
                <li>
                    <a href="<%= Url.Action("buildersamples/addwatermark") %>">Adding watermark</a>
                </li>
                <li>
                    <a href="<%= Url.Action("buildersamples/createtabledocument") %>">Creating table document</a>
                </li>
                <li>
                    <a href="<%= Url.Action("buildersamples/createreports") %>">Creating report document</a>
                </li>
                <li>
                    <a title="Creating mail merge receptions" href="<%= Url.Action("buildersamples/mailmergereceptions") %>">Creating mail merge receptions</a>
                </li>
                <li>
                    <a href="<%= Url.Action("buildersamples/fillspreadsheet") %>">Filling spreadsheet</a>
                </li>
                <li>
                    <a href="<%= Url.Action("buildersamples/createspreadsheetchart") %>">Creating spreadsheet chart</a>
                </li>
                <li>
                    <a title="Commenting spreadsheet errors" href="<%= Url.Action("buildersamples/commenterrors") %>">Commenting spreadsheet errors</a>
                </li>
                <li>
                    <a href="<%= Url.Action("buildersamples/createpresentation") %>">Creating presentation</a>
                </li>
                <li>
                    <a href="<%= Url.Action("buildersamples/createchartpresentation") %>">Creating chart presentation</a>
                </li>
                <li>
                    <a href="<%= Url.Action("buildersamples/createbasicform") %>">Creating basic form</a>
                </li>
                <li>
                    <a href="<%= Url.Action("buildersamples/createadvancedform") %>">Creating advanced form</a>
                </li>
                <li>
                    <a href="<%= Url.Action("buildersamples/fillform") %>">Filling form</a>
                </li>
            </ul>
        </li>
    </ul>

    <div class="treeheader">More information</div>
    <ul class="side-nav root">
        <li>
            <a href="<%= Url.Action("changelog") %>">Changelog</a>
        </li>
    </ul>
</div>
