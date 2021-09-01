<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

    <h1>
        <span class="hdr">Using WOPI</span>
    </h1>

    <p class="dscr">
        Starting from version 6.4, ONLYOFFICE Docs offers support for the <b>Web Application Open Platform Interface Protocol (WOPI)</b> - a REST-based protocol 
        that is used to integrate your application with an online office. WOPI operations allow you to open files stored on a server, edit and save them. 
    </p>
    <p>This documentation describes:</p>
    <ul>
        <li>file properties that can be specified via <a href="<%= Url.Action("wopi/discovery") %>">WOPI discovery</a>;</li>
        <li>a <a href="<%= Url.Action("wopi/hostpage") %>">host page</a> that must be built to create an iframe element within the online office;</li>
        <li>supported <a href="<%= Url.Action("wopi/restapi") %>">WOPI REST API</a> functions;</li>
        <li>available messages that can be posted via <a href="<%= Url.Action("wopi/postmessage") %>">PostMessage</a>.</li>
    </ul>

    <p>For further information on the WOPI protocol, please read the <a href="https://wopi.readthedocs.io/en/latest/" target="_blank">WOPI documentation</a>.</p>
