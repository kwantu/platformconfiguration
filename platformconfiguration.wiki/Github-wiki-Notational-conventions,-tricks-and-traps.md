# Introduction

**This page describes how to maintain the Kwantu platform github markdown wiki.** It is important to maintain consistency in the documentation of a system to avoid confusion. This page exists as a reference to style and practice in pursuit of consistency of presentation. As the documentation develops and skill levels improve, this page should be kept up-to-date. In terms of consistency of semantics and syntax, there is a [Glossary of terms, dictionary and terminology](https://github.com/kwantu/platformconfiguration/wiki/Glossary-of-terms,-dictionary-and-terminology) page for reference.

Refer to the github wiki cheat sheet [here](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).

# Notational conventions

Notational conventions are important to agree upon among the authors and maintainers of wiki pages, because users of the pages become accustomed to style and they infer meaning from it. However, to have conflicting notational conventions from various authors, or to have a single author randomly employ text styling, can be confusing to the reader and reduce the efficacy of the wiki, thus being counter to its purpose. 

**Notational conventions employed in the wiki are as follows:**

| Kind of text | Format | Description of reason |
|-------------:|:------:|:----------------------|
| reserved-word | `reserved-word` | This is the way _"reserved words"_ that can be found in a configuration file must appear. That includes when it appears inside the cell of a table or a regular paragraph. |
| camelCase | `camelCase` | This highlights the fact that it refers to a piece of code and not a natural language word that has been misspelled or incorrectly quoted or explained. |
| Concept | "_A conceptual thing_" | This allows the reader to easily distinguish a concept made up of several words as a single idea.|
| Bold | **Something important** | The bolding of certain important text helps to orientate a user in a sea of text by anchoring their focus on the central most important word or phrase and allows them to locate that bit of text easily when they re-read it, perhaps after returning from a hyperlink.|

**Note** that tables and pictures should be introduced with **bolded** text as per the example of the table above. Text can also be <b> bolded with the bold HTML tag \<b\> and </b> unbolded with the HTML tag \<\/b\>. Notice how the backslash is used to escape the special meaning of HTML tag characters when they must appear in the text.

# Lists inside a markdown table cell example using html tags

This functionality is achieved by embedding some HTML tags in the text copied from [here](https://stackoverflow.com/questions/19950648/how-to-write-lists-inside-a-markdown-table).
The following two examples demonstrate: an unnumbered list; and a list of new lines:

|Example|List|
|-------|----|
|Unnumbered list of 2 items| <ul><li> Item1 </li><li> Item2 </li></ul>|
|List of 3 items|  * NewLine1 <br/> * NewLine2 <br/> * NewLine3 <br/>|
|List of 4 items|  NewLine1 <br/> NewLine2 <br/> NewLine3 <br/> NewLine4 <br/>|

See first implementation [here](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-instanceType-in-the-workflow).

# Chunks of Code
The Kwantu app is configured with XML and JSON configuration files.  The wiki is laced with examples from these files.
Precede a code block on a new line with three back-ticks: ```.

Immediately follow the three back-ticks by **XML** or **javaScript** as appropriate for each type of code block and then complete the code block with three more back-ticks on a new line: ```.

# Inserting pictures
The wiki provides a picture button for inserting pictures into the text of a page. It has been noted that this often reduces the understandability of the context of the text because the picture is not "anchored" to the text. To overcome this subtlety, we put the picture into a table with a single column and a single row, with the heading left justified, as in the following example:

| The elSelect tag: |
| :---------------- |
|![](https://github.com/kwantu/platformconfiguration/blob/master/elSelecttag.png)|

**This is the same example without being in a table:**
![](https://github.com/kwantu/platformconfiguration/blob/master/elSelecttag.png)

This becomes particularly pertinent when there are multiple screenshots close together on the same page. In the following example two screenshots have been placed side by side in a table of two columns and one row.

| The elSelect tag: | The elSelect tag: |
| :---------------- | :---------------- |
|![](https://github.com/kwantu/platformconfiguration/blob/master/elSelecttag.png)| ![](https://github.com/kwantu/platformconfiguration/blob/master/elSelecttag.png)|

Differences between the two pictures become easy to discuss in reference to left and right hand sides.

***