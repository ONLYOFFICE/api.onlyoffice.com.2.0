<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<% var license = !string.IsNullOrEmpty(Page.Request["license"]); %>

<h1>
    <a class="up" href="<%= Url.Action("config/editor") %>"></a>
    <span class="hdr">Customization</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">The customization section allows to customize the editor interface so that it looked like your other products (if there are any) and change the presence or absence of the additional buttons, links, change logos and editor owner details.</p>

<nav class="content">
    <ul class="columns-4" style="list-style: none;">
        <li><a href="#anonymous">anonymous</a></li>
        <li><a href="#autosave">autosave</a></li>
        <li><a href="#chat">chat</a></li>
        <li><a href="#commentAuthorOnly">commentAuthorOnly</a></li>
        <li><a href="#comments">comments</a></li>
        <li><a href="#compactHeader">compactHeader</a></li>
        <li><a href="#compactToolbar">compactToolbar</a></li>
        <li><a href="#compatibleFeatures">compatibleFeatures</a></li>
        <li><a href="#customer">customer</a></li>
        <li><a href="#feedback">feedback</a></li>
        <li><a href="#forcesave">forcesave</a></li>
        <li><a href="#goback">goback</a></li>
        <li><a href="#help">help</a></li>
        <li><a href="#hideRightMenu">hideRightMenu</a></li>
        <li><a href="#hideRulers">hideRulers</a></li>
        <li><a href="#logo">logo</a></li>
        <li><a href="#macros">macros</a></li>
        <li><a href="#macrosMode">macrosMode</a></li>
        <li><a href="#mentionShare">mentionShare</a></li>
        <li><a href="#plugins">plugins</a></li>
        <li><a href="#reviewDisplay">reviewDisplay</a></li>
        <li><a href="#showReviewChanges">showReviewChanges</a></li>
        <li><a href="#spellcheck">spellcheck</a></li>
        <li><a href="#toolbarHideFileName">toolbarHideFileName</a></li>
        <li><a href="#toolbarNoTabs">toolbarNoTabs</a></li>
        <li><a href="#trackChanges">trackChanges</a></li>
        <li><a href="#uiTheme">uiTheme</a></li>
        <li><a href="#unit">unit</a></li>
        <li><a href="#zoom">zoom</a></li>
    </ul>
