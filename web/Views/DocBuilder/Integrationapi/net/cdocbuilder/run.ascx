<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Run</span>
</h1>

<h4 class="header-gray" id="Run">bool Run(sPath);</h4>
<p class="dscr">Runs the <b>ONLYOFFICE Document Builder</b> executable. If you do not want to write a .Net application, you can simply use the <b>docbuilder.exe</b> executable file
and run it with the <b>.docbuilder</b> file as an argument, where all the code for the document file creation will be written.
For .Net, create the <em>CDocBuilder</em> object and call the <em>Run</em> method with the path to the executable file from the <em>sPath</em> parameter.</p>

<h2>Parameters:</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Type</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><em>sPath</em></td>
            <td>String^</td>
            <td>The path to the <b>ONLYOFFICE Document Builder</b> executable.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Example</h2>
<h4 class="header-gray" >.Net</h4>
<pre>
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
oBuilder.Run("path-to-script.docbuilder");
CDocBuilder.Destroy();
</pre>
<h4 class="header-gray" >.docbuilder</h4>
<pre>
docbuilder.exe mydocument.docbuilder
</pre>
