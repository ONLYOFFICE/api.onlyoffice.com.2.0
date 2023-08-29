<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <a class="up" href="<%= Url.Action("howitworks/") %>"></a>
   <span class="hdr">Encrypting local documents</span>
</h1>

<p>To protect your local documents, spreadsheets and presentations, encrypt them with a simple symmetric encryption plugin. The steps below explain how to do it.</p>


<h2>Step 1. Creating the Encryption plugin for the editor</h2>

<p>To build the <b>Encryption</b> plugin, you need to create three files:</p>
<ul>
    <li>HTML file with the interface,</li>
    <li>JS file with code,</li>
    <li>JSON file with config.</li>
</ul>

<p>More information about the plugin structure can be found <a href="<%= Url.Action("structure", "plugin") %>">here</a>.</p>
<p>Let&#8217;s have a look at the config:</p>
<pre>
{
    "name" : "crypto",
    "guid" : "asc.{22222222-2222-2222-2222-222222222222}",

    "variations" : [
        {
            "url"         : "index.html",

            "icons"           : [],

            "isViewer"        : true,
            "EditorsSupport"  : ["word", "cell", "slide"],

            "isVisual"        : false,
            "isModal"         : false,
            "isInsideMode"    : false,

            "initDataType"    : "desktop",
            "initData"        : "encryption",
            "cryptoMode"      : "2",

            "cryptoDisabledForInternalCloud" : "true",
            "cryptoDisabledForExternalCloud" : "true"
        }
    ]
}
</pre>

<p>All the config parameters are described in the <a href="<%= Url.Action("config", "plugin") %>">documentation</a>.</p>
<p>After the config file is ready, create the plugin code file with the following contents:</p>
<pre>
(function (window, undefined) {
    const global_password = "{my-super-long-password}";
    window.Asc.plugin.init = function (obj)
    {
        if (!obj)
        return;

        switch (obj.type)
        {
            case "generatePassword":
            {
                this.executeMethod ("OnEncryption", [{type: "generatePassword", password: global_password}]);
                break;
            }
            case "getPasswordByFile":
            {
                this.executeMethod("OnEncryption", [{type: "getPasswordByFile", password: global_password}]);
                break;
            }
            case "setPasswordByFile":
            {
                this.executeMethod("StartAction", ["Info", "Save"]);
                this.executeMethod("EndAction", ["Info", "Save"]);
                break;
            }
            case "encryptData":
            {
                this.executeMethod("OnEncryption", [{type: "encryptData", data: obj.data, check: true}]);
                break;
            }
            case "decryptData":
            {
                this.executeMethod("OnEncryption", [{type: "decryptData", data: obj.data, check: true}]);
                break;
            }
            default:
                break;
        }
    };
})(window, undefined);
</pre>

<p>As we can see from the code above, all files will be encrypted with one password - <em>{my-super-long-password}</em>. 
The <a href="<%= Url.Action("executemethod/common/onencryption", "plugin") %>">OnEncryption</a>, <a href="<%= Url.Action("executemethod/common/startaction", "plugin") %>">StartAction</a>, 
<a href="<%= Url.Action("executemethod/common/endaction", "plugin") %>">EndAction</a> methods can be found in the <b>Plugins and macros API documentation</b>.</p>

<note>Please note that the <em>encryptData</em> and <em>decryptData</em> types of the <em>OnEncryption</em> method are not relevant for local files.</note>


<h2>Step 2. Creating the UI plugin for the app</h2>

<p>The <b>Encryption</b> plugin has no interface and can&#8217;t run by default. It works only within a document where it is opened (in one tab of the app). 
To work with all the documents opened or created in different tabs of the ONLYOFFICE desktop, the <b>UI</b> plugin for the app should be created. 
It helps to use the <b>Encryption</b> plugin when necessary for the whole app.</p>

<p>This plugin can&#8217;t access the editing features but has almost the same config:</p>
<pre>
{
    "name" : "Encryption",
    "nameLocale" : { 
        "ru" : "&#1064;&#1080;&#1092;&#1088;&#1086;&#1074;&#1072;&#1085;&#1080;&#1077;",
        "it" : "Crittografia",
        "fr" : "Chiffrement",
        "es" : "Encriptacio&#769;n",
        "de" : "Verschl&#252;sselung"
    },
    "guid" : "asc.{11111111-1111-1111-1111-111111111111}",

    "variations" : [
        {
            "url"           : "index.html",

            "initDataType"  : "desktop-external",
            "initData"      : "encryption",

            "cryptoDisabledOnStart" : "true"
        }
    ]
}
</pre>

<p>The <em>index.html</em> file will look as follows:</p>
<pre>
&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
  &lt;head&gt;
    &lt;meta charset="UTF-8" /&gt;
    &lt;meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"&gt;
    &lt;title&gt;Encrypt files&lt;/title&gt;
    &lt;script type="text/javascript" src="code.js"&gt;&lt;/script&gt;
  &lt;/head&gt;
  &lt;body&gt;
    &lt;p&gt;Encryption enabled: &lt;input id="check" type="checkbox"/&gt;&lt;/p&gt;
  &lt;/body&gt;
&lt;/html&gt;
</pre>

<p>With it, we will get a new tab called <b>Encryption</b> on the main app page:</p>
<img class="screenshot-width-550" alt="Encryption exabled" src="<%= Url.Content("~/content/img/desktop/encryption-enabled.png") %>" />

<p>Enable encryption by ticking the checkbox:</p>
<pre>
window.onload = function() {
  const ASC_DESKTOP_EDITOR_DEFAULT_MODE = 0;
  const ASC_DESKTOP_EDITOR_CRYPTO_MODE = 2;

  document.getElementById ("check").onchange = function() {

    let mode = this.checked ? ASC_DESKTOP_EDITOR_CRYPTO_MODE : ASC_DESKTOP_EDITOR_DEFAULT_MODE;
    AscDesktopEditor.SetCryptoMode("", mode, function(retCode) {
      switch (retCode) {
        case 0:
          console.log("OK");
          break;
        case 1:
          console.log("Please, close all open files!");
          break;
        default:
          break;
      }
    });
  };
};
</pre>


<h2>Step 3. Adding plugins to the desktop app</h2>

<p>Copy the folders with plugins to the <em>sdkjs-plugins</em> directory. The path to the folder depends on the operating system you use:</p>
<ul style="list-style: none;">
        <li>For Linux - <em>/opt/onlyoffice/desktopeditors/editors/sdkjs-plugins/</em></li>
        <li>For Windows - <em>%ProgramFiles%\ONLYOFFICE\DesktopEditors\sdkjs-plugins\</em></li>
</ul>
<p>It is important that you use plugins GUID as a folder name.</p>
<p>Detailed instructions can be found <a href="<%= Url.Action("installation/desktop", "plugin") %>">here</a>.</p>


<h2>Step 4. Working with encryption plugins</h2>

<p>After adding both plugins to the app, a new <b>Encryption</b> tab will be displayed. If you tick the checkbox there, all files you create and edit will be encrypted with the password:</p>
<ul>
    <li>If the encryption remains enabled, a password will not be required while opening the protected files (<em>getPasswordByFile</em> will be called).</li>
    <li>If the encryption is disabled or files are opened in another app, a password will be asked.</li>
</ul>
