ONLYOFFICE Docs [uses](../../Get%20Started/How%20It%20Works/Security/index.md) **tokens** generated using the JSON Web Tokens standard.

> This feature is used in **ONLYOFFICE Docs** starting with version 4.2

For the validation setup it is necessary to edit the [secret key](https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#SecretKey) and [token](https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#Token) parameters in the configuration file which can be found (or created) at the following path:

For Linux - */etc/onlyoffice/documentserver/**local.json***.

For Windows - *%ProgramFiles%\ONLYOFFICE\DocumentServer\config\\**local.json***.

> The default values are available in the *default.json* configuration file, which is available in the folders above (for Linux and Windows). Please do not edit the contents of the *default.json* file directly. The default values will be restored each time you restart Docker container or upgrade **ONLYOFFICE Docs** to a new version and all your changes will be lost.

Restart the services for the config changes to take effect:

**For RPM/DEB packages:**

``` sh
systemctl restart ds-*
```

**For Docker:**

``` sh
supervisorctl restart all
```

## Parameters

| Parameter                                        | Type    | Example | Description                                                                                                                                                                                                                                                                                                                                                                             |
| ------------------------------------------------ | ------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| services.CoAuthoring.secret.browser.string       | string  | secret  | Defines the *secret key* to generate a token in the client-side [browser requests](Browser/index.md) to ONLYOFFICE Docs. Deprecated since version 7.2, please use [services.CoAuthoring.secret.inbox.string](#services.CoAuthoring.secret.inbox.string) instead.                                                                                                                        |
| services.CoAuthoring.secret.inbox.string         | string  | secret  | Defines the *secret key* to generate a token in the [incoming HTTP requests](Request/index.md#incoming-request) with the commands from the **document storage service** to the **document command service**, **document conversion service** and **document builder service** and a token in the client-side [browser requests](Browser/index.md) to ONLYOFFICE Docs since version 7.2. |
| services.CoAuthoring.secret.outbox.string        | string  | secret  | Defines the *secret key* to generate a token in the [outgoing HTTP requests](Request/index.md#outgoing-requests) to the *callbackUrl* address by **document editing service**.                                                                                                                                                                                                          |
| services.CoAuthoring.token.enable.browser        | boolean | false   | Defines if a token in the client-side [browser requests](Browser/index.md) is enabled or not.                                                                                                                                                                                                                                                                                           |
| services.CoAuthoring.token.enable.request.inbox  | boolean | false   | Defines if a token in the [incoming HTTP requests](Request/index.md#incoming-request) is enabled or not.                                                                                                                                                                                                                                                                                |
| services.CoAuthoring.token.enable.request.outbox | boolean | false   | Defines if a token in the [outgoing HTTP requests](Request/index.md#outgoing-requests) is enabled or not.                                                                                                                                                                                                                                                                               |

## Sample local.json configuration

``` json
{
  "services": {
    "CoAuthoring": {
      "secret": {
        "inbox": {
          "string": "secret"
        },
        "outbox": {
          "string": "secret"
        }
      },
      "token": {
        "enable": {
          "browser": true,
          "request": {
            "inbox": true,
            "outbox": true
          }
        }
      }
    }
  }
}
```

## Code samples for signature generation

Below you can find examples of signature generation for init config and requests. They are taken from [test samples](../../Get%20Started/Language-specific%20examples/index.md) in different programming languages. We advise you to use this code in your projects to generate signatures.

### C# example

``` cs
public static class JwtManager
{
    private static readonly string Secret;
    public static readonly bool Enabled;

    static JwtManager()
    {
        Secret = WebConfigurationManager.AppSettings["files.docservice.secret"] ?? "";
        Enabled = !string.IsNullOrEmpty(Secret);
    }

    public static string Encode(IDictionary<string, object> payload)
    {
        var encoder = new JwtEncoder(new HMACSHA256Algorithm(),
                                        new JsonNetSerializer(),
                                        new JwtBase64UrlEncoder());
        return encoder.Encode(payload, Secret);
    }
}
```

### Java example

``` java
public static String CreateToken(Map payloadClaims)
{
    try
    {
        String secret = ConfigManager.GetProperty("files.docservice.secret");
        Signer signer = HMACSigner.newSHA256Signer(secret);
        JWT jwt = new JWT();
        for (String key : payloadClaims.keySet())
        {
            jwt.addClaim(key, payloadClaims.get(key));
        }
        return JWT.getEncoder().encode(jwt, signer);
    }
    catch (Exception e)
    {
        return "";
    }
}
```

### Node.js example

``` ts
import config from "config"

const configServer = config.get("server")
const cfgSignatureSecretExpiresIn = configServer.get("token.expiresIn")
const cfgSignatureSecret = configServer.get("token.secret")
const cfgSignatureSecretAlgorithmRequest = configServer.get("token.algorithmRequest")
documentService.getToken = function getToken(data) {
  const options = {algorithm: cfgSignatureSecretAlgorithmRequest,
    expiresIn: cfgSignatureSecretExpiresIn}
  return jwt.sign(data, cfgSignatureSecret, options)
}
```

### PHP example

``` php
<?php
function jwtEncode($payload) {
    return \Firebase\JWT\JWT::encode($payload, $GLOBALS["DOC_SERV_JWT_SECRET"]);
}
?>
```

### Python example

``` py
def encode(payload):
    return jwt.encode(payload, config.DOC_SERV_JWT_SECRET, algorithm='HS256')
```

### Ruby example

``` rb
@jwt_secret = Rails.configuration.jwtSecret

class << self
    def encode(payload)
        return JWT.encode payload, @jwt_secret, 'HS256'
    end
end
```

### Go example

``` go
type onlyofficeJwtManager struct {
    key []byte
}

func (j onlyofficeJwtManager) Sign(payload interface {
    Valid() error
}) (string, error) {
    token := jwt.NewWithClaims(jwt.SigningMethodHS256, payload)
    ss, err := token.SignedString(j.key)

    if err != nil {
        return "", errors.New("could not generate a new jwt")
    }

    return ss, nil
}
```
