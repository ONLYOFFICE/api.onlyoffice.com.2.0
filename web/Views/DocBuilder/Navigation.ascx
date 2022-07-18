<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>
<%@ Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl" %>

<div class="treeheader">Get Started</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("basic") %>">Overview</a>
    </li>
    <li>
        <a href="<%= Url.Action("gettingstarted") %>">Getting started</a>
    </li>
    <li>
        <a href="<%= Url.Action("try") %>">Try now</a>
    </li>
    <li>
        <a href="<%= Url.Action("integratingdocumentbuilder") %>">Integrating Document Builder</a>
        <ul>
            <li>
                <a href="<%= Url.Action("csharpexample") %>">.Net (C#) example</a>
            </li>
            <li>
                <a href="<%= Url.Action("nodejsexample") %>">Node.js example</a>
            </li>
            <li>
                <a href="<%= Url.Action("phpexample") %>">PHP example</a>
            </li>
            <li>
                <a href="<%= Url.Action("rubyexample") %>">Ruby example</a>
            </li>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("howitworks") %>">How it works</a>
        <ul>
            <li>
                <a href="<%= Url.Action("howitworks/globalvariable") %>">Exchanging data among files</a>
            </li>
            <li>
                <a href="<%= Url.Action("howitworks/comparedocuments") %>">Comparing documents</a>
            </li>
        </ul>
    </li>
</ul>

<div class="treeheader">Usage API</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("integrationapi") %>">Integration API</a>
        <ul>
            <li>
                <a href="<%= Url.Action("integrationapi/usingdocbuilderfile") %>">Using .docbuilder file</a>
            </li>
            <li>
                <a href="<%= Url.Action("integrationapi/cdocbuilder") %>">CDocBuilder class</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("integrationapi/cdocbuilder/closefile") %>">CloseFile</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("integrationapi/cdocbuilder/createfile") %>">CreateFile</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("integrationapi/cdocbuilder/dispose") %>">Dispose</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("integrationapi/cdocbuilder/executecommand") %>">ExecuteCommand</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("integrationapi/cdocbuilder/initialize") %>">Initialize</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("integrationapi/cdocbuilder/openfile") %>">OpenFile</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("integrationapi/cdocbuilder/run") %>">Run</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("integrationapi/cdocbuilder/runtexta") %>">RunTextA</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("integrationapi/cdocbuilder/runtextw") %>">RunTextW</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("integrationapi/cdocbuilder/savefile") %>">SaveFile</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("integrationapi/cdocbuilder/setproperty") %>">SetProperty</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("integrationapi/cdocbuilder/setpropertyw") %>">SetPropertyW</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("integrationapi/cdocbuilder/settmpfolder") %>">SetTmpFolder</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="<%= Url.Action("integrationapi/arguments") %>">Using command line arguments</a>
            </li>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("textdocumentapi") %>">Text document API</a>
        <ul>
            <% foreach (var entry in DocBuilderDocumentation.GetModule("word")) { %>
                <li>
                    <a href="<%= Url.Action(string.Format("textdocumentapi/{0}", entry.Key.ToLower())) %>"> <%= entry.Key %></a>
                    <ul>
                        <% foreach (var method in entry.Value.Methods) { %>
                            <li>
                                <a title=<%= method.Key %> href="<%= Url.Action(string.Format("textdocumentapi/{0}/{1}", entry.Key.ToLower(), method.Key.ToLower())) %>"><%= method.Key %></a>
                            </li>
                        <% } %>
                    </ul>
                </li>
            <% } %>
        </ul>
    <li>
        <a href="<%= Url.Action("spreadsheetapi") %>">Spreadsheet API</a>
        <ul>
            <% foreach (var entry in DocBuilderDocumentation.GetModule("cell")) { %>
                <li>
                    <a href="<%= Url.Action(string.Format("spreadsheetapi/{0}", entry.Key.ToLower())) %>"> <%= entry.Key %></a>
                    <ul>
                        <% foreach (var method in entry.Value.Methods) { %>
                            <li>
                                <a title=<%= method.Key %> href="<%= Url.Action(string.Format("spreadsheetapi/{0}/{1}", entry.Key.ToLower(), method.Key.ToLower())) %>"><%= method.Key %></a>
                            </li>
                        <% } %>
                    </ul>
                </li>
            <% } %>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("presentationapi") %>">Presentation API</a>
        <ul>
            <% foreach (var entry in DocBuilderDocumentation.GetModule("slide")) { %>
                <li>
                    <a href="<%= Url.Action(string.Format("presentationapi/{0}", entry.Key.ToLower())) %>"> <%= entry.Key %></a>
                    <ul>
                        <% foreach (var method in entry.Value.Methods) { %>
                            <li>
                                <a title=<%= method.Key %> href="<%= Url.Action(string.Format("presentationapi/{0}/{1}", entry.Key.ToLower(), method.Key.ToLower())) %>"><%= method.Key %></a>
                            </li>
                        <% } %>
                    </ul>
                </li>
            <% } %>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("formapi") %>">Form API</a>
        <ul>
            <% foreach (var entry in DocBuilderDocumentation.GetModule("form")) { %>
                <li>
                    <a href="<%= Url.Action(string.Format("formapi/{0}", entry.Key.ToLower())) %>"> <%= entry.Key %></a>
                    <ul>
                        <% foreach (var method in entry.Value.Methods) { %>
                            <li>
                                <a title=<%= method.Key %> href="<%= Url.Action(string.Format("formapi/{0}/{1}", entry.Key.ToLower(), method.Key.ToLower())) %>"><%= method.Key %></a>
                            </li>
                        <% } %>
                    </ul>
                </li>
            <% } %>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("global") %>">Global</a>
    </li>
    <li>
        <a href="<%= Url.Action("classlist") %>">List of classes</a>
    </li>
</ul>

<div class="treeheader">More information</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("buildersamples") %>">Builder samples</a>
        <ul>
            <li><a href="<%= Url.Action("buildersamples/creatingaformaldocument") %>">Creating a formal document</a></li>
            <li><a href="<%= Url.Action("buildersamples/addingtext") %>">Adding text to the opened document</a></li>
            <li><a href="<%= Url.Action("buildersamples/convertingadocument") %>">Converting a document</a></li>
            <li><a href="<%= Url.Action("buildersamples/creatingatable") %>">Creating a statistical table</a></li>
            <li><a href="<%= Url.Action("buildersamples/creatingapresentation") %>">Creating a presentation</a></li>
            <li><a href="<%= Url.Action("buildersamples/creatingreports") %>">Creating a comment/review report</a></li>
            <li><a href="<%= Url.Action("buildersamples/insertingawatermark") %>">Inserting a watermark</a></li>
            <li><a href="<%= Url.Action("buildersamples/mailmergereceptions") %>">Mail merge receptions</a></li>
            <li><a href="<%= Url.Action("buildersamples/mailmergeprocess") %>">Mail merge process</a></li>
        </ul>
    </li>
    <li>
        <a href="<%= Url.Action("changelog") %>">Changelog</a>
    </li>
</ul>