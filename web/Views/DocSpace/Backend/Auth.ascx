<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">How to pass authentication?</span>
</h1>

<p>The user needs to perform several easy steps to pass authentication:</p>
<ol>
    <li>Send POST request, containing the <b>userName</b> and <b>password</b> parameters to the <a href="<%= Url.DocUrl("authentication", null, "post", "api/2.0/authentication", "docspace") %>">api/2.0/authentication</a> address:

        <div class="header-gray">Authentication Request</div>
        <pre>
POST /api/2.0/authentication.json HTTP/1.1
Host: yourportal.onlyoffice.com
Content-Type: application/json
Accept: application/json

{
    "userName": "yourusername",
    "password": "yourpassword"
}
</pre>
        <div class="note">Please note, that you have to enter your own portal address to the <em>Host: yourportal.onlyoffice.com</em> line instead of <em>yourportal.onlyoffice.com</em> address.</div>

        <div class="header-gray">Response</div>
        <pre>
HTTP/1.1 201 Created
Cache-Control: private
Content-Type: application/json; charset=utf-8
{
    "count": 1,
    "response": {
        "expires": "2010-07-07T17:06:03.5845502+03:00",
        "token": "sdjhfskjdhkqy739459234"
    },
    "status": 0,
    "statusCode": 201
}
</pre>
    </li>

    <li>In case authentication is successful, a token which will look like <b>sdjhfskjdhkqy739459234</b> will be received.</li>
    <li>Use this token every time you call API methods inserting it to the <b>Authorization</b> HTTP header:

        <div class="header-gray">Sample API Request</div>
        <pre>
GET api/2.0/people/@self.json HTTP/1.1
Host: yourportal.onlyoffice.com
Accept: application/json
Authorization:sdjhfskjdhkqy739459234
</pre>

        <div class="note">Please note, that you have to enter your own portal address to the <em>Host: yourportal.onlyoffice.com</em> line instead of <em>yourportal.onlyoffice.com</em> address.</div>
    </li>
</ol>

<div id="csharp" class="header-gray">C# authentication request example</div>
<pre>
var request = System.Net.WebRequest.Create("https://yourportal.onlyoffice.com/api/2.0/authentication.json");
request.Method = "POST";
request.ContentType = "application/json";

var body = "{\"userName\":\"yourusername\",\"password\":\"yourpassword\"}";
var data = System.Text.Encoding.UTF8.GetBytes(body);

request.ContentLength = data.Length;
using (var stream = request.GetRequestStream())
{
    stream.Write(data, 0, data.Length);
}

var response = (System.Net.HttpWebResponse)request.GetResponse();
var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();
</pre>
<div class="note">Please note, that you have to enter your own portal address instead of <em>yourportal.onlyoffice.com</em> address.</div>

<div id="curl" class="header-gray">cURL authentication request example</div>
<pre>
curl --request POST --header "Content-Type: application/json" --data "{\"username\":\"yourusername\",\"password\":\"yourpassword\"}" "https://yourportal.onlyoffice.com/api/2.0/authentication.json"
</pre>
<div class="note">Please note, that you have to enter your own portal address instead of <em>yourportal.onlyoffice.com</em> address.</div>
