---
order: -3
---

[ONLYOFFICE DocSpace](https://www.onlyoffice.com/docspace.aspx) is a collaborative cloud platform that allows users to edit and collaborate on documents, spreadsheets, presentations, and forms in customizable rooms. It provides the following features:

- creating and customizing rooms for collaboration;
- creating, editing and viewing text documents, spreadsheets, presentations, fillable forms, PDFs, ebooks, multimedia files;
- inviting users to collaborate on files with them in real time.

The ONLYOFFICE DocSpace API is implemented as REST over HTTP using GET/POST/PUT/DELETE. All the resources, like posts or comments, have their own URLs and are designed to be manipulated in isolation.

## Authentication

Authentication in the ONLYOFFICE DocSpace API is managed via the HTTP authentication, i.e. every request must include the Authorization HTTP header. For information and examples please visit the [Authentication](../How%20It%20Works/Passing%20Authentication/index.md) section.

## Making requests

To identify the request and response format, please make sure that both the **Content-Type** and **Accept** headers are set to *application/json*. Any API method can be called specifying the json format for the response.

## Responses

**If a request succeeds, it will return a status code in the 200 range** and a JSON-formatted response. Note that, in general, if a request causes a new record to be created (like a new post, or comment, etc.), the response will use the **201 Created** status. Any other successful operation (like a successful query, delete, or update) will return a 200 status code.

**If a request fails, a non-200 status code will be returned** in JSON format, possibly with error information as the response content. For instance, if a requested record could not be found, the HTTP response might look something like:

``` http
HTTP/1.1 404 Not Found
```

## Rate limiting

Please pay attention to some restrictions on autentication requests:

- You can perform up to 1500 authentication requests per minute.
- You can perform up to 50 simultaneous GET authentication requests.
- You can perform up to 15 simultaneous authentication requests of any type except GET.
- Some methods have additional restrictions. For example, you can perform up to 5 authentication requests per minute to collect passwords.

If you exceed the limit, the **429 Too Many Requests** response for the subsequent requests will be received. This response may contain additional headers:

- **X-Ratelimit-Limit**. Request limit per timespan: 100/30m.
- **X-Ratelimit-Remaining**. The number of requests left for the time window.
- **X-Ratelimit-Reset**. The remaining window before the rate limit resets in seconds.

## Conventions used in this documentation

The following notation is used in the documentation:\
**{text}**: indicates the text that should be replaced with your own data (ID, search query, etc.)
