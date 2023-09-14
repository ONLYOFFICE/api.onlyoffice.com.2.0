<%@ Import Namespace="ASC.Api.Web.Help.Models" %>
<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>
<%@ 
    Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage<MethodViewModel>"
    ContentType="text/html"
%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <% var method = (Model as MethodViewModel).Method; %>
    <%= !string.IsNullOrEmpty(method.ShortName) ? method.ShortName : method.Summary %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% var model = Model as MethodViewModel;
       var method = model.Method; %>
    <h1>
        <a href="<%= Url.DocUrl(model.Section.Name, string.IsNullOrEmpty(method.Category) ? null : method.Category, null, null, Html.GetCurrentController()) %>" class="up"></a>
        <span class="hdr"><%= method.HttpMethod + " " + method.Path %></span>
        <% if (method.Authentification)
          { %>
        <span class="comment">This function requires authentication</span>
        <% } %>
    </h1>
    
    <div id="methodDesc">
        <% if (!string.IsNullOrEmpty(method.Summary))
              { %>
        <div class="header-gray">Description</div>
        <p class="dscr"><%= method.Summary %></p>
        <% } %>
    </div>

    <div class="header-gray">Parameters</div>
    <% if (method.Params.Any(x => x.Visible))
       { %>
    <div id="methodParams">
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
            <% MsDocEntryPointMethodParams inDto = null; %>
            <% foreach (var param in method.Params.OrderByDescending(x => x.Method).Where(x => x.Visible))
                {
                    if (param.Name == "inDto")
                    {
                        inDto = param;
                        continue;
                    }
                    var paramModel = DocSpaceDocumentation.GetPluralizer().ToHumanName(param.Type); %>
                <tr class="tablerow">
                    <td>
                        <%= param.Name %>
                        <div class="infotext">sent in <%= param.Method %></div>
                    </td>
                    <td>
                        <%= param.Description %>
                        <% if (!string.IsNullOrEmpty(param.Remarks)) { %>
                        <div class="infotext"><%= param.Remarks %></div><% } %>
                        <% if (DocSpaceDocumentation.GetPluralizer().IsOptional(param.Type) || param.IsOptional) { %>
                        <div class="infotext">optional</div><% } %>
                    </td>
                    <td>
                        <%= paramModel.Description %>
                        <% if (DocSpaceDocumentation.GetPluralizer().IsCollection(param.Type) || paramModel.IsCollection) { %>
                        <div class="infotext">collection</div><% } %>
                    </td>
                    <td>
                        <% if (!string.IsNullOrEmpty(paramModel.Example)) { %><%= paramModel.Example %><% } %>
                        <% if (!string.IsNullOrEmpty(paramModel.Note)) { %>
                        <div class="infotext"><%= paramModel.Note %></div><% } %>
                    </td>
                </tr>
            <% } %>
                <% if (inDto != null && inDto.Dto != null && inDto.Dto.Any()) { 
                        foreach(var prop in inDto.Dto)
                    { %>
                <tr class="tablerow">
                    <td>
                        <%= prop.Name %>
                        <div class="infotext">sent in body</div>
                    </td>
                    <td>
                        <%= prop.Description %>
                    </td> 
                    <td>
                        <%= prop.Type %>
                    </td>
                    <td>
                    </td>
                </tr>
                   <% }
                 } %>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </div>
    <% } else { %>
    <div id="methodParams">
        <p>This method doesn't have any parameters.</p>
    </div>
    <%} %>

    <%if (!string.IsNullOrEmpty(method.Remarks))
      { %>
    <div class="header-gray">Remark</div>
    <p><%= method.Remarks %></p>
    <% } %>
    
    <%if (!string.IsNullOrEmpty(method.Notes))
      { %>
    <div class="header-gray">Notes</div>
    <p><%= method.Notes %></p>
    <% } %>
    
    <div id="methodExample">
        <%if (!string.IsNullOrEmpty(method.Example))
          { %>
        <div class="header-gray">Example</div>
        <pre><%= method.Example%></pre>
        <% } %>
    </div>

    <div class="header-gray">Returns</div>
    <% if (!string.IsNullOrEmpty(method.Returns))
       { %>
    <div id="methodReturns">
        <p><%= method.Returns %></p>
    </div>
    <% } else { %>
    <div id="methodReturns">
        <p>This method doesn't return any data.</p>
    </div>
    <% } %>

    <div id="methodResponse">
    <% if (method.Response.Any())
       { %>
    <div class="header-gray">Example Response</div>
    <% foreach (var output in method.Response.First().Outputs)
       { %>
        <p><%= Html.Encode(output.Key) %></p>
        <pre><%= Html.Encode(output.Value) %></pre>
    <% }
       } %>
    </div>

</asp:Content>
