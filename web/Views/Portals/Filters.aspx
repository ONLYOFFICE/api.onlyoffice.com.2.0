<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" ContentType="text/html"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Filters
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <h1>
        <span class="hdr">Request filtering</span>
    </h1>

    <p>Every request to the API supports a certain number of parameters sent in the URL.</p>
    <p>For example, the <a href="<%= Url.DocUrl("people", null, "get", "api/2.0/people", "portals") %>">api/2.0/people</a> request can be appended with several parameters:</p>
    <pre>
api/2.0/people?startIndex=10&amp;count=25
</pre>
 
    <div class="header-gray">Request parameters</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col/>
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Parameter</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td>count</td>
                <td>Number of the elements returned.</td>
            </tr>
            <tr class="tablerow">
                <td>startIndex</td>
                <td>Number of the elements to be skipped in the beginning. Used for response data pagination.</td>
            </tr>
            <tr class="tablerow">
                <td>sortBy</td>
                <td>Sorts results by the field name.</td>
            </tr>
            <tr class="tablerow">
                <td>sortOrder</td>
                <td>
                    Sorting direction (<em>"descending"</em> or <em>"ascending"</em>). It must be used together with the <b>sortBy</b> parameter:<br/>
                    <em>api/2.0/people?sortBy=userName&amp;sortOrder=descending</em>
                </td>
            </tr>
            <tr class="tablerow">
                <td>filterBy</td>
                <td>Filters results by the field name.</td>
            </tr>
            <tr class="tablerow">
                <td>filterOp</td>
                <td>Filtering operation: <em>"contains"</em>, <em>"equals"</em>, <em>"startsWith"</em>, <em>"present"</em>.</td>
            </tr>
            <tr class="tablerow">
                <td>filterValue</td>
                <td>
                    Filter value. It must be used together with the <b>filterBy</b> and <b>filterOp</b> parameters:<br/>
                    <em>api/2.0/people?filterBy=userName&amp;filterOp=startsWith&amp;filterValue=Alex</em>
                </td>
            </tr>
            <tr class="tablerow">
                <td>updatedSince</td>
                <td>Returns the values updated or created since a certain period of time.</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

</asp:Content>
