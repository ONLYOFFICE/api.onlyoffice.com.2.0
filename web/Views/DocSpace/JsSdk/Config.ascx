<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Config</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">The configuration parameters describe the behavior and display options of the DocSpace elements.</p>

<ul class="columns-3" style="list-style: none;">
    <li><a href="#destroyText">destroyText</a></li>
    <li><a href="#editorType">editorType</a></li>
    <li><a href="#events">events</a></li>
    <li><a href="#filter">filter</a></li>
    <li><a href="#frameId">frameId</a></li>
    <li><a href="#height">height</a></li>
    <li><a href="#id">id</a></li>
    <li><a href="#locale">locale</a></li>
    <li><a href="#mode">mode</a></li>
    <li><a href="#name">name</a></li>
    <li><a href="#rootPath">rootPath</a></li>
    <li><a href="#showFilter">showFilter</a></li>
    <li><a href="#showHeader">showHeader</a></li>
    <li><a href="#showMenu">showMenu</a></li>
    <li><a href="#showTitle">showTitle</a></li>
    <li><a href="#src">src</a></li>
    <li><a href="#theme">theme</a></li>
    <li><a href="#type">type</a></li>
    <li><a href="#viewAs">viewAs</a></li>
    <li><a href="#width">width</a></li>
</ul>

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
            <td id="destroyText" class="copy-link">destroyText</td>
            <td>The text that will be inserted into the <em>div</em> tag when the <a href="<%= Url.Action("jssdk/methods") %>#destroyFrame">destroyFrame</a> method is called.</td>
            <td>string</td>
            <td>""</td>
        </tr>
        <tr class="tablerow">
            <td id="editorType" class="copy-link">editorType</td>
            <td>The editor mode display type ("embedded", "desktop").</td>
            <td>string</td>
            <td>"embedded"</td>
        </tr>
        <tr class="tablerow">
            <td id="events" class="copy-link">events</td>
            <td>A list of DocSpace events that will be returned on certain actions within the SDK.</td>
            <td>object</td>
            <td>{
                onSelectCallback: null,
                onCloseCallback: null,
                onAppReady: null,
                onAppError: null
            }</td>
        </tr>
        <tr class="tablerow">
            <td id="filter" class="copy-link">filter</td>
            <td>
                The filter parameters that facilitate searching files in the DocSpace manager:
                <ul>
                    <li>
                        <b>count</b> - a number of files to be displayed,
                        <br />
                        <b>type</b>: integer,
                        <br />
                        <b>example</b>: 100;
                    </li>
                    <li>
                        <b>page</b> - a page number,
                        <br />
                        <b>type</b>: integer,
                        <br />
                        <b>example</b>: 1;
                    </li>
                    <li>
                        <b>sortorder</b> - the sort order of files ("descending", "ascending"),
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "descending";
                    </li>
                    <li>
                        <b>sortby</b> - the parameter by which the files will be sorted ("DateAndTime", "AZ", "Type", "Size", "DateAndTimeCreation", "Author"),
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "DateAndTime".
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td>{
    count: 100,
    page: 1,
    sortorder: "descending",
    sortby: "DateAndTime"
}</td>
        </tr>
        <tr class="tablerow">
            <td id="frameId" class="copy-link">frameId</td>
            <td>The frame SDK ID which is used to refer to the SDK instance.</td>
            <td>string</td>
            <td>"ds-frame"</td>
        </tr>
        <tr class="tablerow">
            <td id="height" class="copy-link">height</td>
            <td>The frame SDK height measured in percent.</td>
            <td>string</td>
            <td>"100%"</td>
        </tr>
        <tr class="tablerow">
            <td id="id" class="copy-link">id</td>
            <td>The element ID which will be used in the SDK initialization modes.</td>
            <td>string</td>
            <td>null</td>
        </tr>
        <tr class="tablerow">
            <td id="locale" class="copy-link">locale</td>
            <td>The language of the DocSpace user interface which is specified with the four letter language code.</td>
            <td>string</td>
            <td>"en-US"</td>
        </tr>
        <tr class="tablerow">
            <td id="mode" class="copy-link">mode</td>
            <td>The SDK <a href="<%= Url.Action("jssdk/initmodes") %>">initialization mode</a> ("manager", "file-selector", 'room-selector", "editor", "viewer", "system")</td>
            <td>string</td>
            <td>"manager"</td>
        </tr>
        <tr class="tablerow">
            <td id="name" class="copy-link">name</td>
            <td>The name of the object inserted into the page. It is used for messaging at the SDK level.</td>
            <td>string</td>
            <td>"frameDocSpace"</td>
        </tr>
        <tr class="tablerow">
            <td id="rootPath" class="copy-link">rootPath</td>
            <td>The path to the frame SDK. Opens a list of rooms by default.</td>
            <td>string</td>
            <td>"/rooms/shared/"</td>
        </tr>
        <tr class="tablerow">
            <td id="showFilter" class="copy-link">showFilter</td>
            <td>Specifies whether the interface filter is displayed in the DocSpace manager.</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td id="showHeader" class="copy-link">showHeader</td>
            <td>Specifies whether the interface header is displayed in the DocSpace manager.</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td id="showMenu" class="copy-link">showMenu</td>
            <td>Specifies whether the interface menu is displayed in the DocSpace manager.</td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td id="showTitle" class="copy-link">showTitle</td>
            <td>Specifies whether the interface title is displayed in the DocSpace manager.</td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td id="src" class="copy-link">src</td>
            <td>The base URL to the DocSpace portal. It is used to generate links.</td>
            <td>string</td>
            <td>{PORTAL_SRC}</td>
        </tr>
        <tr class="tablerow">
            <td id="theme" class="copy-link">theme</td>
            <td>The DocSpace user interface theme ("Base", "Dark", "System").</td>
            <td>string</td>
            <td>"Base"</td>
        </tr>
        <tr class="tablerow">
            <td id="type" class="copy-link">type</td>
            <td>The platform type which is used by the browser and affects the parameters of the inserted object ("desktop", "mobile").</td>
            <td>string</td>
            <td>"desktop"</td>
        </tr>
        <tr class="tablerow">
            <td id="viewAs" class="copy-link">viewAs</td>
            <td>The way elements are arranged in the DocSpace manager ("row", "table", "tile").</td>
            <td>string</td>
            <td>"row"</td>
        </tr>
        <tr class="tablerow">
            <td id="width" class="copy-link">width</td>
            <td>The frame SDK width measured in percent.</td>
            <td>string</td>
            <td>"100%"</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<div class="header-gray">Example</div>
<pre>{ 
    "destroyText": "",
    "editorType": "embedded",
    "events": {
        "onSelectCallback": null,
        "onCloseCallback": null,
        "onAppReady": null,
        "onAppError": null
    },
    "filter": {
          "count": 100,
          "page": 1,
          "sortorder": "descending",
          "sortby": "DateAndTime"
    },
    "frameId": "ds-frame",
    "height":  "100%",
    "id": null,
    "locale": "en-US",
    "mode": "manager",
    "name": "frameDocSpace",
    "rootPath": "/rooms/shared/",
    "showFilter": false,
    "showHeader": false,
    "showMenu": false,
    "showTitle": true,
    "src": {PORTAL_SRC},
    "theme": "Base",
    "type": "desktop",
    "viewAs": "row",
    "width": "100%"
};</pre>
