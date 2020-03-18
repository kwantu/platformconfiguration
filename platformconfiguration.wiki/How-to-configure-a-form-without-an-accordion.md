Created by Liza Tuliza, last modified on Jul 31, 2018. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+configure+a+form+without+an+accordion) on 2018-12-13.

In the context of an [app-config](https://github.com/kwantu/platformconfiguration/wiki/Application-config) definition file, the user interface is defined and includes [forms](https://github.com/kwantu/platformconfiguration/wiki/Entity-list#form) and fields (among others), which are specified with XML.  On this page we see a comparison of two XML code snippets in which the first **doesn't** have the accordion feature and the second one **does** have it.

**Example 1:**  Form configured with an accordion  section

![See image below](https://github.com/kwantu/platformconfiguration/blob/master/How%20to%20configure%20a%20form%20without%20an%20accordion%20Example%201.png)

**Example 2:**  Form configured without  an accordion section

![See image below](https://github.com/kwantu/platformconfiguration/blob/master/How%20to%20configure%20a%20form%20without%20an%20accordion%20Example%202.png) 

NB: This will only work if you fully remove the entire panel set section and reference direct elements in the layout as shown above.