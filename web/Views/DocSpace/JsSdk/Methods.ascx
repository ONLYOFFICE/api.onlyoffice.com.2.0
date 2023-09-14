<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Methods</span>
</h1>

<p class="dscr">After initializing SDK, you will get an object that can be used to call the methods:</p>
<pre>
var docSpace = DocSpace.SDK.initManager({config});
</pre>

<ul class="columns-4" style="list-style: none;">
    <li><a href="#addTagsToRoom">addTagsToRoom</a></li>
    <li><a href="#createFile">createFile</a></li>
    <li><a href="#createFolder">createFolder</a></li>
    <li><a href="#createHash">createHash</a></li>
    <li><a href="#createRoom">createRoom</a></li>
    <li><a href="#createTag">createTag</a></li>
    <li><a href="#destroyFrame">destroyFrame</a></li>
    <li><a href="#getConfig">getConfig</a></li>
    <li><a href="#getFiles">getFiles</a></li>
    <li><a href="#getFolderInfo">getFolderInfo</a></li>
    <li><a href="#getFolders">getFolders</a></li>
    <li><a href="#getHashSettings">getHashSettings</a></li>
    <li><a href="#getList">getList</a></li>
    <li><a href="#getSelection">getSelection</a></li>
    <li><a href="#getUserInfo">getUserInfo</a></li>
    <li><a href="#initEditor">initEditor</a></li>
    <li><a href="#initFileSelector">initFileSelector</a></li>
    <li><a href="#initFrame">initFrame</a></li>
    <li><a href="#initManager">initManager</a></li>
    <li><a href="#initRoomSelector">initRoomSelector</a></li>
    <li><a href="#initSystem">initSystem</a></li>
    <li><a href="#initViewer">initViewer</a></li>
    <li><a href="#login">login</a></li>
    <li><a href="#logout">logout</a></li>
    <li><a href="#openModal">openModal</a></li>
    <li><a href="#removeTagsFromRoom">removeTagsFromRoom</a></li>
    <li><a href="#setConfig">setConfig</a></li>
    <li><a href="#setListView">setListView</a></li>
</ul>

<h2>Methods and their description:</h2>
<ul>
    <li>
        <p>
            <b id="addTagsToRoom" class="copy-link">addTagsToRoom</b> - adds the specified tags to the room with the specified ID.
        </p>
        <pre>
docSpace.addTagsToRoom(roomId, tags);
</pre>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Presence</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>roomId</td>
                    <td>Defines the ID of a room where the tags will be added.</td>
                    <td>string</td>
                    <td>required</td>
                </tr>
                <tr class="tablerow">
                    <td>tags</td>
                    <td>Defines a list of tags to be added.</td>
                    <td>array of strings</td>
                    <td>required</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p>
            <b id="createFile" class="copy-link">createFile</b> - creates a file with the specified parameters.
        </p>
        <pre>
docSpace.createFile(folderId, title, templateId, formId);
</pre>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Presence</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>folderId</td>
                    <td>Defines the ID of a folder where a file will be created.</td>
                    <td>string</td>
                    <td>required</td>
                </tr>
                <tr class="tablerow">
                    <td>title</td>
                    <td>Defines the file title.</td>
                    <td>string</td>
                    <td>required</td>
                </tr>
                <tr class="tablerow">
                    <td>templateId</td>
                    <td>Defines the ID of a template which will be used to create a file.</td>
                    <td>string</td>
                    <td>optional</td>
                </tr>
                <tr class="tablerow">
                    <td>formId</td>
                    <td>Defines the ID of a form which will be used to create a file.</td>
                    <td>string</td>
                    <td>optional</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p>
            <b id="createFolder" class="copy-link">createFolder</b> - creates a folder with the specified parameters.
        </p>
        <pre>
docSpace.createFolder(parentFolderId, title);
</pre>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Presence</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>parentFolderId</td>
                    <td>Defines the ID of a parent folder where a folder will be created.</td>
                    <td>string</td>
                    <td>required</td>
                </tr>
                <tr class="tablerow">
                    <td>title</td>
                    <td>Defines the folder title.</td>
                    <td>string</td>
                    <td>required</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p>
            <b id="createHash" class="copy-link">createHash</b> - generates the hash string based on the specified hash settings.
        </p>
        <pre>
