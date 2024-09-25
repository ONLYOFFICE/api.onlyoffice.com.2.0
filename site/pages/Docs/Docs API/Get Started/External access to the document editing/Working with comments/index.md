---
order: -3
---

Collects all the comments from the document and displays them in the custom interface.

## How it works

1. When the user opens a document, the GetAllComments method is executed to collect all the comments from the document and display them in the custom interface. The following comment data is displayed: the comment author, the time when the comment was posted, the comment text, and the comment replies:

   ``` ts
   let comments = []
   function onDocumentReady() {
     window.connector = docEditor.createConnector()
  
     connector.executeMethod("GetAllComments", null, (data) => {
       comments = data
     })
   }
   ```

2. When the user clicks the **Add comment** button in the custom interface, the AddComment method is executed to add a new comment to the document. After this method is called, the onAddComment event is fired to add a new comment to an array with all the document comments:

  ``` ts
  function onDocumentReady() {
    connector.attachEvent("onAddComment", (val) => {
      const index = comments.findIndex((comment) => {
        return comment["Id"] === val["Id"]
      })
      if (index === -1) {
        comments = [val, ...comments]
      }
    })
  }

  $("#addComment").on("click", () => {
    const comment = $("#addCommentArea").val()
    if (comment) {
      const currentdate = Date.now()
      const datetime = `${currentdate}`
      connector.executeMethod("AddComment", [{
        Text: comment,
        UserName: "John Smith",
        Time: datetime,
      }])
    }
  })
  ```

3. When the user clicks the **Remove comment** button in the custom interface, the RemoveComments method is executed to remove a comment from the document. After this method is called, the onRemoveComment event is fired to remove a comment from an array with all the document comments:

  ``` ts
  function onDocumentReady() {
    connector.attachEvent("onRemoveComment", (val) => {
      const index = comments.findIndex((comment) => {
        return comment["Id"] === val["Id"]
      })
      if (index !== -1) {
        comments.splice(index, 1)
      }
    })
  }
  $("#deleteComment").on("click", () => {
    connector.executeMethod("RemoveComments", [[comments[indexComment]["Id"]]])
  })
  ```

4. When the user clicks the arrow buttons in the custom interface, the MoveToComment method is executed to move between the comments in the document:

   ``` ts
   connector.executeMethod("MoveToComment", [comments[indexComment]["Id"]])
   ```

5. When the user clicks the **Add reply** button in the custom interface, the ChangeComment method is executed to add a reply to the existing comment by changing the *CommentData* object. After this method is called, the onChangeCommentData event is fired to add a new comment reply to an array with all the document comments:

  ``` ts
  function onDocumentReady() {
    connector.attachEvent("onChangeCommentData", (val) => {
      const index = comments.findIndex((comment) => {
        return comment["Id"] === val["Id"]
      })
      if (index !== -1) {
        comments[index]["Data"] = val["Data"]
      }
    })
  }
  $("#addReply").on("click", () => {
    const reply = $("#addReplyArea").val()
    if (reply) {
      const datetime = `${Date.now()}`
      comments[indexComment]["Data"]["Replies"].push({
        Text: reply,
        Time: datetime,
        UserName: "John Smith",
      })

      connector.executeMethod(
        "ChangeComment",
        [comments[indexComment]["Id"],
          comments[indexComment]["Data"]],
      )
    }
  })
   ```

> Please note that the connector is available only for **ONLYOFFICE Developer Edition**.
>
> This class is an additional feature which is available at extra cost. If you have any questions, please contact our sales team at <sales@onlyoffice.com>.
