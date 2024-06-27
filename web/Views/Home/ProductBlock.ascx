﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<% var product = (Product)Model; %>

<div class="main-item <%= product.Id %>">
    <% if (product.Id == "docs") { %>
    <% Html.RenderPartial("Lines/docsLine"); %>
<% } else if (product.Id == "docspace") { %>
    <% Html.RenderPartial("Lines/docspaceLine"); %>
<% } else { %>
    <% Html.RenderPartial("Lines/workspaceLine"); %>
<% } %>
    <div class="main-item-wrapper">
        <div class="main-item-body">
            <div class="main-item-inner">
                <h2 class="main-item-title">
                    <a href="<%= Url.Action(product.Sections == null ? "basic": "index", product.Id) %>"><%= product.Title %></a>
                </h2>
                <p class="main-item-description"><%= product.Description %></p>
                <div class="main-item-more"><a href="<%= Url.Action(product.Sections == null ? "basic": "index", product.Id) %>">More</a></div>
            </div>
            <div class="main-item-img mobile">
                <a href="<%= Url.Action(product.Sections == null ? "basic": "index", product.Id) %>"><span class="img"></span></a>
            </div>
        </div>

        <ul class="main-item-links <%= product.Id %>">
            <%
                var sections = product.Sections;
                if (sections != null)
            {
                    foreach (var section in sections)
                    {
                        var productSection = Products.GetSection(product.Id, section);
                        var productUrl = Url.Action(productSection.Id, product.Id, null);
                        if (product.Id == "docs")
                        {
                           productUrl = Url.Action("basic", productSection.Id, null);
                        }
                    %>
                <li><a href="<%= productUrl %>" class="<%: productSection.Id %>"><%: productSection.Title %></a></li>
            <% } } %>
        </ul>
    </div>
    <div class="main-item-img desktop">
        <a href="<%= Url.Action(product.Sections == null ? "basic": "index", product.Id) %>"><span class="img"></span></a>
    </div>
</div>