</nav>

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
        <% if (license)
           { %>
        <tr class="tablerow">
            <td id="about" class="copy-link">about<span class="required">**</span></td>
            <td>
                Defines if the <b>About</b> menu button is displayed or hidden.
                The default value is <b>true</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <% } %>
        <tr>
            <td id="anonymous" class="copy-link">anonymous</td>
            <td>
                Adds a request for the anonymous name:
                <ul>
                    <li>
                        <b>request</b> - defines if the request is sent or not.
                        The default value is <em>true</em>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>label</b> - a postfix added to the user name.
                        The default value is <em>Guest</em>,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "Guest";
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td></td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img src="<%= Url.Content("~/content/img/editor/anonymous.png") %>" alt="" />
            </td>
        </tr>
        <tr>
            <td id="autosave" class="copy-link">autosave</td>
            <td>
                Defines if the <b>Autosave</b> menu option is enabled or disabled.
                If set to <b>false</b>, only <em>Strict</em> co-editing mode can be selected, as <em>Fast</em> does not work without autosave.
                Please note that in case you change this option in menu it will be saved to your browser localStorage.
                The default value is <b>true</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">Please note that in case this setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the <em>editorConfig.customization.autosave</em> parameter.</div>
            </td>
        </tr>
        <tr class="tablerow">
            <td id="chat" class="copy-link">chat</td>
            <td>
                Defines if the <b>Chat</b> menu button is displayed or hidden; please note that in case you hide the <b>Chat</b> button, the corresponding chat functionality will also be disabled.
                The default value is <b>true</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td id="commentAuthorOnly" class="copy-link">commentAuthorOnly</td>
            <td>
                Defines if the user can edit and delete only his comments.
                The default value is <b>false</b>.
                Deprecated since version 6.3, please use the <a href="<%= Url.Action("config/document/permissions") %>#editCommentAuthorOnly">document.permissions.editCommentAuthorOnly</a> and <a href="<%= Url.Action("config/document/permissions") %>#deleteCommentAuthorOnly">document.permissions.deleteCommentAuthorOnly</a> fields instead. 
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td id="comments" class="copy-link">comments</td>
            <td>
                Defines if the <b>Comments</b> menu button is displayed or hidden; please note that in case you hide the <b>Comments</b> button, the corresponding commenting functionality will be available for viewing only, the adding and editing of comments will be unavailable.
                The default value is <b>true</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr>
            <td id="compactHeader" class="copy-link">compactHeader</td>
            <td>
                Defines if the additional action buttons are displayed in the upper part of the editor window header next to the logo (<b>false</b>) or in the toolbar (<b>true</b>) making the header more compact.
                The default value is <b>false</b>.
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img src="<%= Url.Content("~/content/img/editor/compactHeader.png") %>" alt="" />
            </td>
        </tr>
        <tr>
            <td id="compactToolbar" class="copy-link">compactToolbar</td>
            <td>
                Defines if the top toolbar type displayed is full (<b>false</b>) or compact <b>true</b>.
                The default value is <b>false</b>.
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">Please note that in case this setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the <em>editorConfig.customization.compactToolbar</em> parameter.</div>
                <img src="<%= Url.Content("~/content/img/editor/compactToolbar.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="compatibleFeatures" class="copy-link">compatibleFeatures</td>
            <td>
                Defines the use of functionality only compatible with the OOXML format.
                For example, do not use comments on the entire document.
                The default value is <b>false</b>.
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td id="customer" class="copy-link">customer<span class="required">*</span></td>
            <td>
                Contains the information which will be displayed in the editor <b>About</b> section and visible to all the editor users.
                The object has the following parameters:
                <ul>
                    <li>
                        <b>address</b> - postal address of the company or person who gives access to the editors or the editor authors,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "My City, 123a-45";
                    </li>
                    <li>
                        <b>info</b> - some additional information about the company or person you want the others to know,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "Some additional information";
                    </li>
                    <li>
                        <b>logo</b> - the path to the image logo (there are no special recommendations for this file, but it would be better if it were in .png format with transparent background).
                        The image must have the following size: 432x70,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "https://example.com/logo-big.png".
                    </li>
                    <li>
                        <b>mail</b> - email address of the company or person who gives access to the editors or the editor authors,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "john@example.com".
                    </li>
                    <li>
                        <b>name</b> - the name of the company or person who gives access to the editors or the editor authors,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "John Smith and Co.";
                    </li>
                    <li>
                        <b>www</b> - home website address of the above company or person,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "example.com".
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td></td>
        </tr>
        <tr class="tablerow">
            <td id="feedback" class="copy-link">feedback</td>
            <td>
                Defines settings for the <b>Feedback &amp; Support</b> menu button.
                Can be either boolean (simply displays or hides the <b>Feedback &amp; Support</b> menu button) or object.
                In case of object type the following parameters are available:
                <ul>
                    <li>
                        <b>url</b> - the absolute URL to the website address which will be opened when clicking the <b>Feedback &amp; Support</b> menu button,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "https://example.com";
                    </li>
                    <li>
                        <b>visible</b> - show or hide the <b>Feedback &amp; Support</b> menu button,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true.
                    </li>
                </ul>
                The default value is <b>false</b>.
            </td>
            <td>boolean or object</td>
            <td>true</td>
        </tr>
        <tr>
            <td id="forcesave" class="copy-link">forcesave</td>
            <td>
                Adds the request for the forced file saving to the <a href="<%= Url.Action("callback") %>#forcesavetype">callback handler</a> when saving the document within the <b>document editing service</b> (e.g. clicking the <b>Save</b> button, etc.).
                The default value is <b>false</b>.
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">Please note that in case this setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the <em>editorConfig.customization.forcesave</em> parameter.</div>
            </td>
        </tr>
        <tr>
            <td id="goback" class="copy-link">goback</td>
            <td>
                Defines settings for the <b>Open file location</b> menu button and upper right corner button.
                The object has the following parameters:
                <ul>
                    <li>
                        <b>blank</b> - open the website in the new browser tab/window (if the value is set to <em>true</em>) or the current tab (if the value is set to <em>false</em>) when the <b>Open file location</b> button is clicked.
                        The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>requestClose</b> - defines that if the <b>Open file location</b> button is clicked, <a href="<%= Url.Action("config/events") %>#onRequestClose">events.onRequestClose</a> event is called instead of opening a browser tab or window.
                        The default value is <b>false</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: false;
                    </li>
                    <li>
                        <b>text</b> - the text which will be displayed for the <b>Open file location</b> menu button and upper right corner button (i.e. instead of <em>Go to Documents</em>),
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "Open file location";
                    </li>
                    <li>
                        <b>url</b> - the absolute URL to the website address which will be opened when clicking the <b>Open file location</b> menu button,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "https://example.com".
                    </li>
                </ul>
            </td>
            <td>boolean or object</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img src="<%= Url.Content("~/content/img/editor/goback.png") %>" alt="" />
            </td>
        </tr>
        <tr>
            <td id="help" class="copy-link">help</td>
            <td>
                Defines if the <b>Help</b> menu button is displayed or hidden.
                The default value is <b>true</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img src="<%= Url.Content("~/content/img/editor/help.png") %>" alt="" />
            </td>
        </tr>
        <tr>
            <td id="hideRightMenu" class="copy-link">hideRightMenu</td>
            <td>
                Defines if the right menu is displayed or hidden on first loading.
                The default value is <b>false</b>.
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">Please note that in case this setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the <em>editorConfig.customization.hideRightMenu</em> parameter.</div>
            </td>
        </tr>
        <tr>
            <td id="hideRulers" class="copy-link">hideRulers</td>
            <td>
                Defines if the editor rulers are displayed (<b>true</b>) or hidden (<b>false</b>). 
                This parameter is available for the document and presentation editors. The default value is <b>false</b> for the document editor and <b>true</b> for presentations.
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img src="<%= Url.Content("~/content/img/editor/hideRulers.png") %>" alt="" />
            </td>
        </tr>
        <% if (license)
           { %>
        <tr class="tablerow">
            <td id="leftMenu" class="copy-link">leftMenu<span class="required">**</span></td>
            <td>
                Defines if the left menu panel is displayed or hidden.
                The default value is <b>true</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td id="loaderLogo" class="copy-link">loaderLogo<span class="required">**</span></td>
            <td>
                Defines the path to the image logo which will be displayed while the document is being loaded (there are no special recommendations for this file, but it would be better if it were in .png format with transparent background).
                The image will be proportionally resized to the height of 160 pixels when displayed in the editors.
            </td>
            <td>string</td>
            <td>"https://example.com/loader-logo.png"</td>
        </tr>
        <tr class="tablerow">
            <td id="loaderName" class="copy-link">loaderName<span class="required">**</span></td>
            <td>Defines the text which will be displayed while the document is being loaded.</td>
            <td>string</td>
            <td>"The document is loading, please wait..."</td>
        </tr>
        <% } %>
        <tr class="tablerow">
            <td id="logo" class="copy-link">logo<span class="required">*</span></td>
            <td>
                Changes the image file at the top left corner of the Editor header.
                The recommended image height is 20 pixels.
                The object has the following parameters:
                <ul>
                    <li>
                        <b>image</b> - path to the image file used to show in common work mode (i.e. in view and edit modes for all editors).
                        The image must have the following size: 172x40,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "https://example.com/logo.png";
                    </li>
                    <li>
                        <b>imageEmbedded</b> - path to the image file used to show in the embedded mode (see the <a href="<%= Url.Action("config/") %>#type">config</a> section to find out how to define the <b>embedded</b> document type).
                        The image must have the following size: 248x40,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "https://example.com/logo_em.png";
                    </li>
                    <li>
                        <b>url</b> - the absolute URL which will be used when someone clicks the logo image (can be used to go to your web site, etc.).
                        Leave as an empty string or <em>null</em> to make the logo not clickable,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "https://example.com".
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td></td>
        </tr>
        <tr class="tablerow">
            <td id="macros" class="copy-link">macros</td>
            <td>
                Defines if document macros will be run and available macros settings.
                The default value is <b>true</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr>
            <td id="macrosMode" class="copy-link">macrosMode</td>
            <td>
                Defines if document macros will be run.
                Can take the following values:
                <ul>
                    <li><b>disable</b> - don't run at all;</li>
                    <li><b>enable</b> - run all macros automatically;</li>
                    <li><b>warn</b> - warn about macros and ask permission to run.</li>
                </ul>
                The default value is <b>original</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">Please note that in case this setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the <em>editorConfig.customization.macrosMode</em> parameter.</div>
            </td>
        </tr>
        <tr>
            <td id="mentionShare" class="copy-link">mentionShare</td>
            <td>
                Defines the hint that describes the event after mentions in a comment.
                If <b>true</b>, a hint indicates that the user will receive a notification and access to the document.
                If <b>false</b>, a hint indicates that the user will receive only a notification of the mention.
                The default value is <b>true</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">Please note that it will only be available for the comments if the <a href="<%= Url.Action("config/events") %>#onRequestSendNotify">onRequestSendNotify</a> event is set.</div>
                <img src="<%= Url.Content("~/content/img/editor/mentionShare.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="plugins" class="copy-link">plugins</td>
            <td>
                Defines if <a href="<%= Url.Action("basic", "plugin") %>">plugins</a> will be launched and available.
                The default value is <b>true</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr>
            <td id="reviewDisplay" class="copy-link">reviewDisplay</td>
            <td>
                Defines the review editing mode which will be used when the document is opened for viewing.
                It will only be available for the document editor if the <a href="<%= Url.Action("config/editor") %>#mode">mode</a> parameter is set to <b>view</b>.
                Can take the following values:
                <ul>
                    <li><b>final</b> - the document is displayed with all the proposed changes applied;</li>
                    <li><b>markup</b> - the document is displayed with proposed changes highlighted;</li>
                    <li><b>original</b> - the original document is displayed without the proposed changes.</li>
                </ul>
                The default value is <b>original</b>.
            </td>
            <td>string</td>
            <td>original</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">Please note that in case this setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the <em>editorConfig.customization.reviewDisplay</em> parameter.</div>
                <img src="<%= Url.Content("~/content/img/editor/reviewDisplay.png") %>" alt="" />
            </td>
        </tr>
        <% if (license)
           { %>
        <tr class="tablerow">
            <td id="rightMenu" class="copy-link">rightMenu<span class="required">**</span></td>
            <td>
                Defines if the right menu panel is displayed or hidden.
                The default value is <b>true</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <% } %>
        <tr class="tablerow">
            <td id="showReviewChanges" class="copy-link">showReviewChanges</td>
            <td>
                Defines if the review changes panel is automatically displayed or hidden when the editor is loaded.
                The default value is <b>false</b>.
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr>
            <td id="spellcheck" class="copy-link">spellcheck</td>
            <td>
                Defines if the spell checker is automatically switched on or off when the editor is loaded.
                Spell checker will only be available for the document editor and the presentation editor.
                The default value is <b>true</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <div class="note">Please note that in case this setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the <em>editorConfig.customization.spellcheck</em> parameter.</div>
            </td>
        </tr>
        <% if (license)
           { %>
        <tr class="tablerow">
            <td id="statusBar" class="copy-link">statusBar<span class="required">**</span></td>
            <td>
                Defines if the status bar is displayed or hidden.
                The default value is <b>true</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <% } %>
        <%--<tr>
            <td id="submitForm" class="copy-link">submitForm</td>
            <td>
                Defines if the <b>Submit form</b> button is displayed or hidden.
                Button will only be available for the document editor if the <a href="<%= Url.Action("config/editor") %>#mode">mode</a> parameter is set to <b>edit</b> and at least one of the <a href="<%= Url.Action("config/document/permissions") %>#edit">edit</a>, <a href="<%= Url.Action("config/document/permissions") %>#fillForms">fillForms</a> or <a href="<%= Url.Action("config/document/permissions") %>#review">review</a> permissions is set to <b>true</b>.
                The default value is <b>false</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img src="<%= Url.Content("~/content/img/editor/submitForm.png") %>" alt="" />
            </td>
        </tr>--%>
        <% if (license)
            { %>
        <tr class="tablerow">
            <td id="toolbar" class="copy-link">toolbar<span class="required">**</span></td>
            <td>
                Defines if the top toolbar is displayed or hidden.
                The default value is <b>true</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <% } %>
        <tr>
            <td id="toolbarHideFileName" class="copy-link">toolbarHideFileName</td>
            <td>
                Defines if the document title is visible on the top toolbar (when set to <b>false</b>) or hidden (when set to <b>true</b>).
                The default value is <b>false</b>.
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">Please note that this setting is used when the <a href="<%= Url.Action("config/editor/customization") %>#compactHeader">compactHeader</a> and <a href="<%= Url.Action("config/editor/customization") %>#toolbarNoTabs">toolbarNoTabs</a> parameters are set to <b>true</b>.</div>
                <img src="<%= Url.Content("~/content/img/editor/toolbarHideFileName.png") %>" alt="" />
            </td>
        </tr>
        <tr>
            <td id="toolbarNoTabs" class="copy-link">toolbarNoTabs</td>
            <td>
                Defines if the top toolbar tabs are distinctly displayed (when set to <b>false</b>) or only highlighted to see which one is selected (when set to <b>true</b>).
                The default value is <b>false</b>.
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img src="<%= Url.Content("~/content/img/editor/toolbarNoTabs.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="trackChanges" class="copy-link">trackChanges</td>
            <td>
                Defines if the document is opened in the review editing mode (<b>true</b>) or not (<b>false</b>) regardless of the <a href="<%= Url.Action("config/document/permissions") %>#review">document.permissions.review</a> parameter (the review mode is changed only for the current user).
                If the parameter is <em>undefined</em>, the <em>document.permissions.review</em> value is used (for all the document users).
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td id="uiTheme" class="copy-link">uiTheme</td>
            <td>
                Defines the editor theme settings. It can be set in two ways:
                <ul>
                    <li><b>theme id</b> - the user sets the theme parameter by its id (<em>theme-light</em>, <em>theme-classic-light</em>, <em>theme-dark</em>),</li>
                    <li><b>default theme</b> - the default dark or light theme value will be set (<em>default-dark</em>, <em>default-light</em>). The default light theme is <em>theme-classic-light</em>.</li>
                </ul>
                The first option has higher priority.
            </td>
            <td>string</td>
            <td>theme-dark</td>
        </tr>
        <tr>
            <td id="unit" class="copy-link">unit</td>
            <td>
                Defines the measurement units used on the ruler and in dialog boxes.
                Can take the following values:
                <ul>
                    <li><b>cm</b> - centimeters,</li>
                    <li><b>pt</b> - points,</li>
                    <li><b>inch</b> - inches.</li>
                </ul>
                The default value is centimeters (cm).
            </td>
            <td>string</td>
            <td>cm</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">Please note that in case this setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the <em>editorConfig.customization.unit</em> parameter.</div>
            </td>
        </tr>
        <tr>
            <td id="zoom" class="copy-link">zoom</td>
            <td>
                Defines the document display zoom value measured in percent.
                Can take values larger than <b>0</b>.
                For text documents and presentations it is possible to set this parameter to <b>-1</b> (fitting the document to page option) or to <b>-2</b> (fitting the document page width to the editor page).
                The default value is <b>100</b>.
            </td>
            <td>integer</td>
            <td>100</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">Please note that in case this setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the <em>editorConfig.customization.zoom</em> parameter.</div>
            </td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img src="<%= Url.Content("~/content/img/editor/customization.png") %>" alt="" />
            </td>
        </tr>
    </tbody>
