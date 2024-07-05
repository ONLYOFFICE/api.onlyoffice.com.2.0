#### static CDocBuilderValue CreateNull();

Creates a null value. This method returns the current [context](/docbuilder/integrationapi/c/cdocbuildercontext) and calls its [CreateNull](/docbuilder/integrationapi/c/cdocbuildercontext/createnull) method.

Please note, that for the *.docbuilder* file the *CDocBuilderValue.CreateNull* method is not used.

## Example

#### C++

```
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
CContext oContext = oBuilder.GetContext();
CValue oGlobal = oContext.GetGlobal();
CValue oApi = oGlobal["Api"];
CValue oNull = oApi.CreateNull();
CDocBuilder::Dispose();
```
