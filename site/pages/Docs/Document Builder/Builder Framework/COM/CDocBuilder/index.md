`new CDocBuilder`

Base class used by **ONLYOFFICE Document Builder** for the document file (text document, spreadsheet, presentation, form document, PDF) to be generated.

## Methods

| Name                                                              | Description                                                                                                                                                                                   |
| ----------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [CloseFile](CloseFile/index.md)                                   | Closes the file to stop working with it.                                                                                                                                                      |
| [CreateFile](CreateFile/index.md)                                 | Creates a new file.                                                                                                                                                                           |
| [CreateInstance](CreateInstance/index.md)                         | Creates an instance of the *CDocBuilder* class.                                                                                                                                               |
| [Dispose](Dispose/index.md)                                       | Unloads the **ONLYOFFICE Document Builder** from the application memory when it is no longer needed.                                                                                          |
| [Execute](Execute/index.md)                                       | Executes the command which will be used to create the document file (text document, spreadsheet, presentation, form document, PDF). The command returns the *I\_DOCBUILDER\_VALUE\*\** value. |
| [ExecuteCommand](ExecuteCommand/index.md)                         | Executes the command which will be used to create the document file (text document, spreadsheet, presentation, form document, PDF). The command returns the *VARIANT\_BOOL\** value.          |
| [GetContext](GetContext/index.md)                                 | Returns the current JS context.                                                                                                                                                               |
| [Initialize](Initialize/index.md)                                 | Initializes the **ONLYOFFICE Document Builder** as a library for the application to be able to work with it.                                                                                  |
| [IsSaveWithDoctrendererMode](IsSaveWithDoctrendererMode/index.md) | Specifies if the doctrenderer mode is used when building a document or getting content from the editor when saving a file.                                                                    |
| [OpenFile](OpenFile/index.md)                                     | Opens the document file which will be edited and saved afterwards.                                                                                                                            |
| [Run](Run/index.md)                                               | Runs the **ONLYOFFICE Document Builder** executable.                                                                                                                                          |
| [RunText](RunText/index.md)                                       | Runs all the commands for the document creation using a single command.                                                                                                                       |
| [SaveFile](SaveFile/index.md)                                     | Saves the file after all the changes are made.                                                                                                                                                |
| [SetProperty](SetProperty/index.md)                               | Sets an argument to the builder class which can be transferred to the program outside the [CDocBuilder.ExecuteCommand](ExecuteCommand/index.md) method.                                       |
| [SetTmpFolder](SetTmpFolder/index.md)                             | Sets the path to the folder where the program will temporarily save files needed for the program correct work.                                                                                |
| [WriteData](WriteData/index.md)                                   | Writes data to the log file.                                                                                                                                                                  |
|                                                                   |
