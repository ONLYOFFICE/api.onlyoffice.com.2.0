<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<h1>
    <a class="up" href="<%= Url.Action("interactingoutside/") %>"></a>
    <span class="hdr">Filling out the form</span>
</h1>

<p class="dscr">Fills in the empty cells in the form.</p>
<p>The user can choose a username from the list and all the fields in the form editor will be filled with the user contact information.
At the same time, this data is displayed in the inputs of the custom interface.</p>
<p>When the user edits the input data in the custom interface, it is automatically updated in the form editor as well.</p>
<p>When the document is ready, it can be downloaded by clicking the <b>Download</b> button and printed.</p>

<select id="persons" name="persons" required disabled>
    <option disabled selected value="">Choose Example</option>
    <% var persons = Persons.GetPersons();
    foreach (var person in persons)
    { %>
        <option value="<%= person.PostalCode %>"><%= person.FirstName %>  <%= person.LastName %></option>
    <% } %>
</select>

<div id="controlsBlock" name="controlsBlock" class="docbuilder-script" hidden>
    <div class="left-half"></div>
    <div class="right-half"></div>
</div>

<script id="scriptApi" type="text/javascript" src="<%= ConfigurationManager.AppSettings["editor_url"] ?? "" %>/web-apps/apps/api/documents/api.js"></script>

<div id="editorSpace">
    <div id="placeholder"></div>
</div>

<br/ >
<h1>How it works</h1>

<ol>
    <li>
        <p>When the user opens a form document, the <a href="<%= Url.Action("executemethod/text/getallcontentcontrols", "plugin") %>">GetAllContentControls</a> method is executed
        to collect all the content controls from the document. After that, the <a href="<%= Url.Action("executemethod/form/getformvalue", "plugin") %>">GetFormValue</a> method
        is executed to get the content controls values and display them in the custom interface:</p>
        <pre>
var contentControls = [];

var onDocumentReady = function () {
    window.connector = docEditor.createConnector();

    connector.executeMethod("GetAllContentControls", null, function (data) {
        setTimeout(function () {
            for (let i = 0; i < data.length; i++) {

                ...

                connector.executeMethod("GetFormValue", [data[i]["InternalId"]], function (value) {
                    data[i].Value = value ? value : "";
                    if (data.length - 1 == i) {
                        contentControls = data;

                        ...
                    }
                });
            }
        }, 0);
    });
};
</pre>
    </li>
    <li>
        <p>When the user chooses a username from the list, the <a href="<%= Url.Action("executemethod/form/getformsbytag", "plugin") %>">GetFormsByTag</a> method is executed
        to collect all the forms by their tags and sets the corresponding values to them with the <a href="<%= Url.Action("executemethod/form/setformvalue", "plugin") %>">SetFormValue</a> method:</p>
        <pre>
$("#persons").change(function (e) {
    const postalCode = $(this).val();

    $.getJSON("<%= Url.Content("~/app_data/editor/wildcarddata/persons.json") %>", function (persons) {
        for (const person of persons) {
            if (person["PostalCode"] == postalCode) {
                for (key in person) {
                    var value = person[key];

                    ...

                    setFormValue(key, value);
                }
            }
        }
    })

    var setFormValue = function (tag, value) {
        connector.executeMethod(
            "GetFormsByTag",
            [tag],
            function (forms) {
                connector.executeMethod(
                    "SetFormValue",
                    [forms[0]["InternalId"], value],
                    null
                );
            }
        );
    }
});
</pre>
    </li>
    <li>
        <p>When the user edits a form value, the <a href="<%= Url.Action("events/onchangecontentcontrol", "plugin") %>">onChangeContentControl</a> event is fired
        and after that, the <a href="<%= Url.Action("executemethod/form/getformvalue", "plugin") %>">GetFormValue</a> method is executed to get an updated form value and
        display it in the custom interface:</p>
        <pre>
var onDocumentReady = function () {

    ...

    connector.attachEvent("onChangeContentControl", onChangeContentControl);

    ...

};

function onChangeContentControl(e) {
    connector.executeMethod("GetFormValue", [e["InternalId"]], function (value) {

        ...

        $("#" + e["InternalId"]).val(value || "");

        ...
    });
}
</pre>
    </li>
</ol>
<note>
    <p>Please note that the connector is available only for <b>ONLYOFFICE Developer Edition</b>.</p>
    <p>This class is an additional feature which is available at extra cost. If you have any questions, please contact our sales team at <a href="mailto:sales@onlyoffice.com" target="_blank">sales@onlyoffice.com</a>.</p>
</note>

