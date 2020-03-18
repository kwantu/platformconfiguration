Created by Rob Worthington, last modified on Oct 25, 2017. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+validate+that+the+end+date+is+after+the+start+date) on 2018-12-12.

In many cases when developing and maintaining user input [forms](https://github.com/kwantu/platformconfiguration/wiki/Entity-list#form) we need to validate that one date is after another date (for example that the end date is after the start date).  In the example below, modify the following parameters:

|Parameter|Example|What it does|
|---------|-------|------------|
|Set ID|fsProjectBusinessPlanProjectDetails|This is the set ID of the data object in which the validation is placed|
|ID of source element|plannedStartDate|This is the date field from which the validation will read|
|ID of validated element|plannedEndDate|This is the date field that the validation will apply too|

Example code:
```XML
                                                 <validation seq="3">
                                                     <simple type="constraint" model="customModel.fsProjectBusinessPlanProjectDetails" expr="if(plannedStartDate ne '' and plannedEndDate ne '')then(xs:date(concat(substring(plannedEndDate,7,4),'-',substring(plannedEndDate,4,2),'-',substring(plannedEndDate,1,2))) gt xs:date(concat(substring(plannedStartDate,7,4),'-',substring(plannedStartDate,4,2),'-',substring(plannedStartDate,1,2))))else ('false')"/>
                                                     <errorMessage>
                                                         <i18n xml:lang="en">Date has to be greater than to start date.</i18n>
                                                         <i18n xml:lang="pt">Data tem de ser maior do que a data de início.</i18n>
                                                     </errorMessage>
                                                 </validation>
``` 

This validation uses a substring to extract the date.  The date is captured in this format - DD/MM/YYYY but then converted to this format - YYYY-MM-DD

