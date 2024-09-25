---
order: -1
---

Fills in the empty cells in the form.

The user can choose a username from the list and all the fields in the form editor will be filled with the user contact information. At the same time, this data is displayed in the inputs of the custom interface.

When the user edits the input data in the custom interface, it is automatically updated in the form editor as well.

When the document is ready, the form data can be submitted by clicking the **Complete & Submit** button.

## How it works

1. When the user opens a form document, the GetAllContentControls method is executed to collect all the content controls from the document. After that, the GetFormValue method is executed to get the content controls values and display them in the custom interface:

  ``` ts
  let contentControls = []

  function onDocumentReady() {
    window.connector = docEditor.createConnector()
    function handleGetAllContentControls(data) {
      setTimeout(function processContentControls(index) {
        if (index >= data.length) {
          contentControls = data
          return
        }
        handleGetFormValue(data, index, (value) => {
          if (data[index].Value === value) {
            data[index].Value = value
          } else {
            data[index].Value = ""
          }
          if (index === data.length - 1) {
            contentControls = data
          } else {
            processContentControls(index + 1)
          }
        })
      }, 0)
    }
    function handleGetFormValue(data, index, callback) {
      connector.executeMethod("GetFormValue", [data[index]["InternalId"]], callback)
    }
    connector.executeMethod("GetAllContentControls", null, handleGetAllContentControls)
  }
  ```

2. When the user chooses a username from the list, the GetFormsByTag method is executed to collect all the forms by their tags and sets the corresponding values to them with the SetFormValue method:

``` ts
$("#persons").change(function personChange(e) {
  const postalCode = $(this).val()
  $.getJSON("/app_data/editor/wildcarddata/persons.json", (persons) => {
    for (const person of persons) {
      if (person["PostalCode"] === postalCode) {
        for (key in person) {
          const value = person[key]
          setFormValue(key, value)
        }
      }
    }
  })

  function setFormValue(tag, value) {
    connector.executeMethod(
      "GetFormsByTag",
      [tag],
      (forms) => {
        connector.executeMethod(
          "SetFormValue",
          [forms[0]["InternalId"], value],
          null,
        )
      },
    )
  }
})
```

3. When the user edits a form value, the onChangeContentControl event is fired and after that, the GetFormValue method is executed to get an updated form value and display it in the custom interface:

``` ts
function onDocumentReady() {
  connector.attachEvent("onChangeContentControl", onChangeContentControl)
}
function onChangeContentControl(e) {
  connector.executeMethod("GetFormValue", [e["InternalId"]], (value) => {
    $(`#${e["InternalId"]}`).val(value || "")
  })
}
```

> Please note that the connector is available only for **ONLYOFFICE Developer Edition**.
>
> This class is an additional feature which is available at extra cost. If you have any questions, please contact our sales team at <sales@onlyoffice.com>.
