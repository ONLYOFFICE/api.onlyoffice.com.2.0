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
            <a href="<%= Url.Action("howitworks/") %>">How it works</a>
            <ul>
                <li>
                    <a href="<%= Url.Action("howitworks/encryptinglocaldocuments") %>">Encrypting local documents</a>
                </li>
                <li>
                    <a href="<%= Url.Action("howitworks/encryptingclouddocuments") %>">Encrypting cloud documents</a>
                </li>
            </ul>
        </li>
    </ul>

    <div class="treeheader">Usage API</div>
    <ul class="side-nav root">
        <li>
            <a href="<%= Url.Action("debugging") %>">Debugging</a>
        </li>
        <li>
            <a href="<%= Url.Action("plugins") %>">Adding plugins</a>
        </li>
        <li>
            <a href="<%= Url.Action("addingdms/") %>">Adding a DMS provider</a>
            <ul>
                <li>
                    <a href="<%= Url.Action("addingdms/configuring") %>">Configuring the interaction</a>
                </li>
                <li>
                    <a href="<%= Url.Action("addingdms/loginlogout") %>">Login/logout</a>
                </li>
                <li>
                    <a href="<%= Url.Action("addingdms/opening") %>">Opening documents</a>
                </li>
                <li>
                    <a href="<%= Url.Action("addingdms/notifications") %>">Sending notifications</a>
                </li>
                <li>
                    <a href="<%= Url.Action("addingdms/encryption") %>">Encryption</a>
                    <ul>
                        <li>
                            <a href="<%= Url.Action("addingdms/encryption/keygeneration") %>">Key generation</a>
                        </li>
                        <li>
                            <a href="<%= Url.Action("addingdms/encryption/operations") %>">Operations with encrypted files</a>
                        </li>
                    </ul>
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