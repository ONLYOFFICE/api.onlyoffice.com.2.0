<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("executemethod/") %>"></a>
    <span class="hdr">window.Asc.plugin.executeMethod ("GetSelectionType", callback)</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Defines the method that allows getting the type of the current selection.</p>

<div class="header-gray">Usage</div>
<p>This method should be used in the following way:</p>
<pre>
window.Asc.plugin.executeMethod ("GetSelectionType");
</pre>

<div class="header-gray">Returns</div>

<p>The method returns the selection type in the <em>string</em> format: <em>"none"</em>, <em>"text"</em>, <em>"drawing"</em> or <em>"slide"</em>.</p>

<div class="header-gray">Example</div>

<pre>
window.Asc.plugin.executeMethod ("GetSelectionType", [], function(sType) {
    switch (sType) {
        case "none":
        case "drawing":
            window.Asc.plugin.executeMethod ("PasteText", [$("#txt_shower")[0].innerText]);
            break;
        case "text":
            window.Asc.plugin.callCommand (function() {
                Api.ReplaceTextSmart (Asc.scope.arr);
            });
            break;
    }
});
</pre>