docSpace.createHash(password, hashSettings);
</pre>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Presence</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>password</td>
                    <td>Defines a password to the DocSpace account.</td>
                    <td>string</td>
                    <td>required</td>
                </tr>
                <tr class="tablerow">
                    <td>hashSettings</td>
                    <td>Defines the hash settings for generating the hash string.</td>
                    <td>object</td>
                    <td>required</td>
                </tr>
                <tr class="tablerow">
                    <td>hashSettings.size</td>
                    <td>Defines the hash size.</td>
                    <td>integer</td>
                    <td>required</td>
                </tr>
                <tr class="tablerow">
                    <td>hashSettings.salt</td>
                    <td>Defines the hash salt - a randomly generated set of characters that is added to a password before hashing it.</td>
                    <td>string</td>
                    <td>required</td>
                </tr>
                <tr class="tablerow">
                    <td>hashSettings.iterations</td>
                    <td>Defines a number of hash iterations.</td>
                    <td>integer</td>
                    <td>required</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p>
            <b id="createRoom" class="copy-link">createRoom</b> - creates a room with the specified parameters.
        </p>
        <pre>
docSpace.createRoom(title, type);
</pre>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Presence</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>title</td>
                    <td>Defines the room title.</td>
                    <td>string</td>
                    <td>required</td>
                </tr>
                <tr class="tablerow">
                    <td>type</td>
                    <td>Defines the room type ("CustomRoom", "EditingRoom").</td>
                    <td>string</td>
                    <td>required</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p>
            <b id="createTag" class="copy-link">createTag</b> - creates a tag with the specified name.
        </p>
        <pre>
docSpace.createTag(name);
</pre>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Presence</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>name</td>
                    <td>Defines the tag name.</td>
                    <td>string</td>
                    <td>required</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p>
            <b id="destroyFrame" class="copy-link">destroyFrame</b> - destroys the SDK frame, replacing it with the element passed to <a href="<%= Url.Action("jssdk/config") %>#destroyText">destroyText</a>.
        </p>
        <pre>
docSpace.destroyFrame();
</pre>
    </li>
    <li>
        <p>
            <b id="getConfig" class="copy-link">getConfig</b> - returns the SDK config.
        </p>
        <pre>
docSpace.getConfig();
</pre>
    </li>
    <li>
        <p>
            <b id="getFiles" class="copy-link">getFiles</b> - returns the information about all files in the SDK frame.
        </p>
        <pre>
docSpace.getFiles();
</pre>
    </li>
    <li>
        <p>
            <b id="getFolderInfo" class="copy-link">getFolderInfo</b> - returns the information about the current directory opened in the SDK frame.
        </p>
        <pre>
docSpace.getFolderInfo();
</pre>
    </li>
    <li>
        <p>
            <b id="getFolders" class="copy-link">getFolders</b> - returns the information about all the folders in the SDK frame.
        </p>
        <pre>
docSpace.getFolders();
</pre>
    </li>
    <li>
        <p>
            <b id="getHashSettings" class="copy-link">getHashSettings</b> - returns the DocSpace hash settings for generating a password hash.
        </p>
        <pre>
docSpace.getHashSettings();
</pre>
    </li>
    <li>
        <p>
            <b id="getList" class="copy-link">getList</b> - returns the information about all files and folders in the SDK frame.
        </p>
        <pre>
docSpace.getList();
</pre>
    </li>
    <li>
        <p>
            <b id="getSelection" class="copy-link">getSelection</b> - returns the information about the selected elements in the SDK frame.
        </p>
        <pre>
docSpace.getSelection();
</pre>
    </li>
    <li>
        <p>
            <b id="getUserInfo" class="copy-link">getUserInfo</b> - returns the information about the current DocSpace user or null if there are no authorized users.
        </p>
        <pre>
docSpace.getUserInfo();
</pre>
    </li>
    <li>
        <p>
            <b id="initEditor" class="copy-link">initEditor</b> - initializes the SDK frame in the "editor" mode.
        </p>
        <pre>
docSpace.initEditor(config);
</pre>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Presence</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>config</td>
                    <td>Defines the configuration parameters which describe the behavior and display options of the DocSpace elements.</td>
                    <td>object</td>
                    <td>required</td>
                </tr>
                </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p>
            <b id="initFileSelector" class="copy-link">initFileSelector</b> - initializes the SDK frame in the "file-selector" mode.
        </p>
        <pre>
docSpace.initFileSelector(config);
</pre>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Presence</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>config</td>
                    <td>Defines the configuration parameters which describe the behavior and display options of the DocSpace elements.</td>
                    <td>object</td>
                    <td>required</td>
                </tr>
                </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p>
            <b id="initFrame" class="copy-link">initFrame</b> - initializes the SDK frame dispaying the DocSpace page.
        </p>
        <pre>
