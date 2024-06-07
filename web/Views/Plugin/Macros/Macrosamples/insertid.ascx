<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("macrosamples/") %>"></a>
    <span class="hdr">Insert a unique id</span>
</h1>

<div class="header-gray">Description</div>

<p class="dscr">Inserts a unique id into a form document.</p>

<pre>(function()
{
    function generate () {
        let key = '';
        const data = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' +
                'abcdefghijklmnopqrstuvwxyz0123456789';
        for (let i = 1; i <= 12; i++) {
            let index = Math.floor(Math.random()
                        * data.length + 1);
            key += data.charAt(index);
        }
        return key;
    }
    const id = generate();
    const oDocument = Api.GetDocument();
    const oParagraph = Api.CreateParagraph();
    oParagraph.AddText(id);
    oDocument.InsertContent([oParagraph], { "KeepTextOnly": true });
})();</pre>

<p>Methods used:
<a href="<%= Url.Action("textdocumentapi/api/getdocument", "officeapi") %>">GetDocument</a>,
<a href="<%= Url.Action("textdocumentapi/api/createparagraph", "officeapi") %>">CreateParagraph</a>,
<a href="<%= Url.Action("textdocumentapi/apiparagraph/addtext", "officeapi") %>">AddText</a>,
<a href="<%= Url.Action("textdocumentapi/apidocument/insertcontent", "officeapi") %>">InsertContent</a>
</p>

<div class="header-gray">Result</div>
</br >
<img class="screenshot max-width-832" alt="Insert id" src="<%= Url.Content("~/content/img/plugins/insert_id.png") %>" />
