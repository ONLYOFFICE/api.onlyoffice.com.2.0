<%@ Page
    Title=""
    Language="C#"
    MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage"
    ContentType="text/html" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    How to integrate ONLYOFFICE Document Builder into your application on Ruby
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        <span class="hdr">How to integrate ONLYOFFICE Document Builder into your application on Ruby</span>
    </h1>
    <h2 id="introduction">Introduction</h2>
            <p class="dscr">To integrate <b>ONLYOFFICE Document Builder</b> into your own application on <b>Ruby</b> you need to download and install <b>ONLYOFFICE Document Builder</b> to your computer and use the <a href="<%= Url.Action("integratingdocumentbuilder") %>">Ruby example</a> for the integration. We will show how to run the Ruby example on Linux OS.</p>
            <h2 id="Ruby1"><span class="style_step">Step 1. </span>Download and install ONLYOFFICE Document Builder</h2>
            <p>First, download <a target="_blank" href="https://www.onlyoffice.com/document-builder.aspx"><b>ONLYOFFICE Document Builder</b></a> and install it to your computer.</p>
            <h2 id="Ruby2"><span class="style_step">Step 2. </span>Install the prerequisites and run the application</h2>
            <ol>
                <li>Install <b>Ruby Version Manager (RVM)</b> and the latest stable <b>Ruby</b> version:
<pre>gpg --keyserver "hkp://keys.gnupg.net" --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --rails</pre>
                    <div class="note">You will need to have <b>curl</b> installed on your system to continue. In case you do not have it, run the command for installation:
<pre>sudo apt-get install curl</pre>
                    </div>
                </li>
<%--                <li>Install git and download the example latest files:
<pre><code>sudo apt-get install git
git clone https://github.com/onlyoffice/rails-docbuilder-example.git</code></pre>
                </li>--%>
                <li>Download the archive with the Ruby example and unpack the it:
                    <pre>wget "https://github.com/ONLYOFFICE/document-builder-integration/releases/latest/download/Ruby.Example.zip"
unzip rails-docbuilder-example-master.zip</pre>
                </li>
                <li>Change the current directory for the project directory:
<pre>cd ~/rails-docbuilder-example-master</pre>
                </li>
                <li>Install the dependencies:
<pre>bundle install</pre>
                    <div class="note">You might need to install <b>bundler</b> before you will be able to complete this operation. This is done using the command:
<pre>gem install bundler</pre>
                    </div>
                </li>
                <li>Automate <b>Ruby</b> launch at the computer startup:
<pre>echo "source $HOME/.rvm/scripts/rvm" >> ~/.bash_profile</pre>
                </li>
                <li>And run the <b>Rails</b> application:
<pre>rails s -b 0.0.0.0 -p 80</pre>
                </li>
            </ol>
            <p>Now you will be able to see the result in your browser using the <em>http://localhost</em> address or using the computer address in your local network.</p>
            <p>If you want to experiment with the code changes, you can find the main application code in the <em>~/app/controllers/main_page_controller.rb</em> control.</p>
</asp:Content>
