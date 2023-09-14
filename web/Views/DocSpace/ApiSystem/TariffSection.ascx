<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Billing</span>
</h1>

<table class="table hover">
    <colgroup>
        <col class="table-name" />
        <col />
        <col />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Method</td>
            <td>Resource</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("apisystem/tariffsection/tariffget") %>">Get tariff</a></td>
            <td><a href="<%= Url.Action("apisystem/tariffsection/tariffget") %>">GET /api/tariff/get</a></td>
            <td>Returns a pricing plan of a portal with a name specified in the request.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("apisystem/tariffsection/tariffset") %>">Set tariff</a></td>
            <td><a href="<%= Url.Action("apisystem/tariffsection/tariffset") %>">PUT /api/tariff/set</a></td>
            <td>Changes the portal pricing plan with the parameters specified in the request.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
