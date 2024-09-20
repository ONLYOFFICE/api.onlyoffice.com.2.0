---
order: -1
---

Webhooks are the HTTP/HTTPS callbacks triggered by the events of the API requests, such as POST, PUT, and DELETE. The SSL verification is set when configuring webhooks.

The DocSpace administrator can create webhooks, subscribe to them, and configure webhooks so that events on the portal trigger actions on external services. This approach can be useful for synchronizing and tracking certain events.

The instructions on how to create and configure webhooks can be found [here](https://helpcenter.onlyoffice.com/administration/docspace-webhooks.aspx).

The API methods for working with webhooks can be found in this section.

## Webhook request

The **Accept** and **Content-Type** webhook headers must be used. Custom headers are not available.

The API request is signed with the secret key which is generated when creating the webhook:

``` cs
private string GetSecretHash(string secretKey, string body)
{
    var secretBytes = Encoding.UTF8.GetBytes(secretKey);
    using var hasher = new HMACSHA256(secretBytes);
    var data = Encoding.UTF8.GetBytes(body);
    var hash = hasher.ComputeHash(data);
    return Convert.ToHexString(hash);
}
```

The secret key is sent in the **x-docspace-signature-256** header:

``` json
{
  "Accept": ["*/*"],
  "x-docspace-signature-256": ["sha256=0D4C9D09136103625379E0BC3AA6084E941EA2F2901A2C94FACEFE3A7F9688F3"]
}
```

The webhook request body contains the original request body.

## Timeout policy

The request timeout is 5 minutes:

``` cs
var lifeTime = TimeSpan.FromMinutes(5);

Func<IServiceProvider, HttpRequestMessage, IAsyncPolicy<HttpResponseMessage>> policyHandler = (s, _) =>
{
    var settings = s.GetRequiredService<Settings>();

    return HttpPolicyExtensions
        .HandleTransientHttpError()
        .OrResult(msg => msg.StatusCode == HttpStatusCode.NotFound)
        .WaitAndRetryAsync(settings.RepeatCount ?? 5, retryAttempt => TimeSpan.FromSeconds(Math.Pow(2, retryAttempt)));
};

services.AddHttpClient(WebhookSender.WEBHOOK)
.SetHandlerLifetime(lifeTime)
.AddPolicyHandler(policyHandler);

services.AddHttpClient(WebhookSender.WEBHOOK_SKIP_SSL)
.SetHandlerLifetime(lifeTime)
.AddPolicyHandler(policyHandler)
.ConfigurePrimaryHttpMessageHandler(_ =>
{
    return new HttpClientHandler
    {
        ServerCertificateCustomValidationCallback = (_, _, _, _) => true
    };
});
```

If the response contains the **5xx**, **408**, or **404** statuses, the request can be repeated. There are 5 requests available with an interval of 2 to the power of the attempt number, measured in seconds.

## Webhook response

There are no restrictions for the response body, except for the database limit on the *text* size. The response does not need to be signed. It must contain any successful status.

## Webhook queue

Each webhook is added to the queue and then sequentially retrieved from there. But webhooks are sent in parallel. Therefore, webhooks may not be in the same sequence as simulating events.

The pending webhooks in the queue are checked every 5 seconds, and up to 10 threads are started to send unprocessed webhooks.
