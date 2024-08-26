---
order: -2
---

The ONLYOFFICE Hosted Solution is implemented as REST over HTTP using GET/POST. All the resources, like client creation, portal registration, etc, have their own URLs and are designed to be manipulated in isolation.

## Authentication

Authentication in the ONLYOFFICE Hosted Solution is managed via the HTTP authentication, i.e. every request must include the Authorization HTTP header. For information and examples please visit the [Authentication](../Authentication/index.md) section.

## Making requests

To identify the request and response format, please make sure that both the **Content-Type** and **Accept** headers are set to *application/json*. The API methods are called without specifying the format for the response and are returned in JSON format.

## Responses

**If a request succeeds, it will return a status code in the 200 range** and a JSON-formatted response. Note that, in general, if a request causes a new record to be created, the response will use the **201 Created** status. Any other successful operation will return a *200* status code.

**If a request fails, a non-200 status code will be returned** in JSON format, containing the error code and additional error information (if available) as the response content.

## Possible error codes and their description

| HTTP Status Code | Error code             | Description                                                                                                                                                                            |
| ---------------- | ---------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 400              | portalNameEmpty        | The required parameter **portalName**, which must be present in the request, is not specified.                                                                                         |
| 400              | tooShortError          | The **portalName** specified in the request is too short.                                                                                                                              |
| 400              | portalNameIncorrect    | Invalid characters in the **portalName** parameter.                                                                                                                                    |
| 400              | portalNameNotFound     | No portal with the portal name specified in the request has been registered.                                                                                                           |
| 400              | portalNameExist        | Portal with the portal name specified in the request has already been registered.                                                                                                      |
| 400              | portalsCountTooMuch    | The limit for the number of portals has been reached.                                                                                                                                  |
| 400              | tooMuchAttempts        | The limit for the number of request attempts has been reached.                                                                                                                         |
| 400              | passPolicyError        | The password specified in the request does not meet the requirements.                                                                                                                  |
| 400              | recaptchaInvalid       | Invalid reCAPTCHA value has been entered.                                                                                                                                              |
| 400              | params                 | An error has been made in the method parameters specified in the request.                                                                                                              |
| 403              | authorization          | Authorization error, the possible reasons: an unknown authorization scheme is used, or the authorization key is missing, or the authorization key time is out, or a wrong key is used. |
| 500              | authorization          | Internal server error when decoding the authorization key.                                                                                                                             |
| 500              | registerNewTenantError | Internal server error when registering a new portal.                                                                                                                                   |
| 500              | error                  | Internal server error.                                                                                                                                                                 |
