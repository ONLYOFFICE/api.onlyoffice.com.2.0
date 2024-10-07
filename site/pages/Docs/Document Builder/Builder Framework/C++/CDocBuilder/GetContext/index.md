`CDocBuilderContext GetContext();`

Returns the current JS [context](../../CDocBuilderContext/index.md).

> Please note, that for the *.docbuilder* file the *CDocBuilder.GetContext* method is not used.

## Example

### C++

```cpp
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
CDocBuilderContext oContext = oBuilder.GetContext();
CDocBuilder::Dispose();
```
