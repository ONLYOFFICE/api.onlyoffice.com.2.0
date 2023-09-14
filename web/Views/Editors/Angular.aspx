<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ONLYOFFICE Docs Angular component
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>
        <span class="hdr">ONLYOFFICE Docs Angular component</span>
    </h1>

    <p>This <a href="https://github.com/ONLYOFFICE/document-editor-angular-workspace" target="_blank">component</a> enables users to build ONLYOFFICE Docs user interface using <a href="https://angularjs.org/" target="_blank">Angular</a>.</p>


    <h2 id="install" class="copy-link">Installing ONLYOFFICE Docs Angular component</h2>
    <p>Install ONLYOFFICE Docs Angular component from <b>npm</b> in your project. Run:</p>
    <pre>
npm install --save @onlyoffice/document-editor-angular
</pre>
    <p>or</p>
    <pre>
yarn add @onlyoffice/document-editor-angular
</pre>


    <h2 id="use" class="copy-link">Using ONLYOFFICE Docs Angular component</h2>
    <p>Follow the steps below to start using the component:</p>
    <ol>
        <li>
            <p>Import the <b>DocumentEditorModule</b>:</p>
            <pre>
import { NgModule } from '@angular/core';
import { DocumentEditorModule } from "@onlyoffice/document-editor-angular";

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    DocumentEditorAngularModule
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
</pre>
        </li>
        <li>
            <p>Define options in your consuming component:</p>
            <pre>
@Component({...})
export class ExampleComponent {
  config: IConfig = {
    document: {
      "fileType": "docx",
      "key": "Khirz6zTPdfd7",
      "title": "Example Document Title.docx",
      "url": "https://example.com/url-to-example-document.docx"
    },
    documentType: "word",
    editorConfig: {
      "callbackUrl": "https://example.com/url-to-callback.ashx"
    },
  }

  onDocumentReady = (event) => {
    console.log("Document is loaded");
  };
}
</pre>
            <p>where the <b>example.com</b> is the name of the server where <b>document manager</b> and <b>document storage service</b> are installed.</p>
        </li>
        <li>
            <p>In template, use the <b>document-editor</b> component with your options:</p>
            <pre>
&lt;document-editor 
  id="docxForComments" 
  documentServerUrl="http://documentserver/"
  [config]="config"
  [events_onDocumentReady]="onDocumentReady"
