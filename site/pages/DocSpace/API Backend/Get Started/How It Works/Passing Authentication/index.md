---
order: -4
---

The user needs to perform several easy steps to pass authentication:

1. Send POST request, containing the **UserName** and **Password** parameters to the api/2.0/authentication address:

   Example Authentication Request:

   ``` http
   POST /api/2.0/authentication HTTP/1.1
   Host: yourportal.onlyoffice.com
   Content-Type: application/json
   Accept: application/json

   {
       "UserName": "yourusername",
       "Password": "yourpassword"
   }
   ```

   > Please note, that you have to enter your own portal address to the *Host: yourportal.onlyoffice.com* line instead of *yourportal.onlyoffice.com* address.

   Example Response:

   ``` http
   HTTP/1.1 201 Created
   Content-Type: application/json; charset=utf-8
   {
       "count": 1,
       "response": {
           "Expires": "2010-07-07T17:06:03.5845502+03:00",
           "Token": "sdjhfskjdhkqy739459234"
       },
       "status": 0,
       "statusCode": 201
   }
   ```

2. In case authentication is successful, a token which will look like **sdjhfskjdhkqy739459234** will be received.

3. Use this token every time you call API methods inserting it to the **Authorization** HTTP header:

   Example API Request:

   ``` http
   GET /api/2.0/people/@self HTTP/1.1
   Host: yourportal.onlyoffice.com
   Accept: application/json
   Authorization: sdjhfskjdhkqy739459234
   ```

   > Please note, that you have to enter your own portal address to the *Host: yourportal.onlyoffice.com* line instead of *yourportal.onlyoffice.com* address.

## Authentication request examples

### C# authentication request example

``` cs
var request = System.Net.WebRequest.Create("https://yourportal.onlyoffice.com/api/2.0/authentication");
request.Method = "POST";
request.ContentType = "application/json";

var body = "{\"UserName\":\"yourusername\",\"Password\":\"yourpassword\"}";
var data = System.Text.Encoding.UTF8.GetBytes(body);

request.ContentLength = data.Length;
using (var stream = request.GetRequestStream())
{
    stream.Write(data, 0, data.Length);
}

var response = (System.Net.HttpWebResponse)request.GetResponse();
var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();
```

> Please note, that you have to enter your own portal address instead of *yourportal.onlyoffice.com* address.

### cURL authentication request example

``` sh
curl --request POST --header "Content-Type: application/json" --data "{\"UserName\":\"yourusername\",\"Password\":\"yourpassword\"}" "https://yourportal.onlyoffice.com/api/2.0/authentication"
```

> Please note, that you have to enter your own portal address instead of *yourportal.onlyoffice.com* address.
