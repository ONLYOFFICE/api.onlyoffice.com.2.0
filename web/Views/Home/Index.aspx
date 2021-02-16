﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" ContentType="text/html" %>
<%@ Import Namespace="System.Web.Optimization" %>

<asp:Content ID="IndexHead" ContentPlaceHolderID="HeadContent" runat="server">
    <%= Scripts.Render("~/bundles/faq") %>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Welcome
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="products-info">
        <h1>
            <span class="hdr title-main">Welcome to ONLYOFFICE API</span>
        </h1>
    </div>


     <div class="icon-program-block">
        <div class="img-title-docs">
            <p class="name-icon-program"><a href=<%=VirtualPathUtility.ToAbsolute("~/editors/basic")%>>Document Server</a></p>
        </div>
        <div class="img-title-plugins">
            <p class="name-icon-program"><a href='<%=VirtualPathUtility.ToAbsolute("~/plugin/basic")%>'>Plugins and Macros</a></p>
        </div>
        <div class="img-title-builder">
            <p class="name-icon-program"><a href='<%=VirtualPathUtility.ToAbsolute("~/docbuilder/basic")%>'>Document Builder</a></p>
        </div>
        <div class="img-title-groups">
            <p class="name-icon-program"><a href='<%=VirtualPathUtility.ToAbsolute("~/portals/basic")%>'>Community Server</a></p>
        </div>
        <div class="img-title-host">
            <p class="name-icon-program"><a href='<%=VirtualPathUtility.ToAbsolute("~/apisystem/basic")%>'>Hosted Solution</a></p>
        </div>
        <div class="img-title-editors">
            <p class="name-icon-program"><a href='<%=VirtualPathUtility.ToAbsolute("~/")%>'>Desktop</a></p>
         </div>
        </div>

        <div class="body-block">
    <div class="ip_main_part">
        <div class="first-block">
        <div class="docs_block">
            <div class="pp_title long">
              <div class="img-title-docs"></div>
                <p class="title-block">ONLYOFFICE Docs</p>
            </div>
            <div class="pp_info_block">
                Bring document editing and co-authoring to your web app users. In this section you will learn how to set up, configure and integrate ONLYOFFICE Docs.
                <p class="pp_info_block_more"><a href="<%=VirtualPathUtility.ToAbsolute("~/editors/basic")%>">More</a></p>
            </div>
            <div class="pp_users_recommendation">
                <div class="pp_users_block">
                 <div class="first-column">
                    <p class="programs-list-title">Get started</p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/editors/basic")%>">Basic concepts</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/editors/try")%>">Try now</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/editors/demopreview")%>">Integration examples</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/editors/plugins")%>">Integration connectors</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/editors/howitworks")%>">How it works</a></p>
                  </div>
                  <div class="second-column">                    
                    <p class="programs-list-title">Documentation</p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/editors/advanced")%>">Advanced parameters</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/editors/config")%>">Config</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/editors/methods")%>">Methods</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/editors/callback")%>">Callback handler</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/editors/command")%>">Command service</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/editors/conversionapi")%>">Conversion API</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/editors/documentbuilderapi")%>">Document Builder API</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/editors/signature/")%>">Signature</a></p>
                  </div>
                 <div class="third-column">                    
                    <p class="programs-list-title">More info</p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/editors/changelog")%>">Changelog</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/editors/faq")%>">FAQ</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/editors/troubleshooting")%>">Troubleshooting</a></p>
                  </div>
                </div>
            </div>
        </div>



            <div class="docs_block">
            <div class="pp_title long">
            <div class="img-title-builder"></div>
                <p class="title-block">ONLYOFFICE Document Builder</p>
            </div>
            <div class="pp_info_block">
                    Generate documents easily without running a document editor. In this section you will learn how to build documents using JavaScript and integrate Document Builder into your DMS, CRM system, etc. 
             <p class="pp_info_block_more"><a href="<%=VirtualPathUtility.ToAbsolute("~/docbuilder/basic")%>">More</a></p>
            </div>
            <div class="pp_users_recommendation">
                <div class="pp_users_block">
                 <div class="first-column">
                    <p class="programs-list-title">Get started</p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/docbuilder/basic")%>">Introduction</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/docbuilder/gettingstarted")%>">Getting started</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/docbuilder/integratingdocumentbuilder")%>">Integrating Document</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/docbuilder/integratingdocumentbuilder")%>">Builder</a></p>
                 </div>
                 <div class="second-column">
                    <p class="programs-list-title">Documentation</p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/docbuilder/integrationapi")%>">Integration API</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/docbuilder/textdocumentapi")%>">Text document API</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/docbuilder/spreadsheetapi")%>">Spreadsheet API</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/docbuilder/presentationapi")%>">Presentation API</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/docbuilder/global")%>">Global</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/docbuilder/classlist")%>">List of classes</a></p>
                 </div>
                 <div class="third-column">
                  </div>
                </div>
            </div>
        </div>

            <div class="docs_block">
            <div class="pp_title long">
            <div class="img-title-host"></div>
                <p class="title-block">Hosted solution</p>
            </div>
            <div class="pp_info_block">
                    Host ONLYOFFICE Groups to make your collaboration platform online. In this section you will learn how to make GET and POST requests to manage portals, set tariff plans and pass authentication. 
            <p class="pp_info_block_more"><a href="<%=VirtualPathUtility.ToAbsolute("~/apisystem/basic")%>">More</a></p>
            </div>
            <div class="pp_users_recommendation">
                <div class="pp_users_block">
                 <div class="first-column">
                    <p class="programs-list-title">Get started</p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/apisystem/basic")%>">Changelog</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/apisystem/authentication")%>">Authentication</a></p>
                 </div>
                 <div class="second-column">
                    <p class="programs-list-title">Methods</p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/apisystem/section/portal")%>">Portals</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/apisystem/section/tariff")%>">Billing</a></p>
                 </div>
                 <div class="third-column">
                  </div>
                </div>
            </div>
        </div>
    </div>
            
        <div class="second-block">
            <div class="docs_block">
            <div class="pp_title long">
            <div class="img-title-plugins"></div>
                <p class="title-block">Plugins and macros</p>
            </div>
            <div class="pp_info_block">
                    Extend the ONLYOFFICE Docs functionality. In this section you will learn how to create your own plugins/macros:  its structure, development lifecycle, and examples.
            <p class="pp_info_block_more"><a href="<%=VirtualPathUtility.ToAbsolute("~/plugin/basic")%>">More</a></p>
            </div>
            <div class="pp_users_recommendation">
                <div class="pp_users_block"> 
                   <div class="first-column">
                    <p class="programs-list-title">Get started</p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/plugin/basic")%>">Introduction</a></p>
                   </div>
                   <div class="second-column">
                    <p class="programs-list-title">Documentation</p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/plugin/structure")%>">Plugin structure</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/plugin/installation")%>">Plugin installation</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/plugin/localization")%>">Plugin localization</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/plugin/styles")%>">Plugin styles</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/plugin/example")%>">Plugin example</a></p>
                   </div>
                   <div class="third-column">                    
                    <p class="programs-list-title">Macros</p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/installation/plugin/macros")%>">ONLYOFFICE macros</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/plugin/writingmacros")%>">Writing macros</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/plugin/convertingvbamacros")%>">Converting macros</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/plugin/macrosamples")%>">Macro samples</a></p>
                  </div>
                </div>
           </div>
