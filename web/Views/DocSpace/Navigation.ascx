<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>
<%@ 
    Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<MsDocEntryPoint>>"
%>

<% var entryPoints = Model as List<MsDocEntryPoint>; %>

<div class="nav-list">
    <div class="treeheader">Get Started</div>
    <ul class="side-nav root">
        <li>
            <a href="<%= Url.Action("basic") %>">Overview</a>
        </li>
        <div class="treeheader">JavaScript SDK</div>
        <ul class="side-nav root">
            <li>
                <a href="<%= Url.Action("jssdk/") %>">Basic concepts</a>
            </li>
            <li>
                <a href="<%= Url.Action("jssdk/initmodes") %>">Initialization modes</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("jssdk/initmodes/manager") %>">Manager</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("jssdk/initmodes/roomselector") %>">Room-selector</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("jssdk/initmodes/fileselector") %>">File-selector</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("jssdk/initmodes/editor") %>">Editor</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("jssdk/initmodes/viewer") %>">Viewer</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("jssdk/initmodes/system") %>">System</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("jssdk/config") %>">Config</a>
            </li>
            <li>
                <a href="<%= Url.Action("jssdk/methods") %>">Methods</a>
            </li>
            <li>
                <a href="<%= Url.Action("jssdk/events") %>">Events</a>
            </li>
        </ul>

        <div class="treeheader">API backend</div>
        <ul class="side-nav root">
            <li>
                <a href="<%= Url.Action("backend/") %>">Basic concepts</a>
            </li>
            <li>
                <a href="<%= Url.Action("backend/auth") %>">Passing authentication</a>
            </li>
            <% if (entryPoints != null && entryPoints.Any())
            { %>
            <% foreach (var entryPoint in entryPoints.OrderBy(x => x.Name).ToList())
            { %>
            <li>
                <a href="<%= Url.DocUrl(entryPoint, null, "docspace") %>"><%= entryPoint.Name %></a>
                <% var categories = entryPoint.Methods.Where(x => !string.IsNullOrEmpty(x.Category)).GroupBy(x => x.Category).OrderBy(x => x.Key).ToList(); %>
                <% var rootMethods = entryPoint.Methods.Where(x => string.IsNullOrEmpty(x.Category)).OrderBy(x => x.FunctionName).ToList(); %>
                <% if (categories.Any() || rootMethods.Any()) { %>
                <ul>
                    <% if (categories.Any()) { %>
                        <% foreach (var category in categories)
                        { %>
                            <li>
                                <a href="<%= Url.DocUrl(entryPoint.Name, category.Key, null, null, "docspace") %>"><%= category.Key %></a>
                                <% var methods = category.OrderBy(x => x.FunctionName).ToList(); %>
                                <% if (methods.Any()) { %>
                                    <ul>
                                        <% foreach (var method in methods) { %>
                                            <li>
                                                <a href="<%= Url.DocUrl(entryPoint, method, "docspace") %>"><%= method.FunctionName %></a>
                                            </li>
                                        <% } %>
                                    </ul>
                                <% } %>
                            </li>
                        <% } %>
                    <% } %>
                    <% if (rootMethods.Any()) { %>
                        <% foreach (var method in rootMethods)
                        { %>
                            <li>
                                <a href="<%= Url.DocUrl(entryPoint, method, "docspace") %>"><%= method.FunctionName %></a>
                            </li>
                        <% } %>
                    <% } %>
                </ul>
                <% } %>
            </li>
            <% } %>
            <% } %>
        </ul>

        <div class="treeheader">API system</div>
        <ul class="side-nav root">
            <li>
                <a href="<%= Url.Action("apisystem/") %>">Basic concepts</a>
            </li>
            <li>
                <a href="<%= Url.Action("apisystem/authentication") %>">Authentication</a>
            </li>
            <li>
                <a href="<%= Url.Action("apisystem/portalsection") %>">Portals</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("apisystem/portalsection/portalget") %>">Get portals</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("apisystem/portalsection/portalregister") %>">Register portal</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("apisystem/portalsection/portalremove") %>">Portal deletion</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("apisystem/portalsection/portalstatus") %>">Portal status</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("apisystem/portalsection/validateportalname") %>">Validate portal name</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("apisystem/tariffsection") %>">Billing</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("apisystem/tariffsection/tariffget") %>">Get tariff</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("apisystem/tariffsection/tariffset") %>">Set tariff</a>
                    </li>
                </ul>
            </li>
        </ul>

        <div class="treeheader">More information</div>
        <ul class="side-nav root">
            <li>
                <a href="/docspace-storybook" target="_blank">Storybook</a>
            </li>
            <li>
                <a href="<%= Url.Action("faq") %>">FAQ</a>
            </li>
            <li>
                <a href="<%= Url.Action("filters") %>">Filtering</a>
            </li>
            <li>
                <a href="<%= Url.Action("batch") %>">Batching</a>
            </li>
        </ul>
    </ul>
</div>
