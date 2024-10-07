---
order: -8
---

## How to check how many connections I need?

The minimal number of connections you might need should be equal to the number of users who are going to use your Document Server. But you should bear in mind, that in most cases one user is not equal to one connection, as one and the same user can open more than one document in more than one browser.

So if you are sure that all your users are going to use the Document Server at one and the same time, have a surplus for the connection number equal of at least two times of your user number, otherwise the users with the lack of connections will be able to open the document in view-only mode.

All the available pricing plans for the connections are available at [this page](https://www.onlyoffice.com/integration-edition-prices.aspx).

## How to find the information about users who are currently editing the document?

You can use the API to send a POST request to the **document command service**. Use the *c* parameter for that with the [info](../../../Additional%20API/Command%20service/info/index.md) value and the *key* parameter identifying the document you want to find the information about. The parameters are sent as a part of the JSON object in the request body:

  ``` json
  {
    "c": "info",
    "key": "Khirz6zTPdfd7"
  }
  ```

In case the document is being edited, for instance, by two users, the **document editing service** will inform the **document storage service** using the [callback handler](../../../Usage%20API/Callback%20handler/index.md) with the following information:

  ``` json
  {
    "key": "Khirz6zTPdfd7",
    "status": 1,
    "users": ["6d5a81d0", "78e1e841"]
  }
  ```

- *key* is the identifier of the document (the same as in the POST request above);

- *status* with value of **1** means that the document is currently being edited;

- and the *users* is the array of the IDs of the users who take part in the co-editing.

  Further information about the response from the **document editing service** can be found [at this page](../../../Usage%20API/Callback%20handler/index.md).

## How to disconnect users who are currently editing the document before saving the document?

To force disconnecting the users from the document before it can be saved, use the API to send a POST request to the **document command service**. Use the *c* parameter for that with the [drop](../../../Additional%20API/Command%20service/drop/index.md) value and the *key* parameter identifying the document and the array of the IDs of the users you want to disconnect. The parameters are sent as a part of the JSON object in the request body:

  ``` json
  {
    "c": "drop",
    "key": "Khirz6zTPdfd7",
    "users": ["6d5a81d0", "78e1e841"]
  }
  ```

As a result the two users with the IDs in the request above ("6d5a81d0" and "78e1e841") will be disconnected from editing the document with the **Khirz6zTPdfd7** key.

Further information about the use of requests from **document command service** can be found [at this page](../../../Additional%20API/Command%20service/index.md).
