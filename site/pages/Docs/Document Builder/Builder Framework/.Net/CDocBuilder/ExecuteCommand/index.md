#### bool ExecuteCommand(sCommand, oRetValue = 0);

Executes the command which will be used to create the document file (text document, spreadsheet, presentation, form document, PDF). See the [Text document API](/officeapi/textdocumentapi), [Spreadsheet API](/officeapi/spreadsheetapi), [Presentation API](/officeapi/presentationapi), or [Form API](/officeapi/formapi) sections for more information which commands are available for various document types.

Please note, that for the *.docbuilder* file the *CDocBuilder.ExecuteCommand* method is not used explicitly. The command itself is used instead. See the example below.

## Parameters:

| Name        | Type               | Description                                                                                                                                                                         |
| ----------- | ------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| *sCommand*  | String^            | The command in the form of JavaScript code which will be used to create the document file (in .Net, the escape character must be used when the command contains quotation symbols). |
| *oRetValue* | CDocBuilderValue^% | The command return value.                                                                                                                                                           |

## Example

#### .Net

```
string workDirectory = "C:/Program Files/ONLYOFFICE/DocumentBuilder";
CDocBuilder.Initialize(workDirectory);
CDocBuilder oBuilder = new CDocBuilder();
oBuilder.ExecuteCommand(L"oParagraph.AddText(\"Hello from .net!\");");
CDocBuilder.Destroy();
```

#### .docbuilder

```
oParagraph.AddText("Hello from .net!");
```
