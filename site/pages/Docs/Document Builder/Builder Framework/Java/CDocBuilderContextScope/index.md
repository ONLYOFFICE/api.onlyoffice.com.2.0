```yml signature
- {type: keyword, text: class}
- {type: text, text: " "}
- {type: entity, text: CDocBuilderContextScope}
```

## Description

The stack-allocated class used by ONLYOFFICE Document Builder which sets the execution context for all operations executed within a local scope. All opened scopes will be closed automatically when the builder [closeFile](../CDocBuilder/closeFile/index.md) method is called.

## Instance Methods

<references>

- [close](close/index.md)
  - : Closes the current scope.

</references>
