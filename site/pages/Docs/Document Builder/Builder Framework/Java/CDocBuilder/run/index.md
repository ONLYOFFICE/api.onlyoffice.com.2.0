`boolean run(String path);`

Runs the **ONLYOFFICE Document Builder** executable. If you do not want to write a Java application, you can simply use the **docbuilder.exe** executable file and run it with the **.docbuilder** file as an argument, where all the code for the document file creation will be written. For Java, create the *CDocBuilder* object and call the *run* method with the path to the executable file from the *path* parameter.

## Parameters

| Name   | Type   | Description                                                 |
| ------ | ------ | ----------------------------------------------------------- |
| *path* | String | The path to the **ONLYOFFICE Document Builder** executable. |

## Example

### Java

``` java
CDocBuilder.initialize("");
CDocBuilder builder = new CDocBuilder();
builder.run("path-to-script.docbuilder");
CDocBuilder.dispose();
```

### .docbuilder

```sh
docbuilder.exe mydocument.docbuilder
```
