---
order: -2
---

A presentation document has a more simple structure than that of a text document, most of the presentation elements are nested within the *slide* element with all the other elements placed on it. The single or multiple *slide* elements are a part of the *presentation* element.

If you need all the slides to contain the same fonts and images, the *slide master* should be used. It consists of the same elements as the *slide*.

The *layout* can be added to the *slide* to specify its structure. Also some drawn objects - *images*, *shapes*, *charts* - can be placed directly to the *slide* or slide *layout*. The *placeholder* element can be added to the *shape*.

The text cannot be placed directly to the *slide*, it can be only grouped to *paragraphs* and added to the *shapes* or *tables*. For the sake of convenience (as it is always easier to work with smaller blocks than with larger ones) the text is usually divided into small text portions called *runs*. Each paragraph can consist either of only one text run or have dozens of them inside, depending on the paragraph complexity.


## Creating a new presentation

The simplest example presentation with a single slide without any objects can be built with the help of **ONLYOFFICE Document Builder** using the following code:

``` js
// create a presentation file in the .pptx format with ONLYOFFICE Document Builder
builder.CreateFile("pptx")

// create a new 'oPresentation' variable and get the created presentation contents
const oPresentation = Api.GetPresentation()

// get the first slide
const oSlide = oPresentation.GetSlideByIndex(0)

// remove all objects from the first slide
oSlide.RemoveAllObjects()

// save the resulting presentation as a file in the .pptx format with a new 'example.pptx' name
builder.SaveFile("pptx", "example.pptx")

// close the presentation file and finish work with ONLYOFFICE Document Builder
builder.CloseFile()
```


## Opening an existing presentation

If you want to edit an already existing presentation, you can open it using **ONLYOFFICE Document Builder**, get its elements and change them however you need. The only difference from a presentation editor in this case will be that you will not need this presentation editor. The presentation is opened the following way:

``` js
// use a path to an existing 'mypresentation.pptx' presentation file to open it with ONLYOFFICE Document Builder
builder.OpenFile("https://example.com/mypresentation.pptx")

// create a new 'oPresentation' variable and get the created presentation contents
const oPresentation = Api.GetPresentation()

// get the first slide
const oSlide = oPresentation.GetSlideByIndex(0)

// remove all objects from the first slide
oSlide.RemoveAllObjects()

// save the resulting presentation as a file in the .pptx format with a new 'example.pptx' name
builder.SaveFile("pptx", "example.pptx")

// close the presentation file and finish work with ONLYOFFICE Document Builder
builder.CloseFile()
```

As you can see you just need to use the *builder.OpenFile();* method of the [CDocBuilder](../../../Document%20Builder/Builder%20Framework/C++/CDocBuilder/index.md) class with the path to the necessary presentation as an argument to open it. In the above example we open **mypresentation.pptx** presentation, get its first slide and remove all objects from it. The same way any other presentation element can be changed.

Use the appropriate API documentation sections to find out which methods allow you to change certain document and presentation element formatting properties.
