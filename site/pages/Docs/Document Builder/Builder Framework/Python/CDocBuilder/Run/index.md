`def Run(self, path);`

Runs the **ONLYOFFICE Document Builder** executable. If you do not want to write a Python application, you can simply use the **docbuilder.exe** executable file and run it with the ### .docbuilder file as an argument, where all the code for the document file creation will be written. For Python, create the *CDocBuilder* object and call the *Run* method with the path to the executable file from the *path* parameter.

## Parameters

| Name   | Type | Description                                                 |
| ------ | ---- | ----------------------------------------------------------- |
| *path* | str  | The path to the **ONLYOFFICE Document Builder** executable. |

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
builder.Run("path-to-script.docbuilder")
```

### .docbuilder

```sh
docbuilder.exe mydocument.docbuilder
```
