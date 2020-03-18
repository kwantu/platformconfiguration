Created by Rob Worthington on Oct 25, 2017. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+calculate+a+value+from+another+form) on 2018-12-12.

In many cases we need to read a value from one data object and insert it (often as a label) in another one.  The following parameters may be changed:

| Parameter |Parameter description| Example value | What it does |
|-----------|---------------------|---------------|--------------|
|**elementId**|Element Id|Name|Element ID of the source field|
|**indicatorId**|Indicator Id|appProfileIndicator|Set ID of the source data object|
|**setId**|Set Id|appProfile|Set ID of the source data object|


When considering the **Example code** below it will be useful to read the introduction to [Kwantu platform entities](https://github.com/kwantu/platformconfiguration/wiki/Entity-list#introduction) first:

```XML
                                                <calculated>
                                                     <xpathFunction function="#three?">
                                                         <elementAtomic dataType="string" id="three">
                                                             <indicatorSet indicatorId="appProfileIndicator" setId="appProfile" Scope="atomicLinkType" dataType="string">
                                                                <element elementId="Name"/>
                                                            </indicatorSet>
                                                        </elementAtomic>
                                                    </xpathFunction>
                                                </calculated>

```