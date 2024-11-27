---
order: -3
---

## Before you start

For the samples to work correctly, make sure that two conditions are met:

1. [ONLYOFFICE Document Builder](https://www.onlyoffice.com/download-builder.aspx?utm_source=api) is installed into default directory `C:/Program Files/ONLYOFFICE/DocumentBuilder` on your computer.
2. The directory in which you are going to store the downloaded samples has general editing access to save files created by the Document Builder.

## Download samples

Clone a repository with the Document Builder samples from [https://github.com/ONLYOFFICE/document-builder-samples](https://github.com/ONLYOFFICE/document-builder-samples). The created folder must have general editing access.

The project folder includes the `cs` folder with the C# samples. Each sample has its own folder with the `Program.cs` program file.

## Program structure

To create the [C# sample](https://github.com/ONLYOFFICE/document-builder-samples/blob/master/cs/commenting_errors/Program.cs):

1. Include the [.Net wrapper](../../.Net/index.md) doctrenderer library:

  ```cs
  using docbuilder_net;

  using OfficeFileTypes = docbuilder_net.FileTypes;
  using CValue = docbuilder_net.CDocBuilderValue;
  using CContext = docbuilder_net.CDocBuilderContext;
  using CContextScope = docbuilder_net.CDocBuilderContextScope;
  ```

2. Specify the path to the Document Builder work directory, the result path (where the generated file will be saved), and the optional file path (if a template file will be used):

  ```cs
  string workDirectory = Constants.BUILDER_DIR;
  string resultPath = "../../../result.xlsx";
  string filePath = "../../../../../../resources/docs/spreadsheet_with_errors.xlsx";
  ```

3. Add the `.dll` files to the environment:

  ```cs
  System.Environment.SetEnvironmentVariable("PATH", System.Environment.GetEnvironmentVariable("PATH") + ";" + workDirectory);
  ```

4. Create and call the builder function (this function is created by user and calls the DocBuilder method to work with documents):

  ```cs
  CommentErrors(workDirectory, resultPath, filePath);

  public static void CommentErrors(string workDirectory, string resultPath, string filePath) {}
  ```

- [Initialize](../../.Net/CDocBuilder/Initialize/index.md) the [DocBuilder](../../.Net/CDocBuilder/index.md) from the working directory:

  ```cs
  // Init DocBuilder
  CDocBuilder.Initialize(workDirectory);
  CDocBuilder oBuilder = new CDocBuilder();
  ```

- Open or create a file so that [Context](../../.Net/CDocBuilderContext/index.md), [Scope](../../.Net/CDocBuilderContext/CreateScope/index.md) and [Global](../../.Net/CDocBuilderContext/GetGlobal/index.md) classes can be accessed:

  ```cpp
  // Open file and get context
  oBuilder.OpenFile(filePath, "xlsx");
  CContext oContext = oBuilder.GetContext();
  CContextScope oScope = oContext.CreateScope();
  CValue oGlobal = oContext.GetGlobal();
  CValue oApi = oGlobal["Api"];
  ```

- Edit file using Document Builder API methods. Use the [Call](../../.Net/CDocBuilderValue/Call/index.md) method with the name and parameters of the API method you call as arguments:

  ```cpp
  // Find and comment formula errors
  CValue oWorksheet = oApi.Call("GetActiveSheet");
  CValue oRange = oWorksheet.Call("GetUsedRange");
  var data = oRange.Call("GetValue");

  for (int row = 0; row < data.GetLength(); row++)
  {
    for (int col = 0; col < data[0].GetLength(); col++)
    {
      CheckCell(oWorksheet, data[row][col].ToString(), row, col);
    }
  }
  ```

- [Save](../../.Net/CDocBuilder/SaveFile/index.md) and [close](../../.Net/CDocBuilder/CloseFile/index.md) file after editing, then call the [Destroy](../../.Net/CDocBuilder/Destroy/index.md) method to destroy DocBuilder:

  ```cpp
  // Save file and close DocBuilder
  oBuilder.SaveFile(doctype, resultPath);
  oBuilder.CloseFile();
  CDocBuilder.Destroy();
  ```

## Run the sample

> Available only on Windows with Visual Studio and .NET SDK installed.

To run the C# code samples, use the `configure/configure.py` python script which is able to generate the [Visual Studio project files](#visual-studio).

To use `configure.py`, specify the following options:

1. Type of project files to generate: `--vs`. In case you do not provide the type, all available projects will be generated.

2. Test samples with `--test TEST`. Some available options:

   - `--test all` – generate projects for all samples;
   - `--test cs` – generate projects only for C# samples;
   - `--test cs/creating_basic_form` – generate only the project for the specified sample.

   Several test options are available at the same time. To see all available `TEST` options call `configure.py -l`.

3. Directory to the Document Builder with `--dir DIR`. If Document Builder is not installed in the default path, you have to provide a path to it.

The generated files will be located in the `out` directory inside the corresponding test folders.

### Visual Studio

1. Use `configure.py` to generate VS project files. For example:

  ```sh
  cd ../document-builder-samples/configure
  python configure.py --vs --test cs/creating_advanced_form
  ```

1. Open the `document-builder-samples/out/cpp/creating_advanced_form` directory and run the `.sln` file in Visual Studio. Depending on the installed .NET SDK version, you may need to set a different target framework by specifying it in the Visual Studio project properties or editing it directly in the `.csproj` file.

2. The solution is ready to be built and run. Documents will be created in the project files directory.

   ![Result file](/assets/images/docbuilder/cs-result-file.png)
