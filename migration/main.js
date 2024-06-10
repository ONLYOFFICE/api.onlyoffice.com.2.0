// @ts-check

// todo: update urls
// https://github.com/ONLYOFFICE/api.onlyoffice.com/blob/develop/web/Web.config#L140-L172
// todo: refactor it
// how we can update reference links in comments?

import {mkdir, writeFile} from "node:fs/promises"
import {parse} from "node-html-parser"
import rehypeParse from "rehype-parse"
import rehypeRemark from "rehype-remark"
import remarkGFM from "remark-gfm"
import remarkStringify from "remark-stringify"
import {unified} from "unified"
import {join} from "node:path"
import {compile} from "@mdx-js/mdx"
import {visit} from "unist-util-visit"

const pages = [
  // Docspace

  // DocSpace: Get Started
  {
    from: "https://api.onlyoffice.com/docspace/basic",
    to: "DocSpace/Get Started/Overview"
  },

  // DocSpace: JavaScript SDK
  {
    from: "https://api.onlyoffice.com/docspace/jssdk/",
    to: "DocSpace/JavaScript SDK/Basic Concepts"
  },
  {
    from: "https://api.onlyoffice.com/docspace/jssdk/initmodes",
    to: "DocSpace/JavaScript SDK/Initialization Modes"
  },
  {
    from: "https://api.onlyoffice.com/docspace/jssdk/initmodes/manager",
    to: "DocSpace/JavaScript SDK/Initialization Modes/Manager"
  },
  {
    from: "https://api.onlyoffice.com/docspace/jssdk/initmodes/roomselector",
    to: "DocSpace/JavaScript SDK/Initialization Modes/Room Selector"
  },
  {
    from: "https://api.onlyoffice.com/docspace/jssdk/initmodes/fileselector",
    to: "DocSpace/JavaScript SDK/Initialization Modes/File Selector"
  },
  {
    from: "https://api.onlyoffice.com/docspace/jssdk/initmodes/editor",
    to: "DocSpace/JavaScript SDK/Initialization Modes/Editor"
  },
  {
    from: "https://api.onlyoffice.com/docspace/jssdk/initmodes/viewer",
    to: "DocSpace/JavaScript SDK/Initialization Modes/Viewer"
  },
  {
    from: "https://api.onlyoffice.com/docspace/jssdk/initmodes/system",
    to: "DocSpace/JavaScript SDK/Initialization Modes/System"
  },
  {
    from: "https://api.onlyoffice.com/docspace/jssdk/config",
    to: "DocSpace/JavaScript SDK/Configuration"
  },
  {
    from: "https://api.onlyoffice.com/docspace/jssdk/methods",
    to: "DocSpace/JavaScript SDK/Methods"
  },
  {
    from: "https://api.onlyoffice.com/docspace/jssdk/events",
    to: "DocSpace/JavaScript SDK/Events"
  },

  // DocSpace: Plugins SDK
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/",
    to: "DocSpace/Plugins SDK/Basic Concepts"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/gettingstarted",
    to: "DocSpace/Plugins SDK/Getting Started"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/creatingtemplate",
    to: "DocSpace/Plugins SDK/Creating Plugin Template"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/structure",
    to: "DocSpace/Plugins SDK/Plugin Structure"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin",
    to: "DocSpace/Plugins SDK/Coding Plugin"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/plugintypes",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Types"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/plugintypes/plugin",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Types/Plugin"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/plugintypes/settingsplugin",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Types/SettingsPlugin"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/plugintypes/apiplugin",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Types/APIPlugin"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/plugintypes/contextmenuplugin",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Types/ContextMenuPlugin"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/plugintypes/infopanelplugin",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Types/InfoPanelPlugin"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/plugintypes/mainbuttonplugin",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Types/MainButtonPlugin"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/plugintypes/profilemenuplugin",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Types/ProfileMenuPlugin"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/plugintypes/eventlistenerplugin",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Types/EventListenerPlugin"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/plugintypes/fileplugin",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Types/FilePlugin"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/pluginitems",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Items"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/pluginitems/contextmenuitem",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Items/ContextMenuItem"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/pluginitems/infopanelitem",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Items/InfoPanelItem"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/pluginitems/mainbuttonitem",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Items/MainButtonItem"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/pluginitems/profilemenuitem",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Items/ProfileMenuItem"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/pluginitems/fileitem",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Items/FileItem"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/pluginitems/eventlisteneritem",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Items/EventListenerItem"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/pluginmessage",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Message"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/events",
    to: "DocSpace/Plugins SDK/Coding Plugin/Events"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/plugincomponents",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Components"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/plugincomponents/box",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Components/Box"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/plugincomponents/button",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Components/Button"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/plugincomponents/checkbox",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Components/Checkbox"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/plugincomponents/combobox",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Components/ComboBox"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/plugincomponents/component",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Components/Component"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/plugincomponents/createdialog",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Components/CreateDialog"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/plugincomponents/iframe",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Components/IFrame"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/plugincomponents/img",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Components/Image"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/plugincomponents/input",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Components/Input"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/plugincomponents/label",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Components/Label"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/plugincomponents/modaldialog",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Components/ModalDialog"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/plugincomponents/skeleton",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Components/Skeleton"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/plugincomponents/text",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Components/Text"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/plugincomponents/textarea",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Components/TextArea"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/plugincomponents/toast",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Components/Toast"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/codingplugin/plugincomponents/togglebutton",
    to: "DocSpace/Plugins SDK/Coding Plugin/Plugin Components/ToggleButton"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/buildingplugin",
    to: "DocSpace/Plugins SDK/Building Plugin"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/config",
    to: "DocSpace/Plugins SDK/Configuration"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/addingplugin",
    to: "DocSpace/Plugins SDK/Adding Plugin"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/plugintutorial",
    to: "DocSpace/Plugins SDK/Plugin Tutorial"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/plugintutorial/planning",
    to: "DocSpace/Plugins SDK/Plugin Tutorial/Planning"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/plugintutorial/developing",
    to: "DocSpace/Plugins SDK/Plugin Tutorial/Developing"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/plugintutorial/developing/creatingtemplate",
    to: "DocSpace/Plugins SDK/Plugin Tutorial/Developing/Step 1. Create a plugin template"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/plugintutorial/developing/configuringentrypoint",
    to: "DocSpace/Plugins SDK/Plugin Tutorial/Developing/Step 2. Configure the plugin entry point"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/plugintutorial/developing/addingicons",
    to: "DocSpace/Plugins SDK/Plugin Tutorial/Developing/Step 3. Add plugin icons"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/plugintutorial/developing/configuringinterfaceelements",
    to: "DocSpace/Plugins SDK/Plugin Tutorial/Developing/Step 4. Configure the plugin's interface elements"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/plugintutorial/developing/creatingplugintypes",
    to: "DocSpace/Plugins SDK/Plugin Tutorial/Developing/Step 5. Create plugin types"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/plugintutorial/developing/creatingsettingstype",
    to: "DocSpace/Plugins SDK/Plugin Tutorial/Developing/Step 6. Create the settings plugin type"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/plugintutorial/developing/creatingcodefile",
    to: "DocSpace/Plugins SDK/Plugin Tutorial/Developing/Step 7. Create the code file"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/plugintutorial/testing",
    to: "DocSpace/Plugins SDK/Plugin Tutorial/Testing"
  },
  {
    from: "https://api.onlyoffice.com/docspace/pluginssdk/plugintutorial/using",
    to: "DocSpace/Plugins SDK/Plugin Tutorial/Using"
  },

  // DocSpace: API Backend
  {
    from: "https://api.onlyoffice.com/docspace/backend/",
    to: "DocSpace/API Backend/Basic Concepts"
  },
  {
    from: "https://api.onlyoffice.com/docspace/backend/howitworks",
    to: "DocSpace/API Backend/How It Works"
  },
  {
    from: "https://api.onlyoffice.com/docspace/backend/howitworks/auth",
    to: "DocSpace/API Backend/How It Works/Passing Authentication"
  },
  {
    from: "https://api.onlyoffice.com/docspace/backend/howitworks/longrunningoperations",
    to: "DocSpace/API Backend/How It Works/Long Running Operations"
  },
  {
    from: "https://api.onlyoffice.com/docspace/backend/howitworks/uploadinglargefiles",
    to: "DocSpace/API Backend/How It Works/Uploading Large Files"
  },
  {
    from: "https://api.onlyoffice.com/docspace/backend/howitworks/webhooks",
    to: "DocSpace/API Backend/How It Works/Webhooks"
  },

  // DocSpace: API System
  {
    from: "https://api.onlyoffice.com/docspace/apisystem/",
    to: "DocSpace/API System/Basic Concepts"
  },
  {
    from: "https://api.onlyoffice.com/docspace/apisystem/authentication",
    to: "DocSpace/API System/Authentication"
  },

  // DocSpace: More Information
  {
    from: "https://api.onlyoffice.com/docspace/changelog",
    to: "DocSpace/More Information/Changelog"
  },
  {
    from: "https://api.onlyoffice.com/docspace/faq",
    to: "DocSpace/More Information/FAQ"
  },
  {
    from: "https://api.onlyoffice.com/docspace/filters",
    to: "DocSpace/More Information/Filtering"
  },
  {
    from: "https://api.onlyoffice.com/docspace/batch",
    to: "DocSpace/More Information/Batching"
  },

  // Document Server

  // Document Server: Get Started
  {
    from: "https://api.onlyoffice.com/editors/basic",
    to: "Document Server/Get Started/Basic Concepts"
  },
  {
    from: "https://api.onlyoffice.com/editors/getdocs",
    to: "Document Server/Get Started/Get Docs"
  },
  {
    from: "https://api.onlyoffice.com/editors/try",
    to: "Document Server/Get Started/Try Docs"
  },
  {
    from: "https://api.onlyoffice.com/editors/frameworks",
    to: "Document Server/Get Started/Frontend Frameworks"
  },
  {
    from: "https://api.onlyoffice.com/editors/angular",
    to: "Document Server/Get Started/Frontend Frameworks/Angular"
  },
  {
    from: "https://api.onlyoffice.com/editors/react",
    to: "Document Server/Get Started/Frontend Frameworks/React"
  },
  {
    from: "https://api.onlyoffice.com/editors/vue",
    to: "Document Server/Get Started/Frontend Frameworks/Vue"
  },
  {
    from: "https://api.onlyoffice.com/editors/howitworks",
    to: "Document Server/Get Started/How It Works"
  },
  {
    from: "https://api.onlyoffice.com/editors/open",
    to: "Document Server/Get Started/How It Works/Opening file"
  },
  {
    from: "https://api.onlyoffice.com/editors/save",
    to: "Document Server/Get Started/How It Works/Saving file"
  },
  {
    from: "https://api.onlyoffice.com/editors/coedit",
    to: "Document Server/Get Started/How It Works/Co-editing"
  },
  {
    from: "https://api.onlyoffice.com/editors/history",
    to: "Document Server/Get Started/How It Works/Document history"
  },
  {
    from: "https://api.onlyoffice.com/editors/actionlink",
    to: "Document Server/Get Started/How It Works/Action link"
  },
  {
    from: "https://api.onlyoffice.com/editors/mentions",
    to: "Document Server/Get Started/How It Works/Mentions"
  },
  {
    from: "https://api.onlyoffice.com/editors/rename",
    to: "Document Server/Get Started/How It Works/Renaming files"
  },
  {
    from: "https://api.onlyoffice.com/editors/review",
    to: "Document Server/Get Started/How It Works/Reviewing"
  },
  {
    from: "https://api.onlyoffice.com/editors/inlineeditors",
    to: "Document Server/Get Started/How It Works/Inline editors"
  },
  {
    from: "https://api.onlyoffice.com/editors/conversion",
    to: "Document Server/Get Started/How It Works/Converting and downloading file"
  },
  {
    from: "https://api.onlyoffice.com/editors/security",
    to: "Document Server/Get Started/How It Works/Security"
  },
  {
    from: "https://api.onlyoffice.com/editors/anonymoususers",
    to: "Document Server/Get Started/How It Works/Anonymous users"
  },
  {
    from: "https://api.onlyoffice.com/editors/commenting",
    to: "Document Server/Get Started/How It Works/Commenting"
  },
  {
    from: "https://api.onlyoffice.com/editors/comparing",
    to: "Document Server/Get Started/How It Works/Comparing documents"
  },
  {
    from: "https://api.onlyoffice.com/editors/viewing",
    to: "Document Server/Get Started/How It Works/Viewing"
  },
  {
    from: "https://api.onlyoffice.com/editors/mobileintegration",
    to: "Document Server/Get Started/How It Works/Mobile integration"
  },
  {
    from: "https://api.onlyoffice.com/editors/insertingexternaldata",
    to: "Document Server/Get Started/How It Works/Inserting external data"
  },
  {
    from: "https://api.onlyoffice.com/editors/embeddingforms",
    to: "Document Server/Get Started/How It Works/Embedding forms into a web page"
  },
  {
    from: "https://api.onlyoffice.com/editors/protectingranges",
    to: "Document Server/Get Started/How It Works/Protecting ranges"
  },
  {
    from: "https://api.onlyoffice.com/editors/javasdk",
    to: "Document Server/Get Started/How It Works/Integrating editors using Java SDK"
  },
  {
    from: "https://api.onlyoffice.com/editors/interactingoutside/",
    to: "Document Server/Get Started/External access to the document editing"
  },
  {
    from: "https://api.onlyoffice.com/editors/interactingoutside/comments",
    to: "Document Server/Get Started/External access to the document editing/Working with comments"
  },
  {
    from: "https://api.onlyoffice.com/editors/interactingoutside/reviewwork",
    to: "Document Server/Get Started/External access to the document editing/Working with review changes"
  },
  {
    from: "https://api.onlyoffice.com/editors/interactingoutside/fillingform",
    to: "Document Server/Get Started/External access to the document editing/Filling out the form"
  },

  // Document Server: Usage API
  {
    from: "https://api.onlyoffice.com/editors/advanced",
    to: "Document Server/Usage API/Advanced parameters"
  },
  {
    from: "https://api.onlyoffice.com/editors/config/",
    to: "Document Server/Usage API/Config"
  },
  {
    from: "https://api.onlyoffice.com/editors/config/document",
    to: "Document Server/Usage API/Config/Document"
  },
  {
    from: "https://api.onlyoffice.com/editors/config/document/info",
    to: "Document Server/Usage API/Config/Document/Info"
  },
  {
    from: "https://api.onlyoffice.com/editors/config/document/permissions",
    to: "Document Server/Usage API/Config/Document/Permissions"
  },
  {
    from: "https://api.onlyoffice.com/editors/config/editor",
    to: "Document Server/Usage API/Config/Editor"
  },
  {
    from: "https://api.onlyoffice.com/editors/config/editor/customization",
    to: "Document Server/Usage API/Config/Editor/Customization"
  },
  {
    from: "https://api.onlyoffice.com/editors/config/editor/embedded",
    to: "Document Server/Usage API/Config/Editor/Embedded"
  },
  {
    from: "https://api.onlyoffice.com/editors/config/editor/plugins",
    to: "Document Server/Usage API/Config/Editor/Plugins"
  },
  {
    from: "https://api.onlyoffice.com/editors/config/events",
    to: "Document Server/Usage API/Config/Events"
  },
  {
    from: "https://api.onlyoffice.com/editors/methods",
    to: "Document Server/Usage API/Methods"
  },
  {
    from: "https://api.onlyoffice.com/editors/connector",
    to: "Document Server/Usage API/Automation API"
  },
  {
    from: "https://api.onlyoffice.com/editors/callback",
    to: "Document Server/Usage API/Callback handler"
  },

  // Document Server: Using WOPI
  {
    from: "https://api.onlyoffice.com/editors/wopi/",
    to: "Document Server/Using WOPI/Overview"
  },
  {
    from: "https://api.onlyoffice.com/editors/wopi/discovery",
    to: "Document Server/Using WOPI/WOPI discovery"
  },
  {
    from: "https://api.onlyoffice.com/editors/wopi/hostpage",
    to: "Document Server/Using WOPI/Host page"
  },
  {
    from: "https://api.onlyoffice.com/editors/wopi/proofkeys",
    to: "Document Server/Using WOPI/Proof keys"
  },
  {
    from: "https://api.onlyoffice.com/editors/wopi/restapi",
    to: "Document Server/Using WOPI/WOPI REST API"
  },
  {
    from: "https://api.onlyoffice.com/editors/wopi/restapi/checkfileinfo",
    to: "Document Server/Using WOPI/WOPI REST API/CheckFileInfo"
  },
  {
    from: "https://api.onlyoffice.com/editors/wopi/restapi/getfile",
    to: "Document Server/Using WOPI/WOPI REST API/GetFile"
  },
  {
    from: "https://api.onlyoffice.com/editors/wopi/restapi/lock",
    to: "Document Server/Using WOPI/WOPI REST API/Lock"
  },
  {
    from: "https://api.onlyoffice.com/editors/wopi/restapi/refreshlock",
    to: "Document Server/Using WOPI/WOPI REST API/RefreshLock"
  },
  {
    from: "https://api.onlyoffice.com/editors/wopi/restapi/unlock",
    to: "Document Server/Using WOPI/WOPI REST API/Unlock"
  },
  {
    from: "https://api.onlyoffice.com/editors/wopi/restapi/putfile",
    to: "Document Server/Using WOPI/WOPI REST API/PutFile"
  },
  {
    from: "https://api.onlyoffice.com/editors/wopi/restapi/putrelativefile",
    to: "Document Server/Using WOPI/WOPI REST API/PutRelativeFile"
  },
  {
    from: "https://api.onlyoffice.com/editors/wopi/restapi/renamefile",
    to: "Document Server/Using WOPI/WOPI REST API/RenameFile"
  },
  {
    from: "https://api.onlyoffice.com/editors/wopi/postmessage",
    to: "Document Server/Using WOPI/PostMessage"
  },
  {
    from: "https://api.onlyoffice.com/editors/wopi/conversionapi",
    to: "Document Server/Using WOPI/Conversion API"
  },
  {
    from: "https://api.onlyoffice.com/editors/wopi/editingbinary",
    to: "Document Server/Using WOPI/Editing binary documents"
  },
  {
    from: "https://api.onlyoffice.com/editors/wopi/apivswopi",
    to: "Document Server/Using WOPI/API vs WOPI"
  },

  // Document Server: Additional API
  {
    from: "https://api.onlyoffice.com/editors/command/",
    to: "Document Server/Additional API/Command service"
  },
  {
    from: "https://api.onlyoffice.com/editors/command/deleteforgotten",
    to: "Document Server/Additional API/Command service/deleteForgotten"
  },
  {
    from: "https://api.onlyoffice.com/editors/command/drop",
    to: "Document Server/Additional API/Command service/drop"
  },
  {
    from: "https://api.onlyoffice.com/editors/command/forcesave",
    to: "Document Server/Additional API/Command service/forcesave"
  },
  {
    from: "https://api.onlyoffice.com/editors/command/getforgotten",
    to: "Document Server/Additional API/Command service/getForgotten"
  },
  {
    from: "https://api.onlyoffice.com/editors/command/getforgottenlist",
    to: "Document Server/Additional API/Command service/getForgottenList"
  },
  {
    from: "https://api.onlyoffice.com/editors/command/info",
    to: "Document Server/Additional API/Command service/info"
  },
  {
    from: "https://api.onlyoffice.com/editors/command/license",
    to: "Document Server/Additional API/Command service/license"
  },
  {
    from: "https://api.onlyoffice.com/editors/command/meta",
    to: "Document Server/Additional API/Command service/meta"
  },
  {
    from: "https://api.onlyoffice.com/editors/command/version",
    to: "Document Server/Additional API/Command service/version"
  },
  {
    from: "https://api.onlyoffice.com/editors/conversionapi",
    to: "Document Server/Additional API/Conversion API"
  },
  {
    from: "https://api.onlyoffice.com/editors/documentbuilderapi",
    to: "Document Server/Additional API/Document Builder API"
  },
  {
    from: "https://api.onlyoffice.com/editors/signature/",
    to: "Document Server/Additional API/Signature"
  },
  {
    from: "https://api.onlyoffice.com/editors/signature/browser",
    to: "Document Server/Additional API/Signature/Browser"
  },
  {
    from: "https://api.onlyoffice.com/editors/signature/body",
    to: "Document Server/Additional API/Signature/Request"
  },
  {
    from: "https://api.onlyoffice.com/editors/signature/body",
    to: "Document Server/Additional API/Signature/Request/Token in body"
  },
  {
    from: "https://api.onlyoffice.com/editors/signature/request",
    to: "Document Server/Additional API/Signature/Request/Token in header"
  },

  // Document Server: More Information
  {
    from: "https://api.onlyoffice.com/editors/changelog",
    to: "Document Server/More Information/Changelog"
  },
  {
    from: "https://api.onlyoffice.com/editors/faq",
    to: "Document Server/More Information/FAQ"
  },
  {
    from: "https://api.onlyoffice.com/editors/faq/general",
    to: "Document Server/More Information/FAQ/General"
  },
  {
    from: "https://api.onlyoffice.com/editors/faq/security",
    to: "Document Server/More Information/FAQ/Security"
  },
  {
    from: "https://api.onlyoffice.com/editors/faq/sharing",
    to: "Document Server/More Information/FAQ/Sharing"
  },
  {
    from: "https://api.onlyoffice.com/editors/faq/embedding",
    to: "Document Server/More Information/FAQ/Embedding"
  },
  {
    from: "https://api.onlyoffice.com/editors/faq/coediting",
    to: "Document Server/More Information/FAQ/Co-editing"
  },
  {
    from: "https://api.onlyoffice.com/editors/faq/customizing",
    to: "Document Server/More Information/FAQ/Customizing"
  },
  {
    from: "https://api.onlyoffice.com/editors/faq/integrating",
    to: "Document Server/More Information/FAQ/Integrating"
  },
  {
    from: "https://api.onlyoffice.com/editors/faq/editing",
    to: "Document Server/More Information/FAQ/Editing"
  },
  {
    from: "https://api.onlyoffice.com/editors/faq/managingversions",
    to: "Document Server/More Information/FAQ/Managing versions"
  },
  {
    from: "https://api.onlyoffice.com/editors/faq/saving",
    to: "Document Server/More Information/FAQ/Saving"
  },
  {
    from: "https://api.onlyoffice.com/editors/faq/renaming",
    to: "Document Server/More Information/FAQ/Renaming"
  },
  {
    from: "https://api.onlyoffice.com/editors/faq/usingwopi",
    to: "Document Server/More Information/FAQ/Using WOPI"
  },
  {
    from: "https://api.onlyoffice.com/editors/troubleshooting",
    to: "Document Server/More Information/Troubleshooting"
  },

  // Plugin and Macros

  // Plugin and Macros: Get Started
  {
    from: "https://api.onlyoffice.com/plugin/basic",
    to: "Plugin and Macros/Get Started/Overview"
  },
  {
    from: "https://api.onlyoffice.com/plugin/gettingstarted",
    to: "Plugin and Macros/Get Started/Getting started with plugins"
  },
  {
    from: "https://api.onlyoffice.com/plugin/types",
    to: "Plugin and Macros/Get Started/Plugin types"
  },
  {
    from: "https://api.onlyoffice.com/plugin/structure",
    to: "Plugin and Macros/Get Started/Plugin structure"
  },

  // Plugin and Macros: Usage API
  {
    from: "https://api.onlyoffice.com/plugin/config",
    to: "Plugin and Macros/Usage API/Config"
  },
  {
    from: "https://api.onlyoffice.com/plugin/variations",
    to: "Plugin and Macros/Usage API/Config/Plugin variations"
  },
  {
    from: "https://api.onlyoffice.com/plugin/icons",
    to: "Plugin and Macros/Usage API/Config/Plugin icons"
  },
  {
    from: "https://api.onlyoffice.com/plugin/indexhtml",
    to: "Plugin and Macros/Usage API/index.html"
  },

  // Plugin and Macros: Plugins
  {
    from: "https://api.onlyoffice.com/plugin/developing",
    to: "Plugin and Macros/Plugins/Developing plugins"
  },
  {
    from: "https://api.onlyoffice.com/plugin/installation/",
    to: "Plugin and Macros/Plugins/Adding plugins"
  },
  {
    from: "https://api.onlyoffice.com/plugin/installation/desktop",
    to: "Plugin and Macros/Plugins/Adding plugins/ONLYOFFICE Desktop Editors"
  },
  {
    from: "https://api.onlyoffice.com/plugin/installation/onpremises",
    to: "Plugin and Macros/Plugins/Adding plugins/ONLYOFFICE Docs on-premises"
  },
  {
    from: "https://api.onlyoffice.com/plugin/installation/cloud",
    to: "Plugin and Macros/Plugins/Adding plugins/ONLYOFFICE Cloud"
  },
  {
    from: "https://api.onlyoffice.com/plugin/localization",
    to: "Plugin and Macros/Plugins/Plugin localization"
  },
  {
    from: "https://api.onlyoffice.com/plugin/styles",
    to: "Plugin and Macros/Plugins/Plugin styles"
  },
  {
    from: "https://api.onlyoffice.com/plugin/publishing",
    to: "Plugin and Macros/Plugins/Publishing plugins"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/",
    to: "Plugin and Macros/Plugins/Plugin examples"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/addcommentincell",
    to: "Plugin and Macros/Plugins/Plugin examples/Add comment in cell"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/addcustomfields",
    to: "Plugin and Macros/Plugins/Plugin examples/Add custom fields"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/autocomplete",
    to: "Plugin and Macros/Plugins/Plugin examples/Autocomplete"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/chess",
    to: "Plugin and Macros/Plugins/Plugin examples/Chess"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/clippy",
    to: "Plugin and Macros/Plugins/Plugin examples/Clippy"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/contextmenuandevents",
    to: "Plugin and Macros/Plugins/Plugin examples/Context menu and events"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/countwordsandcharacters",
    to: "Plugin and Macros/Plugins/Plugin examples/Count words and characters"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/extendedcomments",
    to: "Plugin and Macros/Plugins/Plugin examples/Extended comments"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/getandpastehtml",
    to: "Plugin and Macros/Plugins/Plugin examples/Get and paste html"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/helloworld",
    to: "Plugin and Macros/Plugins/Plugin examples/Hello world"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/highlightcode",
    to: "Plugin and Macros/Plugins/Plugin examples/Highlight code"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/invoices",
    to: "Plugin and Macros/Plugins/Plugin examples/Invoices"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/languagetool",
    to: "Plugin and Macros/Plugins/Plugin examples/Language tool"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/loadcustomfields",
    to: "Plugin and Macros/Plugins/Plugin examples/Load custom fields"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/movecursor",
    to: "Plugin and Macros/Plugins/Plugin examples/Move cursor"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/ocr",
    to: "Plugin and Macros/Plugins/Plugin examples/OCR"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/photoeditor",
    to: "Plugin and Macros/Plugins/Plugin examples/Photo editor"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/searchandchangetextbackgroundcolor",
    to: "Plugin and Macros/Plugins/Plugin examples/Search and change text background color"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/searchandreplace",
    to: "Plugin and Macros/Plugins/Plugin examples/Search and replace"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/searchandreplaceonstart",
    to: "Plugin and Macros/Plugins/Plugin examples/Search and replace on start"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/settings",
    to: "Plugin and Macros/Plugins/Plugin examples/Settings"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/speech",
    to: "Plugin and Macros/Plugins/Plugin examples/Speech"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/symboltable",
    to: "Plugin and Macros/Plugins/Plugin examples/Symbol table"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/telegram",
    to: "Plugin and Macros/Plugins/Plugin examples/Telegram"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/templates",
    to: "Plugin and Macros/Plugins/Plugin examples/Templates"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/thesaurus",
    to: "Plugin and Macros/Plugins/Plugin examples/Thesaurus"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/translator",
    to: "Plugin and Macros/Plugins/Plugin examples/Translator"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/typograf",
    to: "Plugin and Macros/Plugins/Plugin examples/Typograf"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/workwithcontentcontrolscontent",
    to: "Plugin and Macros/Plugins/Plugin examples/Work with content controls content"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/workwithcontentcontrolsnavigation",
    to: "Plugin and Macros/Plugins/Plugin examples/Work with content controls navigation"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/workwithcontentcontrolstags",
    to: "Plugin and Macros/Plugins/Plugin examples/Work with content controls tags"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/youtube",
    to: "Plugin and Macros/Plugins/Plugin examples/YouTube"
  },
  {
    from: "https://api.onlyoffice.com/plugin/example/zotero",
    to: "Plugin and Macros/Plugins/Plugin examples/Zotero"
  },

  // Plugin and Macros: Macros
  {
    from: "https://api.onlyoffice.com/plugin/macros",
    to: "Plugin and Macros/Macros/Getting started with macros"
  },
  {
    from: "https://api.onlyoffice.com/plugin/writingmacros",
    to: "Plugin and Macros/Macros/Writing macros"
  },
  {
    from: "https://api.onlyoffice.com/plugin/debugging",
    to: "Plugin and Macros/Macros/Debugging"
  },
  {
    from: "https://api.onlyoffice.com/plugin/convertingvbamacros",
    to: "Plugin and Macros/Macros/Converting VBA macros"
  },
  {
    from: "https://api.onlyoffice.com/plugin/macrosamples/",
    to: "Plugin and Macros/Macros/Macro samples"
  },
  {
    from: "https://api.onlyoffice.com/plugin/macrosamples/writedatatoworksheetcell",
    to: "Plugin and Macros/Macros/Macro samples/Write data to worksheet cell"
  },
  {
    from: "https://api.onlyoffice.com/plugin/macrosamples/changecellbackgroundcolor",
    to: "Plugin and Macros/Macros/Macro samples/Change cell background color"
  },
  {
    from: "https://api.onlyoffice.com/plugin/macrosamples/changecellfontcolor",
    to: "Plugin and Macros/Macros/Macro samples/Change cell font color"
  },
  {
    from: "https://api.onlyoffice.com/plugin/macrosamples/makecellfontbold",
    to: "Plugin and Macros/Macros/Macro samples/Make cell font bold"
  },
  {
    from: "https://api.onlyoffice.com/plugin/macrosamples/mergecellrange",
    to: "Plugin and Macros/Macros/Macro samples/Merge cell range"
  },
  {
    from: "https://api.onlyoffice.com/plugin/macrosamples/unmergecellrange",
    to: "Plugin and Macros/Macros/Macro samples/Unmerge cell range"
  },
  {
    from: "https://api.onlyoffice.com/plugin/macrosamples/setcolumnwidth",
    to: "Plugin and Macros/Macros/Macro samples/Set column width"
  },
  {
    from: "https://api.onlyoffice.com/plugin/macrosamples/formatrangeasatable",
    to: "Plugin and Macros/Macros/Macro samples/Format range as a table"
  },
  {
    from: "https://api.onlyoffice.com/plugin/macrosamples/addchart",
    to: "Plugin and Macros/Macros/Macro samples/Add chart"
  },
  {
    from: "https://api.onlyoffice.com/plugin/macrosamples/highlightduplicates",
    to: "Plugin and Macros/Macros/Macro samples/Highlight duplicates"
  },
  {
    from: "https://api.onlyoffice.com/plugin/macrosamples/nextblankrow",
    to: "Plugin and Macros/Macros/Macro samples/Next blank row"
  },
  {
    from: "https://api.onlyoffice.com/plugin/macrosamples/inserttext",
    to: "Plugin and Macros/Macros/Macro samples/Insert text"
  },
  {
    from: "https://api.onlyoffice.com/plugin/macrosamples/currencyexchangerates",
    to: "Plugin and Macros/Macros/Macro samples/Currency exchange rates"
  },
  {
    from: "https://api.onlyoffice.com/plugin/macrosamples/importcsv",
    to: "Plugin and Macros/Macros/Macro samples/Import CSV/TXT data"
  },
  {
    from: "https://api.onlyoffice.com/plugin/macrosamples/recalculatevalues",
    to: "Plugin and Macros/Macros/Macro samples/Recalculate worksheet values"
  },
  {
    from: "https://api.onlyoffice.com/plugin/macrosamples/unhideallrows",
    to: "Plugin and Macros/Macros/Macro samples/Unhide all rows and columns"
  },
  {
    from: "https://api.onlyoffice.com/plugin/macrosamples/removeshapes",
    to: "Plugin and Macros/Macros/Macro samples/Remove shapes from slides"
  },
  {
    from: "https://api.onlyoffice.com/plugin/macrosamples/insertid",
    to: "Plugin and Macros/Macros/Macro samples/Insert unique id"
  },
  {
    from: "https://api.onlyoffice.com/plugin/macrosamples/completeaddressinformation",
    to: "Plugin and Macros/Macros/Macro samples/Complete address information"
  },
  {
    from: "https://api.onlyoffice.com/plugin/changelog",
    to: "Plugin and Macros/Changelog"
  },
  {
    from: "https://api.onlyoffice.com/plugin/faq",
    to: "Plugin and Macros/FAQ"
  },

  // Document Builder

  // Document Builder: Get Started
  {
    from: "https://api.onlyoffice.com/docbuilder/basic",
    to: "Document Builder/Get Started/Overview"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/getbuilder",
    to: "Document Builder/Get Started/Get Document Builder"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/try",
    to: "Document Builder/Get Started/Try now"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/debugging",
    to: "Document Builder/Get Started/Debugging"
  },

  // Document Builder: Builder API
  {
    from: "https://api.onlyoffice.com/docbuilder/gettingstarted",
    to: "Document Builder/Builder API/Overview"
  },

  // Document Builder: Builder Framework
  {
    from: "https://api.onlyoffice.com/docbuilder/framework",
    to: "Document Builder/Builder Framework/Overview"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c",
    to: "Document Builder/Builder Framework/C++"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuilder",
    to: "Document Builder/Builder Framework/C++/CDocBuilder"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuilder/closefile",
    to: "Document Builder/Builder Framework/C++/CDocBuilder/CloseFile"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuilder/createfile",
    to: "Document Builder/Builder Framework/C++/CDocBuilder/CreateFile"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuilder/dispose",
    to: "Document Builder/Builder Framework/C++/CDocBuilder/Dispose"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuilder/executecommand",
    to: "Document Builder/Builder Framework/C++/CDocBuilder/ExecuteCommand"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuilder/getcontext",
    to: "Document Builder/Builder Framework/C++/CDocBuilder/GetContext"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuilder/getversion",
    to: "Document Builder/Builder Framework/C++/CDocBuilder/GetVersion"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuilder/initialize",
    to: "Document Builder/Builder Framework/C++/CDocBuilder/Initialize"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuilder/issavewithdoctrenderermode",
    to: "Document Builder/Builder Framework/C++/CDocBuilder/IsSaveWithDoctrendererMode"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuilder/openfile",
    to: "Document Builder/Builder Framework/C++/CDocBuilder/OpenFile"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuilder/run",
    to: "Document Builder/Builder Framework/C++/CDocBuilder/Run"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuilder/runtexta",
    to: "Document Builder/Builder Framework/C++/CDocBuilder/RunTextA"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuilder/runtextw",
    to: "Document Builder/Builder Framework/C++/CDocBuilder/RunTextW"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuilder/savefile",
    to: "Document Builder/Builder Framework/C++/CDocBuilder/SaveFile"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuilder/setproperty",
    to: "Document Builder/Builder Framework/C++/CDocBuilder/SetProperty"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuilder/setpropertyw",
    to: "Document Builder/Builder Framework/C++/CDocBuilder/SetPropertyW"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuilder/settmpfolder",
    to: "Document Builder/Builder Framework/C++/CDocBuilder/SetTmpFolder"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuilder/writedata",
    to: "Document Builder/Builder Framework/C++/CDocBuilder/WriteData"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildercontext",
    to: "Document Builder/Builder Framework/C++/CDocBuilderContext"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildercontext/allocmemorytypedarray",
    to: "Document Builder/Builder Framework/C++/CDocBuilderContext/AllocMemoryTypedArray"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildercontext/createarray",
    to: "Document Builder/Builder Framework/C++/CDocBuilderContext/CreateArray"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildercontext/createnull",
    to: "Document Builder/Builder Framework/C++/CDocBuilderContext/CreateNull"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildercontext/createobject",
    to: "Document Builder/Builder Framework/C++/CDocBuilderContext/CreateObject"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildercontext/createscope",
    to: "Document Builder/Builder Framework/C++/CDocBuilderContext/CreateScope"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildercontext/createtypedarray",
    to: "Document Builder/Builder Framework/C++/CDocBuilderContext/CreateTypedArray"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildercontext/createundefined",
    to: "Document Builder/Builder Framework/C++/CDocBuilderContext/CreateUndefined"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildercontext/freememorytypedarray",
    to: "Document Builder/Builder Framework/C++/CDocBuilderContext/FreeMemoryTypedArray"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildercontext/getglobal",
    to: "Document Builder/Builder Framework/C++/CDocBuilderContext/GetGlobal"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildercontext/iserror",
    to: "Document Builder/Builder Framework/C++/CDocBuilderContext/IsError"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildercontextscope",
    to: "Document Builder/Builder Framework/C++/CDocBuilderContextScope"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildercontextscope/close",
    to: "Document Builder/Builder Framework/C++/CDocBuilderContextScope/Close"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildervalue",
    to: "Document Builder/Builder Framework/C++/CDocBuilderValue"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildervalue/call",
    to: "Document Builder/Builder Framework/C++/CDocBuilderValue/Call"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildervalue/clear",
    to: "Document Builder/Builder Framework/C++/CDocBuilderValue/Clear"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildervalue/createnull",
    to: "Document Builder/Builder Framework/C++/CDocBuilderValue/CreateNull"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildervalue/createundefined",
    to: "Document Builder/Builder Framework/C++/CDocBuilderValue/CreateUndefined"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildervalue/get",
    to: "Document Builder/Builder Framework/C++/CDocBuilderValue/Get"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildervalue/getlength",
    to: "Document Builder/Builder Framework/C++/CDocBuilderValue/GetLength"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildervalue/getproperty",
    to: "Document Builder/Builder Framework/C++/CDocBuilderValue/GetProperty"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildervalue/isarray",
    to: "Document Builder/Builder Framework/C++/CDocBuilderValue/IsArray"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildervalue/isbool",
    to: "Document Builder/Builder Framework/C++/CDocBuilderValue/IsBool"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildervalue/isdouble",
    to: "Document Builder/Builder Framework/C++/CDocBuilderValue/IsDouble"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildervalue/isempty",
    to: "Document Builder/Builder Framework/C++/CDocBuilderValue/IsEmpty"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildervalue/isfunction",
    to: "Document Builder/Builder Framework/C++/CDocBuilderValue/IsFunction"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildervalue/isint",
    to: "Document Builder/Builder Framework/C++/CDocBuilderValue/IsInt"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildervalue/isnull",
    to: "Document Builder/Builder Framework/C++/CDocBuilderValue/IsNull"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildervalue/isobject",
    to: "Document Builder/Builder Framework/C++/CDocBuilderValue/IsObject"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildervalue/isstring",
    to: "Document Builder/Builder Framework/C++/CDocBuilderValue/IsString"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildervalue/istypedarray",
    to: "Document Builder/Builder Framework/C++/CDocBuilderValue/IsTypedArray"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildervalue/isundefined",
    to: "Document Builder/Builder Framework/C++/CDocBuilderValue/IsUndefined"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildervalue/set",
    to: "Document Builder/Builder Framework/C++/CDocBuilderValue/Set"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildervalue/setproperty",
    to: "Document Builder/Builder Framework/C++/CDocBuilderValue/SetProperty"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildervalue/tobool",
    to: "Document Builder/Builder Framework/C++/CDocBuilderValue/ToBool"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildervalue/todouble",
    to: "Document Builder/Builder Framework/C++/CDocBuilderValue/ToDouble"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildervalue/toint",
    to: "Document Builder/Builder Framework/C++/CDocBuilderValue/ToInt"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/c/cdocbuildervalue/tostring",
    to: "Document Builder/Builder Framework/C++/CDocBuilderValue/ToString"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com",
    to: "Document Builder/Builder Framework/COM"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuilder",
    to: "Document Builder/Builder Framework/COM/CDocBuilder"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuilder/closefile",
    to: "Document Builder/Builder Framework/COM/CDocBuilder/CloseFile"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuilder/createfile",
    to: "Document Builder/Builder Framework/COM/CDocBuilder/CreateFile"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuilder/createinstance",
    to: "Document Builder/Builder Framework/COM/CDocBuilder/CreateInstance"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuilder/dispose",
    to: "Document Builder/Builder Framework/COM/CDocBuilder/Dispose"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuilder/execute",
    to: "Document Builder/Builder Framework/COM/CDocBuilder/Execute"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuilder/executecommand",
    to: "Document Builder/Builder Framework/COM/CDocBuilder/ExecuteCommand"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuilder/getcontext",
    to: "Document Builder/Builder Framework/COM/CDocBuilder/GetContext"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuilder/initialize",
    to: "Document Builder/Builder Framework/COM/CDocBuilder/Initialize"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuilder/issavewithdoctrenderermode",
    to: "Document Builder/Builder Framework/COM/CDocBuilder/IsSaveWithDoctrendererMode"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuilder/openfile",
    to: "Document Builder/Builder Framework/COM/CDocBuilder/OpenFile"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuilder/run",
    to: "Document Builder/Builder Framework/COM/CDocBuilder/Run"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuilder/runtext",
    to: "Document Builder/Builder Framework/COM/CDocBuilder/RunText"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuilder/savefile",
    to: "Document Builder/Builder Framework/COM/CDocBuilder/SaveFile"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuilder/setproperty",
    to: "Document Builder/Builder Framework/COM/CDocBuilder/SetProperty"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuilder/settmpfolder",
    to: "Document Builder/Builder Framework/COM/CDocBuilder/SetTmpFolder"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuilder/writedata",
    to: "Document Builder/Builder Framework/COM/CDocBuilder/WriteData"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildercontext",
    to: "Document Builder/Builder Framework/COM/CDocBuilderContext"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildercontext/createarray",
    to: "Document Builder/Builder Framework/COM/CDocBuilderContext/CreateArray"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildercontext/createnull",
    to: "Document Builder/Builder Framework/COM/CDocBuilderContext/CreateNull"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildercontext/createobject",
    to: "Document Builder/Builder Framework/COM/CDocBuilderContext/CreateObject"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildercontext/createscope",
    to: "Document Builder/Builder Framework/COM/CDocBuilderContext/CreateScope"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildercontext/createtypedarray",
    to: "Document Builder/Builder Framework/COM/CDocBuilderContext/CreateTypedArray"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildercontext/createundefined",
    to: "Document Builder/Builder Framework/COM/CDocBuilderContext/CreateUndefined"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildercontext/getglobal",
    to: "Document Builder/Builder Framework/COM/CDocBuilderContext/GetGlobal"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildercontext/iserror",
    to: "Document Builder/Builder Framework/COM/CDocBuilderContext/IsError"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildercontextscope",
    to: "Document Builder/Builder Framework/COM/CDocBuilderContextScope"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildercontextscope/close",
    to: "Document Builder/Builder Framework/COM/CDocBuilderContextScope/Close"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildervalue",
    to: "Document Builder/Builder Framework/COM/CDocBuilderValue"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildervalue/call",
    to: "Document Builder/Builder Framework/COM/CDocBuilderValue/Call"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildervalue/clear",
    to: "Document Builder/Builder Framework/COM/CDocBuilderValue/Clear"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildervalue/createinstance",
    to: "Document Builder/Builder Framework/COM/CDocBuilderValue/CreateInstance"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildervalue/get",
    to: "Document Builder/Builder Framework/COM/CDocBuilderValue/Get"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildervalue/getlength",
    to: "Document Builder/Builder Framework/COM/CDocBuilderValue/GetLength"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildervalue/getproperty",
    to: "Document Builder/Builder Framework/COM/CDocBuilderValue/GetProperty"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildervalue/isarray",
    to: "Document Builder/Builder Framework/COM/CDocBuilderValue/IsArray"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildervalue/isbool",
    to: "Document Builder/Builder Framework/COM/CDocBuilderValue/IsBool"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildervalue/isdouble",
    to: "Document Builder/Builder Framework/COM/CDocBuilderValue/IsDouble"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildervalue/isempty",
    to: "Document Builder/Builder Framework/COM/CDocBuilderValue/IsEmpty"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildervalue/isfunction",
    to: "Document Builder/Builder Framework/COM/CDocBuilderValue/IsFunction"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildervalue/isint",
    to: "Document Builder/Builder Framework/COM/CDocBuilderValue/IsInt"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildervalue/isnull",
    to: "Document Builder/Builder Framework/COM/CDocBuilderValue/IsNull"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildervalue/isobject",
    to: "Document Builder/Builder Framework/COM/CDocBuilderValue/IsObject"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildervalue/isstring",
    to: "Document Builder/Builder Framework/COM/CDocBuilderValue/IsString"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildervalue/istypedarray",
    to: "Document Builder/Builder Framework/COM/CDocBuilderValue/IsTypedArray"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildervalue/isundefined",
    to: "Document Builder/Builder Framework/COM/CDocBuilderValue/IsUndefined"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildervalue/set",
    to: "Document Builder/Builder Framework/COM/CDocBuilderValue/Set"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildervalue/setproperty",
    to: "Document Builder/Builder Framework/COM/CDocBuilderValue/SetProperty"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildervalue/tobool",
    to: "Document Builder/Builder Framework/COM/CDocBuilderValue/ToBool"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildervalue/todouble",
    to: "Document Builder/Builder Framework/COM/CDocBuilderValue/ToDouble"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildervalue/toint",
    to: "Document Builder/Builder Framework/COM/CDocBuilderValue/ToInt"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/com/cdocbuildervalue/tostring",
    to: "Document Builder/Builder Framework/COM/CDocBuilderValue/ToString"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net",
    to: "Document Builder/Builder Framework/.Net"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuilder",
    to: "Document Builder/Builder Framework/.Net/CDocBuilder"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuilder/closefile",
    to: "Document Builder/Builder Framework/.Net/CDocBuilder/CloseFile"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuilder/createfile",
    to: "Document Builder/Builder Framework/.Net/CDocBuilder/CreateFile"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuilder/destroy",
    to: "Document Builder/Builder Framework/.Net/CDocBuilder/Destroy"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuilder/executecommand",
    to: "Document Builder/Builder Framework/.Net/CDocBuilder/ExecuteCommand"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuilder/getcontext",
    to: "Document Builder/Builder Framework/.Net/CDocBuilder/GetContext"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuilder/getversion",
    to: "Document Builder/Builder Framework/.Net/CDocBuilder/GetVersion"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuilder/initialize",
    to: "Document Builder/Builder Framework/.Net/CDocBuilder/Initialize"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuilder/issavewithdoctrenderermode",
    to: "Document Builder/Builder Framework/.Net/CDocBuilder/IsSaveWithDoctrendererMode"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuilder/openfile",
    to: "Document Builder/Builder Framework/.Net/CDocBuilder/OpenFile"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuilder/run",
    to: "Document Builder/Builder Framework/.Net/CDocBuilder/Run"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuilder/runtext",
    to: "Document Builder/Builder Framework/.Net/CDocBuilder/RunText"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuilder/savefile",
    to: "Document Builder/Builder Framework/.Net/CDocBuilder/SaveFile"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuilder/setproperty",
    to: "Document Builder/Builder Framework/.Net/CDocBuilder/SetProperty"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuilder/settmpfolder",
    to: "Document Builder/Builder Framework/.Net/CDocBuilder/SetTmpFolder"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuilder/writedata",
    to: "Document Builder/Builder Framework/.Net/CDocBuilder/WriteData"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildercontext",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderContext"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildercontext/createarray",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderContext/CreateArray"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildercontext/createnull",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderContext/CreateNull"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildercontext/createobject",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderContext/CreateObject"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildercontext/createscope",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderContext/CreateScope"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildercontext/createtypedarray",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderContext/CreateTypedArray"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildercontext/createundefined",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderContext/CreateUndefined"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildercontext/getglobal",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderContext/GetGlobal"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildercontext/iserror",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderContext/IsError"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildercontextscope",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderContextScope"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildercontextscope/close",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderContextScope/Close"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildervalue",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderValue"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildervalue/call",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderValue/Call"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildervalue/clear",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderValue/Clear"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildervalue/createnull",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderValue/CreateNull"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildervalue/createundefined",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderValue/CreateUndefined"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildervalue/get",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderValue/Get"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildervalue/getlength",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderValue/GetLength"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildervalue/getproperty",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderValue/GetProperty"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildervalue/isarray",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderValue/IsArray"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildervalue/isbool",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderValue/IsBool"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildervalue/isdouble",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderValue/IsDouble"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildervalue/isempty",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderValue/IsEmpty"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildervalue/isfunction",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderValue/IsFunction"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildervalue/isint",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderValue/IsInt"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildervalue/isnull",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderValue/IsNull"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildervalue/isobject",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderValue/IsObject"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildervalue/isstring",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderValue/IsString"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildervalue/istypedarray",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderValue/IsTypedArray"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildervalue/isundefined",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderValue/IsUndefined"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildervalue/set",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderValue/Set"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildervalue/setproperty",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderValue/SetProperty"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildervalue/tobool",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderValue/ToBool"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildervalue/todouble",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderValue/ToDouble"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildervalue/toint",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderValue/ToInt"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/net/cdocbuildervalue/tostring",
    to: "Document Builder/Builder Framework/.Net/CDocBuilderValue/ToString"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/builderframeworksamples",
    to: "Document Builder/Builder Framework/Builder framework samples"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/builderframeworksamples/cppbuildersamples",
    to: "Document Builder/Builder Framework/Builder framework samples/C++ samples guide"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/builderframeworksamples/csharpbuildersamples",
    to: "Document Builder/Builder Framework/Builder framework samples/.Net samples guide"
  },

  // Document Builder: Builder App
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/default",
    to: "Document Builder/Builder App/Overview"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/usingdocbuilderfile",
    to: "Document Builder/Builder App/Using .docbuilder file"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/integrationapi/arguments",
    to: "Document Builder/Builder App/Using command line arguments"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/howitworks",
    to: "Document Builder/Builder App/How it works"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/howitworks/globalvariable",
    to: "Document Builder/Builder App/How it works/Exchanging data among files"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/howitworks/comparedocuments",
    to: "Document Builder/Builder App/How it works/Comparing documents"
  },

  // Document Builder: Builder Server
  {
    from: "https://api.onlyoffice.com/docbuilder/integratingdocumentbuilder",
    to: "Document Builder/Builder Server/Overview"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/csharpexample",
    to: "Document Builder/Builder Server/.Net (C#) example"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/nodejsexample",
    to: "Document Builder/Builder Server/Node.js example"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/phpexample",
    to: "Document Builder/Builder Server/PHP example"
  },
  {
    from: "https://api.onlyoffice.com/docbuilder/rubyexample",
    to: "Document Builder/Builder Server/Ruby example"
  },

  // Document Builder: More Information
  {
    from: "https://api.onlyoffice.com/docbuilder/changelog",
    to: "Document Builder/More Information/Changelog"
  },

  // Desktop Editors

  // Desktop Editors: Get Started
  {
    from: "https://api.onlyoffice.com/desktop/basic",
    to: "Desktop Editors/Get Started/Overview"
  },
  {
    from: "https://api.onlyoffice.com/desktop/howitworks/",
    to: "Desktop Editors/Get Started/How it works"
  },
  {
    from: "https://api.onlyoffice.com/desktop/howitworks/encryptinglocaldocuments",
    to: "Desktop Editors/Get Started/How it works/Encrypting local documents"
  },
  {
    from: "https://api.onlyoffice.com/desktop/howitworks/encryptingclouddocuments",
    to: "Desktop Editors/Get Started/How it works/Encrypting cloud documents"
  },

  // Desktop Editors: Usage API
  {
    from: "https://api.onlyoffice.com/desktop/debugging",
    to: "Desktop Editors/Usage API/Debugging"
  },
  {
    from: "https://api.onlyoffice.com/desktop/plugins",
    to: "Desktop Editors/Usage API/Adding plugins"
  },
  {
    from: "https://api.onlyoffice.com/desktop/addingdms/",
    to: "Desktop Editors/Usage API/Adding a DMS provider"
  },
  {
    from: "https://api.onlyoffice.com/desktop/addingdms/configuring",
    to: "Desktop Editors/Usage API/Adding a DMS provider/Configuring the interaction"
  },
  {
    from: "https://api.onlyoffice.com/desktop/addingdms/notifications",
    to: "Desktop Editors/Usage API/Adding a DMS provider/Sending notifications"
  },
  {
    from: "https://api.onlyoffice.com/desktop/addingdms/execcommand",
    to: "Desktop Editors/Usage API/Adding a DMS provider/execCommand"
  },
  {
    from: "https://api.onlyoffice.com/desktop/addingdms/loginlogout",
    to: "Desktop Editors/Usage API/Adding a DMS provider/Login logout"
  },
  {
    from: "https://api.onlyoffice.com/desktop/addingdms/opening",
    to: "Desktop Editors/Usage API/Adding a DMS provider/Opening documents"
  },
  {
    from: "https://api.onlyoffice.com/desktop/addingdms/changingtheme",
    to: "Desktop Editors/Usage API/Adding a DMS provider/Changing a theme"
  },
  {
    from: "https://api.onlyoffice.com/desktop/addingdms/encryption",
    to: "Desktop Editors/Usage API/Adding a DMS provider/Encryption"
  },
  {
    from: "https://api.onlyoffice.com/desktop/addingdms/encryption/keygeneration",
    to: "Desktop Editors/Usage API/Adding a DMS provider/Encryption/Key generation"
  },
  {
    from: "https://api.onlyoffice.com/desktop/addingdms/encryption/operations",
    to: "Desktop Editors/Usage API/Adding a DMS provider/Encryption/Operations with encrypted files"
  },

  // Desktop Editors: More Information
  {
    from: "https://api.onlyoffice.com/desktop/changelog",
    to: "Desktop Editors/More Information/Changelog"
  },
  {
    from: "https://api.onlyoffice.com/desktop/faq",
    to: "Desktop Editors/More Information/FAQ"
  },

  // Community Server: Get Started
  {
    from: "https://api.onlyoffice.com/portals/basic",
    to: "Community Server/Get Started/Basic concepts"
  },
  {
    from: "https://api.onlyoffice.com/portals/auth",
    to: "Community Server/Get Started/Passing authentication"
  },

  // Community Server: More Information
  {
    from: "https://api.onlyoffice.com/portals/faq",
    to: "Community Server/More Information/FAQ"
  },
  {
    from: "https://api.onlyoffice.com/portals/filters",
    to: "Community Server/More Information/Filtering"
  },
  {
    from: "https://api.onlyoffice.com/portals/batch",
    to: "Community Server/More Information/Batching"
  }
]

