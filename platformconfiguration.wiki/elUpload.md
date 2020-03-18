This page is referenced from  the [**9. Element upload**](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component#9-element-upload) part of the [Data object component](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component) page and was cross referenced here on 2018-01-07 with other sub pages that have been created because that page had become too unwieldy.

***

# Element upload
The relative PATH in the XML to the element for **uploading files** in the Kwantu platform data object configuration file is:  `.elements.elUpload`. This element consists of the XML tags which are referenced above:
* `displays` refer to **6.1) User interface displays** above; and
* `fieldData` refer to **6.3) Field level meta data** above.

**Elements `elUpload`** - **Example code 6c:**
```XML 
<elUpload id="uploadDocs">
    <displays>
        <display show="true" mode="edit" widget="camera">
            <label show="false">
                <i18n xml:lang="en">Capture photo</i18n>
            </label>
            <style width="90%"/>
        </display>
        <display show="true" mode="readonly" widget="preview">
            <label show="false">
                <i18n xml:lang="en">Preview photo</i18n>
            </label>
            <style width="90%"/>
        </display>
    </displays>
    <fieldData/>
</elUpload>
```
***
Refer  also to the **How to** page:
[How to configure the file upload and photo widget](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-the-file-upload-and-photo-widget)
