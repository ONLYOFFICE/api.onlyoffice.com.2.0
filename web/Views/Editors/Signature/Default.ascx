<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Signature</span>
</h1>
<p class="dscr">ONLYOFFICE Document Server <a href="<%= Url.Action("security") %>">uses</a> <b>tokens</b> generated using the JSON Web Tokens standard.</p>

<div class="note">This feature is used in <b>Document Server</b> starting with version 4.2</div>

<p>For the validation setup it is necessary to edit the <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#SecretKey" target="_blank">secret key</a> and <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-configuring.aspx#Token" target="_blank">token</a> parameters in the configuration file which can be found (or created) at the following path:</p>
<div>For Linux - <em>/etc/onlyoffice/documentserver/<b>local.json</b></em>.</div>
<div>For Windows - <em>%ProgramFiles%\ONLYOFFICE\DocumentServer\config\<b>local.json</b></em>.</div>

<div class="note">
    The default values are available in the <em>default.json</em> configuration file, which is available in the folders above (for Linux and Windows).
    Please do not edit the contents of the <em>default.json</em> file directly.
    The default values will be restored each time you restart Docker container or upgrade <b>Document Server</b> to a new version and all your changes will be lost.
</div>

<p>Restart the services for the config changes to take effect:</p>

<p><b>For RPM/DEB packages:</b></p>
<pre>
systemctl restart ds-*
</pre>

<p><b>For Docker:</b></p>
<pre>
supervisorctl restart all
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
            <td>Example</td>
        </tr>
    </thead>
    <tbody>
        <tr id="services.CoAuthoring.secret.browser.string" class="tablerow">
            <td>services.CoAuthoring.secret.browser.string</td>
            <td>
                Defines the <em>secret key</em> to generate a token in the client-side <a href="<%= Url.Action("signature/browser") %>">browser requests</a> to ONLYOFFICE Docs.
                Deprecated since version 7.2, please use <a href="#services.CoAuthoring.secret.inbox.string">services.CoAuthoring.secret.inbox.string</a> instead.
            </td>
            <td>string</td>
            <td>secret</td>
        </tr>
        <tr id="services.CoAuthoring.secret.inbox.string" class="tablerow">
            <td>services.CoAuthoring.secret.inbox.string</td>
            <td>Defines the <em>secret key</em> to generate a token in the <a href="<%= Url.Action("signature/request") %>#incoming">incoming HTTP requests</a> with the commands from the <b>document storage service</b> to the <b>document command service</b>, <b>document conversion service</b> and <b>document builder service</b> and a token in the client-side <a href="<%= Url.Action("signature/browser") %>">browser requests</a> to ONLYOFFICE Docs since version 7.2.</td>
            <td>string</td>
            <td>secret</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.secret.outbox.string</td>
            <td>Defines the <em>secret key</em> to generate a token in the <a href="<%= Url.Action("signature/request") %>#outgoing">outgoing HTTP requests</a> to the <em>callbackUrl</em> address by <b>document editing service</b>.</td>
            <td>string</td>
            <td>secret</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.token.enable.browser</td>
            <td>Defines if a token in the client-side <a href="<%= Url.Action("signature/browser") %>">browser requests</a> is enabled or not.</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.token.enable.request.inbox</td>
            <td>Defines if a token in the <a href="<%= Url.Action("signature/request") %>#incoming">incoming HTTP requests</a> is enabled or not.</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td>services.CoAuthoring.token.enable.request.outbox</td>
            <td>Defines if a token in the <a href="<%= Url.Action("signature/request") %>#outgoing">outgoing HTTP requests</a> is enabled or not.</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>


<div class="header-gray">Sample local.json configuration</div>
<pre>
{
    "services": {
        "CoAuthoring": {
            "secret": {
                "inbox": {
                    "string": "secret"
                },
                "outbox": {
                    "string": "secret"
                },
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
</pre>

<h2 id="code-samples" class="copy-link">Code samples for signature generation</h2>
<p>Below you can find examples of signature generation for init config and requests.
They are taken from <a href="<%= Url.Action("demopreview") %>">test samples</a> in different programming languages.
We advise you to use this code in your projects to generate signatures.</p>
<div class="container">
    <ul class="browser">
        <li class="browser tab active copy-link" id="csharp">C#</li>
        <li class="browser tab copy-link" id="java">Java</li>
        <li class="browser tab copy-link" id="nodejs">Node.js</li>
        <li class="browser tab copy-link" id="php">PHP</li>
        <li class="browser tab copy-link" id="python">Python</li>
        <li class="browser tab copy-link" id="ruby">Ruby</li>
        <li class="browser tab copy-link" id="go">Go</li>
    </ul>
    <div id="csharp" class="content active">
        <pre>
public static class JwtManager
{
    private static readonly string Secret;
    public static readonly bool Enabled;

    static JwtManager()
    {
        Secret = WebConfigurationManager.AppSettings["files.docservice.secret"] ?? "";
        Enabled = !string.IsNullOrEmpty(Secret);
    }

    public static string Encode(IDictionary&lt;string, object&gt; payload)
    {
        var encoder = new JwtEncoder(new HMACSHA256Algorithm(),
                                        new JsonNetSerializer(),
                                        new JwtBase64UrlEncoder());
        return encoder.Encode(payload, Secret);
    }
}
</pre>
    </div>
    <div id="java" class="content">
        <pre>
public static String CreateToken(Map<String, Object> payloadClaims)
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
</pre>
    </div>
    <div id="nodejs" class="content">
        <pre>
var configServer = require('config').get('server');
var cfgSignatureSecretExpiresIn = configServer.get('token.expiresIn');
var cfgSignatureSecret = configServer.get('token.secret');
var cfgSignatureSecretAlgorithmRequest = configServer.get('token.algorithmRequest');

documentService.getToken = function (data) {
    var options = {algorithm: cfgSignatureSecretAlgorithmRequest, expiresIn: cfgSignatureSecretExpiresIn};
    return jwt.sign(data, cfgSignatureSecret, options);
};
</pre>
    </div>
    <div id="php" class="content">
        <pre>
function jwtEncode($payload) {
    return \Firebase\JWT\JWT::encode($payload, $GLOBALS["DOC_SERV_JWT_SECRET"]);
}
</pre>
    </div>
    <div id="python" class="content">
        <pre>
def encode(payload):
    return jwt.encode(payload, config.DOC_SERV_JWT_SECRET, algorithm='HS256')

</pre>
    </div>
    <div id="ruby" class="content">
        <pre>
@jwt_secret = Rails.configuration.jwtSecret

class << self
    def encode(payload)
        return JWT.encode payload, @jwt_secret, 'HS256'
    end
end
</pre>
    </div>
    <div id="go" class="content">
        <pre>
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
</pre>
    </div>
</div>

<script type="text/javascript">
    $('ul.browser').on('click', 'li:not(.browser tab active)', function() {
        $(this)
        .addClass('active').siblings().removeClass('active')
        .closest('div.container').find('div.content').removeClass('active').eq($(this).index()).addClass('active');
    });
    var loc = window.location.hash;
    if (loc != "") {
        var id = loc.substring(1);;
        if ($('.browser .tab[id="' + id + '"]').length) {
            $('.browser .tab').removeClass('active');
            $('.browser .tab[id="' + id + '"]').addClass('active');
            $('.content').removeClass('active');
            $('.content[id="' + id + '"]').addClass('active');
        }
    }
</script>
