---
order: -2
---

## Before you start

For the samples to work correctly, make sure that two conditions are met:

1. [ONLYOFFICE Document Builder](https://www.onlyoffice.com/download-builder.aspx?utm_source=api) is installed into default directory **"C:/Program Files/ONLYOFFICE/DocumentBuilder"** on your computer.
2. **The directory** in which you are going to store the downloaded samples **has general editing access** to save files created by the Document Builder.

## Download a sample

Download one of the Builder C++ samples and copy it into a folder with general editing access.

- [Filling spreadsheet](https://github.com/ONLYOFFICE/document-builder-samples/blob/master/cpp/FillingSpreadsheet/FillingSpreadsheet/FillingSpreadsheet.cpp)
- [Commenting spreadsheet errors](https://github.com/ONLYOFFICE/document-builder-samples/blob/master/cpp/CommentingErrors/CommentingErrors/CommentingErrors.cpp)
- [Creating presentation](https://github.com/ONLYOFFICE/document-builder-samples/blob/master/cpp/CreatingPresentation/CreatingPresentation/CreatingPresentation.cpp)
- [Creating chart presentation](https://github.com/ONLYOFFICE/document-builder-samples/blob/master/cpp/CreatingChartPresentation/CreatingChartPresentation/CreatingChartPresentation.cpp)
- [Creating basic form](https://github.com/ONLYOFFICE/document-builder-samples/blob/master/cpp/CreatingBasicForm/CreateBasicForm/CreateBasicForm.cpp)
- [Creating advanced form](https://github.com/ONLYOFFICE/document-builder-samples/blob/master/cpp/CreatingAdvancedForm/CreateAdvancedForm/CreateAdvancedForm.cpp)
- [Filling form](https://github.com/ONLYOFFICE/document-builder-samples/blob/master/cpp/FillingForm/FillForm/FillForm.cpp)

## Sample structure

![C++ Builder sample structure](/assets/images/docbuilder/cpp/sample_structure.png)

Each sample includes a **code folder**, an **sln file**, and a **template file** if the sample uses a template.\
The code folder consists of a **C++ program file** and **project files**.

![C++ Builder project file](/assets/images/docbuilder/cpp/project_file.png)

Please note that the **path to the DocBuilder .dll file in the project file is set to default**. You can change the path in the **Sample.vcxproj.user** file if DocBuilder is located in a different directory on your computer.

## Program structure

![C# Builder program file](/assets/images/docbuilder/cpp/program_file.png)

- Include doctrenderer library [C++ wrapper](../../C++/index.md)
- Specify the paths to the Document Builder **work directory**, the **result path** (where the generated file will be saved), and the optional **template path** (if a template file will be used).
- Create the **main function** (this function works with the DocBuilder methods to edit documents).

![C# Builder builder function](/assets/images/docbuilder/cpp/builder_function.png)

- [Initialize](../../C++/CDocBuilder/Initialize/index.md) the [DocBuilder](../../C++/CDocBuilder/index.md) from the working directory. After that Builder opens or creates a file so that [Context](../../C++/CDocBuilderContext/index.md), [Scope](../../C++/CDocBuilderContext/CreateScope/index.md) and [Global](../../C++/CDocBuilderContext/GetGlobal/index.md) classes can be accessed.
- Edit file using DocBuilder API methods. Use [Call](../../C++/CDocBuilderValue/Call/index.md) method with the name and params of the API method you call as an arguments.
- [Save](../../C++/CDocBuilder/SaveFile/index.md) and [close](../../C++/CDocBuilder/CloseFile/index.md) file after editing, then call the [Dispose](../../C++/CDocBuilder/Dispose/index.md) method to destroy DocBuilder.

## Run the sample

Open .sln file inside the sample folder to build the project.\
Run the program when the project is built.

![Visual Studio build and run sample](/assets/images/docbuilder/cpp/build_and_run.png)

## Check the result

After program execution the result file will be saved to the **result path**. It's sample folder root by default.

![C# Builder sample structure result file](/assets/images/docbuilder/cpp/sample_structure_after.png) ![C# Builder sample folder result file](/assets/images/docbuilder/cpp/folder_root_after.png)

Open **result file** and check the result.

![C# Builder result file](/assets/images/docbuilder/csharp/result_file.png)
