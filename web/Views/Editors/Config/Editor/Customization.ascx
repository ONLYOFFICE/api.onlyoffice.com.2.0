﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<% var license = !string.IsNullOrEmpty(Page.Request["license"]); %>

<h1>
    <a class="up" href="<%= Url.Action("config/editor") %>"></a>
    <span class="hdr">Customization</span>
</h1>

<div class="header-gray">Description</div>
<p class="dscr">The customization section allows to customize the editor interface so that it looked like your other products (if there are any) and change the presence or absence of the additional buttons, links, change logos and editor owner details.</p>

<ul class="columns-4" style="list-style: none;">
    <% if (license)
       { %>
    <li><a href="#about">about</a></li>
    <% } %>
    <li><a href="#anonymous">anonymous</a></li>
    <li><a href="#autosave">autosave</a></li>
    <li><a href="#chat">chat</a></li>
    <li><a href="#commentAuthorOnly">commentAuthorOnly</a></li>
    <li><a href="#comments">comments</a></li>
    <li><a href="#compactHeader">compactHeader</a></li>
    <li><a href="#compactToolbar">compactToolbar</a></li>
    <li><a href="#compatibleFeatures">compatibleFeatures</a></li>
    <li><a href="#customer">customer</a></li>
    <li><a href="#features">features</a></li>
    <li><a href="#feedback">feedback</a></li>
    <% if (license)
       { %>
    <li><a href="#font">font</a></li>
    <% } %>
    <li><a href="#forcesave">forcesave</a></li>
    <li><a href="#goback">goback</a></li>
    <li><a href="#help">help</a></li>
    <li><a href="#hideNotes">hideNotes</a></li>
    <li><a href="#hideRightMenu">hideRightMenu</a></li>
    <li><a href="#hideRulers">hideRulers</a></li>
    <li><a href="#integrationMode">integrationMode</a></li>
    <% if (license)
       { %>
    <li><a href="#layout">layout</a></li>
    <li><a href="#leftMenu">leftMenu</a></li>
    <li><a href="#loaderLogo">loaderLogo</a></li>
    <li><a href="#loaderName">loaderName</a></li>
    <% } %>
    <li><a href="#logo">logo</a></li>
    <li><a href="#macros">macros</a></li>
    <li><a href="#macrosMode">macrosMode</a></li>
    <li><a href="#mentionShare">mentionShare</a></li>
    <li><a href="#mobileForceView">mobileForceView</a></li>
    <li><a href="#plugins">plugins</a></li>
    <li><a href="#review">review</a></li>
    <li><a href="#reviewDisplay">reviewDisplay</a></li>
    <% if (license)
       { %>
    <li><a href="#rightMenu">rightMenu</a></li>
    <% } %>
    <li><a href="#showReviewChanges">showReviewChanges</a></li>
    <li><a href="#spellcheck">spellcheck</a></li>
    <% if (license)
       { %>
    <li><a href="#statusBar">statusBar</a></li>
    <% } %>
    <li><a href="#submitForm">submitForm</a></li>
    <% if (license)
       { %>
    <li><a href="#toolbar">toolbar</a></li>
    <% } %>
    <li><a href="#toolbarHideFileName">toolbarHideFileName</a></li>
    <li><a href="#toolbarNoTabs">toolbarNoTabs</a></li>
    <li><a href="#trackChanges">trackChanges</a></li>
    <li><a href="#uiTheme">uiTheme</a></li>
    <li><a href="#unit">unit</a></li>
    <li><a href="#zoom">zoom</a></li>
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
        <% if (license)
           { %>
        <tr class="tablerow">
            <td id="about" class="copy-link">about<a href="#requiredDescr2" class="required">**</a></td>
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
                        The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>label</b> - a postfix added to the user name.
                        The default value is <b>Guest</b>,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "Guest";
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td>{
    "request": true,
    "label": "Guest"
}</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/anonymous.png") %>" alt="" />
            </td>
        </tr>
        <tr>
            <td id="autosave" class="copy-link">autosave</td>
            <td>
                Defines if the <b>Autosave</b> menu option is enabled or disabled.
                If set to <b>false</b>, only <b>Strict</b> co-editing mode can be selected, as <b>Fast</b> does not work without autosave.
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
        <tr>
            <td id="chat" class="copy-link">chat</td>
            <td>
                Defines if the <b>Chat</b> menu button is displayed or hidden.
                Please note that in case you hide the <b>Chat</b> button, the corresponding chat functionality will also be disabled.
                The default value is <b>true</b>.
                Deprecated since version 7.1, please use the <a href="<%= Url.Action("config/document/permissions") %>#chat">document.permissions.chat</a> parameter instead.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/chat.png") %>" alt="" />
            </td>
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
        <tr>
            <td id="comments" class="copy-link">comments</td>
            <td>
                Defines if the <b>Comments</b> menu button is displayed or hidden.
                Please note that in case you hide the <b>Comments</b> button, the corresponding commenting functionality will be available for viewing only, adding and editing comments will be unavailable.
                The default value is <b>true</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/comment.png") %>" alt="" />
            </td>
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
                <img class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/compactHeader.png") %>" alt="" />
            </td>
        </tr>
        <tr>
            <td id="compactToolbar" class="copy-link">compactToolbar</td>
            <td>
                Defines if the top toolbar type displayed is full (<b>false</b>) or compact (<b>true</b>).
                The default value is <b>false</b>.
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">Please note that in case this setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the <em>editorConfig.customization.compactToolbar</em> parameter.</div>
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/compactToolbar.png") %>" alt="" />
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
        <tr>
            <td id="customer" class="copy-link">customer<a href="#requiredDescr" class="required">*</a></td>
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
                        <b>logo</b> - the path to the image logo (there are no special recommendations for this file, but it would be better if it was in the <em>.png</em> format with transparent background).
                        The image must have the following size: 432x70,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "https://example.com/logo-big.png".
                    </li>
                    <li>
                        <b>logoDark</b> - the path to the image logo for the dark theme (there are no special recommendations for this file, but it would be better if it was in <em>.png</em> format with transparent background).
                        The image must have the following size: 432x70,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "https://example.com/dark-logo-big.png".
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
                        <b>phone</b> - the phone of the company or person who gives access to the editors or the editor authors,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "123456789";
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
            <td>{
    "address": "My City, 123a-45",
    "info": "Some additional information",
    "logo": "https://example.com/logo-big.png",
    "logoDark": "https://example.com/dark-logo-big.png",
    "mail": "john@example.com",
    "name": "John Smith and Co.",
    "phone": "123456789",
    "www": "example.com"
}</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/customer.png") %>" alt="" />
            </td>
        </tr>
        <tr>
            <td id="features" class="copy-link">features</td>
            <td>
                Defines the parameters that the user can disable or customize if possible:
                <ul>
                    <li>
                        <b>spellcheck </b> - defines if the spell checker is automatically switched on or off when the editor is loaded.
                        If this parameter is a boolean value, then it is set as the initial spell checker value and the spell checker setting will not be hidden.
                        The default value is <b>true</b>,
                        <br />
                        <b>type</b>: object or boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>spellcheck.mode</b> - defines if the spell checker is automatically switched on or off when the editor is loaded.
                        This parameter will only be available for the document editor and the presentation editor,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <% if (license)
                       { %>
                    <li>
                        <b>spellcheck.change<a href="#requiredDescr2" class="required">**</a></b> - defines if the spell checker setting will be displayed or not. Spell checker setting is available in all editor types,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true.
                    </li>
                    <% } %>
                </ul>
            </td>
            <td>object</td>
            <td>{
    "spellcheck": {
        "mode": true<% if (license)
        { %>,
        "change": true<% } %>
    }
}</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <div class="note">Please note that in case <em>spellcheck</em> setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the <em>editorConfig.customization.features.spellcheck</em> parameter.</div>
            </td>
        </tr>
        <tr>
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
                        <b>visible</b> - shows or hides the <b>Feedback &amp; Support</b> menu button,
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
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/feedback.png") %>" alt="" />
            </td>
        </tr>
        <% if (license)
           { %>
        <tr class="tablerow">
            <td id="font" class="copy-link">font<a href="#requiredDescr2" class="required">**</a></td>
            <td>
                Defines the font for the interface elements (buttons, tabs, etc.):
                <ul>
                    <li>
                        <b>name</b> - the font name,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "Arial";
                    </li>
                    <li>
                        <b>size</b> - the font size,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "11px".
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td>{
    "name": "Arial", "size": "11px"
}</td>
        </tr>
        <% } %>
        <tr>
            <td id="forcesave" class="copy-link">forcesave</td>
            <td>
                Adds the request for the file force saving to the <a href="<%= Url.Action("callback") %>#forcesavetype">callback handler</a> when saving the document within the <b>document editing service</b> (e.g. clicking the <b>Save</b> button, etc.).
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
                        <b>blank</b> - opens the website in the new browser tab/window (if the value is set to <b>true</b>) or the current tab (if the value is set to <b>false</b>) when the <b>Open file location</b> button is clicked.
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
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/goback.png") %>" alt="" />
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
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/help.png") %>" alt="" />
            </td>
        </tr>
        <tr>
            <td id="hideNotes" class="copy-link">hideNotes</td>
            <td>
                Defines if the note panel is displayed or hidden on first loading.
                The default value is <b>false</b>. This parameter is available for the presentation editor only.
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow-note">
            <td colspan="4">
                <div class="note">Please note that in case this setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the <em>editorConfig.customization.hideNotes</em> parameter.</div>
            </td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/hideNotes.png") %>" alt="" />
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
                Defines if the editor rulers are displayed or hidden. 
                This parameter is available for the document and presentation editors. The default value is <b>false</b> for the document editor and <b>true</b> for presentations.
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/hideRulers.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="integrationMode" class="copy-link">integrationMode</td>
            <td>
                Defines the mode of embedding editors into the web page.
                The <b>embed</b> value disables scrolling to the editor frame when it is loaded as the focus is not captured.
            </td>
            <td>string</td>
            <td>embed</td>
        </tr>
        <% if (license)
           { %>
        <tr class="tablerow">
            <td id="layout" class="copy-link">layout<a href="#requiredDescr2" class="required">**</a></td>
            <td>
                Defines the parameters that the user can use to hide the interface elements but not to disable features completely
                (for example, if this functionality is available from other elements such as context menu, or via hotkeys):
                <ul>
                    <li>
                        <b>header</b> - defines the editor header settings,
                        <br />
                        <b>type</b>: object,
                    </li>
                    <li>
                        <b>header.save</b> - defines if the <b>Save</b> button in the editor header is displayed or hidden. The default value is <b>true</b>.
                        Please note that this setting is used when the <a href="#compactHeader">compactHeader</a> parameter is set to <b>false</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>header.users</b> - defines if the button with the editing users is displayed or hidden. The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>leftMenu</b> - defines the left menu settings. If this parameter is a boolean value, then it specifies whether the left menu will be displayed or hidden.
                        The default value is <b>true</b>,
                        <br />
                        <b>type</b>: object or boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>leftMenu.mode</b> - defines the initial value of the left panel visibility - displayed or hidden.
                        It is used for the <b>Left panel</b> menu option on the <b>View</b> tab.
                        The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>leftMenu.navigation</b> - defines if the <b>Navigation</b> button is displayed or hidden. The default value is <b>true</b>.
                        This parameter will only be available for the document editor,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>leftMenu.spellcheck</b> - defines if the <b>Spellcheck</b> button is displayed or hidden. The default value is <b>true</b>.
                        This parameter will only be available for the spreadsheet editor,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>rightMenu</b> - defines the right menu settings. If this parameter is a boolean value, then it specifies whether the right menu will be displayed or hidden.
                        The default value is <b>true</b>,
                        <br />
                        <b>type</b>: object or boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>rightMenu.mode</b> - defines the initial value of the right panel visibility - displayed or hidden.
                        It is used for the <b>Right panel</b> menu option on the <b>View</b> tab.
                        The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>statusBar</b> - defines the status bar settings.
                        If this parameter is a boolean value, then it specifies whether the status bar will be displayed or hidden.
                        The default value is <b>true</b>,
                        <br />
                        <b>type</b>: object or boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>statusBar.actionStatus</b> - defines if an action status is displayed or hidden. The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>statusBar.docLang</b> - defines if a button for choosing the document language is displayed or hidden. The default value is <b>true</b>.
                        This parameter will only be available for the document editor and the presentation editor,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>statusBar.textLang</b> - defines if a button for choosing the text language is displayed or hidden. The default value is <b>true</b>.
                        This parameter will only be available for the document editor and the presentation editor,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>toolbar </b> - defines the toolbar settings.
                        If this parameter is a boolean value, then it specifies whether the toolbar will be displayed or hidden.
                        The default value is <b>true</b>,
                        <br />
                        <b>type</b>: object or boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>toolbar.collaboration</b> - defines if the <b>Collaboration</b> tab is displayed or hidden.
                        The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>toolbar.draw</b> - defines if the <b>Draw</b> tab is displayed or hidden.
                        The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>toolbar.file</b> - defines the <b>File</b> tab settings. If this parameter is a boolean value, then it specifies
                        whether the <b>File</b> tab will be displayed or hidden. The default value is <b>true</b>,
                        <br />
                        <b>type</b>: object or boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>toolbar.file.close</b> - defines if the <b>Close menu</b> option is displayed or hidden. The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>toolbar.file.info</b> - defines if the <b>Document info</b> option is displayed or hidden. The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>toolbar.file.save</b> - defines if the <b>Save</b> option is displayed or hidden. The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>toolbar.file.settings</b> - defines if the <b>Advanced settings</b> option is displayed or hidden. The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>toolbar.home</b> - defines the <b>Home</b> tab settings. This tab cannot be hidden,
                        <br />
                        <b>type</b>: object,
                    </li>
                    <li>
                        <b>toolbar.home.mailmerge</b> - defines if the button for choosing the mail merge base is displayed or hidden. The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>toolbar.layout</b> - defines if the <b>Layout</b> tab is displayed or hidden. This parameter will only be available for the document editor and the spreadsheet editor.
                        The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>toolbar.plugins</b> - defines if the <b>Plugins</b> tab is displayed or hidden. The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>toolbar.protect</b> - defines if the <b>Protection</b> tab is displayed or hidden. The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>toolbar.references</b> - defines if the <b>References</b> tab is displayed or hidden. This parameter will only be available for the document editor.
                        The default value is <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>toolbar.save</b> - defines if the <b>Save</b> button on the toolbar is displayed or hidden. The default value is <b>true</b>.
                        Please note that this setting is used when the <a href="#compactHeader">compactHeader</a> parameter is set to <b>true</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>toolbar.view</b> - defines the <b>View</b> tab settings. If this parameter is a boolean value, then it specifies whether the <b>View</b> tab will be displayed or hidden.
                        The default value is <b>true</b>,
                        <br />
                        <b>type</b>: object or boolean,
                        <br />
                        <b>example</b>: true;
                    </li>
                    <li>
                        <b>toolbar.view.navigation</b> - defines if the <b>Navigation</b> button is displayed or hidden. 
                        The default value is <b>true</b>. This parameter will only be available for the document editor,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true.
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td>{
    "header": {
        "save": true,
        "users": true
    },
    "leftMenu": {
        "mode": true,
        "navigation": true,
        "spellcheck": true
    },
    "rightMenu": {
        "mode": true
    },
    "statusBar": {
        "actionStatus": true,
        "docLang": true,
        "textLang": true
    },
    "toolbar": {
        "collaboration": true,
        "draw": true,
        "file": {
            "close": true,
            "info": true,
            "save": true,
            "settings": true
        },
        "home": {
            "mailmerge": true
        },
        "layout": true,
        "plugins": true,
        "protect": true,
        "references": true,
        "save": true,
        "view": {
            "navigation": true
        }
    }
}</td>
        </tr>
        <tr>
            <td id="leftMenu" class="copy-link">leftMenu<a href="#requiredDescr2" class="required">**</a></td>
            <td>
                Defines if the left menu panel is displayed or hidden.
                The default value is <b>true</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">Deprecated since version 7.1. Please use the <a href="#layout">layout.leftMenu</a> parameter instead.</div>
            </td>
        </tr>
        <tr class="tablerow">
            <td id="loaderLogo" class="copy-link">loaderLogo<a href="#requiredDescr2" class="required">**</a></td>
            <td>
                Defines the path to the image logo which will be displayed while the document is being loaded (there are no special recommendations for this file, but it would be better if it were in .png format with transparent background).
                The image will be proportionally resized to the height of 160 pixels when displayed in the editors.
            </td>
            <td>string</td>
            <td>"https://example.com/loader-logo.png"</td>
        </tr>
        <tr class="tablerow">
            <td id="loaderName" class="copy-link">loaderName<a href="#requiredDescr2" class="required">**</a></td>
            <td>Defines the text which will be displayed while the document is being loaded.</td>
            <td>string</td>
            <td>"The document is loading, please wait..."</td>
        </tr>
        <% } %>
        <tr class="tablerow">
            <td id="logo" class="copy-link">logo<a href="#requiredDescr" class="required">*</a></td>
            <td>
                Changes the image file at the top left corner of the editor header.
                The recommended image height is 20 pixels.
                The object has the following parameters:
                <ul>
                    <li>
                        <b>image</b> - path to the image file used to show in the common work mode (i.e. in view and edit modes for all editors) or in the embedded mode (see the <a href="<%= Url.Action("config/") %>#type">config</a> section to find out how to define the <b>embedded</b> document type).
                        The image must have the following size: 172x40,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "https://example.com/logo.png";
                    </li>
                    <li>
                        <b>imageDark</b> - path to the image file used for the dark theme.
                        The image must have the following size: 172x40,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "https://example.com/dark-logo.png";
                    </li>
                    <li>
                        <b>imageEmbedded</b> - path to the image file used to show in the embedded mode (see the <a href="<%= Url.Action("config/") %>#type">config</a> section to find out how to define the <b>embedded</b> document type).
                        The image must have the following size: 248x40.
                        Deprecated since version 7.0, please use the <em>image</em> field instead,
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
            <td>{
    "image": "https://example.com/logo.png",
    "imageDark": "https://example.com/dark-logo.png",
    "url": "https://example.com"
}</td>
        </tr>
        <tr class="tablerow">
            <td id="macros" class="copy-link">macros</td>
            <td>
                Defines if document macros will be automatically run when the editor opens.
                The default value is <b>true</b>. The <b>false</b> value hides the <a href="#macrosMode">macros settings</a> from the user.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr>
            <td id="macrosMode" class="copy-link">macrosMode</td>
            <td>
                Defines the macros run mode when autostart is enabled.
                Can take the following values:
                <ul>
                    <li><b>disable</b> - don't run macros at all;</li>
                    <li><b>enable</b> - run all macros automatically;</li>
                    <li><b>warn</b> - warn about macros and ask permission to run them.</li>
                </ul>
                The default value is <b>warn</b>.
            </td>
            <td>string</td>
            <td>warn</td>
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
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/mentionShare.png") %>" alt="" />
            </td>
        </tr>
        <tr class="tablerow">
            <td id="mobileForceView" class="copy-link">mobileForceView</td>
            <td>
                Defines if the mobile document editor is opened in the view/edit mode on launch. The default value is <b>true</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
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
            <td id="review" class="copy-link">review</td>
            <td>
                Contains the information about the review mode.
                The object has the following parameters:
                <ul>
                    <li>
                        <b>hideReviewDisplay</b> - defines if the <b>Display mode</b> button is displayed or hidden on the <b>Collaboration</b> tab.
                        The default value is <b>false</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: false;
                    </li>
                    <li>
                        <b>hoverMode</b> - defines the review display mode: show reviews in tooltips by hovering the changes (<b>true</b>) 
                        or in balloons by clicking the changes (<b>false</b>).
                        The default value is <b>false</b>.
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: false;
                    </li>
                    <li>
                        <b>reviewDisplay</b> - defines the review editing mode which will be used when the document is opened for viewing.
                        It will only be available for the document editor if <a href="<%= Url.Action("config/editor") %>#mode">mode</a> is set to <b>view</b>.
                        Can take the following values:
                        <br />– <b>markup</b> - the document is displayed with proposed changes highlighted;
                        <br />– <b>simple</b> - the document is displayed with proposed changes highlighted, but the balloons are turned off;
                        <br />– <b>final</b> - the document is displayed with all the proposed changes applied;
                        <br />– <b>original</b> - the original document is displayed without the proposed changes.
                        <br />The default value is <b>original</b>,
                        <br />
                        <b>type</b>: string,
                        <br />
                        <b>example</b>: "original";
                    </li>
                    <li>
                        <b>showReviewChanges</b> - defines if the review changes panel is automatically displayed or hidden when the editor is loaded.
                        The default value is <b>false</b>,
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: false;
                    </li>
                    <li>
                        <b>trackChanges</b> - defines if the document is opened in the review editing mode (<b>true</b>) or not (<b>false</b>) regardless of the <a href="<%= Url.Action("config/document/permissions") %>#review">document.permissions.review</a> parameter (the review mode is changed only for the current user).
                        If the parameter is <em>undefined</em>, the <em>document.permissions.review</em> value is used (for all the document users),
                        <br />
                        <b>type</b>: boolean,
                        <br />
                        <b>example</b>: true.
                    </li>
                </ul>
            </td>
            <td>object</td>
            <td>{
    "hideReviewDisplay": false,
    "showReviewChanges": false,
    "reviewDisplay": "original",
    "trackChanges": true,
    "hoverMode": false
}</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">
                    The <a href="#showReviewChanges">showReviewChanges</a>, <a href="#reviewDisplay">reviewDisplay</a>, <a href="#trackChanges">trackChanges</a> parameters are deprecated since version 7.0.
                    Please use the <em>review</em> parameter instead.
                </div>
                <div class="note">Please note that in case this setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the <em>editorConfig.customization.review.hoverMode</em> and the <em>editorConfig.customization.review.reviewDisplay</em> parameters.</div>
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/reviewDisplay.png") %>" alt="" />
            </td>
        </tr>
        <tr>
            <td id="reviewDisplay" class="copy-link">reviewDisplay</td>
            <td>
                Defines the review editing mode in the document editor. 
                This parameter can take the following values:
                <ul>
                    <li><b>markup</b> - the document is displayed with proposed changes highlighted;</li>
                    <li><b>simple</b> - the document is displayed with proposed changes highlighted, but the balloons are turned off;</li>
                    <li><b>final</b> - the document is displayed with all the proposed changes applied;</li>
                    <li><b>original</b> - the original document is displayed without the proposed changes.</li>
                </ul>
                The default value is <b>original</b> for viewer and <b>markup</b> for editor.
            </td>
            <td>string</td>
            <td>original</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">Deprecated since version 7.0. Please use the <a href="#review">review.reviewDisplay</a> parameter instead.</div>
                <div class="note">Please note that in case this setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the <em>editorConfig.customization.reviewDisplay</em> parameter.</div>
            </td>
        </tr>
        <% if (license)
           { %>
        <tr>
            <td id="rightMenu" class="copy-link">rightMenu<a href="#requiredDescr2" class="required">**</a></td>
            <td>
                Defines if the right menu panel is displayed or hidden.
                The default value is <b>true</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">Deprecated since version 7.1. Please use the <a href="#layout">layout.rightMenu</a> parameter instead.</div>
            </td>
        </tr>
        <% } %>
        <tr>
            <td id="showReviewChanges" class="copy-link">showReviewChanges</td>
            <td>
                Defines if the review changes panel is automatically displayed or hidden when the editor is loaded.
                The default value is <b>false</b>.
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">Deprecated since version 7.0. Please use the <a href="#review">review.showReviewChanges</a> parameter instead.</div>
            </td>
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
                <div class="note">Deprecated since version 7.1. Please use the <a href="#features">features.spellcheck</a> parameter instead.</div>
                <div class="note">Please note that in case this setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the <em>editorConfig.customization.spellcheck</em> parameter.</div>
            </td>
        </tr>
        <% if (license)
           { %>
        <tr>
            <td id="statusBar" class="copy-link">statusBar<a href="#requiredDescr2" class="required">**</a></td>
            <td>
                Defines if the status bar is displayed or hidden.
                The default value is <b>true</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">Deprecated since version 7.1. Please use the <a href="#layout">layout.statusBar</a> parameter instead.</div>
            </td>
        </tr>
        <% } %>
        <tr>
            <td id="submitForm" class="copy-link">submitForm</td>
            <td>
                Defines if the <b>Submit</b> button is displayed or hidden on the top toolbar.
                Button will only be available for the <em>pdf</em> format. The default value is <b>false</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img alt="Submit button" class="screenshot" src="<%= Url.Content("~/content/img/editor/submitForm.png") %>" />
            </td>
        </tr>
        <% if (license)
            { %>
        <tr>
            <td id="toolbar" class="copy-link">toolbar<a href="#requiredDescr2" class="required">**</a></td>
            <td>
                Defines if the top toolbar is displayed or hidden.
                The default value is <b>true</b>.
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">Deprecated since version 7.1. Please use the <a href="#layout">layout.toolbar</a> parameter instead.</div>
            </td>
        </tr>
        <% } %>
        <tr>
            <td id="toolbarHideFileName" class="copy-link">toolbarHideFileName</td>
            <td>
                Defines if the document title is visible on the top toolbar (<b>false</b>) or hidden (<b>true</b>).
                The default value is <b>false</b>.
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">Please note that this setting is used when the <a href="<%= Url.Action("config/editor/customization") %>#compactHeader">compactHeader</a> and <a href="<%= Url.Action("config/editor/customization") %>#toolbarNoTabs">toolbarNoTabs</a> parameters are set to <b>true</b>.</div>
                <img class="screenshot max-width-832" src="<%= Url.Content("~/content/img/editor/toolbarHideFileName.png") %>" alt="" />
            </td>
        </tr>
        <tr>
            <td id="toolbarNoTabs" class="copy-link">toolbarNoTabs</td>
            <td>
                Defines if the top toolbar tabs are distinctly displayed (<b>false</b>) or only highlighted to see which one is selected (<b>true</b>).
                The default value is <b>false</b>.
            </td>
            <td>boolean</td>
            <td>false</td>
        </tr>
        <tr class="tablerow">
            <td colspan="4">
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/toolbarNoTabs.png") %>" alt="" />
            </td>
        </tr>
        <tr>
            <td id="trackChanges" class="copy-link">trackChanges</td>
            <td>
                Defines if the document is opened in the review editing mode (<b>true</b>) or not (<b>false</b>) regardless of the <a href="<%= Url.Action("config/document/permissions") %>#review">document.permissions.review</a> parameter (the review mode is changed only for the current user).
                If the parameter is <em>undefined</em>, the <em>document.permissions.review</em> value is used (for all the document users).
            </td>
            <td>boolean</td>
            <td>true</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">Deprecated since version 7.0. Please use the <a href="#review">review.trackChanges</a> parameter instead.</div>
            </td>
        </tr>
        <tr>
            <td id="uiTheme" class="copy-link">uiTheme</td>
            <td>
                Defines the editor theme settings.
                It can be set in two ways:
                <ul>
                    <li><b>theme id</b> - the user sets the theme parameter by its id (<b>theme-light</b>, <b>theme-classic-light</b>, <b>theme-dark</b>, <b>theme-contrast-dark</b>),</li>
                    <li>
                        <b>default theme</b> - the default dark or light theme value will be set (<b>default-dark</b>, <b>default-light</b>).
                        The default light theme is <b>theme-classic-light</b>.
                    </li>
                </ul>
                The first option has higher priority.
                <p></p>
                Apart from the available editor themes, the user can also customize their own <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-change-theme.aspx" target="_blank">color themes</a> for the application interface.
            </td>
            <td>string</td>
            <td>theme-dark</td>
        </tr>
        <tr class="tablerow tablerow-note">
            <td colspan="4">
                <div class="note">Please note that in case this setting is changed in the editor interface, it will be stored in the browser local storage and will overwrite any values sent as the <em>editorConfig.customization.uiTheme</em> parameter.</div>
            </td>
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
                The default value is centimeters (<b>cm</b>).
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
                <img class="screenshot" src="<%= Url.Content("~/content/img/editor/customization.png") %>" alt="" />
            </td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
<span id="requiredDescr" class="required-descr"><span class="required">*</span><em> - available for editing only for ONLYOFFICE Developer Edition</em></span>
<% if (license)
   { %>
<span id="requiredDescr2" class="required-descr"><span class="required">**</span><em> - extended white label option for Developer Edition</em></span>
<% } %>

<div class="header-gray">Example</div>
<p>
    Where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.
    See the <a href="<%= Url.Action("howitworks") %>">How it works</a> section to find out more on Document Server service client-server interactions.
</p>

<p>
    If you have any further questions, please contact us at
    <a href="mailto:integration@onlyoffice.com" onclick="if(window.ga){window.ga('send','event','mailto');}return true;">integration@onlyoffice.com</a>.
</p>

<div id="controlFields">
    <div id="customization" class="control-panel">
        <div class="line" style="margin-top: 0px;">
            <label class="dataItemSpan" style="margin-top: 0px;">
                <input type="checkbox" id="editorConfig_customization_anonymous" name="editorConfig_customization_anonymous" hidden="hidden" checked>
                <span></span>
                <label for="editorConfig_customization_anonymous">Anonymous</label>
            </label>
        </div>
        <div id="holder_editorConfig_customization_anonymous" class="config_object_holder">
            <div class="line">
                <label class="dataItemSpan">
                    <input type="checkbox" id="editorConfig_customization_anonymous_request" name="editorConfig_customization_anonymous_request" hidden="hidden" checked>
                    <span></span>
                    <label for="editorConfig_customization_anonymous">Request</label>
                </label>
            </div>
            <div class="line input_line">
                <label for="editorConfig_customization_anonymous_label">Label</label>
                <input type="text" id="editorConfig_customization_anonymous_label" name="editorConfig_customization_anonymous_label" value="Guest">
            </div>
        </div>
        <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="editorConfig_customization_autosave" name="editorConfig_customization_autosave" hidden="hidden">
                <span></span>
                <label for="editorConfig_customization_autosave">Autosave</label>
            </label>
        </div>
        <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="editorConfig_customization_comments" name="editorConfig_customization_comments" hidden="hidden" checked>
                <span></span>
                <label for="editorConfig_customization_comments">Comments</label>
            </label>
        </div>
        <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="editorConfig_customization_compactHeader" name="editorConfig_customization_compactHeader" hidden="hidden">
                <span></span>
                <label for="editorConfig_customization_compactHeader">Compact Header</label>
            </label>
        </div>
       <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="editorConfig_customization_compactToolbar" name="editorConfig_customization_compactToolbar" hidden="hidden">
                <span></span>
                <label for="editorConfig_customization_compactToolbar">Compact Toolbar</label>
            </label>
        </div>
        <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="editorConfig_customization_compatibleFeatures" name="editorConfig_customization_compatibleFeatures" hidden="hidden">
                <span></span>
                <label for="editorConfig_customization_compatibleFeatures">Compatible Features</label>
            </label>
        </div>
        <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="editorConfig_customization_customer" name="editorConfig_customization_customer" hidden="hidden">
                <span></span>
                <label for="editorConfig_customization_customer">Customer</label>
            </label>
        </div>
        <div id="holder_editorConfig_customization_customer" class="config_object_holder" hidden>
            <div class="line input_line">
                <label for="editorConfig_customization_customer_address">Address</label>
                <input type="text" id="editorConfig_customization_customer_address" name="editorConfig_customization_customer_address" value="My City, 123a-45">
            </div>
            <div class="line input_line">
                <label for="editorConfig_customization_customer_info">Info</label>
                <input type="text" id="editorConfig_customization_customer_info" name="editorConfig_customization_customer_info" value="Some additional information">
            </div>
            <div class="line input_line">
                <label for="editorConfig_customization_customer_logo">Logo</label>
                <input type="text" id="editorConfig_customization_customer_logo" name="editorConfig_customization_customer_logo" value="https://example.com/logo-big.png">
            </div>
            <div class="line input_line">
                <label for="editorConfig_customization_customer_logoDark">Logo Dark</label>
                <input type="text" id="editorConfig_customization_customer_logoDark" name="editorConfig_customization_customer_logoDark" value="https://example.com/dark-logo-big.png">
            </div>
            <div class="line input_line">
                <label for="editorConfig_customization_customer_mail">Mail</label>
                <input type="text" id="editorConfig_customization_customer_mail" name="editorConfig_customization_customer_mail" value="john@example.com">
            </div>
            <div class="line input_line">
                <label for="editorConfig_customization_customer_name">Name</label>
                <input type="text" id="editorConfig_customization_customer_name" name="editorConfig_customization_customer_name" value="John Smith and Co.">
            </div>
            <div class="line input_line">
                <label for="editorConfig_customization_customer_phone">phone</label>
                <input type="text" id="editorConfig_customization_customer_phone" name="editorConfig_customization_customer_phone" value="123456789">
            </div>
            <div class="line input_line">
                <label for="editorConfig_customization_customer_www">www</label>
                <input type="text" id="editorConfig_customization_customer_www" name="editorConfig_customization_customer_www" value="example.com">
            </div>
        </div>
        <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="editorConfig_customization_features" name="editorConfig_customization_features" hidden="hidden">
                <span></span>
                <label for="editorConfig_customization_features">Features</label>
            </label>
        </div>
        <div id="holder_editorConfig_customization_features" class="config_object_holder" hidden>
            <div class="line">
                <label class="dataItemSpan">
                    <input type="checkbox" id="editorConfig_customization_features_spellcheck" name="editorConfig_customization_features_spellcheck" hidden="hidden" checked>
                    <span></span>
                    <label for="editorConfig_customization_features_spellcheck">Features.Spellcheck</label>
                </label>
            </div>
            <div class="line">
                <label class="dataItemSpan">
                    <input type="checkbox" id="editorConfig_customization_features_spellcheck_mode" name="editorConfig_customization_features_spellcheck_mode" hidden="hidden">
                    <span></span>
                    <label for="editorConfig_customization_features_spellcheck_mode">Features.Spellcheck.Mode</label>
                </label>
            </div>
        </div>
        <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="editorConfig_customization_feedback" name="editorConfig_customization_feedback" hidden="hidden">
                <span></span>
                <label for="editorConfig_customization_feedback">Feedback</label>
            </label>
        </div>
        <div id="holder_editorConfig_customization_feedback" class="config_object_holder" hidden>
            <div class="line input_line">
                <label for="editorConfig_customization_feedback_url">url</label>
                <input type="text" id="editorConfig_customization_feedback_url" name="editorConfig_customization_feedback_url" value="https://example.com">
            </div>
            <div class="line">
                <label class="dataItemSpan">
                    <input type="checkbox" id="editorConfig_customization_feedback_visible" name="editorConfig_customization_feedback_visible" hidden="hidden" checked>
                    <span></span>
                    <label for="editorConfig_customization_feedback_visible">Visible</label>
                </label>
            </div>
        </div>
        <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="editorConfig_customization_forcesave" name="editorConfig_customization_forcesave" hidden="hidden">
                <span></span>
                <label for="editorConfig_customization_forcesave">Force Save</label>
            </label>
        </div>
        <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="editorConfig_customization_goback" name="editorConfig_customization_goback" hidden="hidden">
                <span></span>
                <label for="editorConfig_customization_goback">Go back</label>
            </label>
        </div>
        <div id="holder_editorConfig_customization_goback" class="config_object_holder" hidden>
            <div class="line">
                <label class="dataItemSpan">
                    <input type="checkbox" id="editorConfig_customization_goback_blank" name="editorConfig_customization_goback_blank" hidden="hidden" checked>
                    <span></span>
                    <label for="editorConfig_customization_goback_blank">Blank</label>
                </label>
            </div>
            <div class="line">
                <label class="dataItemSpan">
                    <input type="checkbox" id="editorConfig_customization_goback_requestClose" name="editorConfig_customization_goback_requestClose" hidden="hidden">
                    <span></span>
                    <label for="editorConfig_customization_goback_requestClose">Request Close</label>
                </label>
            </div>
            <div class="line input_line">
                <label for="editorConfig_customization_goback_text">Text</label>
                <input type="text" id="editorConfig_customization_goback_text" name="editorConfig_customization_goback_text" value="Open file location">
            </div>
            <div class="line input_line">
                <label for="editorConfig_customization_goback_url">Url</label>
                <input type="text" id="editorConfig_customization_goback_url" name="editorConfig_customization_goback_url" value="https://example.com">
            </div>
        </div>
        <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="editorConfig_customization_help" name="editorConfig_customization_help" hidden="hidden" checked>
                <span></span>
                <label for="editorConfig_customization_help">Help</label>
            </label>
        </div>
        <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="editorConfig_customization_hideRightMenu" name="editorConfig_customization_hideRightMenu" hidden="hidden">
                <span></span>
                <label for="editorConfig_customization_hideRightMenu">Hide Right Menu</label>
            </label>
        </div>
        <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="editorConfig_customization_hideRulers" name="editorConfig_customization_hideRulers" hidden="hidden">
                <span></span>
                <label for="editorConfig_customization_hideRulers">Hide Rulers</label>
            </label>
        </div>
        <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="editorConfig_customization_integrationMode" name="editorConfig_customization_integrationMode" hidden="hidden" checked>
                <span></span>
                <label for="editorConfig_customization_integrationMode">Integration Mode</label>
            </label>
        </div>
        <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="editorConfig_customization_logo" name="editorConfig_customization_logo" hidden="hidden">
                <span></span>
                <label for="editorConfig_customization_logo">Logo</label>
            </label>
        </div>
        <div id="holder_editorConfig_customization_logo" class="config_object_holder" hidden>
            <div class="line input_line">
                <label for="editorConfig_customization_logo_image">Image</label>
                <input type="text" id="editorConfig_customization_logo_image" name="editorConfig_customization_logo_image" value="https://example.com/logo.png">
            </div>
            <div class="line input_line">
                <label for="editorConfig_customization_logo_imageDark">Image Dark</label>
                <input type="text" id="editorConfig_customization_logo_imageDark" name="editorConfig_customization_logo_imageDark" value="https://example.com/dark-logo.png">
            </div>
            <div class="line input_line">
                <label for="editorConfig_customization_logo_url">Url</label>
                <input type="text" id="editorConfig_customization_logo_url" name="editorConfig_customization_logo_url" value="https://example.com">
            </div>
        </div>
        <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="editorConfig_customization_macros" name="editorConfig_customization_macros" hidden="hidden" checked>
                <span></span>
                <label for="editorConfig_customization_macros">Macros</label>
            </label>
        </div>
        <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="editorConfig_customization_mentionShare" name="editorConfig_customization_mentionShare" hidden="hidden" checked>
                <span></span>
                <label for="editorConfig_customization_mentionShare">Mention share</label>
            </label>
        </div>
        <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="editorConfig_customization_mobileForceView" name="editorConfig_customization_mobileForceView" hidden="hidden" checked>
                <span></span>
                <label for="editorConfig_customization_mobileForceView">Mobile force view</label>
            </label>
        </div>
        <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="editorConfig_customization_plugins" name="editorConfig_customization_plugins" hidden="hidden" checked>
                <span></span>
                <label for="editorConfig_customization_plugins">Plugins</label>
            </label>
        </div>
        <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="editorConfig_customization_review" name="editorConfig_customization_review" hidden="hidden">
                <span></span>
                <label for="editorConfig_customization_review">Review</label>
            </label>
        </div>

        <div id="holder_editorConfig_customization_review" class="config_object_holder" hidden>
            <div class="line input_line">
                <label for="editorConfig_customization_review_reviewDisplay">Review Display</label>
                <select class="select" id="editorConfig_customization_review_reviewDisplay" name="editorConfig_customization_review_reviewDisplay">
                    <option value="original" disabled>original</option>
                    <option value="markup">markup</option>
                    <option value="simple">simple</option>
                    <option value="final">final</option>
                    <option value="original" selected>original</option>
                </select>
            </div>
            <div class="line">
                <label class="dataItemSpan">
                    <input type="checkbox" id="editorConfig_customization_review_hideReviewDisplay" name="editorConfig_customization_review_hideReviewDisplay" hidden="hidden">
                    <span></span>
                    <label for="editorConfig_customization_review_hideReviewDisplay">Hide Review Display</label>
                </label>
            </div>
            <div class="line">
                <label class="dataItemSpan">
                    <input type="checkbox" id="editorConfig_customization_review_showReviewChanges" name="editorConfig_customization_review_showReviewChanges" hidden="hidden">
                    <span></span>
                    <label for="editorConfig_customization_review_showReviewChanges">Show Review Changes</label>
                </label>
            </div>
            <div class="line">
                <label class="dataItemSpan">
                    <input type="checkbox" id="editorConfig_customization_review_trackChanges" name="editorConfig_customization_review_trackChanges" hidden="hidden" checked>
                    <span></span>
                    <label for="editorConfig_customization_review_trackChanges">Track Changes</label>
                </label>
            </div>
            <div class="line">
                <label class="dataItemSpan">
                    <input type="checkbox" id="editorConfig_customization_review_hoverMode" name="editorConfig_customization_review_hoverMode" hidden="hidden">
                    <span></span>
                    <label for="editorConfig_customization_review_hoverMode">Hover Mode</label>
                </label>
            </div>
        </div>
        <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="editorConfig_customization_submitForm" name="editorConfig_customization_submitForm" hidden="hidden" checked>
                <span></span>
                <label for="editorConfig_customization_submitForm">Submit Form</label>
            </label>
        </div>
        <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="editorConfig_customization_toolbarHideFileName" name="editorConfig_customization_toolbarHideFileName" hidden="hidden">
                <span></span>
                <label for="editorConfig_customization_toolbarHideFileName">Toolbar Hide File Name</label>
            </label>
        </div>
        <div class="line">
            <label class="dataItemSpan">
                <input type="checkbox" id="editorConfig_customization_toolbarNoTabs" name="editorConfig_customization_toolbarNoTabs" hidden="hidden">
                <span></span>
                <label for="editorConfig_customization_toolbarNoTabs">Toolbar No Tabs</label>
            </label>
        </div>
        <div class="line input_line" id="macrosModeLine">
            <label for="editorConfig_customization_macrosMode">Macros Mode</label>
            <select class="select" id="editorConfig_customization_macrosMode" name="editorConfig_customization_macrosMode">
                <option value="warn" disabled>Warn</option>
                <option value="warn" selected>Warn</option>
                <option value="disable">Disable</option>
                <option value="enable">Enable</option>
            </select>
        </div>
        <div class="line input_line">
            <label for="editorConfig_customization_uiTheme">UiTheme</label>
            <select class="select" id="editorConfig_customization_uiTheme" name="editorConfig_customization_uiTheme">
                <option value="theme-dark" disabled>theme-dark</option>
                <option value="theme-classic-light">theme-classic-light</option>
                <option value="theme-light">theme-light</option>
                <option value="theme-dark" selected>theme-dark</option>
                <option value="theme-contrast-dark">theme-contrast-dark</option>
            </select>
        </div>
        <div class="line input_line">
            <label for="editorConfig_customization_unit">Unit</label>
            <select class="select" id="editorConfig_customization_unit" name="editorConfig_customization_unit">
                <option value="cm" disabled>cm</option>
                <option value="cm" selected>cm</option>
                <option value="pt">pt</option>
                <option value="inch ">inch </option>
            </select>
        </div>
        <div class="line input_line">
            <label for="editorConfig_customization_zoom">Zoom</label>
            <input type="text" id="editorConfig_customization_zoom" name="editorConfig_customization_zoom" value="100">
        </div>
    </div>
</div>
<div id="configPreHolder">
    <pre id="configPre"></pre>
</div>


<div id="editorSpace">
    <div id="placeholder"></div>
</div>
<script>
    $('.select').each(function () {
        const _this = $(this),
            selectOption = _this.find('option'),
            selectOptionLength = selectOption.length,
            selectedOption = selectOption.filter(':selected'),
            duration = 120;

        _this.hide();
        _this.wrap('<div class="select"></div>');
        $('<div>', {
            class: 'new-select',
            text: _this.children('option:disabled').text()
        }).insertAfter(_this);

        const selectHead = _this.next('.new-select');
        $('<div>', {
            class: 'new-select__list'
        }).insertAfter(selectHead);

        const selectList = selectHead.next('.new-select__list');
        for (let i = 1; i < selectOptionLength; i++) {
            $('<div>', {
                class: 'new-select__item',
                html: $('<span>', {
                    text: selectOption.eq(i).text()
                })
            })
                .attr('data-value', selectOption.eq(i).val())
                .appendTo(selectList);
        }

        const selectItem = selectList.find('.new-select__item');
        selectList.slideUp(0);
        selectHead.on('click', function () {
            if (!$(this).hasClass('on')) {
                $(this).addClass('on');
                selectList.slideDown(duration);
                selectItem.on('click', function () {
                    let chooseItem = $(this).data('value');
                    $('select').val(chooseItem).attr('selected', 'selected');
                    selectHead.text($(this).find('span').text());
                    selectList.slideUp(duration);
                    selectHead.removeClass('on');
                    updateConfig();
                });
                window.addEventListener('click', function (e) {
                    if (e.target != selectList[0] && e.target != selectHead[0] && e.target != selectItem[0]) {
                        selectHead.removeClass('on');
                        selectList.slideUp(duration);
                    }
                });
            } else {
                $(this).removeClass('on');
                selectList.slideUp(duration);
            }
        });
    });
</script>
<script id="scriptApi" type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_url"] ?? "" %>/web-apps/apps/api/documents/api.js"></script>
<script type="text/javascript">

    // Editor window
    var config = <%= Config.Serialize(
    new Config {
        Document = new Config.DocumentConfig
            {
                FileType = "docx",
                Key = "apiwh" + Guid.NewGuid(),
                Permissions = new Config.DocumentConfig.PermissionsConfig(),
                Title = "Example Title." + "docx",
                Url = ConfigurationManager.AppSettings["storage_demo_url"] + "demo." + "docx" 
            },
        DocumentType = "word",
        EditorConfig = new Config.EditorConfigConfiguration
            {
                CallbackUrl = Url.Action("callback", "editors", null, Request.Url.Scheme),
                Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                    {   
                        Anonymous = new Config.EditorConfigConfiguration.CustomizationConfig.AnonymousConfig
                            {
                                Request = true
                            },
                        Feedback = new Config.EditorConfigConfiguration.CustomizationConfig.FeedbackConfig
                            {
                                Visible = true
                            },
                        IntegrationMode = "embed",
                }
            },
        Height = "550px",
        Width = "100%"
    }) %>;
    window.docEditor = new DocsAPI.DocEditor("placeholder", config);
</script>

<script>
    $(document).ready(function () {
        resizeCodeInput();
        updateConfig();
    });

    $("#controlFields").find("input,select").change(function () {
        updateConfig();
    });

    $("#editorConfig_customization_anonymous").change(showHideConfigObject);
    $("#editorConfig_customization_customer").change(showHideConfigObject);
    $("#editorConfig_customization_feedback").change(showHideConfigObject);
    $("#editorConfig_customization_features").change(showHideConfigObject);
    $("#editorConfig_customization_goback").change(showHideConfigObject);
    $("#editorConfig_customization_logo").change(showHideConfigObject);
    $("#editorConfig_customization_review").change(showHideConfigObject);

    function showHideConfigObject(e) {
        var hidden = document.getElementById(`holder_${e.target.id}`).hidden;
        document.getElementById(`holder_${e.target.id}`).hidden = !hidden;
        resizeCodeInput();
    }

    function getFeaturesValue() {
        if (!getFieldValue("editorConfig_customization_features")) {
            return "";
        }
        if (!getFieldValue("editorConfig_customization_features_spellcheck_mode")) {
            return `"features": {
                "spellcheck": ${getFieldValue("editorConfig_customization_features_spellcheck")}
            },
            `
        } else {
            return `"features": {
                "spellcheck": {
                    "mode": true
                }
            },
            `
        }
    }

    function updateConfig() {
        var macrosMode = `
            "macrosMode": ${getFieldValue("editorConfig_customization_macrosMode")},`;
        if (!document.getElementById("editorConfig_customization_macros").checked) {
            document.getElementById(`macrosModeLine`).hidden = true;
            macrosMode = "";
        } else {
            document.getElementById(`macrosModeLine`).hidden = false;
        }

        var anonymous = getFieldValue("editorConfig_customization_anonymous") ?
            `"anonymous": {
                "request": ${getFieldValue("editorConfig_customization_anonymous_request")},
                "label": ${getFieldValue("editorConfig_customization_anonymous_label")}
            },
            ` : "";
        var customer = getFieldValue("editorConfig_customization_customer") ?
            `"customer": {
                "address": ${getFieldValue("editorConfig_customization_customer_address")},
                "info": ${getFieldValue("editorConfig_customization_customer_info")},
                "logo": ${getFieldValue("editorConfig_customization_customer_logo")},
                "logoDark": ${getFieldValue("editorConfig_customization_customer_logoDark")},
                "mail": ${getFieldValue("editorConfig_customization_customer_mail")},
                "name": ${getFieldValue("editorConfig_customization_customer_name")},
                "phone": ${getFieldValue("editorConfig_customization_customer_phone")},
                "www": ${getFieldValue("editorConfig_customization_customer_www")}
            },
            ` : "";
        var features = getFeaturesValue();
        var feedback = getFieldValue("editorConfig_customization_feedback") ?
            `"feedback": {
                "url": ${getFieldValue("editorConfig_customization_feedback_url")},
                "visible": ${getFieldValue("editorConfig_customization_feedback_visible")}
            },
            ` : "";
        var goback = getFieldValue("editorConfig_customization_goback") ?
            `"goback": {
                "blank": ${getFieldValue("editorConfig_customization_goback_blank")},
                "requestClose": ${getFieldValue("editorConfig_customization_goback_requestClose")},
                "text": ${getFieldValue("editorConfig_customization_goback_text")},
                "url": ${getFieldValue("editorConfig_customization_goback_url")}
            },
            ` : "";
        var logo = getFieldValue("editorConfig_customization_logo") ?
            `"logo": {
                "image": ${getFieldValue("editorConfig_customization_logo_image")},
                "imageDark": ${getFieldValue("editorConfig_customization_logo_imageDark")},
                "url": ${getFieldValue("editorConfig_customization_logo_url")}
            },
            ` : "";
        var review = getFieldValue("editorConfig_customization_review") ?
            `"review": {
                "hideReviewDisplay": ${getFieldValue("editorConfig_customization_review_hideReviewDisplay")},
                "showReviewChanges": ${getFieldValue("editorConfig_customization_review_showReviewChanges")},
                "reviewDisplay": ${getFieldValue("editorConfig_customization_review_reviewDisplay")},
                "trackChanges": ${getFieldValue("editorConfig_customization_review_trackChanges")},
                "hoverMode": ${getFieldValue("editorConfig_customization_review_hoverMode")}
            },
            ` : "";
        var integrationMode = getFieldValue("editorConfig_customization_integrationMode") ? `
            "integrationMode": "embed",` : "";
        var customization = `{
            ${anonymous}"autosave": ${getFieldValue("editorConfig_customization_autosave")},
            "comments": ${getFieldValue("editorConfig_customization_comments")},
            "compactHeader": ${getFieldValue("editorConfig_customization_compactHeader")},
            "compactToolbar": ${getFieldValue("editorConfig_customization_compactToolbar")},
            "compatibleFeatures": ${getFieldValue("editorConfig_customization_compatibleFeatures")},
            ${customer}${features}${feedback}"forcesave": ${getFieldValue("editorConfig_customization_forcesave")},
            ${goback}"help": ${getFieldValue("editorConfig_customization_help")},
            "hideRightMenu": ${getFieldValue("editorConfig_customization_hideRightMenu")},
            "hideRulers": ${getFieldValue("editorConfig_customization_hideRulers")},${integrationMode}
            ${logo}"macros": ${getFieldValue("editorConfig_customization_macros")},${macrosMode}
            "mentionShare": ${getFieldValue("editorConfig_customization_mentionShare")},
            "mobileForceView": ${getFieldValue("editorConfig_customization_mobileForceView")},
            "plugins": ${getFieldValue("editorConfig_customization_plugins")},
            ${review}"toolbarHideFileName": ${getFieldValue("editorConfig_customization_toolbarHideFileName")},
            "toolbarNoTabs": ${getFieldValue("editorConfig_customization_toolbarNoTabs")},
            "uiTheme": ${getFieldValue("editorConfig_customization_uiTheme")},
            "unit": ${getFieldValue("editorConfig_customization_unit")},
            "zoom": ${getFieldValue("editorConfig_customization_zoom")}
        }`;
        var config_string =
`var docEditor = new DocsAPI.DocEditor("placeholder", {
    "editorConfig": {
        "customization": ${customization}
        ,
        ...
    },
    ...
});
`;
        var customization_object = JSON.parse(customization);
        if (!customization_object.anonymous) {
            customization_object.anonymous = { request: false }
        }
        config.editorConfig.customization = customization_object;
        window.docEditor.destroyEditor();
        window.docEditor = new DocsAPI.DocEditor("placeholder", config);
        var pre = document.getElementById("configPre");
        pre.innerHTML = config_string;
        hljs.highlightBlock(pre);
    }

    function getFieldValue(id) {
        var element = document.getElementById(id);
        if (document.getElementById(id).parentElement.className == "select") {
            return `"${document.getElementById(id).parentElement.children[1].innerText}"`;
        } else if (element.type == "checkbox") {
            return element.checked;
        } else if (element.id == `editorConfig_customization_zoom`) {
            return isNaN(Number(element.value)) ? 0 : Number(element.value);
        } else if (`${element.value}` == ``) {
            return `""`;
        } else if (isNaN(element.value)) {
            return `"${element.value}"`;
        } else {
            return Number(element.value);
        }
    }

    function resizeCodeInput() {
        var paddingTop = Number(getComputedStyle(document.getElementsByTagName("pre")[0]).paddingTop.split("px")[0]);
        var paddingBottom = Number(getComputedStyle(document.getElementsByTagName("pre")[0]).paddingBottom.split("px")[0]);
        var borderSize = Number(getComputedStyle(document.getElementsByTagName("pre")[0]).border.split("px")[0]);
        var controlFieldsHeight = Math.round(document.getElementById("controlFields").getBoundingClientRect().height * 100) / 100;

        var offset = paddingTop + paddingBottom + (borderSize * 2);
        var height = controlFieldsHeight - offset;

        document.getElementById("configPre").style.height = `${height}px`;
    }
</script>