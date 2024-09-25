---
order: -1
---

## Before you start

For the samples to work correctly, make sure that two conditions are met:

1. [ONLYOFFICE Document Builder](https://www.onlyoffice.com/download-builder.aspx?utm_source=api) is installed into default directory **"C:/Program Files/ONLYOFFICE/DocumentBuilder"** on your computer.
2. **The directory** in which you are going to store the downloaded samples **has general editing access** to save files created by the Document Builder.

## Download a sample

Download one of the Builder .Net samples archive and unzip it into a folder with general editing access.

- [Filling spreadsheet](https://api.teamlab.info:443/app_data/docbuilder/csharp-samples/FillingSpreadsheet.zip)
- [Commenting spreadsheet errors](https://api.teamlab.info:443/app_data/docbuilder/csharp-samples/CommentingErrors.zip)
- [Creating presentation](https://api.teamlab.info:443/app_data/docbuilder/csharp-samples/CreatingPresentation.zip)
- [Creating chart presentation](https://api.teamlab.info:443/app_data/docbuilder/csharp-samples/CreatingChartPresentation.zip)
- [Creating basic form](https://api.teamlab.info:443/app_data/docbuilder/csharp-samples/CreatingBasicForm.zip)
- [Creating advanced form](https://api.teamlab.info:443/app_data/docbuilder/csharp-samples/CreatingAdvancedForm.zip)
- [Filling form](https://api.teamlab.info:443/app_data/docbuilder/csharp-samples/FillingForm.zip)

## Sample structure

![C# Builder sample structure](/assets/images/docbuilder/csharp/sample_structure.png)

Each sample includes a **code folder**, an **sln file**, and a **template file** if the sample uses a template.\
The code folder consists of two files: a **project file** and a **program file**.

![C# Builder project file](/assets/images/docbuilder/csharp/project_file.png)

Please note that the **path to the DocBuilder .dll file in the project file is set to default**. Here you can change the path if DocBuilder is located in a different directory on your computer.

## Program structure

![C# Builder program file](/assets/images/docbuilder/csharp/program_file.png)

- Include doctrenderer library [.Net wrapper](../../.Net/index.md) classes.
- Specify the paths to the Document Builder **work directory**, the **result path** (where the generated file will be saved), and the optional **file path** (if a template file will be used).
- Add **.dll** files to the environment.
- Call the **builder function** (this function is created by user and calls the DocBuilder method to work with documents).

![C# Builder builder function](/assets/images/docbuilder/csharp/builder_function.png)

- [Initialize](../../.Net/CDocBuilder/Initialize/index.md) the [DocBuilder](../../.Net/CDocBuilder/index.md) from the working directory. After that Builder opens or creates a file so that [Context](../../.Net/CDocBuilderContext/index.md), [Scope](../../.Net/CDocBuilderContext/CreateScope/index.md) and [Global](../../.Net/CDocBuilderContext/GetGlobal/index.md) classes can be accessed.
- Edit file using DocBuilder API methods. Use [Call](../../.Net/CDocBuilderValue/Call/index.md) method with the name and params of the API method you call as an arguments.
- [Save](../../.Net/CDocBuilder/SaveFile/index.md) and [close](../../.Net/CDocBuilder/CloseFile/index.md) file after editing, then call the [Destroy](../../.Net/CDocBuilder/Destroy/index.md) method to destroy DocBuilder.

## Run the sample

Open .sln file inside the sample folder to build the project.\
Run the program when the project is built.

![Visual Studio build and run sample](/assets/images/docbuilder/csharp/build_and_run.png)

## Check the result

After program execution the result file will be saved to the **result path**. It's sample folder root by default.

![C# Builder sample structure result file](/assets/images/docbuilder/csharp/sample_structure_after.png) ![C# Builder sample folder result file](/assets/images/docbuilder/csharp/folder_root_after.png)

Open **result file** and check the result.

![C# Builder result file](/assets/images/docbuilder/csharp/result_file.png)
