This page was originally the [**5. Elements section**](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component#2-settings-section) part of the [Data object component](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component) page and was moved here on 2018-01-07 because that page had become too unwieldy.


***
# Elements section
The **User interface elements** section mirrors the MVC (model view controller) concept of other development platforms. Refer to the abstract concept of `elements` in the "application screen layout" of the [Kwantu platform SDO view model](https://github.com/kwantu/platformconfiguration/wiki/Kwantu-platform-SDO-view-model) page.

The absolute PATH to the `elements` section in the data object config file is as follows: <br> 

`entry.content.kwantu:sequence.kwantu:data.component.configuration.indicator.set.version.elements`. <br>

**Elements structure** - **Example code 5a:**
```XML
<elements>
	<elField id="nameOfInfluence">
		...
	</elField>
	<elSelect id="levelOfInfluenceDetails">
		...
	</elSelect>
        <elUpload id="uploadDocs">
		...
	</elUpload>
</elements>
```

The Elements section contains any number of `element` XML tags, each of which is made up in turn of any number of user interface widgets identified from the following list of XML element tags: 
1. **`elField`** : Provides control over the basic view of a field which is mapped to the data object.
1. **`elSelect`** : Provides an extension of the basic field view, providing a link to a list from which the user can pick an entry. 
1. **`elUpload`** : Provides a variation of the basic field which allows files to be uploaded into the data object.
1. **`elRepeat`** : Provides a container for a grid of rows and columns of cells including (header and footer) rows of cells, plus the possibility to be (horizontally or vertically) orientated, and for each cell to be a field of one of the preceding three types. This is a complicated control and formerly had its own [page](https://github.com/kwantu/platformconfiguration/wiki/elRepeat)  which was merged into this page.  The elRepeat is a far more complicated control than the preceding three controls, which manages the definition of a grid of fields (as defined by the previous three controls), with rows, columns, a header and footer row. This element is the "**table control functionality**" of the user interface.
