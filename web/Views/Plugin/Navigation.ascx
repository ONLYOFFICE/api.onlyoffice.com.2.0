<%@ Control
    Language="C#"
    Inherits="System.Web.Mvc.ViewUserControl" %>

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
</ul>

<div class="treeheader">Plugins</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("structure") %>">Plugin structure</a>
        <ul>
            <li>
                <a href="<%= Url.Action("config") %>">config.json</a>
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
                <a href="<%= Url.Action("indexhtml") %>">index.html</a>
            </li>
            <li>
                <a href="<%= Url.Action("code") %>">Plugin code</a>
                <ul>
                    <li>
                        <a href="<%= Url.Action("plugin") %>">Methods</a>
                        <ul>
                            <li>
                                <a href="<%= Url.Action("callcommand") %>">callCommand</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("callmodule") %>">callModule</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("createinputhelper") %>">createInputHelper</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("executecommand") %>">executeCommand</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("executemethod/") %>">executeMethod</a>
                                <ul>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/addcomment") %>">AddComment</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/addcontentcontrol") %>">AddContentControl</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/addoleobject") %>">AddOleObject</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/changecomment") %>">ChangeComment</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/editoleobject") %>">EditOleObject</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/endaction") %>">EndAction</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/getallcomments") %>">GetAllComments</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/getallcontentcontrols") %>">GetAllContentControls</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/getcurrentcontentcontrol") %>">GetCurrentContentControl</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/getcurrentcontentcontrolpr") %>">GetCurrentContentControlPr</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/getfields") %>">GetFields</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/getfilehtml") %>">GetFileHTML</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/getfontlist") %>">GetFontList</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/getmacros") %>">GetMacros</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/getselectedtext") %>">GetSelectedText</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/getselectiontype") %>">GetSelectionType</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/getversion") %>">GetVersion</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/inputtext") %>">InputText</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/insertandreplacecontentcontrols") %>">InsertAndReplaceContentControls</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/movecursortocontentcontrol") %>">MoveCursorToContentControl</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/movecursortoend") %>">MoveCursorToEnd</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/movecursortostart") %>">MoveCursorToStart</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/movetocomment") %>">MoveToComment</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/onencryption") %>">OnEncryption</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/openfile") %>">OpenFile</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/pastehtml") %>">PasteHtml</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/pastetext") %>">PasteText</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/removecomments") %>">RemoveComments</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/removecontentcontrol") %>">RemoveContentControl</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/removecontentcontrols") %>">RemoveContentControls</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/removeselectedcontent") %>">RemoveSelectedContent</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/searchandreplace") %>">SearchAndReplace</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/selectcontentcontrol") %>">SelectContentControl</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/setmacros") %>">SetMacros</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/setproperties") %>">SetProperties</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/showinputhelper") %>">ShowInputHelper</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/startaction") %>">StartAction</a>
                                    </li>
                                    <li>
                                        <a href="<%= Url.Action("executemethod/unshowinputhelper") %>">UnShowInputHelper</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="<%= Url.Action("getinputhelper") %>">getInputHelper</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("loadmodule") %>">loadModule</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("resizewindow") %>">resizeWindow</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="<%= Url.Action("events") %>">Events</a>
                    </li>
                    <li>
                        <a href="<%= Url.Action("objects") %>">Auxiliary objects</a>
                        <ul>
                            <li>
                                <a href="<%= Url.Action("scope") %>">Asc.scope object</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("info") %>">info object</a>
                            </li>
                            <li>
                                <a href="<%= Url.Action("inputhelper") %>">InputHelper object</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>
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
                <a href="<%= Url.Action("example/cbr") %>">CBR</a>
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
                <a href="<%= Url.Action("example/num2word") %>">Num2word</a>
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
        </ul>
    <li>
</ul>
<div class="treeheader">More information</div>
<ul class="side-nav root">
    <li>
        <a href="<%= Url.Action("faq") %>">FAQ</a>
    </li>
</ul>
