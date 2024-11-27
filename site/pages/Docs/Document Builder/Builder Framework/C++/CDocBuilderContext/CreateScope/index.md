```yml signature
- {id: ../../CDocBuilderContextScope/index.md, token: {type: type, text: CDocBuilderContextScope}}
- {type: text, text: " "}
- {type: entity, text: CreateScope}
- {type: text, text: (}
- {type: text, text: )}
```

## Description

Creates a [context scope](../../CDocBuilderContextScope/index.md) which sets the execution context for all operations executed within a local scope.

> Please note, that for the `.docbuilder` file the `CDocBuilderContext.CreateScope` method is not used.

## Example

### C++

```cpp
std::wstring sWorkDirectory = NSUtils::GetBuilderDirectory();
CDocBuilder::Initialize(sWorkDirectory.c_str());
CDocBuilder oBuilder;
CContext oContext = oBuilder.GetContext();
CContextScope oScope = oContext.CreateScope();
CDocBuilder::Dispose();
```