&gt;&lt;/document-editor&gt;
</pre>
            <p>where the <b>documentserver</b> is the name of the server with <b>ONLYOFFICE Docs</b> installed.</p>
        </li>
    </ol>


    <h2 id="api" class="copy-link">ONLYOFFICE Docs Angular component API</h2>
    <div class="header-gray">Properties</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col class="table-type" />
            <col />
            <col />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Name</td>
                <td>Type</td>
                <td>Default</td>
                <td>Description</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td id="id" class="copy-link">id<span class="required">*</span></td>
                <td>string</td>
                <td>null</td>
                <td>Component unique identifier.</td>
            </tr>
            <tr class="tablerow">
                <td id="documentServerUrl" class="copy-link">documentServerUrl<span class="required">*</span></td>
                <td>string</td>
                <td>null</td>
                <td>Address of ONLYOFFICE Document Server.</td>
            </tr>
            <tr class="tablerow">
                <td id="config" class="copy-link">config<span class="required">*</span></td>
                <td>object</td>
                <td>null</td>
                <td>Generic <a href="<%= Url.Action("config") %>">configuration object</a> for opening a file with token.</td>
            </tr>
            <tr class="tablerow">
                <td id="document_fileType" class="copy-link">document_fileType</td>
                <td>string</td>
                <td>null</td>
                <td>The type of the file.</td>
            </tr>
            <tr class="tablerow">
                <td id="document_title" class="copy-link">document_title</td>
                <td>string</td>
                <td>null</td>
                <td>The file name.</td>
            </tr>
            <tr class="tablerow">
                <td id="documentType" class="copy-link">documentType</td>
                <td>string</td>
                <td>null</td>
                <td>The document type.</td>
            </tr>
            <tr class="tablerow">
                <td id="height" class="copy-link">height</td>
                <td>string</td>
                <td>null</td>
                <td>Defines the document height in the browser window.</td>
            </tr>
            <tr class="tablerow">
                <td id="type" class="copy-link">type</td>
                <td>string</td>
                <td>null</td>
                <td>Defines the platform type used to access the document (desktop, mobile or embedded).</td>
            </tr>
            <tr class="tablerow">
                <td id="width" class="copy-link">width</td>
                <td>string</td>
                <td>null</td>
                <td>Defines the document width in the browser window.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onAppReady" class="copy-link">events_onAppReady</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the application is loaded into the browser.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onDocumentStateChange" class="copy-link">events_onDocumentStateChange</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the document is modified.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onMetaChange" class="copy-link">events_onMetaChange</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the meta information of the document is changed via the meta command.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onDocumentReady" class="copy-link">events_onDocumentReady</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the document is loaded into the document editor.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onInfo" class="copy-link">events_onInfo</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the application opened the file.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onWarning" class="copy-link">events_onWarning</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when a warning occurs.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onError" class="copy-link">events_onError</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when an error or some other specific event occurs.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestSharingSettings" class="copy-link">events_onRequestSharingSettings</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the user is trying to manage document access rights by clicking <b>Change access rights</b> button.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestRename" class="copy-link">events_onRequestRename</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the user is trying to rename the file by clicking the <b>Rename...</b> button.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onMakeActionLink" class="copy-link">events_onMakeActionLink</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the user is trying to get link for opening the document which contains a bookmark, scrolling to the bookmark position.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestInsertImage" class="copy-link">events_onRequestInsertImage</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the user is trying to insert an image by clicking the <b>Image from Storage</b> button.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestSaveAs" class="copy-link">events_onRequestSaveAs</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the user is trying to save file by clicking <b>Save Copy as...</b> button.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestMailMergeRecipients" class="copy-link">events_onRequestMailMergeRecipients</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the user is trying to select recipients data by clicking the <b>Mail merge</b> button.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestCompareFile" class="copy-link">events_onRequestCompareFile</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the user is trying to select document for comparing by clicking the <b>Document from Storage</b> button.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestEditRights" class="copy-link">events_onRequestEditRights</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the user is trying to switch the document from the viewing into the editing mode by clicking the <b>Edit Document</b> button.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestHistory" class="copy-link">events_onRequestHistory</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the user is trying to show the document version history by clicking the <b>Version History</b> button.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestHistoryClose" class="copy-link">events_onRequestHistoryClose</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the user is trying to go back to the document from viewing the document version history by clicking the <b>Close History</b> button.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestHistoryData" class="copy-link">events_onRequestHistoryData</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the user is trying to click the specific document version in the document version history.</td>
            </tr>
            <tr class="tablerow">
                <td id="events_onRequestRestore" class="copy-link">events_onRequestRestore</td>
                <td>(event: object) => void</td>
                <td>null</td>
                <td>The function called when the user is trying to restore the file version by clicking the <b>Restore</b> button in the version history.</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>

    <span class="required-descr"><span class="required">*</span><em> - required field</em></span>


    <h2 id="development" class="copy-link">Developing ONLYOFFICE Docs Angular component</h2>
    <ol>
        <li>
            <p>Clone project from the GitHub repository:</p>
            <pre>
git clone https://github.com/ONLYOFFICE/document-editor-angular-workspace.git
</pre>
        </li>
        <li>
            <p>Install the project dependencies:</p>
            <pre>
npm install
</pre>
        </li>
        <li>
            <p>Build the project:</p>
            <pre>
cd ./projects

ng build @onlyoffice/document-editor-angular
</pre>
        </li>
        <li>
            <p>Create the package:</p>
            <pre>
cd ./dist/onlyoffice/document-editor-angular

npm pack
</pre>
        </li>
        <li>
            <p>Test the component:</p>
            <pre>
cd ./projects

ng test @onlyoffice/document-editor-angular
</pre>
        </li>
    </ol>


    <h2 id="feedback" class="copy-link">Feedback and support</h2>
    <p>In case you have any issues, questions, or suggestions for the ONLYOFFICE Docs Angular component, please refer to the <a href="https://github.com/ONLYOFFICE/document-editor-angular-workspace/issues" target="_blank">Issues</a> section.</p>


</asp:Content>
