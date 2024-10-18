`new CDocBuilderValue`

Class used by **ONLYOFFICE Document Builder** for getting the results of called JS commands. It represents a wrapper for a JS object.

The **CDocBuilderValue** class can be created from the primitive data types:

``` java
CDocBuilderValue(boolean value);
CDocBuilderValue(int value);
CDocBuilderValue(double value);
CDocBuilderValue(String value);
CDocBuilderValue(Object[] values);
```

## Methods

| Name                                        | Description                                     |
| ------------------------------------------- | ----------------------------------------------- |
| [call](call/index.md)                       | Calls the specified Document Builder method.    |
| [clear](clear/index.md)                     | Clears the object.                              |
| [createArray](createArray/index.md)         | Creates an array value.                         |
| [createNull](createNull/index.md)           | Creates a null value.                           |
| [createUndefined](createUndefined/index.md) | Creates an undefined value.                     |
| [get](get/index.md)                         | Returns an array value by its index or name.    |
| [getLength](getLength/index.md)             | Returns the length if this object is an array.  |
| [getProperty](getProperty/index.md)         | Returns a property of this object.              |
| [isArray](isArray/index.md)                 | Returns true if this object is an array.        |
| [isBool](isBool/index.md)                   | Returns true if this object is a boolean value. |
| [isDouble](isDouble/index.md)               | Returns true if this object is a double value.  |
| [isEmpty](isEmpty/index.md)                 | Returns true if this object is empty.           |
| [isFunction](isFunction/index.md)           | Returns true if this object is a function.      |
| [isInt](isInt/index.md)                     | Returns true if this object is an integer.      |
| [isNull](isNull/index.md)                   | Returns true if this object is null.            |
| [isObject](isObject/index.md)               | Returns true if this object is an object.       |
| [isString](isString/index.md)               | Returns true if this object is a string.        |
| [isUndefined](isUndefined/index.md)         | Returns true if this object is undefined.       |
| [set](set/index.md)                         | Sets an array value by its index or name.       |
| [setProperty](setProperty/index.md)         | Sets a property to this object.                 |
| [toBool](toBool/index.md)                   | Converts this object to a boolean value.        |
| [toDouble](toDouble/index.md)               | Converts this object to a double value.         |
| [toInt](toInt/index.md)                     | Converts this object to an integer.             |
| [toString](toString/index.md)               | Converts this object to a string.               |
