---
order: -4
---

## Before you start

For the samples to work correctly, make sure that two conditions are met:

1. [ONLYOFFICE Document Builder](https://www.onlyoffice.com/download-builder.aspx?utm_source=api) is installed into default directory `C:/Program Files/ONLYOFFICE/DocumentBuilder` on your computer.
2. The directory in which you are going to store the downloaded samples has general editing access to save files created by the Document Builder.

## Download samples

Clone a repository with the Document Builder samples from [https://github.com/ONLYOFFICE/document-builder-samples](https://github.com/ONLYOFFICE/document-builder-samples). The created folder must have general editing access.

The project folder includes the `cpp` folder with the C++ samples. Each sample has its own folder with the `main.cpp` program file.

## Program structure

To create the [C++ sample](https://github.com/ONLYOFFICE/document-builder-samples/blob/master/cpp/commenting_errors/main.cpp):

1. Include the [C++ wrapper](../../C++/index.md) doctrenderer library:

  ```cpp
  #include "common.h"
  #include "docbuilder.h"
  ```

2. Specify the path to the Document Builder work directory and the result path (where the generated file will be saved):

  ```cpp
  const wchar_t* workDir = BUILDER_DIR;
  const wchar_t* resultPath = L"result.xlsx";
  ```

3. Create the main function (this function works with the DocBuilder methods to edit documents):

  ```cpp
  int main(){ }
  ```

- [Initialize](../../C++/CDocBuilder/Initialize/index.md) the [DocBuilder](../../C++/CDocBuilder/index.md) from the working directory:

  ```cpp
  // Init DocBuilder
  CDocBuilder::Initialize(workDir);
  CDocBuilder oBuilder;
  oBuilder.SetProperty("--work-directory", workDir);
  ```

- Open or create a file so that [Context](../../C++/CDocBuilderContext/index.md), [Scope](../../C++/CDocBuilderContext/CreateScope/index.md) and [Global](../../C++/CDocBuilderContext/GetGlobal/index.md) classes can be accessed:

  ```cpp
  // Open file and get context
  wstring templatePath = NSUtils::GetResourcesDirectory() + L"/docs/spreadsheet_with_errors.xlsx";
  oBuilder.OpenFile(templatePath.c_str(), L"");
  CContext oContext = oBuilder.GetContext();
  CContextScope oScope = oContext.CreateScope();
  CValue oGlobal = oContext.GetGlobal();
  CValue oApi = oGlobal["Api"];
  ```

- Edit file using Document Builder API methods. Use the [Call](../../C++/CDocBuilderValue/Call/index.md) method with the name and parameters of the API method you call as arguments:

  ```cpp
  // Find and comment formula errors
  CValue oWorksheet = oApi.Call("GetActiveSheet");
  CValue oRange = oWorksheet.Call("GetUsedRange");
  CValue data = oRange.Call("GetValue");
 
  for (int row = 0; row < (int)data.GetLength(); row++)
  {
    for (int col = 0; col < (int)data[0].GetLength(); col++)
    {
      CheckCell(oWorksheet, data[row][col].ToString().c_str(), row, col);
    }
  }
  ```

- [Save](../../C++/CDocBuilder/SaveFile/index.md) and [close](../../C++/CDocBuilder/CloseFile/index.md) file after editing, then call the [Dispose](../../C++/CDocBuilder/Dispose/index.md) method to destroy DocBuilder:

  ```cpp
  // Save and close
  oBuilder.SaveFile(OFFICESTUDIO_FILE_SPREADSHEET_XLSX, resultPath);
  oBuilder.CloseFile();
  CDocBuilder::Dispose();
  return 0;
  ```

## Run the sample

To run the C++ code samples, use the `configure/configure.py` python script which is able to generate:

- [Visual Studio project files](#visual-studio);
- [Qt project files](#qt);
- [Makefile](#makefile).

To use `configure.py`, specify the following options:

1. Type of project files to generate: `--vs`, `--qt` or `--make`. Several options are available at the same time, but some of them are not supported on all platforms. In case you provide none of these options, all available projects will be generated.

2. Test samples with `--test TEST`. Some available options:

   - `--test all` – generate projects for all samples;
   - `--test cpp` – generate projects only for C++ samples;
   - `--test cpp/creating_basic_form` – generate only the project for the specified sample.

   Several test options are available at the same time. To see all available `TEST` options call `configure.py -l`.

3. Directory to the Document Builder with `--dir DIR`. If Document Builder is not installed in the default path, you have to provide a path to it.

The generated files will be located in the `out` directory inside the corresponding test folders.

### Visual Studio

> Available only on Windows.

1. Use `configure.py` to generate VS project files. For example:

  ```sh
  cd ../document-builder-samples/configure
  python configure.py --vs --test cpp/creating_advanced_form
  ```

2. Open the `document-builder-samples/out/cpp/creating_advanced_form` directory and run the `.sln` file in Visual Studio. It will prompt you to retarget Windows SDK and VS toolset to your installed version. Click **OK**.

   ![Retarget projects](/assets/images/docbuilder/retarget-projects.png)

3. The solution is ready to be built and run. Documents will be created in the project files directory.

   ![Result file](/assets/images/docbuilder/cpp-result-file.png)

### Qt

1. Use `configure.py` to generate Qt project files. For example:

  ```sh
  cd ../document-builder-samples/configure
  python configure.py --qt --test cpp/creating_advanced_form
  ```

2. Open the `document-builder-samples/out/cpp/creating_advanced_form` directory and run the `.pro` file in Qt Creator.
3. The project is ready to be built and run. Documents will be created in the build directory.

### Makefile

> Available only on Linux and macOS.

1. Use `configure.py` to generate Makefile. For example:

  ```sh
  cd ../document-builder-samples/configure
  python configure.py --make --test cpp/creating_advanced_form
  ```

2. Go to the directory with generated Makefile:

   ```sh
   cd ../out/cpp/creating_advanced_form
   ```

3. Call `make`, which will build and run the executable. Documents will be created in the same directory as Makefile.
