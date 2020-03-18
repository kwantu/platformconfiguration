The layout is like a canvass that can hold other elements. Importantly, though the orientation of the layout can be specified as horizontal or vertical, specifying the way objects are added. To the right (horizontal) or below (vertical).

The layout is used to group elements and text to provide a vertical rendering on user interface. For example lets take a layout below where layout has label with some text followed by an element name, and another label with some different text and a textarea again for an address.

The following example shows a user interface with elements and text for informative purposes.

```XML
<layout id="vbPanel2" orientation="vertical">
  <label>
    <i18n xml:lang="en">Some text</i18n>
    <i18n xml:lang="pt">Some text</i18n>
  </label>
  <element ref="name"/>
  <label>
    <i18n xml:lang="en">Some other text</i18n>
    <i18n xml:lang="pt">Some other text</i18n>
  </label>
  <element ref="address"/>
</layout>
```

The order in which you place the tags in layout will be displayed on interface.

![Layout tag schema](https://github.com/kwantu/platformconfiguration/blob/master/layouttag.png)
