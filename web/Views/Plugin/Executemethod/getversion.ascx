<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("GetVersion", callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows getting the editor version.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("GetVersion");
</pre>

<div class="header-gray">Returns</div>

<p>The method returns the editor version in the <em>string</em> format.</p>
<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod ("GetVersion", [], function(version) {
    if (version === undefined) {
        window.Asc.plugin.executeMethod ("PasteText", [ifr.contentDocument.getElementById ("google_translate_element").outerText]);
    }
    else {
        window.Asc.plugin.executeMethod ("GetSelectionType", [], function(sType) {
            switch (sType) {
                case "none":
                case "drawing":
                    window.Asc.plugin.executeMethod("PasteText", [ifr.contentDocument.getElementById("google_translate_element").outerText]);
                    break;
                case "text":
                    window.Asc.plugin.callCommand(function() {
                        Api.ReplaceTextSmart(Asc.scope.arr);
                    });
                    break;
            }
        });
    }
});
</pre>