</div>


            <div class="docs_block">
            <div class="pp_title long">
            <div class="img-title-groups"></div>
                <p class="title-block">ONLYOFFICE Groups</p>
            </div>
            <div class="pp_info_block">
                    Create your own productivity platform based on ONLYOFFICE Groups. In this section you will learn how to make GET, POST, PUT and DELETE requests to work with platform modules and pass authentication. 
            <p class="pp_info_block_more"><a href="<%=VirtualPathUtility.ToAbsolute("~/portals/basic")%>">More</a></p>
            </div>
            <div class="pp_users_recommendation">
                <div class="pp_users_block">
                   <div class="first-column">
                    <p class="programs-list-title">Get started</p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/portals/basic")%>">Basic concepts</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/portals/auth")%>">Passing authentication</a></p>
                   </div>
                   <div class="second-column">
                    <p class="programs-list-title">Documentation</p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/portals/section/authentication")%>">authentication</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/portals/section/calendar")%>">calendar</a> | <a href="<%=VirtualPathUtility.ToAbsolute("~/portals/section/capabilities")%>">capabilities</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/portals/section/community")%>">community</a> | <a href="<%=VirtualPathUtility.ToAbsolute("~/portals/section/crm/cases")%>">crm</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/portals/section/feed")%>">feed</a> | <a href="<%=VirtualPathUtility.ToAbsolute("~/portals/section/files")%>">files</a> | <a href="<%=VirtualPathUtility.ToAbsolute("~/portals/section/group")%>">group</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/portals/section/mail")%>">mail</a> | <a href="<%=VirtualPathUtility.ToAbsolute("~/portals/section/mailserver/addressdata")%>">mailserver</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/portals/section/people")%>">people</a> | <a href="<%=VirtualPathUtility.ToAbsolute("~/portals/section/portal")%>">portal</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/portals/section/project")%>">project</a> | <a href="<%=VirtualPathUtility.ToAbsolute("~/portals/section/settings")%>">settings</a></p>
                   </div>
                   <div class="third-column">                    
                    <p class="programs-list-title">Help</p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/portals/faq")%>">F.A.Q.</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/portals/filters")%>">Filtering</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/portals/batch")%>">Batching</a></p>
                  </div>
                </div>
            </div>
       </div>

        <div class="docs_block">
            <div class="pp_title long">
              <div class="img-title-editors"></div>
                <p class="title-block">ONLYOFFICE Desktop Editors</p>
            </div>
            <div class="pp_info_block">
                Extent the ONLYOFFICE Desktop Editors functionality. In this section you will learn how to set up, customize and integrate them with the document management systems.
            <p class="pp_info_block_more"><a href="<%=VirtualPathUtility.ToAbsolute("~/")%>">More</a></p>
            </div>
            <div class="pp_users_recommendation">
                <div class="pp_users_block">
                 <div class="first-column">
                    <p class="programs-list-title">Get started</p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/")%>">Overview</a></p>
                  </div>
                  <div class="second-column">                    
                    <p class="programs-list-title">Documentation</p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/")%>">Adding a DMS provider to the list of connections</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/")%>">Opening in DMS</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/")%>">DMS encryption</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/")%>">Enable debug mode</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/")%>">Adding plugins</a></p>
                  </div>
                 <div class="third-column">                    
                    <p class="programs-list-title">More info</p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/")%>">Changelog</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/")%>">FAQ</a></p>
                    <p class="programs-list"><a href="<%=VirtualPathUtility.ToAbsolute("~/")%>">Troubleshooting</a></p>
                  </div>
                </div>
            </div>
        </div>
        </div>
    </div>
</div>


</asp:Content>
