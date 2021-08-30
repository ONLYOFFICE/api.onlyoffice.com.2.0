<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div class="layout-header">
    <div id="menu-button" class="left_menu <%= Html.IfController("Home") ? "mainMenu" : string.Empty %>">
        <span></span>
        <span></span>
        <span></span>
    </div>
    <a class="logo <%= Html.IfController("Home") ? "mainLogo" : string.Empty %>" href="<%= Url.Action("index", "home") %>"></a>
    <div id="header-button" class="ham_menu push menu-btn pushy-link">
        <span></span>
        <span></span>
        <span></span>
        <div class="mobile_table_contents"><span id="variable-heading"></span><div class="menu-header <%= Html.IfController("Home") ? "heading-menu" : string.Empty %>"></div></div>
        <div class="arrow-header"></div>
    </div>
    <nav class="pushy pushy-left pushy-submenu-closed">
        <div class="pushy-content">
            <ul id="nav-all-menu-items" class="top-nav all-menu-items">
                <% var subControllerObj = ViewContext.RequestContext.RouteData.Values["id"];
                   var subControllerStr = subControllerObj != null ? subControllerObj.ToString() : string.Empty;

                   var enabledProducts = Products.EnabledProducts();
                   foreach (var product in enabledProducts)
                   { %>
                <li class="pushy-submenu <%= Html.IfController(product.Id) || subControllerStr.Equals(product.Id, StringComparison.OrdinalIgnoreCase) ? "active" : "" %>">
                    <a href="<%= Url.Action("basic", product.Id) %>"><%= product.Title %></a>
                </li>
                <% } %>
            </ul>
        </div>
    </nav>
</div>