<script type="text/javascript">
    var contentControls = [];
    var indexComment = 0;

    var config = <%= Config.Serialize(
        new Config
            {
                Document = new Config.DocumentConfig
                    {
                        FileType = "oform",
                        Key = "apiwh" + Guid.NewGuid(),
                        Permissions = new Config.DocumentConfig.PermissionsConfig(),
                        Title = "Demo.oform",
                        Url = ConfigurationManager.AppSettings["storage_demo_url"] + "withtags.oform"
                    },
                DocumentType = "word",
                EditorConfig = new Config.EditorConfigConfiguration
                    {
                        CallbackUrl = Url.Action("callback", "editors", null, Request.Url.Scheme),
                        Customization = new Config.EditorConfigConfiguration.CustomizationConfig
                            {
                                HideRightMenu = true,
                                HideRulers = true,
                                IntegrationMode = "embed",
                            }
                    },
                Height = "550px",
                Width = "100%"
            }) %>;

    var onDocumentReady = function () {
        window.connector = docEditor.createConnector();

        connector.executeMethod("GetAllContentControls", null, function (data) {
            setTimeout(function () { // without setTimeout, the first time the loop is executed, an array of content controls is returned
                for (let i = 0; i < data.length; i++) {
                    switch (data[i].Tag) {
                        case "Male":
                            data[i].GroupKey = "Sex";
                            data[i].Type = "radio";
                            break;
                        case "Female":
                            data[i].GroupKey = "Sex";
                            data[i].Type = "radio";
                            break;
                        default:
                            data[i].Type = "input";
                    }

                    connector.executeMethod("GetFormValue", [data[i]["InternalId"]], function (value) {
                        data[i].Value = value ? value : "";
                        if (data.length - 1 == i) {
                            contentControls = preparingArrayContentControls(data);

                            renderForm();
                        }
                    });
                }
            }, 0);
        });

        connector.attachEvent("onChangeContentControl", onChangeContentControl);
    };

    config.events = {
        onDocumentReady: onDocumentReady,
    };

    window.docEditor = new DocsAPI.DocEditor("placeholder", config);

    $("#persons").change(function (e) {
        const postalCode = $(this).val();

        $.getJSON("<%= Url.Content("~/app_data/editor/wildcarddata/persons.json") %>", function (persons) {
            for (const person of persons) {
                if (person["PostalCode"] == postalCode) {
                    for (key in person) {
                        var value = person[key];

                        if (key == "Sex") {
                            key = value == "Male" ? "Male" : "Female";
                            value = "true";
                        }

                        setFormValue(key, value);
                    }
                }
            }
        })

        var setFormValue = function (tag, value) {
            connector.executeMethod(
                "GetFormsByTag",
                [tag],
                function (forms) {
                    connector.executeMethod(
                        "SetFormValue",
                        [forms[0]["InternalId"], value],
                        null
                    );
                }
            );
        }
    });

    var renderForm = function () {
        var controlsBlockLeftHalf = $("#controlsBlock .left-half");
        var controlsBlockRightHalf = $("#controlsBlock .right-half");

        if (contentControls.length != 0) {
            $("#controlsBlock").removeAttr("hidden");
            $("#persons").removeAttr("disabled"); 
            $(".list-buttons a").removeClass("disabled");
        }

        for (const element of contentControls) {
            var targetElement = controlsBlockLeftHalf;

            if ((contentControls.indexOf(element) % 2) != 0) { targetElement = controlsBlockRightHalf };

            switch (element.Type) {
                case "input":
                    targetElement.append($("<label>", {
                        "text": element["Tag"].replace(/([a-z])([A-Z])/g, "$1 $2")
                    })).append($("<input>", {
                        "id": element["InternalId"],
                        "value": element["Value"],
                        "class": "content-control-input"
                    }));
                    break;
                case "radio":
                    targetElement.append($("<label>", {
                        "text": element["Tag"].replace(/([a-z])([A-Z])/g, "$1 $2")
                    }));

                    for (const option of element["Value"]) {
                        targetElement.append($("<input>", {
                            "id": option["InternalId"],
                            "type": "radio",
                            "checked": option["checked"] == true,
                            "name": element["Tag"],
                            "class": "content-control-radio"
                        })).append($("<label>", {
                            "text": option["Tag"].replace(/([a-z])([A-Z])/g, "$1 $2"),
                            "for": option["Tag"],
                            "class": "label-radio"
                        }));
                    }
            }
            
        }

        $(".content-control-input").keyup(updateContent);
        $(".content-control-radio").change(updateContent);
    };

    function updateContent(e) {
        var id = e.target.id;
        var value = e.target.value;

        if (e.target.classList.contains("content-control-radio")) {
            value = true;
        }

        connector.executeMethod(
            "SetFormValue",
            [id, value],
            null
        );
    };

    function onChangeContentControl(e) {
        connector.executeMethod("GetFormValue", [e["InternalId"]], function (value) {
            if ($("#" + e["InternalId"]).hasClass("content-control-radio")) {
                $("#" + e["InternalId"]).prop("checked", value);
            } else {
                $("#" + e["InternalId"]).val(value || "");
            }
        });
    }

    function preparingArrayContentControls(data) {
        data = data.filter(function (element) {
            return element["Tag"] != "";
        });

        let groupsRadioControls = data.filter(contentControl => contentControl["Tag"] != "" && contentControl["Type"] == "radio").reduce((r, a) => {
            r[a["GroupKey"]] = r[a["GroupKey"]] || [];
            r[a["GroupKey"]].push({ Tag: a["Tag"], checked: a["Value"], InternalId: a["InternalId"] });
            return r;
        }, {});

        for (const [key, value] of Object.entries(groupsRadioControls)) {
            let index = [];
            let first = true;

            for (var i = 0; i < data.length; i++) {
                if (data[i]["GroupKey"] && data[i]["GroupKey"] == key) {
                    index.push(i);
                }
            }

            for (var i = 0; i < index.length; i++) {
                if (first) {
                    data[index[i]]["Tag"] = key;
                    data[index[i]]["Value"] = value;
                    first = false;
                } else {
                    data.splice(index[i], 1);
                }
            }
        }

        return data;
    };
</script>
