<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("command/") %>"></a>
    <span class="hdr">license</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Requests the license from Document Server with information about the server and user quota.</p>

<div class="header-gray">Request example</div>
<pre>
{
    "c": "license"
}
</pre>

<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
        <col class="table-example" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Description</td>
            <td>Type</td>
            <td>Presence</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td>c</td>
            <td>Defines the command type.</td>
            <td>string</td>
            <td>required</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Response example</div>

<pre>
{
    "error": 0,
    "license": {
        "end_date": "2021-07-07T23:59:59.000Z",
        "trial": false,
        "customization": false,
        "connections": 0,
        "connections_view": 0,
        "users_count": 10,
        "users_view_count": 10,
        "users_expire": 30
    },
    "server": {
        "resultType": 3,
        "packageType": 1,
        "buildDate": "2021-05-21T00:00:00.000Z",
        "buildVersion": "6.3.0",
        "buildNumber": 111
    },
    "quota": {
        "users": [
            {
                "userid": "uid-0",
                "expire": "2021-07-07T23:59:59.000Z"
            },
            {
                "userid": "uid-1",
                "expire": "2021-07-09T23:59:59.000Z"
            },
            ...
        ],
        "users_view": [
            {
                "userid": "uid-0",
                "expire": "2021-07-07T23:59:59.000Z"
            },
            {
                "userid": "uid-1",
                "expire": "2021-07-09T23:59:59.000Z"
            },
            ...
        ]
    }
}
</pre>

<div class="header-gray">Parameters</div>
<table class="table">
    <colgroup>
        <col class="table-name" />
        <col />
        <col class="table-type" />
        <col class="table-example" />
    </colgroup>
    <thead>
        <tr class="tablerow">
            <td>Parameter</td>
            <td>Description</td>
            <td>Type</td>
            <td>Presence</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td id="error" class="copy-link">error</td>
            <td>Defines an error code.</td>
            <td>integer</td>
            <td>required</td>
        </tr>
        <tr class="tablerow">
            <td id="license" class="copy-link">license</td>
            <td>Defines the document license information:
                <ul>
                    <li>
                        <b>end_date</b> - the license expiration date.
                        <br />
                        <b>type</b>: string
                        <br />
                        <b>presence</b>: required
                    </li>
                    <li>
                        <b>trial</b> - defines if the license is trial or not.
                        <br />
                        <b>type</b>: boolean
                        <br />
                        <b>presence</b>: required
                    </li>
                    <li>
                        <b>customization</b> - defines if the <a href="<%= Url.Action("config/editor/customization") %>">customization</a> parameters marked with the * sign are available for editing only in ONLYOFFICE Developer Edition or not.
                        <br />
                        <b>type</b>: boolean
                        <br />
                        <b>presence</b>: required
                    </li>
                    <li>
                        <b>connections</b> - the number of connections for the connection license.
                        <br />
                        <b>type</b>: integer
                        <br />
                        <b>presence</b>: optional
                    </li>
                    <li>
                        <b>connections_view</b> - the number of connections for the live viewer.
                        <br />
                        <b>type</b>: integer
                        <br />
                        <b>presence</b>: optional
                    </li>
                    <li>
                        <b>users_count</b> - the number of users for the user license.
                        <br />
                        <b>type</b>: integer
                        <br />
                        <b>presence</b>: optional
                    </li>
                    <li>
                        <b>users_view_count</b> - the number of users for the live viewer.
                        <br />
                        <b>type</b>: integer
                        <br />
                        <b>presence</b>: optional
                    </li>
                    <li>
                        <b>users_expire</b> - the number of days after which the user license expires.
                        <br />
                        <b>type</b>: integer
                        <br />
                        <b>presence</b>: optional
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td>required</td>
        </tr>
        <tr class="tablerow">
            <td id="server" class="copy-link">server</td>
            <td>Defines the server characteristics:
                <ul>
                    <li>
                        <b>resultType</b> - the license status (<b>1</b> - an error occurred, <b>2</b> - the license expired, <b>3</b> - the license is still available, <b>6</b> - the trial license expired).
                        <br />
                        <b>type</b>: integer
                        <br />
                        <b>presence</b>: required
                    </li>
                    <li>
                        <b>packageType</b> - the product version (<b>0</b> - an open source product, <b>1</b> - the Enterprise Edition, <b>2</b> - the Developer Edition).
                        <br />
                        <b>type</b>: integer
                        <br />
                        <b>presence</b>: required
                    </li>
                    <li>
                        <b>buildDate</b> - the build date.
                        <br />
                        <b>type</b>: string
                        <br />
                        <b>presence</b>: required
                    </li>
                    <li>
                        <b>buildVersion</b> - the build version.
                        <br />
                        <b>type</b>: string
                        <br />
                        <b>presence</b>: optional
                    </li>
                    <li>
                        <b>buildNumber</b> - the build number.
                        <br />
                        <b>type</b>: integer
                        <br />
                        <b>presence</b>: required
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td>required</td>
        </tr>
        <tr class="tablerow">
            <td id="quota" class="copy-link">quota</td>
            <td>Defines the user quota value:
                <ul>
                    <li>
                        <b>users</b> - the user quota for the user license where <em>userid</em> - the id of the user who opened the editor, <em>expire</em> - date of license expiration for this user.
                        <br />
                        <b>type</b>: array of objects
                        <br />
                        <b>presence</b>: required
                    </li>
                    <li>
                        <b>users_view</b> - the user quota for the live viewer where <em>userid</em> - the id of the user who opened the editor, <em>expire</em> - date of viewing expiration for this user.
                        <br />
                        <b>type</b>: array of objects
                        <br />
                        <b>presence</b>: required
                    </li>
                </ul>  
            </td>
            <td>object</td>
            <td>required</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
