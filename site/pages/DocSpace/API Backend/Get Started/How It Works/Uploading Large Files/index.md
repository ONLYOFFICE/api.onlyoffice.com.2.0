---
order: -2
---

In this article, you will learn how to upload large files to DocSpace using our API Backend.

## Step 1. Creating a file upload session

To upload files with size greater than 10 Mb (10 485 760 bytes), you need to create a session by sending the POST request to the following endpoint:

``` http
POST /api/2.0/files/{folderid}/upload/create_session
```

The minimum data that the request body must contain:

``` json
{
  "CreateOn": "2024-01-01T12:00:00.600Z",
  "FileName": "name.docx",
  "FileSize": 15728640,
  "folderId": 12345
}
```

An object with the information about the created session will be returned in the response:

``` json
{
  "success": true,
  "data": {
    "bytes_total": 15728640,
    "bytes_uploaded": 0,
    "created": "2024-01-01T12:00:00.600Z",
    "expired": "2024-01-01T12:00:00.600Z",
    "id": "00000000000000000000000000000000",
    "location": "https://example.onlyoffice.io/ChunkedUploader.ashx?uid=00000000000000000000000000000000",
    "path": [12345]
  }
}
```

The *location* parameter contain URL which will be used to upload the file chunks.

## Step 2. Chunking and uploading a file

Split the file into chunks. Each chunk must be equal to or less than 10 MB (1010241024 bytes), and multiples of 512 bytes. Use the resulting URLs to upload the chunks.

### Known issues

> Please pay attention to the following details:
> 
> - Each chunk must be submitted in the order they appear in the file.
> - Each chunk must be multiple of **512** and equal to or less than **10 Mb**.
> - After receiving each chunk, the server will respond with the current information about the upload session if no errors occurred.
> - When the number of bytes uploaded is equal to the number of bytes you sent in the initial request, the server responds with the **201 Created** status and sends you information about the uploaded file.

The request body must contain the **FormData** object.

The **"Content-type": "multipart/form-data"** header type specifies that the request body contains the data in the *multipart* format.

After the last chunk is uploaded, the server returns an object in the following format:

``` json
{
  "file": {},
  "folderId": 12345,
  "id": 123456,
  "title": "demo.docx",
  "uploaded": true,
  "version": 1
}
```

Below you can see an example in Node.js:

``` ts
const fileResponse = await fetch("url_to_file")
const data = await fileResponse.arrayBuffer()
const size = fileResponse.headers.get("content-length")
const chunkUploadSize = 1024 * 1023
const folderId = "your_folder_id"

const body = {
  CreateOn: new Date().toISOString(),
  FileName: "file_name",
  FileSize: size,
  folderId,
}

const url = `https://example.onlyoffice.com/api/2.0/files/${folderId}/upload/create_session`
const sessionResponse = await fetch(url, {
  body: JSON.stringify(body),
  headers: {"Content-Type": "application/json"},
  method: "POST",
})

const session = await sessionResponse.json()

const requestsDataArray = []
const chunks = Math.ceil(size / chunkUploadSize)
let chunk = 0

while (chunk < chunks) {
  const offset = chunk * chunkUploadSize
  const formData = new FormData()
  formData.append("file", new Blob([data.slice(offset, offset + chunkUploadSize)]))
  requestsDataArray.push(formData)
  chunk += 1
}

let result
for (const formData of requestsDataArray) {
  const headers = {
    ...formData.getHeaders(),
    "Content-Type": "multipart/form-data",
  }
  result = await fetch(session.data.location, {
    body: formData,
    headers,
    method: "POST",
  })
}
```