</table>
<span class="required-descr"><span class="required">*</span><em> - available for editing only for ONLYOFFICE Developer Edition</em></span>
<% if (license)
   { %>
<span class="required-descr"><span class="required">**</span><em> - extended white label option for Developer Edition</em></span>
<% } %>

<div class="header-gray">Example</div>
<pre>
var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "customization": {
            "anonymous": {
                "request": true,
                "label": "Guest"
            },
            <% if (license)
               { %>"about": true,
            <% } %>"chat": true,
            "comments": true,
            "compactHeader": false,
            "compactToolbar": false,
            "compatibleFeatures": false,
            "customer": {
                "address": "My City, 123a-45",
                "info": "Some additional information",
                "logo": "https://example.com/logo-big.png",
                "mail": "john@example.com",
                "name": "John Smith and Co.",
                "www": "example.com"
            },
            "feedback": {
                "url": "https://example.com",
                "visible": true
            },
            "forcesave": false,
            "goback": {
                "blank": true,
                "requestClose": false,
                "text": "Open file location",
                "url": "https://example.com"
            },
            "help": true,
            <% if (license)
               { %>"leftMenu": true,
            "loaderLogo": "https://example.com/loader-logo.png",
            "loaderName": "The document is loading, please wait...",
            <% } %>"hideRightMenu": false,
            "hideRulers": false,
            "logo": {
                "image": "https://example.com/logo.png",
                "imageEmbedded": "https://example.com/logo_em.png",
                "url": "https://www.onlyoffice.com"
            },
            "macros": true,
            "macrosMode": "warn",
            "mentionShare": true,
            "plugins": true,
            "reviewDisplay": "original",
            <% if (license)
               { %>"rightMenu": true,
            <% } %>"showReviewChanges": false,
            "spellcheck": true,
            <% if (license)
               { %>"statusBar": true,
            <% } %><%--"submitForm": true,--%>
            <% if (license)
                { %>"toolbar": true,
            <% } %>"toolbarHideFileName": false,
            "toolbarNoTabs": false,
            "trackChanges": false,
            "uiTheme": "theme-dark",
            "unit": "cm",
            "zoom": 100
        },
        ...
    },
    ...
});
</pre>
<p>
    Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
    See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
</p>

<p>
    If you have any further questions, please contact us at
    <a href="mailto:integration@onlyoffice.com" onclick="if(window.ga){window.ga('send','event','mailto');}return true;">integration@onlyoffice.com</a>.
</p>
