---
order: -2
---

## Before you start

For the samples to work correctly, make sure that two conditions are met:

1. [ONLYOFFICE Document Builder](https://www.onlyoffice.com/download-builder.aspx?utm_source=api) is installed into default directory `C:/Program Files/ONLYOFFICE/DocumentBuilder` on your computer.
2. The directory in which you are going to store the downloaded samples has general editing access to save files created by the Document Builder.

## Download samples

Clone a repository with the Document Builder samples from [https://github.com/ONLYOFFICE/document-builder-samples](https://github.com/ONLYOFFICE/document-builder-samples). The created folder must have general editing access.

The project folder includes the `python` folder with the Python samples. Each sample has its own folder with the `main.py` program file.

## Program structure

To create the [Python sample](https://github.com/ONLYOFFICE/document-builder-samples/blob/master/python/creating_basic_form/main.py):

1. Include the [Python wrapper](../../Python/index.md) doctrenderer library:

  ```py
  import docbuilder
  ```

2. Specify the path to the Document Builder work directory and the result path (where the generated file will be saved):

  ```py
  sys.path.append(constants.BUILDER_DIR)
  sys.path.append('../../out/python')
  resultPath = os.getcwd() + '/result.docx'
  ```

3. Create and call the builder function (this function is created by user and calls the DocBuilder method to work with documents):

  ```py
  if __name__ == '__main__':
    ...
  ```

- Specify the [DocBuilder](../../Python/CDocBuilder/index.md):

  ```py
  builder = docbuilder.CDocBuilder()
  ```

- Open or create a file so that [Context](../../Python/CDocBuilderContext/index.md) and [Global](../../Python/CDocBuilderContext/GetGlobal/index.md) classes can be accessed:

  ```py
  # Create file and get context
  builder.CreateFile(docbuilder.FileTypes.Document.DOCX)

  context = builder.GetContext()
  globalObj = context.GetGlobal()
  api = globalObj['Api']
  ```

- Edit file using Document Builder API methods. Use the [Call](../../Python/CDocBuilderValue/Call/index.md) method with the name and parameters of the API method you call as arguments:

  ```py
  # Create basic form
  document = api.Call('GetDocument')
  paragraph = document.Call('GetElement', 0)
  headingStyle = document.Call('GetStyle', 'Heading 3')

  paragraph.Call('AddText', 'Employee pass card')
  paragraph.Call('SetStyle', headingStyle)
  document.Call('Push', paragraph)

  pictureForm = api.Call('CreatePictureForm')
  setPictureFormProperties(pictureForm, 'Photo', 'Upload your photo', False, 'Photo', 'tooBig', True, False, 50, 50)
  paragraph = api.Call('CreateParagraph')
  paragraph.Call('AddElement', pictureForm)
  document.Call('Push', paragraph)

  textForm = api.Call('CreateTextForm')
  setTextFormProperties(textForm, 'First name', 'Enter your first name', False, 'First name', True, 13, 3, False, False)
  paragraph = api.Call('CreateParagraph')
  paragraph.Call('AddElement', textForm)
  document.Call('Push', paragraph)
  ```

- [Save](../../Python/CDocBuilder/SaveFile/index.md) and [close](../../Python/CDocBuilder/CloseFile/index.md) file after editing:

  ```py
  # Save file and close DocBuilder
  builder.SaveFile(docbuilder.FileTypes.Document.DOCX, resultPath)
  builder.CloseFile()
  ```

## Run the sample

To run the Python code samples, use the `configure/configure.py` python script.

To use `configure.py`, specify the following options:

1. Test samples with `--test TEST`. Some available options:

   - `--test all` — generate projects for all samples;
   - `--test python` — generate projects only for Python samples;
   - `--test python/creating_basic_form` — generate only the project for the specified sample.

   Several test options are available at the same time. To see all available `TEST` options call `configure.py -l`.

2. Directory to the Document Builder with `--dir DIR`. If Document Builder is not installed in the default path, you have to provide a path to it.

To run the Python sample:

1. Execute `configure.py` with `--test python/creating_basic_form`:

   ```sh
   cd ../document-builder-samples/configure
   python configure.py --test python/creating_basic_form
   ```

   Provide a directory to the Document Builder with `--dir` if necessary to generate an auxiliary module containing the path to the Document Builder.

2. Go to the test directory:

   ```sh
   cd python/creating_basic_form
   ```

3. Run the script:

   ```sh
   python main.py
   ```

   Documents will be created in the test directory.

![Result file](/assets/images/docbuilder/python-result-file.png)
