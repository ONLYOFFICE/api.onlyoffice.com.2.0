`void writeData(String path, String value, boolean append);`

Writes data to the log file. It is used for logs in JS code.

> Please note, that for the *.docbuilder* file the *CDocBuilder.writeData* method is not used.

## Parameters

| Name     | Type    | Description                                                                                                |
| -------- | ------- | ---------------------------------------------------------------------------------------------------------- |
| *path*   | String  | The path to the file where all the logs will be written.                                                   |
| *value*  | String  | The data which will be written to the log file.                                                            |
| *append* | boolean | Specifies if the new data will be appended to the already existing log file or a new file will be created. |

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
builder.writeData("result.log", "Alert!", false);
CDocBuilder.dispose();
```
