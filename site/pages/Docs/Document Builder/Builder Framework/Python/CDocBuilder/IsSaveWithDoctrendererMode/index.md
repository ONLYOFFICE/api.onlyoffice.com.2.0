`def IsSaveWithDoctrendererMode(self);`

Specifies if the doctrenderer mode is used when building a document or getting content from the editor when saving a file.

> Please note, that for the *.docbuilder* file the *CDocBuilder.IsSaveWithDoctrendererMode* method is not used.

## Example

### Python

``` py
builder = docbuilder.CDocBuilder()
doctrendererMode = builder.IsSaveWithDoctrendererMode()
```
