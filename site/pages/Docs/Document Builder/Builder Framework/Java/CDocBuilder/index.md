```yml signature
- {type: keyword, text: class}
- {type: text, text: " "}
- {type: entity, text: CDocBuilder}
```

## Description

Base class used by ONLYOFFICE Document Builder for the document file (text document, spreadsheet, presentation, form document, PDF) to be generated.

## Instance Methods

<references>

- [closeFile](closeFile/index.md)
  - : Closes the file to stop working with it.
- [createFile](createFile/index.md)
  - : Creates a new file.
- [dispose](dispose/index.md)
  - : Unloads the ONLYOFFICE Document Builder from the application memory when it is no longer needed.
- [executeCommand](executeCommand/index.md)
  - : Executes the command which will be used to create the document file (text document, spreadsheet, presentation, form document, PDF).
- [getContext](getContext/index.md)
  - : Returns the current JS context.
- [getVersion](getVersion/index.md)
  - : Returns the ONLYOFFICE Document Builder engine version.
- [initialize](initialize/index.md)
  - : Initializes the ONLYOFFICE Document Builder as a library for the application to be able to work with it.
- [isSaveWithDoctrendererMode](isSaveWithDoctrendererMode/index.md)
  - : Specifies if the doctrenderer mode is used when building a document or getting content from the editor when saving a file.
- [openFile](openFile/index.md)
  - : Opens the document file which will be edited and saved afterwards.
- [run](run/index.md)
  - : Runs the ONLYOFFICE Document Builder executable.
- [runText](runText/index.md)
  - : Runs all the commands for the document creation using a single command.
- [saveFile](saveFile/index.md)
  - : Saves the file after all the changes are made.
- [setProperty](setProperty/index.md)
  - : Sets an argument which can be transferred to the program outside the [CDocBuilder.executeCommand](executeCommand/index.md) method.
- [setTmpFolder](setTmpFolder/index.md)
  - : Sets the path to the folder where the program will temporarily save files needed for the program correct work.
- [writeData](writeData/index.md)
  - : Writes data to the log file.

</references>
