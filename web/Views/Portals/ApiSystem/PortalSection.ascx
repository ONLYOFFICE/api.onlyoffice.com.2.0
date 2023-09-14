<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Portals</span>
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
            <td><a href="<%= Url.Action("apisystem/portalsection/portalget") %>">Get portals</a></td>
            <td><a href="<%= Url.Action("apisystem/portalsection/portalget") %>">GET /api/portal/get</a></td>
            <td>Returns a list of all the portals registered for the user with the email address specified in the request.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("apisystem/portalsection/portalregister") %>">Register portal</a></td>
            <td><a href="<%= Url.Action("apisystem/portalsection/portalregister") %>">POST /api/portal/register</a></td>
            <td>Registers a new portal with the parameters specified in the request.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("apisystem/portalsection/portalremove") %>">Portal deletion</a></td>
            <td><a href="<%= Url.Action("apisystem/portalsection/portalremove") %>">DELETE /api/portal/remove</a></td>
            <td>Deletes a portal with a name specified in the request.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("apisystem/portalsection/portalstatus") %>">Portal status</a></td>
            <td><a href="<%= Url.Action("apisystem/portalsection/portalstatus") %>">PUT /api/portal/status</a></td>
            <td>Changes a portal activation status with a value specified in the request.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("apisystem/portalsection/validateportalname") %>">Validate portal name</a></td>
            <td><a href="<%= Url.Action("apisystem/portalsection/validateportalname") %>">POST /api/portal/validateportalname</a></td>
            <td>Checks if the specified name is available to create a portal.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
