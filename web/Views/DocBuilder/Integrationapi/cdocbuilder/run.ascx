﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Run</span>
</h1>


                <h4 class="header-gray" id="Run">bool Run(sPath);</h4>
               <p class="dscr">Run <b>ONLYOFFICE Document Builder</b> executable. If you do not want to write a C++ application, you can simply use the <b>docbuilder.exe</b> executable file and run it with the <b>.docbuilder</b> file as an argument, where all the code for the document file creation will be written. For C++ the path to the executable file from the <em>sPath</em> parameter must be used, the <em>CDocBuilder</em> object created and the <em>Run</em> method is called.</p>
                
            <h2>Parameters:</h2>
            <div id="mobile-content"></div>
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
                        <td>const wchar_t*
                        </td>
                        <td>The path to the <b>ONLYOFFICE Document Builder</b> executable.</td>
                    </tr>
                </tbody>
            </table>

            <h2>Example</h2>
<h4 class="header-gray" >C++</h4>
<pre>
int wmain(int argc, wchar_t *argv[])
{
  if (argc <= 0)
    return 0;
  NSDoctRenderer::CDocBuilder::Initialize();
  NSDoctRenderer::CDocBuilder oBuilder;
#ifdef _DOC_BUILDER_EXECUTABLE_
  std::wstring sBuildFile(argv[argc - 1]);
  oBuilder.Run(argv[argc - 1]);
#endif
  NSDoctRenderer::CDocBuilder::Dispose();
  return 0;
}
</pre>
<h4 class="header-gray" >.docbuilder</h4>
<pre>
docbuilder.exe mydocument.docbuilder
</pre>