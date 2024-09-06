Attaches files to a website using [File selector](../../Initialization%20Modes/File%20Selector/index.md).

<img alt="Authorization sample" src="/assets/images/docspace/gifs/js-sdk-attach-files.gif" width="720px">

## Before you start

Please make sure you are using a server environment to run the HTML file because the JavaScript SDK must be launched on the server.
You need to [add the URL](../../../Get%20Started/Basic%20concepts/index.md#step-1-specifying-the-docspace-url) of your server's root directory to the <b>Developer Tools</b> section of DocSpace.

## Building a sample

## Step 1. Set HTML structure

* Create an HTML file. It must include a *div* tag where we specify the DocSpace connection parameters:

``` html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>DocSpace JavaScript SDK</title>
    <script src="{PORTAL_SRC}/static/scripts/sdk/1.0.0/api.js"></script>
    ...
  </head>
  <body>
    <div id="ds-frame"></div>
    ...
  </body>
</html>
```

The API JavaScript file can normally be found in the following DocSpace folder: **{PORTAL_SRC}/static/scripts/sdk/1.0.0/api.js** where **{PORTAL_SRC}** is the name of the server with the ONLYOFFICE DocSpace installed.

* Add the *style* section to the page:

``` css
body {
  font-family: Arial, sans-serif;
  margin: 20px;
  display: flex;
}
h1 {
  color: #333;
}
button {
  padding: 8px 12px;
  background-color: #007bff;
  color: #fff;
  border: none;
  cursor: pointer;
}
table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
}
th,td {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: left;
}
th {
  background-color: #f2f2f2;
}
a {
  text-decoration: none;
  color: #007bff;
}
a:hover {
  text-decoration: underline;
  color: #0056b3;
}
.task-row.selected {
  background-color: #d3e2ff;
}
#taskContainer {
  width: 70%;
  margin-right: 20px;
}
#attachmentsPanel {
  width: 30%;
  border: 1px solid #ccc;
  padding: 10px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
#attachmentsPanel h2 {
  margin-top: 0;
}
#attachmentsPanel button {
  margin-top: 10px;
  align-self: flex-start;
}
#attachmentsList {
  list-style-type: none;
  padding: 0;
}
.attachment-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 5px 0;
}
.attachment-item a {
  flex-grow: 1;
}
.delete-button {
  background-color: #dc3545;
  color: white;
  border: none;
  cursor: pointer;
  padding: 5px 10px;
  margin-left: 10px;
}
.delete-button:hover {
  background-color: #c82333;
}
```

* Add a table with tasks to the page:

``` html
<div id="taskContainer">
  <table id="taskTable">
    <thead>
      <tr>
        <th>Task</th>
        <th>Description</th>
        <th>Priority</th>
      </tr>
    </thead>
    <tbody id="taskList">
      <tr class="task-row">
        <td>Prepare a sales analysis</td>
        <td>Analyze sales data for the last six months and prepare a detailed report</td>
        <td>Low</td>
      </tr>
      <tr class="task-row">
        <td>Conclude an agreement with partners</td>
        <td>Sign contracts with new partners to expand the business and increase sales</td>
        <td>High</td>
      </tr>
    </tbody>
  </table>
</div>
```

* Add a sidebar where the attachments of the selected task will be displayed, as well as the **Attach file** button:

``` html
<div id="attachmentsPanel">
  <div>
    <h2>Attachments</h2>
    <ul id="attachmentsList"></ul>
  </div>
  <button id="attachButton">Attach file</button>
</div>
```

* Add a dialog to the page, which will display the **file selector**

``` html
<dialog id="modal" style="width: 600px; height: 700px;">
  <div id="ds-frame"></div>
</dialog>
```

## Step 2. Add functionality for selecting tasks

* Add two variables to get a list of tasks and store the selected task, as well as the function to upload attachments for the selected task:

``` ts
const taskRows = document.querySelectorAll(".task-row")
const selectedTask = null
const loadAttachments = (taskRow) => {
  const attachmentsList = document.querySelector("#attachmentsList")
  attachmentsList.innerHTML = ""
  if (taskRow.attachments && taskRow.attachments.length !== 0) {
    for (const item of taskRow.attachments) {
      attachmentsList.append(item)
    }
  }
}
```

* Add the **click** event handler for each task:

``` ts
for (const row of taskRows) {
  row.addEventListener("click", ((selectedTask, loadAttachments) => {
    return () => {
      if (selectedTask) {
        selectedTask.classList.remove("selected")
      }
      selectedTask = row
      row.classList.add("selected")
      loadAttachments(row)
    }
  })(selectedTask, loadAttachments))
}
```

## Step 3. Implement functionality for adding attachments

Add variables to get a modal window and the **Attach file** button, as well as the *click* handler that opens the modal window when the task is selected:

``` ts
const modalElement = document.querySelector("#modal")
const attachButton = document.querySelector("#attachButton")

attachButton.addEventListener("click", () => {
  if (selectedTask) {
    modalElement.showModal()
  }
})
```

* Add the [onSelectCallback](../../Events/index.md#onselectcallback) event handler that closes the modal window and sends the ID and name of the selected file in JSON format:

``` ts
function onSelectCallback() {
  modalElement.close(JSON.stringify({
    id: e.id,
    title: e.title,
  }))
}
```

* Add a variable for the base URL and an event handler for closing the modal window. When the task is selected and the modal window is closed, this function creates a list item with an attachment that includes a link and the **Delete** button, and then adds this item to the list of task attachments:

``` ts
const dsURL = "{PORTAL_SRC}/doceditor?fileId="

function isNotListItem(item) {
  return item !== listItem
}

modalElement.addEventListener("close", () => {
  const result = modalElement.returnValue
  if (result && selectedTask) {
    const {id, title} = JSON.parse(result)
    const noAttachmentsMessage = document.querySelector("#attachmentsList .no-attachments")
    if (noAttachmentsMessage) {
      noAttachmentsMessage.remove()
    }
    const listItem = document.createElement("li")
    listItem.className = "attachment-item"
    const link = document.createElement("a")
    link.href = dsURL + id
    link.target = "_blank"
    link.textContent = title
    listItem.append(link)
    const deleteButton = document.createElement("button")
    deleteButton.className = "delete-button"
    deleteButton.textContent = "Delete"
    deleteButton.addEventListener("click", () => {
      selectedTask.attachments = selectedTask.attachments.filter(isNotListItem)
      listItem.remove()
      if (selectedTask.attachments.length === 0) {
        showNoAttachmentsMessage()
      }
    })
    listItem.append(deleteButton)
    selectedTask.attachments ||= []
    selectedTask.attachments.push(listItem)
    document.querySelector("#attachmentsList").append(listItem)
  }
})
```

## Step 4. Add the file selector

Add a script to initialize the **file selector**

* Add an event handler for [onAppReady](../../Events/index.md#onappready), which fires when initialization is successful:

``` ts
function onAppReady() {
  const frame = DocSpace.SDK.frames["ds-frame"]
}
```

* Create a configuration for the **file selector**:


``` ts
const config = {
  events: {
    onSelectCallback,
    onAppReady,
  },
  height: "700px",
  width: "100%",
}
```

* Initialize the **file selector** with the [initFileSelector](../../Methods/index.md#initfileselector) method:

``` ts
const docSpace = DocSpace.SDK.initFileSelector(config)
```

## Step 5. Run the sample

Run our HTML file and make sure everything works.

``` html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <script src="{PORTAL_SRC}/static/scripts/sdk/1.0.0/api.js"></script>
    <title>An example of using file manager</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 20px;
        display: flex;
      }
      h1 {
        color: #333;
      }
      button {
        padding: 8px 12px;
        background-color: #007bff;
        color: #fff;
        border: none;
        cursor: pointer;
      }
      table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
      }
      th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
      }
      th {
        background-color: #f2f2f2;
      }
      a {
        text-decoration: none;
        color: #007bff;
      }
      a:hover {
        text-decoration: underline;
        color: #0056b3;
      }
      .task-row.selected {
        background-color: #d3e2ff;
      }
      #taskContainer {
        width: 70%;
        margin-right: 20px;
      }
      #attachmentsPanel {
        width: 30%;
        border: 1px solid #ccc;
        padding: 10px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
      }
      #attachmentsPanel h2 {
        margin-top: 0;
      }
      #attachmentsPanel button {
        margin-top: 10px;
        align-self: flex-start;
      }
      #attachmentsList {
        list-style-type: none;
        padding: 0;
      }
      .attachment-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 5px 0;
      }
      .attachment-item a {
        flex-grow: 1;
      }
      .delete-button {
        background-color: #dc3545;
        color: white;
        border: none;
        cursor: pointer;
        padding: 5px 10px;
        margin-left: 10px;
      }
      .delete-button:hover {
        background-color: #c82333;
      }
    </style>
  </head>
  <body>
    <div id="taskContainer">
      <table id="taskTable">
        <thead>
          <tr>
            <th>Task</th>
            <th>Description</th>
            <th>Priority</th>
          </tr>
        </thead>
        <tbody id="taskList">
          <tr class="task-row">
            <td>Prepare a sales analysis</td>
            <td>Analyze sales data for the last six months and prepare a detailed report</td>
            <td>Low</td>
          </tr>
          <tr class="task-row">
            <td>Conclude an agreement with partners</td>
            <td>Sign contracts with new partners to expand the business and increase sales</td>
            <td>High</td>
          </tr>
        </tbody>
      </table>
    </div>
    <div id="attachmentsPanel">
      <div>
        <h2>Attachments</h2>
        <ul id="attachmentsList"></ul>
      </div>
      <button id="attachButton">Attach file</button>
    </div>
    <dialog id="modal" style="width: 600px; height: 700px;">
      <div id="ds-frame"></div>
    </dialog>
  </body>
  <script>
    const taskRows = document.querySelectorAll(".task-row")
    const selectedTask = null
    const loadAttachments = (taskRow) => {
      const attachmentsList = document.querySelector("#attachmentsList")
      attachmentsList.innerHTML = ""
      if (taskRow.attachments && taskRow.attachments.length !== 0) {
        for (const item of taskRow.attachments) {
          attachmentsList.append(item)
        }
      }
    }

    for (const row of taskRows) {
      row.addEventListener("click", ((selectedTask, loadAttachments) => {
        return () => {
          if (selectedTask) {
            selectedTask.classList.remove("selected")
          }
          selectedTask = row
          row.classList.add("selected")
          loadAttachments(row)
        }
      })(selectedTask, loadAttachments))
    }

    const modalElement = document.querySelector("#modal")
    const attachButton = document.querySelector("#attachButton")

    attachButton.addEventListener("click", () => {
      if (selectedTask) {
        modalElement.showModal()
      }
    })

    function onSelectCallback() {
      modalElement.close(JSON.stringify({
        id: e.id,
        title: e.title,
      }))
    }

    const dsURL = "{PORTAL_SRC}/doceditor?fileId="

    function isNotListItem(item) {
      return item !== listItem
    }

    modalElement.addEventListener("close", () => {
      const result = modalElement.returnValue
      if (result && selectedTask) {
        const {id, title} = JSON.parse(result)
        const noAttachmentsMessage = document.querySelector("#attachmentsList .no-attachments")
        if (noAttachmentsMessage) {
          noAttachmentsMessage.remove()
        }
        const listItem = document.createElement("li")
        listItem.className = "attachment-item"
        const link = document.createElement("a")
        link.href = dsURL + id
        link.target = "_blank"
        link.textContent = title
        listItem.append(link)
        const deleteButton = document.createElement("button")
        deleteButton.className = "delete-button"
        deleteButton.textContent = "Delete"
        deleteButton.addEventListener("click", () => {
          selectedTask.attachments = selectedTask.attachments.filter(isNotListItem)
          listItem.remove()
          if (selectedTask.attachments.length === 0) {
            showNoAttachmentsMessage()
          }
        })
        listItem.append(deleteButton)
        selectedTask.attachments ||= []
        selectedTask.attachments.push(listItem)
        document.querySelector("#attachmentsList").append(listItem)
      }
    })

    function onAppReady() {
      const frame = DocSpace.SDK.frames["ds-frame"];
    }

    const config = {
      events: {
        onSelectCallback,
        onAppReady,
      },
      height: "700px",
      width: "100%",
    }

    DocSpace.SDK.initFileSelector(config)
  </script>
</html>
```