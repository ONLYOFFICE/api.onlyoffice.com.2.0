---
order: -2
---

Manages review process from an external source.

## How it works

1. When the user clicks the **Accept / Reject** buttons in the custom interface, the AcceptReviewChanges / RejectReviewChanges methods are executed to accept / reject the selected change in the editor:

   ``` ts
   $("#accept").on("click", () => {
     connector.executeMethod("AcceptReviewChanges")
   })
   $("#reject").on("click", () => {
     connector.executeMethod("RejectReviewChanges")
   })
   ```

2. When the user clicks the arrow buttons in the custom interface, the MoveToNextReviewChange method is executed to move between the next and previous review changes:

   ``` ts
   $("#prev").on("click", () => {
     connector.executeMethod("MoveToNextReviewChange", [false])
   })
   $("#next").on("click", () => {
     connector.executeMethod("MoveToNextReviewChange")
   })
   ```

> Please note that the connector is available only for **ONLYOFFICE Developer Edition**.
>
> This class is an additional feature which is available at extra cost. If you have any questions, please contact our sales team at <sales@onlyoffice.com>.