const t0 = {}
for (const p of pages) {
  let c = t0
  const a = p.to.split("/")
  for (const [i] of a.entries()) {
    const s = a.slice(0, i + 1).join("/")
    if (!c[s]) {
      c[s] = {
        from: "",
        to: s,
        data: {
          description: "",
          order: 0
        },
        children: {}
      }
    }
    if (s === p.to) {
      c[s].from = p.from
    }
    c = c[s].children
  }
}

const t1 = modify(t0)
function modify(o) {
  const a = Object.entries(o)
  return a.map(([, v], i) => {
    return {
      ...v,
      data: {
        ...v.data,
        order: i - a.length
      },
      children: modify(v.children)
    }
  })
}

const t2 = simplify(t1)
function simplify(a) {
  return a.flatMap((o) => {
    const c = o.children
    delete o.children
    return [o, ...simplify(c)]
  })
}

await Promise.all(t2.map(async (p) => {
  const o = "./pages/"
  const d = join(o, p.to)
  await mkdir(d, {recursive: true})

  let m = [{name: "order", value: p.data.order}]
  let x = ""
  const f = join(d, "index.mdx")

  if (p.from !== "") {
    console.log(p.from)

    await new Promise((res) => setTimeout(res, random(100, 300)))
    p.from = p.from.replace("https://api.onlyoffice.com", "https://api.teamlab.info")

    const r = await fetch(p.from)
    const c = await r.text()
    const h = parse(c)

    let e = h.querySelector(".layout-content")
    let t = e?.toString()
    if (t) {
      const v = await unified()
        .use(rehypeParse)
        .use(rehypeRemark)
        .use(remarkGFM)
        .use(function () {
          return function (tree) {
            visit(tree, "heading", function (node, index, parent) {
              if (node.depth === 1) {
                node.children[0].value = ""
                // parent.children[index] = {
                //   type: "text",
                //   value: ""
                // }
              }
            })
          }
        })
        .use(remarkStringify)
        .process(t)
      x = v.toString()

      try {
        await compile(x, {jsxImportSource: "preact"})
      } catch (e) {
        console.error(e)
        x = ""
      }
    }

    // e = h.querySelector("meta[name=description]")
    // t = e?.getAttribute("content")
    // if (t) {
    //   m.push({name: "description", value: t})
    // }
  }

  let y = "---"
  m = m.sort((a, b) => a.name.localeCompare(b.name))
  for (const o of m) {
    y += `\n${o.name}: ${o.value}`
  }
  y += "\n---\n"
  x = y + x

  x = x.replace(/---\n#\n/, "---")

  await writeFile(f, x, "utf8")
}))

function random(min, max) {
  min = Math.ceil(min)
  max = Math.floor(max)
  return Math.floor(Math.random() * (max - min + 1)) + min
}

export {}
