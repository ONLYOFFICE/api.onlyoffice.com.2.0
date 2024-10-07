---
order: -2
---

## How to rename the created document?

Please see the [Renaming file](../../../Get%20Started/How%20It%20Works/Renaming%20files/index.md) section to find out how file renaming works in ONLYOFFICE Docs and what is needed to rename the created document.

## How to update the name of the document for all collaborative editors?

To do that the [meta](../../../Additional%20API/Command%20service/meta/index.md) option is available. The request must be sent to the [document command service](../../../Additional%20API/Command%20service/index.md), using the *meta* value for the *c* parameter:

  ``` json
  {
    "c": "meta",
    "key": "Khirz6zTPdfd7",
    "meta": {
      "title": "Example Document Title.docx"
    }
  }
  ```
