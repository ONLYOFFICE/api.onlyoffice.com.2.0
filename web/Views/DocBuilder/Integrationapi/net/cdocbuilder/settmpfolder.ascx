<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">SetTmpFolder</span>
</h1>

<h4 class="header-gray" id="SetTmpFolder">void SetTmpFolder(sFolder);</h4>
<p class="dscr">Sets the path to the folder where the program will temporarily save files needed for the program correct work.
After the successful document file creation, all the files will be deleted from the folder. If no temporary folder is set, the system one will be used.</p>

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
            <td><em>sFolder</em></td>
            <td>String^</td>
            <td>The path to the folder where the temporary files will be saved.</td>
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
oBuilder.SetTmpFolder(L"DocBuilderTemp");
CDocBuilder.Destroy();
</pre>
<h4 class="header-gray" >.docbuilder</h4>
<pre>
builder.SetTmpFolder("DocBuilderTemp");
</pre>
