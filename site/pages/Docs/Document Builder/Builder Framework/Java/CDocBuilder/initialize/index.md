`static void initialize(String directory = 0);`

Initializes the **ONLYOFFICE Document Builder** as a library for the application to be able to work with it. This method just sets the directory to the main Document Builder resources (icu files, etc). If this method is not called, the Document Builder will find resources from the current process directory.

> Please note, that for the *.docbuilder* file the *CDocBuilder.initialize* method is not used.

## Parameters

| Name        | Type   | Description                                      |
| ----------- | ------ | ------------------------------------------------ |
| *directory* | String | The path to the main Document Builder resources. |

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
CDocBuilder.dispose();
```
