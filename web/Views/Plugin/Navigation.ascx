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
            <a href="<%= Url.Action("gettingstarted") %>">Getting started with plugins</a>
        </li>
        <li>
            <a href="<%= Url.Action("types") %>">Plugin types</a>
        </li>
        <li>
            <a href="<%= Url.Action("structure") %>">Plugin structure</a>
        </li>
    </ul>

    <div class="treeheader">Plugins</div>
    <ul class="side-nav root">
        <li>
            <a href="<%= Url.Action("config") %>">Configuring plugin</a>
            <ul>
                <li>
                    <a href="<%= Url.Action("variations") %>">Plugin variations</a>
                </li>
                <li>
                    <a href="<%= Url.Action("icons") %>">Plugin icons</a>
                </li>
            </ul>
        </li>
        <li>
            <a href="<%= Url.Action("indexhtml") %>">Creating plugin entry point</a>
        </li>
        <li>
            <a href="<%= Url.Action("code") %>">Coding plugin</a>
            <ul>
                <li>
                    <a href="<%= Url.Action("plugin") %>">Methods</a>
                    <ul>
                        <% foreach (var method in DocPluginsDocumentation.Instance.GetModule("pluginBase")["plugin"].Methods) { %>
                            <li>
                                <a href="<%= Url.Action(string.Format("{0}", method.Key.ToLower())) %>"> <%= method.Key %></a>
                                <% if (method.Key.ToLower() == "executemethod") { %>
                                <ul>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/common") %>">Common Api</a>
                                        <ul>
                                            <% foreach (var executeMethod in DocPluginsDocumentation.Instance.GetModule("sharedPluginMethods")["api"].Methods) { %>
                                                <li>
                                                    <a title=<%= executeMethod.Key %> href="<%= Url.Action(string.Format("executemethod/common/{0}", executeMethod.Key.ToLower())) %>"><%= executeMethod.Key %></a>
                                                </li>
                                            <% } %>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/text") %>">Text Document Api</a>
                                        <ul>
                                            <% foreach (var executeMethod in DocPluginsDocumentation.Instance.GetModule("wordPluginMethods")["api"].Methods) { %>
                                                <li>
                                                    <a title=<%= executeMethod.Key %> href="<%= Url.Action(string.Format("executemethod/text/{0}", executeMethod.Key.ToLower())) %>"><%= executeMethod.Key %></a>
                                                </li>
                                            <% } %>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/cell") %>">Spreadsheet Api</a>
                                        <ul>
                                            <% foreach (var executeMethod in DocPluginsDocumentation.Instance.GetModule("cellPluginMethods")["api"].Methods) { %>
                                                <li>
                                                    <a title=<%= executeMethod.Key %> href="<%= Url.Action(string.Format("executemethod/cell/{0}", executeMethod.Key.ToLower())) %>"><%= executeMethod.Key %></a>
                                                </li>
                                            <% } %>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/slide") %>">Presentation Api</a>
                                        <ul>
                                            <% foreach (var executeMethod in DocPluginsDocumentation.Instance.GetModule("slidePluginMethods")["api"].Methods) { %>
                                                <li>
                                                    <a title=<%= executeMethod.Key %> href="<%= Url.Action(string.Format("executemethod/slide/{0}", executeMethod.Key.ToLower())) %>"><%= executeMethod.Key %></a>
                                                </li>
                                            <% } %>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/form") %>">Form Api</a>
                                        <ul>
                                            <% foreach (var executeMethod in DocPluginsDocumentation.Instance.GetModule("formPluginMethods")["api"].Methods) { %>
                                                <li>
                                                    <a title=<%= executeMethod.Key %> href="<%= Url.Action(string.Format("executemethod/form/{0}", executeMethod.Key.ToLower())) %>"><%= executeMethod.Key %></a>
                                                </li>
                                            <% } %>
                                        </ul>
                                    </li>
                                </ul>
                                <% } %>
                            </li>
                        <% } %>
                    </ul>
                </li>
                <li>
                    <a href="<%= Url.Action("events") %>">Events</a>
                    <ul>
                        <% foreach (var ev in DocPluginsDocumentation.Instance.GetModule("pluginBase")["plugin"].Events) { %>
                            <li>
                                <a title=<%= ev.Key %> href="<%= Url.Action(string.Format("events/{0}", ev.Key.ToLower())) %>"><%= ev.Key %></a>
                            </li>
                        <% } %>
                    </ul>
                </li>
                <li>
                    <a href="<%= Url.Action("scope") %>">Asc.scope object</a>
                </li>
                <li>
                    <a href="<%= Url.Action("info") %>">info object</a>
                </li>
                <li>
                    <a href="<%= Url.Action("inputhelper") %>">InputHelper</a>
                    <ul>
                        <% foreach (var method in DocPluginsDocumentation.Instance.GetModule("pluginBase")["inputHelper"].Methods) { %>
                            <li>
                                <a href="<%= Url.Action(string.Format("inputHelper/{0}", method.Key.ToLower())) %>"> <%= method.Key %></a>
                            </li>
                        <% } %>
                    </ul>
                </li>
                <li>
                    <a href="<%= Url.Action("global") %>">Global</a>
                </li>
            </ul>
        </li>

        <li>
            <a href="<%= Url.Action("installation/") %>">Adding plugins</a>
            <ul>
                <li>
                    <a href="<%= Url.Action("installation/desktop") %>">ONLYOFFICE Desktop Editors</a>
                </li>
                <li>
                    <a href="<%= Url.Action("installation/onpremises") %>">ONLYOFFICE Docs on-premises</a>
                </li>
                <li>
                    <a href="<%= Url.Action("installation/cloud") %>">ONLYOFFICE Cloud</a>
                </li>
            </ul>
        <li>
            <a href="<%= Url.Action("localization") %>">Plugin localization</a>
        </li>
        <li>
            <a href="<%= Url.Action("styles") %>">Plugin styles</a>
        </li>
        <li>
            <a href="<%= Url.Action("example/") %>">Plugin examples</a>
            <ul>
                <li>
                    <a href="<%= Url.Action("example/addcommentincell") %>">Add comment in cell</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/addcustomfields") %>">Add custom fields</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/autocomplete") %>">Autocomplete</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/chess") %>">Chess</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/clippy") %>">Clippy</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/countwordsandcharacters") %>">Count words and characters</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/extendedcomments") %>">Extended comments</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/getandpastehtml") %>">Get and paste html</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/helloworld") %>">Hello world</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/highlightcode") %>">Highlight code</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/invoices") %>">Invoices</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/languagetool") %>">Language tool</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/loadcustomfields") %>">Load custom fields</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/movecursor") %>">Move cursor</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/ocr") %>">OCR</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/photoeditor") %>">Photo editor</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/searchandchangetextbackgroundcolor") %>">Search and change text background color</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/searchandreplace") %>">Search and replace</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/searchandreplaceonstart") %>">Search and replace on start</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/settings") %>">Settings</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/speech") %>">Speech</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/symboltable") %>">Symbol table</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/telegram") %>">Telegram</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/templates") %>">Templates</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/thesaurus") %>">Thesaurus</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/translator") %>">Translator</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/typograf") %>">Typograf</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/workwithcontentcontrolscontent") %>">Work with content controls content</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/workwithcontentcontrolsnavigation") %>">Work with content controls navigation</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/workwithcontentcontrolstags") %>">Work with content controls tags</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/youtube") %>">YouTube</a>
                </li>
                <li>
                    <a href="<%= Url.Action("example/zotero") %>">Zotero</a>
                </li>
            </ul>
        </li>
    </ul>
    <div class="treeheader">Macros</div>
    <ul class="side-nav root">
        <li>
            <a href="<%= Url.Action("macros") %>">Getting started with macros</a>
        </li>
        <li>
            <a href="<%= Url.Action("writingmacros") %>">Writing macros</a>
        </li>
        <li>
            <a href="<%= Url.Action("debugging") %>">Debugging</a>
        </li>
        <li>
            <a href="<%= Url.Action("convertingvbamacros") %>">Converting macros</a>
        </li>
        <li>
            <a href="<%= Url.Action("macrosamples/") %>">Macro samples</a>
            <ul>
                <li>
                    <a href="<%= Url.Action("macrosamples/writedatatoworksheetcell") %>">Write data to worksheet cell</a>
                </li> 
                <li>
                    <a href="<%= Url.Action("macrosamples/changecellbackgroundcolor") %>">Change cell background color</a>
                </li>
                <li>
                    <a href="<%= Url.Action("macrosamples/changecellfontcolor") %>">Change cell font color</a>
                </li>
                <li>
                    <a href="<%= Url.Action("macrosamples/makecellfontbold") %>">Make cell font bold</a>
                </li>
                <li>
                    <a href="<%= Url.Action("macrosamples/mergecellrange") %>">Merge cell range</a>
                </li>
                <li>
                    <a href="<%= Url.Action("macrosamples/unmergecellrange") %>">Unmerge cell range</a>
                </li>
                <li>
                    <a href="<%= Url.Action("macrosamples/setcolumnwidth") %>">Set column width</a>
                </li>
                <li>
                    <a href="<%= Url.Action("macrosamples/formatrangeasatable") %>">Format range as a table</a>
                </li>
                <li>
                    <a href="<%= Url.Action("macrosamples/addchart") %>">Add chart</a>
                </li>
                <li>
                    <a href="<%= Url.Action("macrosamples/highlightduplicates") %>">Highlight duplicates</a>
                </li>
                <li>
                    <a href="<%= Url.Action("macrosamples/nextblankrow") %>">Next blank row</a>
                </li>
                <li>
                    <a href="<%= Url.Action("macrosamples/inserttext") %>">Insert text</a>
                </li>
                <li>
                    <a href="<%= Url.Action("macrosamples/currencyexchangerates") %>">Currency exchange rates</a>
                </li>
                <li>
                    <a href="<%= Url.Action("macrosamples/importcsv") %>">Import CSV/TXT data</a>
                </li>
                <li>
                    <a href="<%= Url.Action("macrosamples/recalculatevalues") %>">Recalculate worksheet values</a>
                </li>
                <li>
                    <a href="<%= Url.Action("macrosamples/unhideallrows") %>">Unhide all rows and columns</a>
                </li>
                 <li>
                    <a href="<%= Url.Action("macrosamples/removeshapes") %>">Remove shapes from slides</a>
                </li>
                 <li>
                    <a href="<%= Url.Action("macrosamples/insertid") %>">Insert unique id</a>
                </li>
                <li>
                    <a href="<%= Url.Action("macrosamples/completeaddressinformation") %>">Complete address information</a>
                </li>
            </ul>
        </li>
    </ul>
    <div class="treeheader">More information</div>
    <ul class="side-nav root">
        <li>
            <a href="<%= Url.Action("changelog") %>">Changelog</a>
        </li>
        <li>
            <a href="<%= Url.Action("faq") %>">FAQ</a>
        </li>
    </ul>
</div>