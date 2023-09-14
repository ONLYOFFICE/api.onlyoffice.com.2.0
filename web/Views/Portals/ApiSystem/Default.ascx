<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Basic concepts</span>
</h1>

<p class="dscr">
    The ONLYOFFICE Hosted Solution is implemented as REST over HTTP using GET/POST.
    All the resources, like client creation, portal registration, etc, have their own URLs and are designed to be manipulated in isolation.
</p>
<h2>Authentication</h2>
<p>
    Authentication in the ONLYOFFICE Hosted Solution is managed via the HTTP authentication, i.e. every request must include the Authorization HTTP header. For information and examples please visit the <a href="<%= Url.Action("apisystem/authentication") %>">Authentication</a> section.
</p>
<h2>Making requests</h2>
<p>
    To identify the request and response format, please make sure that both the <b>Content-Type</b> and <b>Accept</b> headers are set to <em>application/json</em>.
    The API methods are called without specifying the format for the response and are returned in JSON format.
</p>
<h2>Responses</h2>
<p>
    <b>If a request succeeds, it will return a status code in the 200 range</b> and a JSON-formatted response.
    Note that, in general, if a request causes a new record to be created, the response will use the <b>201 Created</b> status. Any other successful operation will return a <em>200</em> status code.
</p>
<p>
    <b>If a request fails, a non-200 status code will be returned</b> in JSON format, containing the error code and additional error information (if available) as the response content.
</p>
<div class="header-gray">Possible error codes and their description</div>
<table class="table">
    <colgroup>
        <col />
        <col class="table-example" />
        <col />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>HTTP Status Code</td>
            <td>Error code</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>400</td>
            <td>portalNameEmpty</td>
            <td>The required parameter <b>portalName</b>, which must be present in the request, is not specified.</td>
        </tr>
        <tr class="tablerow">
            <td>400</td>
            <td>tooShortError</td>
            <td>The <b>portalName</b> specified in the request is too short.</td>
        </tr>
        <tr class="tablerow">
            <td>400</td>
            <td>portalNameIncorrect</td>
            <td>Invalid characters in the <b>portalName</b> parameter.</td>
        </tr>
        <tr class="tablerow">
            <td>400</td>
            <td>portalNameNotFound</td>
            <td>No portal with the portal name specified in the request has been registered.</td>
        </tr>
        <tr class="tablerow">
            <td>400</td>
            <td>portalNameExist</td>
            <td>Portal with the portal name specified in the request has already been registered.</td>
        </tr>
        <tr class="tablerow">
            <td>400</td>
            <td>portalsCountTooMuch</td>
            <td>The limit for the number of portals has been reached.</td>
        </tr>
        <tr class="tablerow">
            <td>400</td>
            <td>tooMuchAttempts</td>
            <td>The limit for the number of request attempts has been reached.</td>
        </tr>
        <tr class="tablerow">
            <td>400</td>
            <td>passPolicyError</td>
            <td>The password specified in the request does not meet the requirements.</td>
        </tr>
        <tr class="tablerow">
            <td>400</td>
            <td>recaptchaInvalid</td>
            <td>Invalid reCAPTCHA value has been entered.</td>
        </tr>
        <tr class="tablerow">
            <td>400</td>
            <td>params</td>
            <td>An error has been made in the method parameters specified in the request.</td>
        </tr>
        <tr class="tablerow">
            <td>403</td>
            <td>authorization</td>
            <td>Authorization error, the possible reasons: an unknown authorization scheme is used, or the authorization key is missing, or the authorization key time is out, or a wrong key is used.</td>
        </tr>
        <tr class="tablerow">
            <td>500</td>
            <td>authorization</td>
            <td>Internal server error when decoding the authorization key.</td>
        </tr>
        <tr class="tablerow">
            <td>500</td>
            <td>registerNewTenantError</td>
            <td>Internal server error when registering a new portal.</td>
        </tr>
        <tr class="tablerow">
            <td>500</td>
            <td>error</td>
            <td>Internal server error.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Get help</h2>

<p>If you have any questions or feature requests about ONLYOFFICE Hosted Solution, please visit <a href="https://forum.onlyoffice.com/c/cloud/31" target="_blank">ONLYOFFICE forum</a> (registration required).</p>
