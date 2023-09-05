<%@ Import Namespace="ASC.Api.Web.Help.DocumentGenerator" %>
<%@ Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl" %>

<div class="nav-list">
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
                <li>
                    <a href="<%= Url.Action("howitworks/createbasicoform") %>">Creating basic oForm</a>
                </li>
                <li>
                    <a href="<%= Url.Action("howitworks/searchoform") %>">Searching by key in oForm</a>
                </li>
                <li>
                    <a href="<%= Url.Action("howitworks/createadvancedoform") %>">Creating advanced oForm</a>
                </li>
                <li>
                    <a href="<%= Url.Action("howitworks/filloform") %>">Filling oForm</a>
                </li>
                <li>
                    <a href="<%= Url.Action("howitworks/readoform") %>">Reading oForm</a>
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
                    <a href="<%= Url.Action("integrationapi/c") %>">Using doctrenderer library</a>
                    <ul>
                        <li>
                            <a href="<%= Url.Action("integrationapi/c") %>">C++ wrapper</a>
                            <ul>
                                <li>
                                    <a href="<%= Url.Action("integrationapi/c/cdocbuilder") %>">CDocBuilder class</a>
                                    <ul>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuilder/closefile") %>">CloseFile</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuilder/createfile") %>">CreateFile</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuilder/dispose") %>">Dispose</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuilder/executecommand") %>">ExecuteCommand</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuilder/getcontext") %>">GetContext</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuilder/getversion") %>">GetVersion</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuilder/initialize") %>">Initialize</a>
                                        </li>
                                        <li>
                                            <a title="IsSaveWithDoctrendererMode" href="<%= Url.Action("integrationapi/c/cdocbuilder/issavewithdoctrenderermode") %>">IsSaveWithDoctrendererMode</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuilder/openfile") %>">OpenFile</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuilder/run") %>">Run</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuilder/runtexta") %>">RunTextA</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuilder/runtextw") %>">RunTextW</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuilder/savefile") %>">SaveFile</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuilder/setproperty") %>">SetProperty</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuilder/setpropertyw") %>">SetPropertyW</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuilder/settmpfolder") %>">SetTmpFolder</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuilder/writedata") %>">WriteData</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="<%= Url.Action("integrationapi/c/cdocbuildercontext") %>">CDocBuilderContext class</a>
                                    <ul>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildercontext/allocmemorytypedarray") %>">AllocMemoryTypedArray</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildercontext/createarray") %>">CreateArray</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildercontext/createnull") %>">CreateNull</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildercontext/createobject") %>">CreateObject</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildercontext/createscope") %>">CreateScope</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildercontext/createtypedarray") %>">CreateTypedArray</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildercontext/createundefined") %>">CreateUndefined</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildercontext/freememorytypedarray") %>">FreeMemoryTypedArray</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildercontext/getglobal") %>">GetGlobal</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildercontext/iserror") %>">IsError</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="<%= Url.Action("integrationapi/c/cdocbuildercontextscope") %>">CDocBuilderContextScope class</a>
                                    <ul>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildercontextscope/close") %>">Close</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue") %>">CDocBuilderValue class</a>
                                    <ul>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/call") %>">Call</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/clear") %>">Clear</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/createnull") %>">CreateNull</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/createundefined") %>">CreateUndefined</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/get") %>">Get</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/getlength") %>">GetLength</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/getproperty") %>">GetProperty</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isarray") %>">IsArray</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isbool") %>">IsBool</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isdouble") %>">IsDouble</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isempty") %>">IsEmpty</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isfunction") %>">IsFunction</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isint") %>">IsInt</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isnull") %>">IsNull</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isobject") %>">IsObject</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isstring") %>">IsString</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/istypedarray") %>">IsTypedArray</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isundefined") %>">IsUndefined</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/set") %>">Set</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/setproperty") %>">SetProperty</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/tobool") %>">ToBool</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/todouble") %>">ToDouble</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/toint") %>">ToInt</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/tostring") %>">ToString</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/net") %>">.Net wrapper</a>
                            <ul>
                                <li>
                                    <a href="<%= Url.Action("integrationapi/net/cdocbuilder") %>">CDocBuilder class</a>
                                    <ul>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuilder/closefile") %>">CloseFile</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuilder/createfile") %>">CreateFile</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuilder/destroy") %>">Destroy</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuilder/executecommand") %>">ExecuteCommand</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuilder/getcontext") %>">GetContext</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuilder/getversion") %>">GetVersion</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuilder/initialize") %>">Initialize</a>
                                        </li>
                                        <li>
                                            <a title="IsSaveWithDoctrendererMode" href="<%= Url.Action("integrationapi/net/cdocbuilder/issavewithdoctrenderermode") %>">IsSaveWithDoctrendererMode</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuilder/openfile") %>">OpenFile</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuilder/run") %>">Run</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuilder/runtext") %>">RunText</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuilder/savefile") %>">SaveFile</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuilder/setproperty") %>">SetProperty</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuilder/settmpfolder") %>">SetTmpFolder</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuilder/writedata") %>">WriteData</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="<%= Url.Action("integrationapi/net/cdocbuildercontext") %>">CDocBuilderContext class</a>
                                    <ul>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildercontext/createarray") %>">CreateArray</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildercontext/createnull") %>">CreateNull</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildercontext/createobject") %>">CreateObject</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildercontext/createscope") %>">CreateScope</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildercontext/createtypedarray") %>">CreateTypedArray</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildercontext/createundefined") %>">CreateUndefined</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildercontext/getglobal") %>">GetGlobal</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildercontext/iserror") %>">IsError</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="<%= Url.Action("integrationapi/net/cdocbuildercontextscope") %>">CDocBuilderContextScope class</a>
                                    <ul>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildercontextscope/close") %>">Close</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue") %>">CDocBuilderValue class</a>
                                    <ul>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/call") %>">Call</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/clear") %>">Clear</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/createnull") %>">CreateNull</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/createundefined") %>">CreateUndefined</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/get") %>">Get</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/getlength") %>">GetLength</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/getproperty") %>">GetProperty</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isarray") %>">IsArray</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isbool") %>">IsBool</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isdouble") %>">IsDouble</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isempty") %>">IsEmpty</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isfunction") %>">IsFunction</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isint") %>">IsInt</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isnull") %>">IsNull</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isobject") %>">IsObject</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isstring") %>">IsString</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/istypedarray") %>">IsTypedArray</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isundefined") %>">IsUndefined</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/set") %>">Set</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/setproperty") %>">SetProperty</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/tobool") %>">ToBool</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/todouble") %>">ToDouble</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/toint") %>">ToInt</a>
                                        </li>
                                        <li>
                                            <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/tostring") %>">ToString</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="<%= Url.Action("integrationapi/usingdocbuilderfile") %>">Using .docbuilder file</a>
                </li>
                <li>
                    <a href="<%= Url.Action("integrationapi/arguments") %>">Using command line arguments</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="<%= Url.Action("textdocumentapi") %>">Text document API</a>
            <ul>
                <% foreach (var entry in DocBuilderDocumentation.Instance.GetModule("word")) { %>
                    <li>
                        <a href="<%= Url.Action(string.Format("textdocumentapi/{0}", entry.Key.ToLower())) %>"> <%= entry.Key %></a>
                        <ul>
                            <% foreach (var method in entry.Value.Methods) { %>
                                <li>
                                    <a title=<%= method.Key %> href="<%= Url.Action(string.Format("textdocumentapi/{0}/{1}", entry.Key.ToLower(), method.Key.ToLower())) %>"><%= method.Key %></a>
                                </li>
                            <% } %>
                            <% if (entry.Value.Events != null && entry.Value.Events.Any()) { %>
                                <% foreach (var ev in entry.Value.Events) { %>
                                    <li>
                                        <a title=<%= ev.Key %> href="<%= Url.Action(string.Format("textdocumentapi/{0}/event-{1}", entry.Key.ToLower(), ev.Key.ToLower())) %>"><%= ev.Key %></a>
                                    </li>
                                <% } %>
                            <% } %>
                        </ul>
                    </li>
                <% } %>
            </ul>
        <li>
            <a href="<%= Url.Action("spreadsheetapi") %>">Spreadsheet API</a>
            <ul>
                <% foreach (var entry in DocBuilderDocumentation.Instance.GetModule("cell")) { %>
                    <li>
                        <a href="<%= Url.Action(string.Format("spreadsheetapi/{0}", entry.Key.ToLower())) %>"> <%= entry.Key %></a>
                        <ul>
                            <% foreach (var method in entry.Value.Methods) { %>
                                <li>
                                    <a title=<%= method.Key %> href="<%= Url.Action(string.Format("spreadsheetapi/{0}/{1}", entry.Key.ToLower(), method.Key.ToLower())) %>"><%= method.Key %></a>
                                </li>
                            <% } %>
                            <% if (entry.Value.Events != null && entry.Value.Events.Any()) { %>
                                <% foreach (var ev in entry.Value.Events) { %>
                                    <li>
                                        <a title=<%= ev.Key %> href="<%= Url.Action(string.Format("spreadsheetapi/{0}/event-{1}", entry.Key.ToLower(), ev.Key.ToLower())) %>"><%= ev.Key %></a>
                                    </li>
                                <% } %>
                            <% } %>
                        </ul>
                    </li>
                <% } %>
            </ul>
        </li>
        <li>
            <a href="<%= Url.Action("presentationapi") %>">Presentation API</a>
            <ul>
                <% foreach (var entry in DocBuilderDocumentation.Instance.GetModule("slide")) { %>
                    <li>
                        <a href="<%= Url.Action(string.Format("presentationapi/{0}", entry.Key.ToLower())) %>"> <%= entry.Key %></a>
                        <ul>
                            <% foreach (var method in entry.Value.Methods) { %>
                                <li>
                                    <a title=<%= method.Key %> href="<%= Url.Action(string.Format("presentationapi/{0}/{1}", entry.Key.ToLower(), method.Key.ToLower())) %>"><%= method.Key %></a>
                                </li>
                            <% } %>
                            <% if (entry.Value.Events != null && entry.Value.Events.Any()) { %>
                                <% foreach (var ev in entry.Value.Events) { %>
                                    <li>
                                        <a title=<%= ev.Key %> href="<%= Url.Action(string.Format("presentationapi/{0}/event-{1}", entry.Key.ToLower(), ev.Key.ToLower())) %>"><%= ev.Key %></a>
                                    </li>
                                <% } %>
                            <% } %>
                        </ul>
                    </li>
                <% } %>
            </ul>
        </li>
        <li>
            <a href="<%= Url.Action("formapi") %>">Form API</a>
            <ul>
                <% foreach (var entry in DocBuilderDocumentation.Instance.GetModule("form")) { %>
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
        <li>
            <a href="<%= Url.Action("debugging") %>">Debugging</a>
        </li>
    </ul>

    <div class="treeheader">More information</div>
    <ul class="side-nav root">
        <li>
            <a href="<%= Url.Action("changelog") %>">Changelog</a>
        </li>
    </ul>
</div>