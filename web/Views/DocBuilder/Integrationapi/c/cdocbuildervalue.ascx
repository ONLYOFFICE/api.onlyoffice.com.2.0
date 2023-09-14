<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CDocBuilderValue</span>
</h1>

<h4 class="header-gray" id="CDocBuilder">new CDocBuilderValue</h4>
<p class="dscr">Class used by <b>ONLYOFFICE Document Builder</b> for getting the results of called JS commands. It represents a wrapper for a JS object.</p>
<p>The <b>CDocBuilderValue</b> class can be created from the primitive data types:</p>
<pre>
CDocBuilderValue(const bool&amp; value);
CDocBuilderValue(const int&amp; value);
CDocBuilderValue(const unsigned int&amp; value);
CDocBuilderValue(const double&amp; value);
CDocBuilderValue(const char* value);
CDocBuilderValue(const wchar_t* value);
</pre>

<h2>Methods</h2>
<table class="table">
    <thead>
        <tr class="tablerow">
            <td>Name</td>
            <td>Description</td>
        </tr>
    </thead>
    <tbody>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/call") %>">Call</a></td>
            <td>Calls the specified Document Builder method.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/clear") %>">Clear</a></td>
            <td>Clears the object.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/createnull") %>">CreateNull</a></td>
            <td>Creates a null value.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/createundefined") %>">CreateUndefined</a></td>
            <td>Creates an undefined value.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/get") %>">Get</a></td>
            <td>Returns an array value by its index.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/getlength") %>">GetLength</a></td>
            <td>Returns the length if this object is an array/typed array.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/getproperty") %>">GetProperty</a></td>
            <td>Returns a property of this object.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isarray") %>">IsArray</a></td>
            <td>Returns true if this object is an array.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isbool") %>">IsBool</a></td>
            <td>Returns true if this object is a boolean value.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isdouble") %>">IsDouble</a></td>
            <td>Returns true if this object is a double value.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isempty") %>">IsEmpty</a></td>
            <td>Returns true if this object is empty.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isfunction") %>">IsFunction</a></td>
            <td>Returns true if this object is a function.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isint") %>">IsInt</a></td>
            <td>Returns true if this object is an integer.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isnull") %>">IsNull</a></td>
            <td>Returns true if this object is null.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isobject") %>">IsObject</a></td>
            <td>Returns true if this object is an object.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isstring") %>">IsString</a></td>
            <td>Returns true if this object is a string.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/istypedarray") %>">IsTypedArray</a></td>
            <td>Returns true if this object is a typed array.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/isundefined") %>">IsUndefined</a></td>
            <td>Returns true if this object is undefined.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/set") %>">Set</a></td>
            <td>Sets an array value by its index.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/setproperty") %>">SetProperty</a></td>
            <td>Sets a property to this object.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/tobool") %>">ToBool</a></td>
            <td>Converts this object to a boolean value.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/todouble") %>">ToDouble</a></td>
            <td>Converts this object to a double value.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/toint") %>">ToInt</a></td>
            <td>Converts this object to an integer.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/c/cdocbuildervalue/tostring") %>">ToString</a></td>
            <td>Converts this object to a string.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
