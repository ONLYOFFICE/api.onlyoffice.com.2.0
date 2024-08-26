Requests the license from ONLYOFFICE Docs with information about the server and user quota.

## Request example

``` json
{
  "c": "license"
}
```

## Parameters

| Name | Description               | Type   | Presence |
| ---- | ------------------------- | ------ | -------- |
| c    | Defines the command type. | string | required |

## Response example

``` json
{
  "error": 0,
  "license": {
    "end_date": "2021-07-07T23:59:59.000Z",
    "trial": false,
    "customization": false,
    "connections": 0,
    "connections_view": 0,
    "users_count": 10,
    "users_view_count": 10,
    "users_expire": 30
  },
  "server": {
    "resultType": 3,
    "packageType": 1,
    "buildDate": "2021-05-21T00:00:00.000Z",
    "buildVersion": "6.3.0",
    "buildNumber": 111
  },
  "quota": {
    "users": [
      {
        "userid": "uid-0",
        "expire": "2021-07-07T23:59:59.000Z"
      },
      {
        "userid": "uid-1",
        "expire": "2021-07-09T23:59:59.000Z"
      }
    ],
    "users_view": [
      {
        "userid": "uid-0",
        "expire": "2021-07-07T23:59:59.000Z"
      },
      {
        "userid": "uid-1",
        "expire": "2021-07-09T23:59:59.000Z"
      }
    ]
  }
}
```

## Response parameters

| Parameter | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | Type    | Presence |
| --------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | -------- |
| error     | Defines an error code.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | integer | required |
| license   | Defines the document license information:<br><br>**end\_date** - the license expiration date,<br>**type**: string,<br>**presence**: required;<br><br>**trial** - defines if the license is trial or not,<br>**type**: boolean,<br>**presence**: required;<br><br>**customization** - defines if the [customization](../../../Usage%20API/Config/Editor/Customization/index.md) parameters marked with the \* sign are available for editing only in ONLYOFFICE Developer Edition or not,<br>**type**: boolean,<br>**presence**: required;<br><br>**connections** - the number of connections for the connection license,<br>**type**: integer,<br>**presence**: optional;<br><br>**connections\_view** - the number of connections for the live viewer,<br>**type**: integer,<br>**presence**: optional;<br><br>**users\_count** - the number of users for the user license,<br>**type**: integer,<br>**presence**: optional;<br><br>**users\_view\_count** - the number of users for the live viewer,<br>**type**: integer,<br>**presence**: optional;<br><br>**users\_expire** - the number of days after which the user license expires,<br>**type**: integer,<br>**presence**: optional. | object  | optional |
| server    | Defines the server characteristics:<br><br>**resultType** - the license status (**1** - an error occurred, **2** - the license expired, **3** - the license is still available, **6** - the trial license expired),<br>**type**: integer,<br>**presence**: required;<br><br>**packageType** - the product version (**0** - an open source product, **1** - the Enterprise Edition, **2** - the Developer Edition),<br>**type**: integer,<br>**presence**: required;<br><br>**buildDate** - the build date,<br>**type**: string,<br>**presence**: required;<br><br>**buildVersion** - the build version,<br>**type**: string,<br>**presence**: optional;<br><br>**buildNumber** - the build number,<br>**type**: integer,<br>**presence**: required.                                                                                                                                                                                                                                                                                                                                                                                                                                          | object  | required |
| quota     | Defines the user quota value:<br><br>**users** - the user quota for the user license where *userid* - the id of the user who opened the editor, *expire* - date of license expiration for this user,<br>**type**: array of objects,<br>**presence**: required;<br><br>**users\_view** - the user quota for the live viewer where *userid* - the id of the user who opened the editor, *expire* - date of viewing expiration for this user,<br>**type**: array of objects,<br>**presence**: required.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | object  | required |
