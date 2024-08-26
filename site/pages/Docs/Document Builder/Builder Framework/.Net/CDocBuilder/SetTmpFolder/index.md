`void SetTmpFolder(sFolder);`

Sets the path to the folder where the program will temporarily save files needed for the program correct work. After the successful document file creation, all the files will be deleted from the folder. If no temporary folder is set, the system one will be used.

## Parameters

| Name      | Type    | Description                                                     |
| --------- | ------- | --------------------------------------------------------------- |
| *sFolder* | String^ | The path to the folder where the temporary files will be saved. |

## Example

### .Net

```cs
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
oBuilder.SetTmpFolder(L"DocBuilderTemp");
CDocBuilder.Destroy();
```

### .docbuilder

```ts
builder.SetTmpFolder("DocBuilderTemp")
```
