---
order: -1
---

## Before you start

For the samples to work correctly, make sure that two conditions are met:

1. [ONLYOFFICE Document Builder](https://www.onlyoffice.com/download-builder.aspx?utm_source=api) is installed into default directory `C:/Program Files/ONLYOFFICE/DocumentBuilder` on your computer.
2. The directory in which you are going to store the downloaded samples has general editing access to save files created by the Document Builder.

## Download samples

Clone a repository with the Document Builder samples from [https://github.com/ONLYOFFICE/document-builder-samples](https://github.com/ONLYOFFICE/document-builder-samples). The created folder must have general editing access.

The project folder includes the `java` folder with the Java samples. Each sample has its own folder with the `Program.java` program file.

## Program structure

To create the [Java sample](https://github.com/ONLYOFFICE/document-builder-samples/blob/master/java/creating_basic_form/Program.java):

1. Include the [Java wrapper](../../Java/index.md) doctrenderer library:

  ```java
  import docbuilder.*;
  ```

2. Specify the result path (where the generated file will be saved):

  ```java
  String resultPath = "result.docx";
  ```

3. Create and call the builder function (this function is created by user and calls the DocBuilder method to work with documents):

  ```java
  public static void createBasicForm(String resultPath) {}
  ```

- [Initialize](../../Java/CDocBuilder/initialize/index.md) the [DocBuilder](../../Java/CDocBuilder/index.md) with `docbuilder.jar` directory by passing an empty string:

  ```java
  // Initialize builder with docbuilder.jar directory by passing an empty string
  CDocBuilder.initialize("");
  CDocBuilder builder = new CDocBuilder();
  ```

- Open or create a file so that [Context](../../Java/CDocBuilderContext/index.md) and [Global](../../Java/CDocBuilderContext/getGlobal/index.md) classes can be accessed:

  ```java
  // Create file and get context
  builder.createFile(doctype);
  CDocBuilderContext context = builder.getContext();
  CDocBuilderValue global = context.getGlobal();
  CDocBuilderValue api = global.get("Api");
  ```

- Edit file using the Document Builder API methods. Use the [call](../../Java/CDocBuilderValue/call/index.md) method with the name and parameters of the API method you call as arguments:

  ```java
  // Create basic form
  CDocBuilderValue document = api.call("GetDocument");
  CDocBuilderValue paragraph = document.call("GetElement", 0);
  CDocBuilderValue headingStyle = document.call("GetStyle", "Heading 3");

  paragraph.call("AddText", "Employee pass card");
  paragraph.call("SetStyle", headingStyle);
  document.call("Push", paragraph);

  CDocBuilderValue pictureForm = api.call("CreatePictureForm");
  setPictureFormProperties(pictureForm, "Photo", "Upload your photo", false, "Photo", "tooBig", true, false, 50, 50);
  paragraph = api.call("CreateParagraph");
  paragraph.call("AddElement", pictureForm);
  document.call("Push", paragraph);

  CDocBuilderValue textForm = api.call("CreateTextForm");
  setTextFormProperties(textForm, "First name", "Enter your first name", false, "First name", true, 13, 3, false, false);
  paragraph = api.call("CreateParagraph");
  paragraph.call("AddElement", textForm);
  document.call("Push", paragraph);
  ```

- [Save](../../Java/CDocBuilder/saveFile/index.md) and [close](../../Java/CDocBuilder/closeFile/index.md) file after editing, then call the [dispose](../../Java/CDocBuilder/dispose/index.md) method to destroy DocBuilder:

  ```cpp
  // Save file and close DocBuilder
  builder.saveFile(doctype, resultPath);
  builder.closeFile();
  CDocBuilder.dispose();
  ```

## Run the sample

> JDK 8 or newer is required.

To run the Java code samples:

1. Go to the test directory:

   ```sh
   cd ../document-builder-samples/java/creating_presentation
   ```

2. Compile the `Program.java` providing the path to `docbuilder.jar` located in the Document Builder directory:

   ```sh
   javac -cp "C:\Program Files\ONLYOFFICE\DocumentBuilder\docbuilder.jar" Program.java
   ```

3. The `.class` file should appear in the directory. Run the program:

   ```sh
   java -cp "C:\Program Files\ONLYOFFICE\DocumentBuilder\docbuilder.jar;." Program
   ```

   Note, that on UNIX systems the path separator is `:` instead of `;`. Thus, on Linux or macOS it should be:

   ```sh
   java -cp "/opt/onlyoffice/documentbuilder/docbuilder.jar:." Program
   ```

   Documents will be created in the test directory.

![Result file](/assets/images/docbuilder/java-result-file.png)
