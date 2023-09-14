<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <span class="hdr">Frequently asked questions: Document Server</span>
</h1>

<h5><a class="link_in_heading" href="<%= Url.Action("faq/general") %>">General questions</a></h5>
<p class="dscr">If you do not know which category below to select, simply start with this section.</p>
<ul class="faq_all_list">
    <li><a href="<%= Url.Action("faq/general") %>#general_1">I am new to Document Server API. Where should I start?</a></li>
    <li><a href="<%= Url.Action("faq/general") %>#general_2">How to find out the current version number of Document Server?</a></li>
    <li><a href="<%= Url.Action("faq/general") %>#general_3">I want to change some Document Server parameters from the default.json configuration file. How can I do that so that my changes were not lost after update?</a></li>
</ul>

<h5><a class="link_in_heading" href="<%= Url.Action("faq/security") %>">Security questions</a></h5>
<p class="dscr">The questions concerning Document Server security issues are in this section.</p>
<ul class="faq_all_list">
    <li><a href="<%= Url.Action("faq/security") %>#security_1">How to limit access to my Document Server?</a></li>
    <li><a href="<%= Url.Action("faq/security") %>#security_2">What's the difference between sending the token in header and in body?</a></li>
</ul>

<h5><a class="link_in_heading" href="<%= Url.Action("faq/sharing") %>">Sharing questions</a></h5>
<p class="dscr">The questions concerning document sharing with various permissions are in this section.</p>
<ul class="faq_all_list">
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_1">How to open a document with "track changes" mode enabled?</a></li>
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_2">How to open a document with "commenting" mode enabled?</a></li>
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_3">How can the 'fillForms' parameter be used?</a></li>
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_4">How to enable both the editing and commenting mode for a document?</a></li>
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_5">Do the permission parameters influence each other?</a></li>
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_6">How to open the document in a viewer without the option to edit it?</a></li>
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_7">How to disable/enable the possibility to download the file?</a></li>
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_8">How to prevent a document from being printed?</a></li>
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_9">How to view and change sharing settings for a certain document?</a></li>
    <li><a href="<%= Url.Action("faq/sharing") %>#sharing_10">How to restrict commenting?</a></li>
</ul>

<h5><a class="link_in_heading" href="<%= Url.Action("faq/embedding") %>">Embedding questions</a></h5>
<p class="dscr">The questions concerning inserting the document into a website page (embedding) are in this section.</p>
<ul class="faq_all_list">
    <li><a href="<%= Url.Action("faq/embedding") %>#embedding_1">How to embed a document to a web site?</a></li>
    <li><a href="<%= Url.Action("faq/embedding") %>#embedding_2">How to change the behavior of the buttons in the embedded mode?</a></li>
</ul>

<h5><a class="link_in_heading" href="<%= Url.Action("faq/coediting") %>">Co-editing questions</a></h5>
<p class="dscr">The questions concerning co-editing the documents with other users are in this section.</p>
<ul class="faq_all_list">
    <li><a href="<%= Url.Action("faq/coediting") %>#coediting_1">How to check how many connections I need?</a></li>
    <li><a href="<%= Url.Action("faq/coediting") %>#coediting_2">How to find the information about users who are currently editing the document?</a></li>
    <li><a href="<%= Url.Action("faq/coediting") %>#coediting_3">How to disconnect users who are currently editing the document before saving the document?</a></li>
</ul>

<h5><a class="link_in_heading" href="<%= Url.Action("faq/customizing") %>">Customizing questions</a></h5>
<p class="dscr">The questions concerning customizing the appearance of Document Server are in this section.</p>
<ul class="faq_all_list">
    <li><a href="<%= Url.Action("faq/customizing") %>#customizing_1">How to whitelabel ONLYOFFICE Document Server?</a></li>
    <li><a href="<%= Url.Action("faq/customizing") %>#customizing_2">How to change the default language of the Document Server interface?</a></li>
    <li><a href="<%= Url.Action("faq/customizing") %>#customizing_3">How to enable or disable the chat and/or the comments panel in the editors?</a></li>
    <li><a href="<%= Url.Action("faq/customizing") %>#customizing_4">How to customize the editors interface, e.g. adjust the top toolbar view?</a></li>
    <li><a href="<%= Url.Action("faq/customizing") %>#customizing_5">How to view and change the document additional parameters, e.g. its owner or uploading date?</a></li>
    <li><a href="<%= Url.Action("faq/customizing") %>#customizing_6">How to optimize the appearance of editors for a desktop computer, or for a mobile device, or for embedding into a web page?</a></li>
    <li><a href="<%= Url.Action("faq/customizing") %>#customizing_7">How to connect plugins to Document Server so that they become visible for all editor users?</a></li>
</ul>

<h5><a class="link_in_heading" href="<%= Url.Action("faq/integrating") %>">Integrating questions</a></h5>
<p class="dscr">The questions concerning integrating Document Server with your own website and some other popular services (ownCloud, Nextcloud, SharePoint, etc.) are in this section.</p>
<ul class="faq_all_list">
    <li><a href="<%= Url.Action("faq/integrating") %>#integrating_1">Where can I find integration examples for ONLYOFFICE Document Server?</a></li>
    <li><a href="<%= Url.Action("faq/integrating") %>#integrating_2">Which paths should I specify when integrating Document Server with my website?</a></li>
    <li><a href="<%= Url.Action("faq/integrating") %>#integrating_3">What settings should be used when connecting ONLYOFFICE to ownClowd/Nextcloud via a local and public network?</a></li>
