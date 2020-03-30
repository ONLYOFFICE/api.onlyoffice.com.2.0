﻿<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    init
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <a class="up" href="<%= Url.Action("plugin") %>"></a>
        <span class="hdr">window.Asc.plugin.init(data)</span>
    </h1>

    <div class="header-gray">Description</div>

    <p class="dscr">Defines the data sent to the plugin describing what actions are to be performed and how they must be performed. This method is called when the plugin is launched.</p>

    <div class="header-gray">Parameters</div>

    <table class="table">
        <colgroup>
            <col style="width: 100px;" />
            <col />
            <col style="width: 100px;" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Name</td>
                <td>Description</td>
                <td>Type</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td>data</td>
                <td>The data parameter depends on the <em>"initDataType"</em> setting specified in the plugin configuration <a href="<%= Url.Action("config") %>">config.json</a> file. It can be of the following type: <em>"none"</em> - an empty string, <em>"text"</em> - the selected document text, <em>"html"</em> - selected document fragment, <em>"ole"</em> - OLE object data.</td>
                <td>string</td>
            </tr>
        </tbody>
    </table>

    <div class="header-gray">Example</div>

    <pre>
window.Asc.plugin.init = function () {
    this.callCommand(function() {
        var oDocument = Api.GetDocument();
        var oParagraph = Api.CreateParagraph();
        oParagraph.AddText("Hello world!");
        oDocument.InsertContent([oParagraph]);
    }, true);
};
</pre>
</asp:Content>
