<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<string>"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Loading external themes
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Loading external themes</span>
    </h1>
    <p class="dscr">Besides the <a href="<%= Url.Action("config/editor/customization") %>#uiTheme">default theme setting</a>, the user can also load external themes for the application interface.</p>

    <note>Loading user themes is available starting from version 6.5.</note>
    
    <p>The steps below explain this process.</p>

    <ol>
        <li>
            <p>Create the <em>json</em> file which specifies the following theme parameters:</p>

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
                        <td>Name</td>
                        <td>Description</td>
                        <td>Type</td>
                        <td>Example</td>
                    </tr>
                </thead>
                <tbody>
                    <tr class="tablerow">
                        <td id="name" class="copy-link">name</td>
                        <td>
                            Defines the theme name which will be displayed in the theme picker.
                        </td>
                        <td>string</td>
                        <td>"Amazing theme"</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="l10n" class="copy-link">l10n (currently in development)</td>
                        <td>
                            Defines the localized theme name. The object keys are the two letter language codes (ru, de, it, etc.) and the values are the theme name translation for each language.
                        </td>
                        <td>object</td>
                        <td></td>
                    </tr>
                    <tr class="tablerow">
                        <td id="id" class="copy-link">id</td>
                        <td>
                            Defines the theme unique identifier which has to be started with the <em>theme-</em> prefix. It may contain the <em>a-Z, 1-9, -, _</em> signs.
                        </td>
                        <td>string</td>
                        <td>"theme-amazing"</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="type" class="copy-link">type</td>
                        <td>
                            Defines the theme type which can be <em>dark</em> or <em>light</em>.
                        </td>
                        <td>string</td>
                        <td>"dark"</td>
                    </tr>
                    <tr class="tablerow">
                        <td id="colors" class="copy-link">colors</td>
                        <td>Defines the set of theme colors. Colors can be presented in the <em>hex</em> or <em>RGBA</em> formats.</td>
                        <td>object</td>
                        <td></td>
                    </tr>
                </tbody>
            </table>

            <div class="header-gray">Example</div>
            <pre>
{
    "name": "Amazing theme",
    "l10n": {
        "fr": "The&#768;me incroyable",
        "de": "Geweldig thema"
    },
    "id" : "theme-amazing",
    "type" : "dark",
    "colors" : {
        "toolbar-header-document" :  "#446995",
        "toolbar-header-spreadsheet" : "#40865c",
        "toolbar-header-presentation" : "#aa5252",
        "border-color-shading" : "rgba(0, 0, 0, 0.15)",
        ...
    }
}
</pre>

        </li>
        <li>Put the created file to the <em>web-apps\apps\common\main\resources\themes</em> directory.</li>
        <li>Now the theme will be dispayed in the <b>Interface theme</b> list of the editor <b>Advanced settings...</b> and you can apply it to the editor interface.</li>
    </ol>

</asp:Content>
