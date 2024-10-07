`new CDocBuilderValue`

Class used by **ONLYOFFICE Document Builder** for getting the results of called JS commands. It represents a wrapper for a JS object.

The **CDocBuilderValue** class can be created from the primitive data types:

``` cpp
CDocBuilderValue(const bool& value);
CDocBuilderValue(const int& value);
CDocBuilderValue(const unsigned int& value);
CDocBuilderValue(const double& value);
CDocBuilderValue(const char* value);
CDocBuilderValue(const wchar_t* value);
```

## Methods

| Name                                        | Description                                                |
| ------------------------------------------- | ---------------------------------------------------------- |
| [Call](Call/index.md)                       | Calls the specified Document Builder method.               |
| [Clear](Clear/index.md)                     | Clears the object.                                         |
| [CreateNull](CreateNull/index.md)           | Creates a null value.                                      |
| [CreateUndefined](CreateUndefined/index.md) | Creates an undefined value.                                |
| [Get](Get/index.md)                         | Returns an array value by its index.                       |
| [GetLength](GetLength/index.md)             | Returns the length if this object is an array/typed array. |
| [GetProperty](GetProperty/index.md)         | Returns a property of this object.                         |
| [IsArray](IsArray/index.md)                 | Returns true if this object is an array.                   |
| [IsBool](IsBool/index.md)                   | Returns true if this object is a boolean value.            |
| [IsDouble](IsDouble/index.md)               | Returns true if this object is a double value.             |
| [IsEmpty](IsEmpty/index.md)                 | Returns true if this object is empty.                      |
| [IsFunction](IsFunction/index.md)           | Returns true if this object is a function.                 |
| [IsInt](IsInt/index.md)                     | Returns true if this object is an integer.                 |
| [IsNull](IsNull/index.md)                   | Returns true if this object is null.                       |
| [IsObject](IsObject/index.md)               | Returns true if this object is an object.                  |
| [IsString](IsString/index.md)               | Returns true if this object is a string.                   |
| [IsTypedArray](IsTypedArray/index.md)       | Returns true if this object is a typed array.              |
| [IsUndefined](IsUndefined/index.md)         | Returns true if this object is undefined.                  |
| [Set](Set/index.md)                         | Sets an array value by its index.                          |
| [SetProperty](SetProperty/index.md)         | Sets a property to this object.                            |
| [ToBool](ToBool/index.md)                   | Converts this object to a boolean value.                   |
| [ToDouble](ToDouble/index.md)               | Converts this object to a double value.                    |
| [ToInt](ToInt/index.md)                     | Converts this object to an integer.                        |
| [ToString](ToString/index.md)               | Converts this object to a string.                          |