</ul>

<h5><a class="link_in_heading" href="<%= Url.Action("faq/editing") %>">Editing questions</a></h5>
<p class="dscr">The questions concerning editing documents using Document Server are in this section.</p>
<ul class="faq_all_list">
    <li><a href="<%= Url.Action("faq/editing") %>#editing_1">What is the 'Callback handler' and why do I need it?</a></li>
    <li><a href="<%= Url.Action("faq/editing") %>#editing_2">What is the 'document.key' parameter?</a></li>
    <li><a href="<%= Url.Action("faq/editing") %>#editing_3">How to define the mode that the file should be opened in (viewing or editing)?</a></li>
</ul>

<h5><a class="link_in_heading" href="<%= Url.Action("faq/managingversions") %>">Managing versions questions</a></h5>
<p class="dscr">The questions concerning working with versions of documents are in this section.</p>
<ul class="faq_all_list">
    <li><a href="<%= Url.Action("faq/managingversions") %>#versions_1">Which methods can be used when working with the document history events?</a></li>
    <li><a href="<%= Url.Action("faq/managingversions") %>#versions_2">How to display a document with highlighted changes?</a></li>
    <li><a href="<%= Url.Action("faq/managingversions") %>#versions_3">Why is a new version not shown in the document history after I forcefully save a document?</a></li>
</ul>

<h5><a class="link_in_heading" href="<%= Url.Action("faq/saving") %>">Saving questions</a></h5>
<p class="dscr">The questions concerning saving the documents are in this section.</p>
<ul class="faq_all_list">
    <li><a href="<%= Url.Action("faq/saving") %>#saving_1">How to forcefully save the document to my storage when editing it?</a></li>
    <li><a href="<%= Url.Action("faq/saving") %>#saving_2">How to save the created document?</a></li>
    <li><a href="<%= Url.Action("faq/saving") %>#saving_3">How to save the opened document to another document file type?</a></li>
    <li><a href="<%= Url.Action("faq/saving") %>#saving_4">How to enable or disable the 'Autosave' option?</a></li>
    <li><a href="<%= Url.Action("faq/saving") %>#saving_5">What is the conversion start delay time and how can it be changed?</a></li>
    <li><a href="<%= Url.Action("faq/saving") %>#saving_6">How to specify the encoding type when converting from the csv or txt formats?</a></li>
</ul>

<h5><a class="link_in_heading" href="<%= Url.Action("faq/renaming") %>">Renaming questions</a></h5>
<p class="dscr">The questions concerning renaming the documents are in this section.</p>
<ul class="faq_all_list">
    <li><a href="<%= Url.Action("faq/renaming") %>#renaming_1">How to rename the created document?</a></li>
    <li><a href="<%= Url.Action("faq/renaming") %>#renaming_2">How to update the name of the document for all collaborative editors?</a></li>
</ul>

<h5><a class="link_in_heading" href="<%= Url.Action("faq/usingwopi") %>">Using WOPI</a></h5>
<p class="dscr">The questions concerning using WOPI are in this section.</p>
<ul class="faq_all_list">
    <li><a href="<%= Url.Action("faq/usingwopi") %>#wopi_1">How to enable WOPI?</a></li>
    <li><a href="<%= Url.Action("faq/usingwopi") %>#wopi_2">How can I configure the Document Server to accept WOPI requests only from the trusted integrator?</a></li>
    <li><a href="<%= Url.Action("faq/usingwopi") %>#wopi_3">Why do I need the discovery XML and how can I get it?</a></li>
    <li><a href="<%= Url.Action("faq/usingwopi") %>#wopi_4">How to customize the editor behavior via WOPI?</a></li>
    <li><a href="<%= Url.Action("faq/usingwopi") %>#wopi_5">How to create an online office session within the application?</a></li>
    <li><a href="<%= Url.Action("faq/usingwopi") %>#wopi_6">How to restrict public access to the data via WOPI?</a></li>
    <li><a href="<%= Url.Action("faq/usingwopi") %>#wopi_7">Where can I find possible WOPI error codes and their descriptions?</a></li>
    <li><a href="<%= Url.Action("faq/usingwopi") %>#wopi_8">Which WOPI REST API operations are supported by ONLYOFFICE Docs?</a></li>
    <li><a href="<%= Url.Action("faq/usingwopi") %>#wopi_9">How to restrict access to the use of ONLYOFFICE server via WOPI?</a></li>
    <li><a href="<%= Url.Action("faq/usingwopi") %>#wopi_10">How to get information about the file properties, access rights and editor settings via WOPI?</a></li>
    <li><a href="<%= Url.Action("faq/usingwopi") %>#wopi_11">What actions are supported via WOPI?</a></li>
    <li><a href="<%= Url.Action("faq/usingwopi") %>#wopi_12">Which access rights can I set to the document via WOPI?</a></li>
    <li><a href="<%= Url.Action("faq/usingwopi") %>#wopi_13">What are the difference between ONLYOFFICE Docs API and WOPI?</a></li>
</ul>
