<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">How it works</span>
</h1>

<p class="dscr">This page describes how to make different operations with documents using <b>ONLYOFFICE Document Builder</b>. 
This process is quite simple but you need to understand how to make the correct <em>.docbuilder</em> script file and which methods should be used in the script. 
Follow the steps and tips described in this section to easily generate documents.</p>
<p>Learn how to:</p>
<ul>
    <li><a href="<%= Url.Action("howitworks/globalvariable") %>">Exchange data among files</a></li>
    <li><a href="<%= Url.Action("howitworks/comparedocuments") %>">Compare documents</a></li>
    <li><a href="<%= Url.Action("howitworks/docbuilder") %>">Document builder</a></li>
</ul>
