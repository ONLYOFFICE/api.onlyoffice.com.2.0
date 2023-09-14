<%@  Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Debugging
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">Debugging</span>
    </h1>

    <p id="system-instructions">To run ONLYOFFICE Desktop Editors in debug mode, follow the instructions depending on the operating system you use.</p>

    <div class="container">
        <ul class="browser">
            <li class="browser tab active copy-link" id="windows">Windows</li>
            <li class="browser tab copy-link" id="linux">Linux</li>
            <li class="browser tab copy-link" id="macos">Mac OS</li>
        </ul>
        <div id="windows" class="content active">
            <h2>Running in debug mode on Windows</h2>
            <p>There are two ways to launch the application: through the shortcut or the terminal.</p>

            <p><b>Option 1</b>. Run the app through the shortcut:</p>
            <ol>
                <li>Right-click the application shortcut on the desktop screen.</li>
                <li>Choose <b>Properties</b>.</li>
                <li>Open the <b>Shortcut</b> tab.</li>
                <li>In the <b>Target</b> field, after the path to the application, enter a space and then type the <em>--ascdesktop-support-debug-info</em> flag.</li>
                <li>Click the <b>Apply</b> button.</li>
            </ol>
            <p><img class="screenshot" alt="Windows shortcut" src="<%= Url.Content("~/content/img/desktop/windows-shortcut.png") %>" /></p>

            <br />
            <p><b>Option 2</b>. Run the app through the terminal:</p>
            <ol>
                <li>Press <b>Win+R</b>.</li>
                <li>
                    <p>In the appeared <b>Run</b> window, type <em>cmd</em> in the <b>Open</b> field.</p>
                    <p><img class="screenshot" alt="Windows terminal" src="<%= Url.Content("~/content/img/desktop/windows-terminal.png") %>" /></p>
                </li>
                <li>Click the <b>OK</b> button. The terminal will be opened.</li>
                <li>
                    <p>In the command line, enter the path to the application, add a space and then type the <em>--ascdesktop-support-debug-info</em> flag:</p>
                    <p><em>"%ProgramFiles%\ONLYOFFICE\DesktopEditors\DesktopEditors" --ascdesktop-support-debug-info</em></p>
                </li>
            </ol>
        </div>
        <div id="linux" class="content">
            <h2>Running in debug mode on Linux</h2>
            <p>Use the terminal to run ONLYOFFICE Desktop Editors in debug mode:</p>
            <ol>
                <li>Press <b>CTRL+ALT+T</b>. The terminal will be opened.</li>
                <li>
                    <p>In the command line, enter the path to the application, add a space and then type the <em>--ascdesktop-support-debug-info</em> flag:</p>
                    <p><em>"/opt/onlyoffice/desktopeditors/DesktopEditors" --ascdesktop-support-debug-info</em></p>
                </li>
            </ol>
        </div>
        <div id="macos" class="content">
            <h2>Running in debug mode on Mac OS</h2>
            <p>Use the terminal to run ONLYOFFICE Desktop Editors in debug mode:</p>
            <ol>
                <li>Press <b>Command+Space</b>.</li>
                <li>
                    <p>In the appeared <b>Spotlight</b> window, type <em>Terminal</em> in the search line.</p>
                </li>
                <li>Choose the <b>Terminal</b> option. The terminal will be opened.</li>
                <li>
                    <p>In the command line, enter the path to the application, add a space and then type the <em>--ascdesktop-support-debug-info</em> flag:</p>
                    <p><em>"/Applications/ONLYOFFICE.app/Contents/MacOS/ONLYOFFICE" --ascdesktop-support-debug-info</em></p>
                </li>
            </ol>
        </div>
    </div>

    <h2 id="debugging" class="copy-link">Working in debug mode</h2>
    <p>To start working in debug mode, right-click any editable field on the top toolbar (for example, font list combo) and click <b>Inspect Element</b>,
        or click anywhere in the document and press <b>F1</b>.</p>

    <p>Here is the result:</p>
    <p><img class="screenshot max-width-832" alt="Debug" src="<%= Url.Content("~/content/img/desktop/debugging.png") %>" /></p>

    <h2 id="running" class="copy-link">Running the application</h2>
    <p>Starting from version 7.1, you can run ONLYOFFICE Desktop Editors with the <em>--ascdesktop-support-debug-info-keep</em> flag. It can have the following values:</p>
    <div class="header-gray">Parameters</div>
    <table class="table">
        <colgroup>
            <col class="table-name" />
            <col />
            <col class="table-example" />
        </colgroup>
        <thead>
            <tr class="tablerow">
                <td>Value</td>
                <td>Description</td>
                <td>Usage</td>
            </tr>
        </thead>
        <tbody>
            <tr class="tablerow">
                <td id="1" class="copy-link">1</td>
                <td>Runs the application.</td>
                <td>--ascdesktop-support-debug-info-keep=1</td>
            </tr>
            <tr class="tablerow">
                <td id="0" class="copy-link">0</td>
                <td>Stops the application.</td>
                <td>--ascdesktop-support-debug-info-keep=0</td>
            </tr>
            <tr class="tablerow">
                <td id="check" class="copy-link">default</td>
                <td>The default application condition - the app is turned off.</td>
                <td>--ascdesktop-support-debug-info-keep=default</td>
            </tr>
        </tbody>
    </table>
    <div class="mobile-content"></div>
    <p>To launch ONLYOFFICE Desktop Editors with this flag, use the same instructions as for the <em>--ascdesktop-support-debug-info</em> flag <a href="#system-instructions">above</a>.
        The only difference is that the <em>--ascdesktop-support-debug-info-keep</em> flag stores the value passed to it.
        You will not need to specify it every time you run the application.</p>

    <script type="text/javascript">
        $('ul.browser').on('click', 'li:not(.browser tab active)', function() {
            $(this)
            .addClass('active').siblings().removeClass('active')
            .closest('div.container').find('div.content').removeClass('active').eq($(this).index()).addClass('active');
        });
        var loc = window.location.hash;
        if (loc != "") {
            var id = loc.substring(1);;
            $('.browser .tab').removeClass('active');
            $('.browser .tab[id="'+id  +'"]').addClass('active');
            $('.content').removeClass('active');
            $('.content[id="'+id  +'"]').addClass('active');
        }
    </script>

</asp:Content>
