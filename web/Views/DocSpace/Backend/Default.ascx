﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Basic concepts</span>
</h1>

<p>
    The ONLYOFFICE DocSpace API is implemented as REST over HTTP using GET/POST/PUT/DELETE.
        All the resources, like posts or comments, have their own URLs and are designed to be manipulated in isolation.
</p>
<h2>Authentication</h2>
<p>
    Authentication in the ONLYOFFICE DocSpace API is managed via the HTTP authentication, i.e. every request must include the Authorization HTTP header.
        For information and examples please visit the <a href="<%= Url.Action("backend/auth") %>">Authentication</a> section.
</p>

<h2>Making requests
</h2>
<p>
    To identify the request and response format, please make sure that both the <b>Content-Type</b> and <b>Accept</b> headers are set to <em>application/json</em>.
        Any API method can be called specifying the json format for the response.
</p>
<h2>Responses
</h2>
<p>
    <b>If a request succeeds, it will return a status code in the 200 range</b> and a JSON-formatted response.
        Note that, in general, if a request causes a new record to be created (like a new post, or comment, etc.), the response will use the <b>201 Created</b> status.
        Any other successful operation (like a successful query, delete, or update) will return a 200 status code.
</p>
<p>
    <b>If a request fails, a non-200 status code will be returned</b> in JSON format, possibly with error information as the response content.
        For instance, if a requested record could not be found, the HTTP response might look something like:
</p>
<pre>HTTP/1.1 404 Not Found</pre>
<h2 id="rate-limiting" class="copy-link">Rate limiting</h2>
<p>Please pay attention to some restrictions on autentication requests:</p>
<ul>
    <li>You can perform up to 1500 authentication requests per minute.</li>
    <li>You can perform up to 50 simultaneous GET authentication requests.</li>
    <li>You can perform up to 15 simultaneous authentication requests of any type except GET.</li>
    <li>Some methods have additional restrictions. For example, you can perform up to 5 authentication requests per minute to collect passwords.</li>
</ul>

<p>If you exceed the limit, the <b>429 Too Many Requests</b> response for the subsequent requests will be received.
This response may contain additional headers:</p>
<ul>
    <li><b>X-Ratelimit-Limit</b>. Request limit per timespan: 100/30m.</li>
    <li><b>X-Ratelimit-Remaining</b>. The number of requests left for the time window.</li>
    <li><b>X-Ratelimit-Reset</b>. The remaining window before the rate limit resets in seconds.</li>
</ul>
<h2>Conventions used in this documentation</h2>
<p>
    The following notation is used in the documentation:<br />
    <b>{text}</b>: indicates the text that should be replaced with your own data (ID, search query, etc.)
</p>