docSpace.initFrame(config);
</pre>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Presence</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>config</td>
                    <td>Defines the configuration parameters which describe the behavior and display options of the DocSpace elements.</td>
                    <td>object</td>
                    <td>required</td>
                </tr>
                </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p>
            <b id="initManager" class="copy-link">initManager</b> - initializes the SDK frame in the "manager" mode.
        </p>
        <pre>
docSpace.initManager(config);
</pre>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Presence</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>config</td>
                    <td>Defines the configuration parameters which describe the behavior and display options of the DocSpace elements.</td>
                    <td>object</td>
                    <td>required</td>
                </tr>
                </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p>
            <b id="initRoomSelector" class="copy-link">initRoomSelector</b> - initializes the SDK frame in the "room-selector" mode.
        </p>
        <pre>
docSpace.initRoomSelector(config);
</pre>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Presence</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>config</td>
                    <td>Defines the configuration parameters which describe the behavior and display options of the DocSpace elements.</td>
                    <td>object</td>
                    <td>required</td>
                </tr>
                </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p>
            <b id="initSystem" class="copy-link">initSystem</b> - initializes the SDK frame in the "system" mode to call system methods.
            This lightweight frame displays a blank page with the loader.
        </p>
        <pre>
docSpace.initSystem(config);
</pre>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Presence</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>config</td>
                    <td>Defines the configuration parameters which describe the behavior and display options of the DocSpace elements.</td>
                    <td>object</td>
                    <td>required</td>
                </tr>
                </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p>
            <b id="initViewer" class="copy-link">initViewer</b> - initializes the SDK frame in the "viewer" mode.
        </p>
        <pre>
docSpace.initViewer(config);
</pre>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Presence</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>config</td>
                    <td>Defines the configuration parameters which describe the behavior and display options of the DocSpace elements.</td>
                    <td>object</td>
                    <td>required</td>
                </tr>
                </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p>
            <b id="login" class="copy-link">login</b> - logs in to the DocSpace account using the specified email and password hash.
        </p>
        <pre>
docSpace.login(email, passwordHash);
</pre>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Presence</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>email</td>
                    <td>Defines the user email address.</td>
                    <td>string</td>
                    <td>required</td>
                </tr>
                <tr class="tablerow">
                    <td>passwordHash</td>
                    <td>Defines a password hash.</td>
                    <td>string</td>
                    <td>required</td>
                </tr>
                </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p>
            <b id="logout" class="copy-link">logout</b> - logs out from the DocSpace account of the current user.
        </p>
        <pre>
docSpace.logout();
</pre>
    </li>
    <li>
        <p>
            <b id="openModal" class="copy-link">openModal</b> - opens the DocSpace modal window of the specified type.
        </p>
        <pre>
docSpace.openModal(type);
</pre>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Presence</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>type</td>
                    <td>Defines the DocSpace modal window type ("CreateFile", "CreateFolder", "CreateRoom").</td>
                    <td>string</td>
                    <td>required</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p>
            <b id="removeTagsFromRoom" class="copy-link">removeTagsFromRoom</b> - removes the specified tags from the room with the specified ID.
        </p>
        <pre>
docSpace.removeTagsFromRoom(roomId, tags);
</pre>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Presence</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>roomId</td>
                    <td>Defines the ID of a room where the tags will be removed.</td>
                    <td>string</td>
                    <td>required</td>
                </tr>
                <tr class="tablerow">
                    <td>tags</td>
                    <td>Defines a list of tags to be removed.</td>
                    <td>array of strings</td>
                    <td>required</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p>
            <b id="setConfig" class="copy-link">setConfig</b> - sets the specified config for the current SDK entity.
        </p>
        <pre>
docSpace.setConfig(config);
</pre>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Presence</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>config</td>
                    <td>Defines the configuration parameters which describe the behavior and display options of the DocSpace elements.</td>
                    <td>object</td>
                    <td>required</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
    <li>
        <p>
            <b id="setListView" class="copy-link">setListView</b> - sets the display of entity lists according to the specified type.
        </p>
        <pre>
docSpace.setListView(type);
</pre>
        <table class="table">
            <colgroup>
                <col class="table-name" />
                <col />
                <col class="table-type" />
                <col class="table-example" />
            </colgroup>
            <thead>
                <tr class="tablerow">
                    <td>Parameter</td>
                    <td>Description</td>
                    <td>Type</td>
                    <td>Presence</td>
                </tr>
            </thead>
            <tbody>
                <tr class="tablerow">
                    <td>type</td>
                    <td>Defines the way elements are arranged in the DocSpace manager ("row", "table", "tile").</td>
                    <td>string</td>
                    <td>required</td>
                </tr>
            </tbody>
        </table>
        <div class="mobile-content"></div>
    </li>
</ul>
