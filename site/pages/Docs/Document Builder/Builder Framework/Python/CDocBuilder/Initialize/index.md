`def Initialize(cls, directory=None);`

Initializes the **ONLYOFFICE Document Builder** as a library for the application to be able to work with it. This method just sets the directory to the main Document Builder resources (icu files, etc). If this method is not called, the Document Builder will find resources from the current process directory.

> Please note, that for the *.docbuilder* file the *CDocBuilder.Initialize* method is not used.

## Parameters

| Name      | Type | Description                                      |
| --------- | ---- | ------------------------------------------------ |
| directory | str  | The path to the main Document Builder resources. |

## Example

### Python

``` py
docbuilder.CDocBuilder.Initialize("C:/Program Files/ONLYOFFICE/DocumentBuilder");
builder = docbuilder.CDocBuilder()
docbuilder.CDocBuilder.Dispose()
```
