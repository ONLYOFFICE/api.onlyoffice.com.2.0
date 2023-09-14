<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
   <span class="hdr">CDocBuilderValue</span>
</h1>

<h4 class="header-gray" id="CDocBuilder">new CDocBuilderValue</h4>
<p class="dscr">Class used by <b>ONLYOFFICE Document Builder</b> for getting the results of called JS commands. It represents a wrapper for a JS object.</p>
<p>The <b>CDocBuilderValue</b> class can be created from the primitive data types:</p>
<pre>
CDocBuilderValue(bool value);
CDocBuilderValue(int value);
CDocBuilderValue(unsigned int value);
CDocBuilderValue(double value);
CDocBuilderValue(String^ value);
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
            <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/call") %>">Call</a></td>
            <td>Calls the specified Document Builder method.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/clear") %>">Clear</a></td>
            <td>Clears the object.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/createnull") %>">CreateNull</a></td>
            <td>Creates a null value.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/createundefined") %>">CreateUndefined</a></td>
            <td>Creates an undefined value.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/get") %>">Get</a></td>
            <td>Returns an array value by its index.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/getlength") %>">GetLength</a></td>
            <td>Returns the length if this object is an array/typed array.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/getproperty") %>">GetProperty</a></td>
            <td>Returns a property of this object.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isarray") %>">IsArray</a></td>
            <td>Returns true if this object is an array.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isbool") %>">IsBool</a></td>
            <td>Returns true if this object is a boolean value.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isdouble") %>">IsDouble</a></td>
            <td>Returns true if this object is a double value.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isempty") %>">IsEmpty</a></td>
            <td>Returns true if this object is empty.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isfunction") %>">IsFunction</a></td>
            <td>Returns true if this object is a function.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isint") %>">IsInt</a></td>
            <td>Returns true if this object is an integer.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isnull") %>">IsNull</a></td>
            <td>Returns true if this object is null.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isobject") %>">IsObject</a></td>
            <td>Returns true if this object is an object.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isstring") %>">IsString</a></td>
            <td>Returns true if this object is a string.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/istypedarray") %>">IsTypedArray</a></td>
            <td>Returns true if this object is a typed array.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/isundefined") %>">IsUndefined</a></td>
            <td>Returns true if this object is undefined.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/set") %>">Set</a></td>
            <td>Sets an array value by its index.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/setproperty") %>">SetProperty</a></td>
            <td>Sets a property to this object.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/tobool") %>">ToBool</a></td>
            <td>Converts this object to a boolean value.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/todouble") %>">ToDouble</a></td>
            <td>Converts this object to a double value.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/toint") %>">ToInt</a></td>
            <td>Converts this object to an integer.</td>
        </tr>
        <tr class="tablerow">
            <td><a href="<%= Url.Action("integrationapi/net/cdocbuildervalue/tostring") %>">ToString</a></td>
            <td>Converts this object to a string.</td>
        </tr>
    </tbody>
</table>
<div class="mobile-content"></div>
