---
order: -3
---

## Structure used for .docbuilder file

All **.docbuilder** files have simple structure which allows to create them easily. They consist of the following main parts each of them having the appropriate [CDocBuilder](../../../Document%20Builder/Builder%20Framework/C++/CDocBuilder/index.md) class method used:

1. Preparing to work with the document (either the [CDocBuilder.CreateFile](../../Builder%20Framework/C++/CDocBuilder/CreateFile/index.md) or [CDocBuilder.OpenFile](../../Builder%20Framework/C++/CDocBuilder/OpenFile/index.md) methods are used together with the [CDocBuilder.SetTmpFolder](../../Builder%20Framework/C++/CDocBuilder/SetTmpFolder/index.md) method).

   ``` ts
   builder.SetTmpFolder("DocBuilderTemp")
   builder.CreateFile("docx")
   ```

2. Creating the document contents with the help of the [CDocBuilder.ExecuteCommand](../../Builder%20Framework/C++/CDocBuilder/ExecuteCommand/index.md) method (the method is not used explicitly, the commands themselves are used instead).

   ``` ts
   const oDocument = Api.GetDocument()
   const oParagraph = Api.CreateParagraph()
   oParagraph.SetJc("center")
   oParagraph.AddText("Center")
   oDocument.Push(oParagraph)
   ```

3. Saving the document (using the [CDocBuilder.SaveFile](../../Builder%20Framework/C++/CDocBuilder/SaveFile/index.md) method) and releasing it to finish work with it (the [CloseFile](../../Builder%20Framework/C++/CDocBuilder/CloseFile/index.md) method).
   ``` ts
   builder.SaveFile("pdf", "images.pdf")
   builder.CloseFile()
   ```

## Rules for .docbuilder file

There are a few rules used for **.docbuilder** script file creation for them to work correctly:

- The file encoding is always **UTF8**.
- All the commands containing *builder.* are line separated, i.e. you cannot write them in one line, each command **must** start with its own line.
- All the common JavaScript commands and methods must be used inside the *builder.CreateFile()* and *builder.SaveFile()* lines, otherwise an error will be thrown when executing the code.
- The comments are allowed. Any line starting with *#* or *//* is considered to be a comment.
- Empty lines are allowed. You can enter any number of empty lines to separate the blocks, the parser will ignore them.
- All the *CDocBuilder* methods (except the [CDocBuilder.ExecuteCommand](../../Builder%20Framework/C++/CDocBuilder/ExecuteCommand/index.md)) are started with *builder*.
- The [CDocBuilder.ExecuteCommand](../../Builder%20Framework/C++/CDocBuilder/ExecuteCommand/index.md) method is not used explicitly, the command itself is used instead. This is done to avoid the parsing complexity and allow the use of common JavaScript commands and methods.
- The [CDocBuilder.RunTextA](../../Builder%20Framework/C++/CDocBuilder/RunTextA/index.md), [CDocBuilder.RunTextW](../../Builder%20Framework/C++/CDocBuilder/RunTextW/index.md), [CDocBuilder.Initialize](../../Builder%20Framework/C++/CDocBuilder/Initialize/index.md) and [CDocBuilder.Dispose](../../Builder%20Framework/C++/CDocBuilder/Dispose/index.md) methods are not used in **.docbuilder** files.
- All the methods in **.docbuilder** file (except the ones listed above) are used the same way as in C++ code. See the list of the methods below to find more on each of them.

Thus the example of the complete working **.docbuilder** file is available below.

## Example

``` ts
builder.SetTmpFolder("DocBuilderTemp")
builder.CreateFile("docx")
const oDocument = Api.GetDocument()
const oParagraph = oDocument.GetElement(0)
oParagraph.SetJc("center")
oParagraph.AddText("Center")
builder.SaveFile("pdf", "images.pdf")
builder.CloseFile()
```
