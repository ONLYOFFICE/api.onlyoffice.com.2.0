`bool ExecuteCommand(sCommand, oRetValue = 0);`

Executes the command which will be used to create the document file (text document, spreadsheet, presentation, form document, PDF). See the [Text document API](../../../../../Office%20API/Usage%20API/Text%20Document%20API/index.md), [Spreadsheet API](../../../../../Office%20API/Usage%20API/Spreadsheet%20API/index.md), [Presentation API](../../../../../Office%20API/Usage%20API/Presentation%20API/index.md), or [Form API](../../../../../Office%20API/Usage%20API/Form%20API/index.md) sections for more information which commands are available for various document types.

Please note, that for the *.docbuilder* file the *CDocBuilder.ExecuteCommand* method is not used explicitly. The command itself is used instead. See the example below.

## Parameters

| Name        | Type               | Description                                                                                                                                         |
| ----------- | ------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| *sCommand*  | const wchar\_t\*   | The command which will be used to create the document file (in C++, the escape character must be used when the command contains quotation symbols). |
| *oRetValue* | CDocBuilderValue\* | The command return value.                                                                                                                           |

## Example

### C++

```cpp
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
oBuilder.ExecuteCommand(L"oParagraph.AddText(\"Hello, world!\");");
CDocBuilder::Dispose();
```

### .docbuilder

```ts
oParagraph.AddText("Hello, world!")
```
