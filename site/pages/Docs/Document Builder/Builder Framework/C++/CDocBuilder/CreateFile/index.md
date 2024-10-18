`bool CreateFile(nType);`

Creates a new file. The type of the file which will be created needs to be set.

## Parameters

| Name         | Type             | Description                                                                                                                                                                                       |
| ------------ | ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| *sExtension* | const wchar\_t\* | The file extension. The following values are possible: **docx**, **xlsx**, **pptx**, or **pdf** (see [OFFICESTUDIO\_FILE\_XXX](../../../../Builder%20App/Overview/index.md#format-types) values). |

## Example

### C++

```cpp
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
oBuilder.CreateFile("docx");
CDocBuilder::Dispose();
```

### .docbuilder

```ts
builder.CreateFile("docx")
```
