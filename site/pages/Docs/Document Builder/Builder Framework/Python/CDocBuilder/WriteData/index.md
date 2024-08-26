`def WriteData(self, path, value, append);`

Writes data to the log file. It is used for logs in JS code.

> Please note, that for the *.docbuilder* file the *CDocBuilder.WriteData* method is not used.

## Parameters

| Name     | Type | Description                                                                                                |
| -------- | ---- | ---------------------------------------------------------------------------------------------------------- |
| *path*   | str  | The path to the file where all the logs will be written.                                                   |
| *value*  | str  | The data which will be written to the log file.                                                            |
| *append* | bool | Specifies if the new data will be appended to the already existing log file or a new file will be created. |

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
builder.WriteData("result.log", "Alert!", false)
```
