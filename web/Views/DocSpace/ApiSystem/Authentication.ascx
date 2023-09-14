<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Authentication</span>
</h1>

<p class="dscr">
    An HTTP header is required to pass the authentication when performing the API request.
    The authentication requires a token to be used in the <b>Authorization</b> header of the HTTP request.
</p>
<p><b>Authentication Token</b> is a string sequence in the following format: "ASC <em>pkey</em>:<em>datetime</em>:<em>hash</em>", where</p>
<ul>
    <li><b>pkey</b> - random string,</li>
    <li><b>datetime</b> - current UTC date and time in the "<em>yyyyMMddHHmmss</em>" format,</li>
    <li><b>hash</b> - hash value for the string in the "<em>datetime</em>\n<em>pkey</em>" format.</li>
</ul>
<p>The hash value is calculated using the HMAC-SHA1 function with the key from the <em>core.machinekey</em> value of the Hosted Solution site <em>appSettings</em> configuration.</p>

<div class="note">
    Please note, that the token is valid for <b>5</b> minutes only, starting with the <b>datetime</b>.
</div>

<p>Authentication Token example will look like this: "<em>ASC abc:20100707140603:E7lwEXOplYS-0lbnV1XQnDSbi3w</em>"</p>

<div id="csharp" class="header-gray copy-link">.Net(C#) generating token example</div>
<pre>
public string CreateAuthToken(string pkey, string machinekey)
{
    using (var hasher = new System.Security.Cryptography.HMACSHA1(System.Text.Encoding.UTF8.GetBytes(machinekey)))
    {
        var now = DateTime.UtcNow.ToString("yyyyMMddHHmmss");
        var hash = System.Web.HttpServerUtility.UrlTokenEncode(hasher.ComputeHash(System.Text.Encoding.UTF8.GetBytes(string.Join("\n", now, pkey))));

        return string.Format("ASC {0}:{1}:{2}", pkey, now, hash);
    }
}
</pre>

<div id="bash" class="header-gray copy-link">Bash generating token example</div>
<pre>
CreateAuthToken() {
    pkey="$1";
    machinekey=$(echo -n "$2");
    now=$(date +"%Y%m%d%H%M%S");

    authkey=$(echo -n -e "${now}\n${pkey}" | openssl dgst -sha1 -binary -mac HMAC -macopt key:$machinekey | sed -e 's/^.* //');
    authkey=$(echo -n "${authkey}" | base64);

    echo "ASC ${pkey}:${now}:${authkey}";
}
</pre>

<div id="nodejs" class="header-gray copy-link">Node.js generating token example</div>
<pre>
var moment = require("moment");
var crypto = require("crypto");

var createToken = function (pkey, machinekey) {
    var now = moment.utc().format("YYYYMMDDHHmmss");

    var authkey = crypto.createHmac("sha1", machinekey).update(now + "\n" + pkey).digest("base64");

    authkey = authkey.replace(/\+/g, "-").replace(/\//g, "_");
    authkey = authkey.substr(0, authkey.length - 1);
    var hash = "ASC " + pkey + ":" + now + ":" + authkey;

    return hash;
};
</pre>

<div id="php" class="header-gray copy-link">PHP generating token example</div>
<pre>
function CreateAuthToken($pkey, $machinekey) {
    $now=gmdate('YmdHis');

    $authkey=hash_hmac('sha1', $now."\n".$pkey, $machinekey, true);
    $authkey=base64_encode($authkey);
    $authkey=str_replace(array("+", "/"), array("-", "_"), substr($authkey, 0, -1)).'1';

    return 'ASC '.$pkey.':'.$now.':'.$authkey;
}
</pre>

<div id="powershell" class="header-gray copy-link">PowerShell generating token example</div>
<pre>
function CreateAuthToken([string]$pkey, [string]$machinekey) {
    $hmacsha = New-Object System.Security.Cryptography.HMACSHA1
    $hmacsha.Key = [System.Text.Encoding]::UTF8.GetBytes($machinekey)

    [string]$now=(Get-Date -format "yyyyMMddHHmmss")
    [string]$hash = [System.Convert]::ToBase64String([byte[]]$hmacsha.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($now + "`n" + $pkey)))
   
    $hash = $hash.Replace('+', '-')
    $hash = $hash.Replace('/', '_')

    return "ASC {0}:{1}:{2}" -f $pkey, $now, $hash
}
</pre>

<div id="ruby" class="header-gray copy-link">Ruby generating token example</div>
<pre>
def create_auth_token(pkey, machine_key)
    now = Time.now.strftime('%Y%m%d%H%M%S')
    hash = Base64.strict_encode64(OpenSSL::HMAC.digest('sha1', machine_key, [now, pkey].join("\n")))
    "ASC #{pkey}:#{now}:#{hash.tr('+', '-').tr('/', '_').chop}"
end
</pre>

<div id="python" class="header-gray copy-link">Python generating token example</div>
<pre>
import base64
import hashlib
import hmac

from datetime import datetime, date, time

def create_auth_token(pkey, machine_key):

    machine_key = bytes(machine_key, 'UTF-8')
    now = datetime.strftime(datetime.utcnow(), "%Y%m%d%H%M%S")

    message = bytes('{0}\n{1}'.format(now, pkey), 'UTF-8')

    _hmac = hmac.new(machine_key, message, hashlib.sha1)
        
    signature = str(base64.urlsafe_b64encode(_hmac.digest()), 'UTF-8')
    signature = signature.replace('-', '+')
    signature = signature.replace('_', '/')
    token = 'ASC {0}:{1}:{2}'.format(pkey, now, signature)

    return token
</pre>

<div id="java" class="header-gray copy-link">Java generating token example</div>
<pre>
public String createAuthToken(String pkey, String machinekey) throws Exception
{
    java.time.OffsetDateTime date = java.time.OffsetDateTime.now(java.time.ZoneOffset.UTC);
    String time = date.format(java.time.format.DateTimeFormatter.ofPattern("YYYYMMddHHmmss"));
    String data = time + "\n" + pkey;

    javax.crypto.spec.SecretKeySpec signingKey = new javax.crypto.spec.SecretKeySpec(machinekey.getBytes(), "HmacSHA1");

    javax.crypto.Mac mac = javax.crypto.Mac.getInstance("HmacSHA1");
    mac.init(signingKey);
    String hash = java.util.Base64.getUrlEncoder().encodeToString(mac.doFinal(data.getBytes()));

    return String.format("ASC %1$s:%2$s:%3$s", pkey, time, hash);
}
</pre>
