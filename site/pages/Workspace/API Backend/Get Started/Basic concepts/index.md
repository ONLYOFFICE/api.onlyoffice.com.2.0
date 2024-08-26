The ONLYOFFICE Workspace API is implemented as REST over HTTP using GET/POST/PUT/DELETE. All the resources, like posts or comments, have their own URLs and are designed to be manipulated in isolation.

## Authentication

Authentication in the ONLYOFFICE Workspace API is managed via the HTTP authentication, i.e. every request must include the Authorization HTTP header. For information and examples please visit the [Authentication](../Passing%20authentication/index.md) section.

## Making requests

To identify the request and response format, please make sure that both the **Content-Type** and **Accept** headers are set to *application/json* or *application/x-www-form-urlencoded*. Any API method can be called specifying the format for the response (json or xml).

**Example:**\
**api/2.0/people/@self** can be called both as **api/2.0/people/@self.json** and **api/2.0/people/@self.xml**. In the first case, the format of the returned media is = JSON, and the second option returns media as = XML.

By default, the XML format is used for the response if no format is specified in the request (e.g. **api/2.0/people/@self** will return XML media).

## Responses

**If a request succeeds, it will return a status code in the 200 range** and in case no format was specified in the request, it will return an XML-formatted response. Note that, in general, if a request causes a new record to be created (like a new post, or comment, etc.), the response will use the **201 Created** status. Any other successful operation (like a successful query, delete, or update) will return a 200 status code.

**If a request fails, a non-200 status code will be returned**, possibly with error information in XML format as the response content. For instance, if a requested record could not be found, the HTTP response might look something like:

``` http
HTTP/1.1 404 Not Found
```

## Rate limiting

You can perform up to 500 requests per 10-second period from the same IP address with one account. If you exceed this limit, a 503 response for the subsequent requests will be received. Check the **Retry-After** header to see how many seconds to wait before you try again.

## Conventions used in this documentation

The following notation is used in the documentation:\
**{text}**: indicates the text that should be replaced with your own data (ID, search query, etc.)
