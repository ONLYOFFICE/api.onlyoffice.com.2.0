<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<% var product = (Product)Model; %>

<div class="docs_block">
    <div class="api_title long">
        <div class="img-title-<%= product.Id %> block-img"></div>
        <p class="title-block"><a href="<%= Url.Action("basic", product.Id) %>"><%: product.Title %></a></p>
    </div>
    <div class="pp_info_block">
        <%: product.Description %>
        <p class="pp_info_block_more"><a href="<%= Url.Action("basic", product.Id) %>">More</a></p>
    </div>
    <% if (product.Links != null)
       { %>
    <div class="api_block_links">
        <div class="api_users_block">
            <% foreach (var linkGroup in product.Links)
               { %>
            <div class="product-link-column">
                <p class="programs-list-title"><%: linkGroup.Key %></p>
                <% foreach (var link in linkGroup.Value)
                   { %>
                <% const int maxLinkItem = 8;
                   if (linkGroup.Value.Count > maxLinkItem
                        && link.Item1 == linkGroup.Value[maxLinkItem - 1].Item1)
                   { %>
                <p class="programs-list spoiler_heading"><%: "more" %></p>
                <div class="spoiler_code">
                    <% for (var i = maxLinkItem - 1; i < linkGroup.Value.Count; i++)
                       { %>
                        <p class="programs-list"><a href="<%= Url.Action(linkGroup.Value[i].Item2, product.Id) %>"><%: linkGroup.Value[i].Item1 %></a></p>
                    <% } %>
                </div>
                <% break;
                   } %>
                <p class="programs-list"><a href="<%= Url.Action(link.Item2, product.Id) %>"><%: link.Item1 %></a></p>
                <% } %>
            </div>
            <% } %>
        </div>
        <div class="api_col_wrapper">
            <div class="api_products col_1"></div>
            <div class="api_products col_2"></div>
        </div>
    </div>
    <% } %>
</div>
