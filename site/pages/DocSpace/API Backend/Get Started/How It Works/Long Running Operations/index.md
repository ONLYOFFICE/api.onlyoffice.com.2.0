---
order: -4
---

The user initiates a long-running operation by sending a request to the appropriate API endpoint, which returns an object containing information about the initiated operation. An example of such a request and response:

Example Request:

``` http
PUT /api/2.0/files/rooms/1234/archive
Host: yourportal.onlyoffice.com
Content-Type: application/json
Accept: application/json

{
  "DeleteAfter": true
}
```

Example Response:

``` json
{
  "error": "",
  "finished": false,
  "id": "00000000-0000-0000-0000-000000000000",
  "operation": 0,
  "processed": "0",
  "progress": 0
}
```

The following endpoints return the operation status:

- PUT api/2.0/files/rooms/{id}/archive
- PUT api/2.0/files/fileops/delete
- DELETE api/2.0/files/file/{fileid}

## Monitoring the operation status

To track the operation progress, you must periodically execute a GET request to the following endpoint:

``` http
GET /api/2.0/files/fileops
```

This request returns an array of the current operations as objects similar to the one described above.

In this array, the ID of the previously initiated operation is returned. If *finished* is not true, or *progress* or *percents* is not 100, wait a while and then execute the *files/fileops/* request again. This loop is repeated until the operation completes or the error text appears in the *error* property.
