<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">Call</span>
</h1>

<h4 class="header-gray" id="CloseFile">HRESULT Call([in] BSTR name, [in, optional] VARIANT val1, [in, optional] VARIANT val2, [in, optional] VARIANT val3, [in, optional] VARIANT val4, [in, optional] VARIANT val5, [in, optional] VARIANT val6, [out, retval] I_DOCBUILDER_VALUE** result);</h4>
<p class="dscr">Calls the specified Document Builder method.
See the <a href="<%= Url.Action("textdocumentapi", "officeapi") %>">Text document API</a>, <a href="<%= Url.Action("spreadsheetapi", "officeapi") %>">Spreadsheet API</a>, <a href="<%= Url.Action("presentationapi", "officeapi") %>">Presentation API</a>, or <a href="<%= Url.Action("formapi", "officeapi") %>">Form API</a> sections for more information which methods are available for various document types.</p>
<div class="note">Please note, that for the <em>.docbuilder</em> file the <em>CDocBuilderValue.Call</em> method is not used explicitly. The method itself is used instead. See the example below.</div>

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
            <td><em>name</em></td>
            <td>BSTR</td>
            <td>The name of the Document Builder method.</td>
        </tr>
        <tr class="tablerow">
            <td><em>val1-val6</em></td>
            <td>VARIANT</td>
            <td>The parameters that the Document Builder method takes as arguments.</td>
        </tr>
        <tr class="tablerow">
            <td><em>result</em></td>
            <td>I_DOCBUILDER_VALUE**</td>
            <td>The returned method value.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>

<h2>Example</h2>
<h4 class="header-gray" >COM</h4>
<pre>
CoInitialize(NULL);
IONLYOFFICEDocBuilder* oBuilder = NULL;
IONLYOFFICEDocBuilderContext* oContext = NULL;
IONLYOFFICEDocBuilderValue* oGlobal = NULL;
IONLYOFFICEDocBuilderValue* oApi = NULL;
IONLYOFFICEDocBuilderValue* oDocument = NULL;
oBuilder-&gt;Initialize();
oBuilder-&gt;GetContext(&oContext);
oContext-&gt;GetGlobal(&oGlobal);
oGlobal-&gt;GetProperty(_bstr_t("Api"), &oApi);
oApi-&gt;Call(_bstr_t("GetDocument"), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), ATL::CComVariant(), &oDocument);
oBuilder-&gt;Dispose();
</pre>
<h4 class="header-gray" >.docbuilder</h4>
<pre>
var oDocument = Api.GetDocument();
</pre>
