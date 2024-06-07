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
            <a href="<%= Url.Action("getbuilder") %>">Get Document Builder</a>
        </li>
        <li>
            <a href="<%= Url.Action("try") %>">Try now</a>
        </li>
        <li>
            <a href="<%= Url.Action("debugging") %>">Debugging</a>
        </li>
    </ul>

    <div class="treeheader">Builder.Framework</div>
    <ul class="side-nav root">
        <li>
            <a href="<%= Url.Action("framework") %>">Overview</a>
        </li>
        <li>
            <a href="<%= Url.Action("integrationapi/c") %>">C++</a>
            <ul>
                <li>
                    <a href="<%= Url.Action("integrationapi/c/cdocbuilder") %>">CDocBuilder</a>
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
                    <a href="<%= Url.Action("integrationapi/c/cdocbuildercontext") %>">CDocBuilderContext</a>
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
                    <a href="<%= Url.Action("integrationapi/c/cdocbuildercontextscope") %>">CDocBuilderContextScope</a>
                    <ul>
                        <li>
                            <a href="<%= Url.Action("integrationapi/c/cdocbuildercontextscope/close") %>">Close</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="<%= Url.Action("integrationapi/c/cdocbuildervalue") %>">CDocBuilderValue</a>
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
            <a href="<%= Url.Action("integrationapi/com") %>">COM</a>
            <ul>
                <li>
                    <a href="<%= Url.Action("integrationapi/com/cdocbuilder") %>">CDocBuilder</a>
                    <ul>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuilder/closefile") %>">CloseFile</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuilder/createfile") %>">CreateFile</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuilder/createinstance") %>">CreateInstance</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuilder/dispose") %>">Dispose</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuilder/execute") %>">Execute</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuilder/executecommand") %>">ExecuteCommand</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuilder/getcontext") %>">GetContext</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuilder/initialize") %>">Initialize</a>
                        </li>
                        <li>
                            <a title="IsSaveWithDoctrendererMode" href="<%= Url.Action("integrationapi/com/cdocbuilder/issavewithdoctrenderermode") %>">IsSaveWithDoctrendererMode</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuilder/openfile") %>">OpenFile</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuilder/run") %>">Run</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuilder/runtext") %>">RunText</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuilder/savefile") %>">SaveFile</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuilder/setproperty") %>">SetProperty</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuilder/settmpfolder") %>">SetTmpFolder</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuilder/writedata") %>">WriteData</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="<%= Url.Action("integrationapi/com/cdocbuildercontext") %>">CDocBuilderContext</a>
                    <ul>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildercontext/createarray") %>">CreateArray</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildercontext/createnull") %>">CreateNull</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildercontext/createobject") %>">CreateObject</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildercontext/createscope") %>">CreateScope</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildercontext/createtypedarray") %>">CreateTypedArray</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildercontext/createundefined") %>">CreateUndefined</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildercontext/getglobal") %>">GetGlobal</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildercontext/iserror") %>">IsError</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="<%= Url.Action("integrationapi/com/cdocbuildercontextscope") %>">CDocBuilderContextScope</a>
                    <ul>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildercontextscope/close") %>">Close</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="<%= Url.Action("integrationapi/com/cdocbuildervalue") %>">CDocBuilderValue</a>
                    <ul>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/call") %>">Call</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/clear") %>">Clear</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/createinstance") %>">CreateInstance</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/get") %>">Get</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/getlength") %>">GetLength</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/getproperty") %>">GetProperty</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/isarray") %>">IsArray</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/isbool") %>">IsBool</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/isdouble") %>">IsDouble</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/isempty") %>">IsEmpty</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/isfunction") %>">IsFunction</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/isint") %>">IsInt</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/isnull") %>">IsNull</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/isobject") %>">IsObject</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/isstring") %>">IsString</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/istypedarray") %>">IsTypedArray</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/isundefined") %>">IsUndefined</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/set") %>">Set</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/setproperty") %>">SetProperty</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/tobool") %>">ToBool</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/todouble") %>">ToDouble</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/toint") %>">ToInt</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/com/cdocbuildervalue/tostring") %>">ToString</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </li>
        <li>
            <a href="<%= Url.Action("integrationapi/net") %>">.Net</a>
            <ul>
                <li>
                    <a href="<%= Url.Action("integrationapi/net/cdocbuilder") %>">CDocBuilder</a>
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
                    <a href="<%= Url.Action("integrationapi/net/cdocbuildercontext") %>">CDocBuilderContext</a>
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
                    <a href="<%= Url.Action("integrationapi/net/cdocbuildercontextscope") %>">CDocBuilderContextScope</a>
                    <ul>
                        <li>
                            <a href="<%= Url.Action("integrationapi/net/cdocbuildercontextscope/close") %>">Close</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="<%= Url.Action("integrationapi/net/cdocbuildervalue") %>">CDocBuilderValue</a>
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
        <li>
            <a href="<%= Url.Action("integrationapi/python") %>">Python</a>
            <ul>
                <li>
                    <a href="<%= Url.Action("integrationapi/python/cdocbuilder") %>">CDocBuilder</a>
                    <ul>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuilder/closefile") %>">CloseFile</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuilder/createfile") %>">CreateFile</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuilder/dispose") %>">Dispose</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuilder/executecommand") %>">ExecuteCommand</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuilder/getcontext") %>">GetContext</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuilder/getversion") %>">GetVersion</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuilder/initialize") %>">Initialize</a>
                        </li>
                        <li>
                            <a title="IsSaveWithDoctrendererMode" href="<%= Url.Action("integrationapi/python/cdocbuilder/issavewithdoctrenderermode") %>">IsSaveWithDoctrendererMode</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuilder/openfile") %>">OpenFile</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuilder/run") %>">Run</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuilder/runtext") %>">RunText</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuilder/savefile") %>">SaveFile</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuilder/setproperty") %>">SetProperty</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuilder/settmpfolder") %>">SetTmpFolder</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuilder/writedata") %>">WriteData</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="<%= Url.Action("integrationapi/python/cdocbuildercontext") %>">CDocBuilderContext</a>
                    <ul>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildercontext/createarray") %>">CreateArray</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildercontext/createnull") %>">CreateNull</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildercontext/createobject") %>">CreateObject</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildercontext/createscope") %>">CreateScope</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildercontext/createundefined") %>">CreateUndefined</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildercontext/getglobal") %>">GetGlobal</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildercontext/iserror") %>">IsError</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="<%= Url.Action("integrationapi/python/cdocbuildercontextscope") %>">CDocBuilderContextScope</a>
                    <ul>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildercontextscope/close") %>">Close</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="<%= Url.Action("integrationapi/python/cdocbuildervalue") %>">CDocBuilderValue</a>
                    <ul>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildervalue/call") %>">Call</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildervalue/clear") %>">Clear</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildervalue/createarray") %>">CreateArray</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildervalue/createnull") %>">CreateNull</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildervalue/createundefined") %>">CreateUndefined</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildervalue/get") %>">Get</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildervalue/getlength") %>">GetLength</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildervalue/getproperty") %>">GetProperty</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildervalue/isarray") %>">IsArray</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildervalue/isbool") %>">IsBool</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildervalue/isdouble") %>">IsDouble</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildervalue/isempty") %>">IsEmpty</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildervalue/isfunction") %>">IsFunction</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildervalue/isint") %>">IsInt</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildervalue/isnull") %>">IsNull</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildervalue/isobject") %>">IsObject</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildervalue/isstring") %>">IsString</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildervalue/isundefined") %>">IsUndefined</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildervalue/set") %>">Set</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildervalue/setproperty") %>">SetProperty</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildervalue/tobool") %>">ToBool</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildervalue/todouble") %>">ToDouble</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildervalue/toint") %>">ToInt</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("integrationapi/python/cdocbuildervalue/tostring") %>">ToString</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </li>
        <li>
            <a href="<%= Url.Action("builderframeworksamples") %>">Builder framework samples</a>
            <ul>
                <li>
                    <a href="<%= Url.Action("builderframeworksamples/cppbuildersamples") %>">C++ samples guide</a>
                </li>
                <li>
                    <a href="<%= Url.Action("builderframeworksamples/csharpbuildersamples") %>">.Net samples guide</a>
                </li>
            </ul>
        </li>
    </ul>


    <div class="treeheader">Builder.App</div>
    <ul class="side-nav root">
        <li>
            <a href="<%= Url.Action("integrationapi/default") %>">Overview</a>
        </li>
        <li>
            <a href="<%= Url.Action("integrationapi/usingdocbuilderfile") %>">Using .docbuilder file</a>
        </li>
        <li>
            <a href="<%= Url.Action("integrationapi/arguments") %>">Using command line arguments</a>
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


    <div class="treeheader">Builder.Server</div>
    <ul class="side-nav root">
        <li>
            <a href="<%= Url.Action("integratingdocumentbuilder") %>">Overview</a>
        </li>
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
</div>
