Copied from Kwantu [Google docs](https://docs.google.com/document/d/1_-czXKjBnixFUOksBhn2w7uUXE1D1BERZMMdGQo8OGI/edit?ts=5c19d836#) on 2018-12-19.

Refer to a google docs spreadsheet of examples [here](https://docs.google.com/spreadsheets/d/1g0r5Di_dJYaf6Jw6UrdJm8aNlQdzMi7oVq7iQCr7XD4/edit?ts=5c331977#gid=0).


# Calculations
The platform has a powerful calculation capability using XPATH technology. 

## Index 1

1. Calculate sum in repeat with XPATH	
1. Sum total of 'yes' responses to previous question. If total is five or greater then set label to true. If not then set label to false	
1. Calculate  sum of two fields - Xpath	
1. Calculate  sum of two fields – element atomic	
1. Calculate  Subtract  of two fields – element atomic	
1. Calculate  Subtract  of two fields – Xpath	
1. Read Element form the other Indicator	
1. Calculate duration between dates	
1. Calculate Percentage using multiply and divide	
1. Calculate Unique ID	
1. Calculate Year from the date	
1. Calculate Auto increment  number	
1. Count number of repeat	
1. Conditional visibility	
1. Multiple Conditional visibility (Join with And operator)	
1. Multiple Conditional visibility (Join with OR operator)	
1. Comparison different elements and generate certain thing based on the condition	
1. Retrieve a value from a taxonomy / search after selecting the key in the elSelect.	
1. Access the repeat column values	
1. Element atomic with the search	
1. Finding the minimum date from a list of dates in a repeat	
1. Using the current workflow process sequence in a form calculation	

## Overview

`Wijmo`, is in memory: 
* `CustomModel` - Pending data block (model/customModel/cepEvaluationHealth/menCount)
* `defaultMode`l - Renderer create implicitly (metadata block)
* `dynamicTaxonomies` - dont use
* `dynamicTaxonomyRepeats` - dont use
* `externalModel` - Indicator from the current (profile / sub-profile instance, if you are in one) only. 


```XML
<calculated>
	<xpathFunction>
		<elementAtomic dataType="string" id="three">
			<indicatorSet indicatorId="ProjectDetailIndicator" setId="ProjectDetail" Scope="atomicLinkType" dataType="string">
				<element elementId="projectType/label"/>
			</indicatorSet>
		</elementAtomic>
	</xpathFunction>
</calculated>


<calculated>
	<sum uniqueOnly="">
		<elementAtomic dataType="currency">
			<indicatorSet indicatorId="" setId="" Scope="currentUUID" dataType="">
				<element elementId="TotalPaymentWages"/>
			</indicatorSet>
		</elementAtomic>
		<elementAtomic dataType="currency">
			<indicatorSet indicatorId="" setId="" Scope="currentUUID" dataType="">
				<element elementId="TotalPaymentOther"/>
			</indicatorSet>
		</elementAtomic>
	</sum>
</calculated>

<calculated>
    <xpathFunction function="#external?/value[./code eq /current/Title/code]/initial">
        <elementAtomic dataType="element" id="external">
            <indicatorSet indicatorId="" setId="" Scope="linkType" dataType="string" SearchDataId="beneficiarySearch">
                <xpath/>
            </indicatorSet>
        </elementAtomic>
    </xpathFunction>
</calculated>

```
**Scope: **
* `atomicLinkTyp`e - external model
* `currentUUID` - current model
* `linkType` - Seems that this is specific to search … if link to a search.

**1. Calculate sum in repeat with XPATH**

```XML
                                            <fieldData dataType="string">
      	                                      <calculated>
                                                    <xpathFunction function="sum((model/customModel/BudgetInformation/BudgetAmountMunRepeat/Budgets/Budget/TotalFundBodyFy[. ne '']))"/>
                	                            </calculated>
                                            </fieldData>
 ```
**2. Sum total of 'yes' responses to previous question.** If total is five or greater, then set label to true. If not then set label to false
```XML
<fieldData dataType="string">
        <calculated>
            <xpathFunction function="
				if(count((model/customModel/cepEvaluationHealth/ListofServices2Repeat/ListofServices2Def/ListofServices2Row/response[code eq '1'])) ge 5) 
				then ('True') 
				else ('False')
			"/>
       </calculated>
</fieldData>
```

**3. Calculate  sum of two fields - Xpath**

```XML
<calculated>
                                                    <xpathFunction function="
If ( model/customModel/cepEvaluationHealth/ ne '' and 
    model/customModel/cepEvaluationHealth/womenCount ne '')
then (model/customModel/cepEvaluationHealth/menCount + model/customModel/cepEvaluationHealth/womenCount)else('')"/>
                                                </calculated>
```

**4. Calculate  sum of two fields – element atomic**

```XML
                                           	 <calculated>
                                                    <sum uniqueOnly="">
                                 	                   <elementAtomic dataType="currency">
															<indicatorSet indicatorId="" setId="" Scope="currentUUID" dataType="">
																<element elementId="TotalPaymentWages"/>
															</indicatorSet>
                                                        </elementAtomic>
                                                        <elementAtomic dataType="currency">
															<indicatorSet indicatorId="" setId="" Scope="currentUUID" dataType="">
																<element elementId="TotalPaymentOther"/>
															</indicatorSet>
                                                        </elementAtomic>
                                                    </sum>
                                           	 </calculated>

```

**5. Calculate  Subtract  of two fields – element atomic**

```XML
                                                <calculated>
                                                    <sum uniqueOnly="">
                                                        <elementAtomic dataType="currency">
															<indicatorSet indicatorId="" setId="" Scope="currentUUID" dataType="string">
																<element elementId="TotalPaymentWages"/>
														</indicatorSet>
                                                        </elementAtomic>
                                                        <elementAtomic dataType="currency">
															<indicatorSet indicatorId="" setId="" Scope="currentUUID" dataType="">
																<element elementId="TotalPaymentOther"/>
															</indicatorSet>
                                                        </elementAtomic>
                                                    </sum>
                                                </calculated>
```

**6. Calculate  Subtract  of two fields – Xpath**

```XML
                                                <calculated seq="1">
                                                    <xpathFunction function="(
														if(model/customModel/TotalPayment/PaymentCurrPeriod ne '') 
														then (xs:integer(model/customModel/TotalPayment/PaymentCurrPeriod)) 
														else (0)) - (if(model/customModel/TotalPayment/PaymentCurrPeriod ne '') 
															then (xs:integer(model/customModel/TotalPayment/PaymentCurrPeriod)) 
															else (0))
													"/>
                                                </calculated>
```
 
**7. Read Element form the other Indicator**

```XML
                                                <calculated>
                                                    <xpathFunction function="#three?">
                                                        <elementAtomic dataType="string" id="three">
<indicatorSet indicatorId="ProjectDetailIndicator" setId="ProjectDetail" Scope="atomicLinkType" dataType="string">
    <element elementId="projectType/label"/>
                                       	                 </indicatorSet>
                                                        </elementAtomic>
                                                    </xpathFunction>
                                                </calculated>
```

***8. Read multiple Element form the other Indicator**

```XML
                                                <calculated>
                                                    <xpathFunction function="concat(#countryCode?, '-', #partnername?, '-',#OutcomeLevel?, '-', (current-dateTime() - xs:dateTime('1970-01-01T00:00:00-00:00')) div xs:dayTimeDuration('PT0.001S') )">
                                                        <elementAtomic dataType="string" id="countryCode">
<indicatorSet indicatorId="PartnerDetails" setId="PartnerDetails" Scope="atomicLinkType" dataType="string">
    <element elementId="Country/code"/>
</indicatorSet>
                        	                            </elementAtomic>
                                                        <elementAtomic dataType="string" id="partnername">
<indicatorSet indicatorId="PartnerDetails" setId="PartnerDetails" Scope="atomicLinkType" dataType="string">
    <element elementId="PartnerName"/>
</indicatorSet>
             	                                       </elementAtomic>
                                                        <elementAtomic dataType="string" id="OutcomeLevel">
<indicatorSet indicatorId="outcomeChristianAid" setId="outcomeChristianAid" Scope="currentUUID" dataType="string">
    <element elementId="Significance/Label"/>
</indicatorSet>
                                                        </elementAtomic>
                                                       
                                                    </xpathFunction>
                                                </calculated>
 
```

**9. Calculate duration between dates**

```XML
                                                <calculated>
                                                    <xpathFunction function="if(#plannedStartDate? ne '' and #plannedEndDate? ne '')then(days-from-duration(xs:date(concat(substring(#plannedEndDate?,7,4),'-',substring(#plannedEndDate?,4,2),'-',substring(#plannedEndDate?,1,2))) - xs:date(concat(substring(#plannedStartDate?,7,4),'-',substring(#plannedStartDate?,4,2),'-',substring(#plannedStartDate?,1,2)))))else('')">
                           	                         <elementAtomic dataType="string" id="plannedStartDate">
<indicatorSet indicatorId="" setId="" Scope="currentUUID" dataType="">
                                        	                    <element elementId="plannedStartDate"/>
</indicatorSet>
                                                        </elementAtomic>
                                           	         <elementAtomic dataType="string" id="plannedEndDate">
<indicatorSet indicatorId="" setId="" Scope="currentUUID" dataType="">
    <element elementId="plannedEndDate"/>
</indicatorSet>
                                                        </elementAtomic>
                                                    </xpathFunction>
                                                </calculated>
 ```

**10. Calculate Percentage using multiply and divide**

```XML
<calculated seq="1">
                                                    <xpathFunction function="(#from? * #by?) div 100">
               	                                     <elementAtomic dataType="integer" id="from">
<indicatorSet indicatorId="" setId="" Scope="currentUUID" dataType="">
                                       	                     <element elementId="percentageCompleted"/>
</indicatorSet>
                                                        </elementAtomic>
                                                        <elementAtomic dataType="integer" id="by">
<indicatorSet indicatorId="" setId="" Scope="currentUUID" dataType="">
                      	                                      <element elementId="percentageContributionCompletion"/>
</indicatorSet>
                                                        </elementAtomic>
         	                                       </xpathFunction>
                                                </calculated>
```

**11. Calculate Unique ID**

```XML
<calculated type="init">
<xpathFunction function="(current-dateTime() - xs:dateTime('1970-01-01T00:00:00-00:00')) div xs:dayTimeDuration('PT0.001S')"/>
</calculated>
```

**12. Calculate Year from the date**

```XML 
<calculated type="init">
                                                    <xpathFunction function="(substring-before(xs:string(current-date()),'-'))"/>
                                                </calculated>
```

**13. Calculate Auto increment  number**

```XML
<calculated>
    <xpathFunction function="/parent/*[_uuid eq /current/_uuid]/position()"/>
</calculated>
```

**14. Count number of repeat**

```XML
                        <calculated seq="1">
                          <xpathFunction function="count(model/customModel/IJRManualattendance/attendanceRepeat/attendancedef/attendanceData/Name)"/>
                        </calculated>
```

**15. Conditional visibility**

```XML
<showIf operator="Equal" value="Informal Settlement Register /Upgrade" datatype="string">
    <Element global="true" ElementID="ProjectType"/>
</showIf>
```

**16. Multiple Conditional visibility (Join with And operator)**

```XML
                                                    <showIf  operator="Equal" value="Yes" datatype="string">
                                                        <Element  ElementID="Target"/>
       	                                            </showIf>
                                                    <showIf join="and" operator="Equal" value="Yes" datatype="string">
                                                        <Element  ElementID="Varification"/>
                                                    </showIf>

```

**17. Multiple Conditional visibility (Join with OR operator)**

```XML
                                                    <showIf  operator="Equal" value="Yes" datatype="string">
                                                        <Element  ElementID="Target"/>
       	                                            </showIf>
                                                    <showIf join="or" operator="Equal" value="Yes" datatype="string">
                                                        <Element  ElementID="Varification"/>
                                                    </showIf>
```

**18. Comparison different elements and generate certain thing based on the condition**

```XML
<calculated seq="1">
    <xpathFunction function="if(/current/levelEvs1 != '' and xs:integer(/current/levelEvs1) lt 24) then ('Level 0') else if(/current/levelEvs1 != '' and xs:integer(/current/levelEvs1) ge 24 and  /current/SecondEvs != '' and xs:integer(/current/SecondEvs) lt 42)  then ('Level 1') else if(/current/levelEvs1 != '' and xs:integer(/current/levelEvs1) ge 24 and /current/SecondEvs != '' and xs:integer(/current/SecondEvs) ge 42) then ('Level 2')   else ('')"/>
</calculated>
```

**19. Retrieve a value from a taxonomy / search after selecting the key in the elSelect.**

```XML
<calculated seq="1">
    <xpathFunction function="#external?/value[./documentId eq 
 						/current/materialName/code]/numofItemsReceived">
        <elementAtomic dataType="element" id="external">
            <indicatorSet indicatorId="" setId="" Scope="linkType" dataType="string" SearchDataId="materialnamedoSearch">
                <xpath/>
            </indicatorSet>
        </elementAtomic>
    </xpathFunction>
</calculated>
```

`<elementAtomic dataType="element" id="nameOfDoc">` points to the external file to be read.  `ElementAtomic` always returns a single result. The id is what is used to refer to it in the xpath statement.
`<xpathFunction  function="xxx">` the xxx represents the xpath statement that will be executed when the calc is executed.
`#external?/value[./documentId eq /current/materialName/code]/numofItemsReceived
#nameOfDoc` is the pointer to some single external document. It points to the id int the `elementAtomic` tag.
`?` points to the end of the document, and the referencing of its content.
`/value` points to a path in the document. (all the searches have a `/value` I think .. to be confirmed.
`[ ,,, ]` points to some filter condition in expath. Ie. return the value where the condition in the [ ] is true.
`./documentId` is the pointer to the field `/documentId` in the external document.
`eq` is the operator that says is equal to in xpath
`/current` points the current data model, either the current row if you are in a table, or the datamodel below the <setId>
`materialName/code` is the xpath to the data in the current model to use in the comparison.
`numofItemsReceived` is the value in the #external object, filtered by the [ x eq y ] that will be returned.

**20. Access the repeat column values**

```XML
                                                            <calculated seq="1">
                                                                <xpathFunction function="if(/current/englishLevel1Score != '' and xs:integer(/current/englishLevel1Score) lt 5) then ('Level 0') else if(/current/englishLevel1Score != '' and xs:integer(/current/englishLevel1Score) ge 5 and /current/englishsecondLevelScore != '' and xs:integer(/current/englishsecondLevelScore) lt 12) then ('Level 1') else if(/current/englishLevel1Score != '' and xs:integer(/current/englishLevel1Score) ge 5 and /current/englishsecondLevelScore != '' and xs:integer(/current/englishsecondLevelScore) ge 12 and /current/englishthirdLevelScore != '' and xs:integer(/current/englishthirdLevelScore) lt 22) then ('Level 2') else if(/current/englishLevel1Score != '' and xs:integer(/current/englishLevel1Score) ge 5 and /current/englishsecondLevelScore != '' and xs:integer(/current/englishsecondLevelScore) ge 12 and /current/englishthirdLevelScore != '' and xs:integer(/current/englishthirdLevelScore) ge 22) then ('Level 3') else ('')"/>
                                                            </calculated>
```

**21. Element atomic with the search**

```XML
                                                            <calculated>
                                                                <xpathFunction function="#external?/value[./code eq /current/Title/code]/initial">
                                                                    <elementAtomic dataType="element" id="external">
                                                                        <indicatorSet indicatorId="" setId="" Scope="linkType" dataType="string" SearchDataId="beneficiarySearch">
                                                                            <xpath/>
                                                                        </indicatorSet>
                                                                    </elementAtomic>
                                                                </xpathFunction>
                                                            </calculated>
```

**22. Finding the minimum date from a list of dates in a repeat**

The issue is that we need to convert the `date` or `dateTime` to "date" or "dateTime value" before we do the function. `xs:dateTime(xxxx`) will expect a single value of xxxx. If this reads from a `repeat`, then it will get a list of xxxx values. Then we need to tell it how to convert each xxxx to `dateTime`. This is done inside a for loop:

`"min( for $i in <model with pointer to the field holding the date time> return xs:dateTime($i/date))"`
Where:
`$i` is a user chosen variable name

```XML
                                                            <calculated seq="1" type="init">
                                                                <xpathFunction function="(current-dateTime() - xs:dateTime('1970-01-01T00:00:00-00:00')) div xs:dayTimeDuration('PT0.001S')"/>
                                                            </calculated>
```

**23. Using the current workflow process sequence or valid date in a form calculation**

To access this use:
`/model/defaultModel/latestSeq`
`/model/defaultModel/validDate`


Note that even while opening any older approved sequence, this variable will return the latest pending `seq`. So it is recommended to use it with `"type"="init`" in the form in some other field, to get its value once, then do not change further.

In order to get the latest value when initiating a form, we can do the following: when we open a new instance we can use the workflow to set the current value to "". Then the form calculation will call with the latest sequence and lock it using the init attribute.

## ​Calculations 
 
 
### Index 2​
1. Calculate sum in repeat with XPATH​
1. Sum total of 'yes' responses to previous question. If total is five or greater then set 
label to true. If not then set label to false​
1. Calculate  sum of two fields - Xpath​
1. Calculate  sum of two fields – element atomic​
1. Calculate  Subtract  of two fields – element atomic​
1. Calculate  Subtract  of two fields – Xpath​
1. Read Element form the other Indicator​
1. Calculate duration between dates​
1. Calculate Percentage using multiply and divide​
1. Calculate Unique ID​
1. Calculate Year from the date​
1. Calculate Auto increment  number​
1. Count number of repeat​
1. Conditional visibility​
1. Multiple Conditional visibility (Join with And operator)​
1. Multiple Conditional visibility (Join with OR operator)​
1. Comparison different elements and generate certain thing based on the condition​
1. Retrieve a value from a taxonomy / search after selecting the key in the `elSelect`.
1. Access the repeat column values​
1. Element atomic with the search​
1. Finding the minimum date from a list of dates in a repeat​
1. Using the current workflow process sequence in a form calculation​
 
## Overview 
 
`Wijmo`, it is in memory:  
1. `CustomMode`l - Pending data block 
(model/customModel/cepEvaluationHealth/menCount) 
1. `defaultModel` - Renderer create implicitly (metadata block) 
1. `dynamicTaxonomies` - dont use 
1. `dynamicTaxonomyRepeats` - dont use 
1. `externalModel` - Indicator from the current profile (/ sub-profile instance if you are 
in one) only.  
 
 ```XML
 
<elementAtomic dataType="string" id="three"> 
<indicatorSet indicatorId="ProjectDetailIndicator" setId="ProjectDetail" 
Scope="atomicLinkType" dataType="string"> 
   <element elementId="projectType/label"/> 
                                                        </indicatorSet> 
                                                       </elementAtomic> 
                                                   </xpathFunction> 
                                               </calculated> 
 
 
<calculated> 
                                                   <sum uniqueOnly=""> 
                                                    <elementAtomic dataType="currency"> 
<indicatorSet indicatorId="" setId="" Scope="currentUUID" dataType=""> 
   <element elementId="TotalPaymentWages"/> 
</indicatorSet> 
                                                       </elementAtomic> 
                                                       <elementAtomic dataType="currency"> 
<indicatorSet indicatorId="" setId="" Scope="currentUUID" dataType=""> 
   <element elementId="TotalPaymentOther"/> 
</indicatorSet> 
                                                       </elementAtomic> 
                                                   </sum> 
                                            </calculated> 
 
<calculated> 
                                                               <xpathFunction function="#external?/value[./code 
eq /current/Title/code]/initial"> 
                                                                   <elementAtomic dataType="element" 
id="external"> 
                                                                       <indicatorSet indicatorId="" setId="" 
Scope="linkType" dataType="string" SearchDataId="beneficiarySearch"> 
                                                                           <xpath/> 
                                                                       </indicatorSet> 
                                                                   </elementAtomic> 
                                                               </xpathFunction> 
                                                           </calculated> 
 ```
 
**Scope :**  
1. `atomicLinkType` - external model 
1. `currentUUID` - current model 
1. `linkTyp`e - Seems that this is specific to search … if link to a search. 
 
**1. ​Calculate sum in repeat with XPATH**

```XML
    <fieldData dataType="string"> 
        <calculated> 
            <xpathFunction 
function="sum((model/customModel/BudgetInformation/BudgetAmountMunRepeat/Budgets/Budget/TotalFundBodyFy
[. ne '']))"/> 
         </calculated> 
    </fieldData> 
```
 
**2.​ ​Sum total of 'yes' responses to previous question**. If total is five or greater then set label 
to true. If not then set label to false 

```XML
<fieldData​ ​dataType​=​"string"> 
       ​<calculated> 
           ​<xpathFunction​ ​function​=​" 
 
if(count((model/customModel/cepEvaluationHealth/ListofServices2Repeat/ListofServices2Def/Listo
fServices2Row/response[code eq '1'])) ge 5)  
then ('True')  
else ('False') 
"​/> 
      ​</calculated> 
</fieldData> 
```
 
**3.​ Calculate  sum of two fields - Xpath**

```XML
                                               <calculated> 
                                                   <xpathFunction function=" 
If ( model/customModel/cepEvaluationHealth/ ne '' and  
   model/customModel/cepEvaluationHealth/womenCount ne '') 
then (model/customModel/cepEvaluationHealth/menCount + 
model/customModel/cepEvaluationHealth/womenCount)else('')"/> 
                                               </calculated> 
  
```
 
**4. ​Calculate  sum of two fields – element atomic**

```XML
	<calculated> 
		<sum uniqueOnly=""> 
			<elementAtomic dataType="currency"> 
				<indicatorSet indicatorId="" setId="" Scope="currentUUID" dataType=""> 
					<element elementId="TotalPaymentWages"/> 
				</indicatorSet> 
			</elementAtomic> 
			<elementAtomic dataType="currency"> 
				<indicatorSet indicatorId="" setId="" Scope="currentUUID" dataType=""> 
					<element elementId="TotalPaymentOther"/> 
				</indicatorSet> 
			</elementAtomic> 
		</sum> 
	</calculated> 
```
 
**5. ​Calculate  Subtract  of two fields – element atomic**

```XML
                                            <calculated> 
												<sum uniqueOnly=""> 
													<elementAtomic dataType="currency"> 
														<indicatorSet indicatorId="" setId="" Scope="currentUUID" dataType="string"> 
															<element elementId="TotalPaymentWages"/> 
														</indicatorSet> 
                                                    </elementAtomic> 
                                                    <elementAtomic dataType="currency"> 
														<indicatorSet indicatorId="" setId="" Scope="currentUUID" dataType=""> 
															<element elementId="TotalPaymentOther"/> 
														</indicatorSet> 
                                                    </elementAtomic> 
                                                </sum> 
                                            </calculated> 
```
 
**6. Calculate  Subtract  of two fields – Xpath** 
 
```XML
                                               <calculated seq="1"> 
                                                   <xpathFunction function="(if(model/customModel/TotalPayment/PaymentCurrPeriod 
ne '') then (xs:integer(model/customModel/TotalPayment/PaymentCurrPeriod)) else (0)) - 
(if(model/customModel/TotalPayment/PaymentCurrPeriod ne '') then 
(xs:integer(model/customModel/TotalPayment/PaymentCurrPeriod)) else (0))"/> 
  
                                               </calculated> 
 ```

**7. Read Element form the other Indicator**

```XML
<calculated> 
                                                   <xpathFunction function="#three?"> 
                                                       <elementAtomic dataType="string" id="three"> 
<indicatorSet indicatorId="ProjectDetailIndicator" setId="ProjectDetail" Scope="atomicLinkType" dataType="string"> 
   <element elementId="projectType/label"/> 
                  </indicatorSet> 
                                                       </elementAtomic> 
                                                   </xpathFunction> 
                                               </calculated> 
```

**8. ​Read multiple Element form the other Indicator**

```XML
<calculated> 
                                                   <xpathFunction function="concat(#countryCode?, '-', #partnername?, '-',#OutcomeLevel?, '-', (current-dateTime() - 
xs:dateTime('1970-01-01T00:00:00-00:00')) div xs:dayTimeDuration('PT0.001S') )"> 
                                                       <elementAtomic dataType="string" id="countryCode"> 
<indicatorSet indicatorId="PartnerDetails" setId="PartnerDetails" Scope="atomicLinkType" dataType="string"> 
   <element elementId="Country/code"/> 
</indicatorSet> 
                             </elementAtomic> 
                                                       <elementAtomic dataType="string" id="partnername"> 
<indicatorSet indicatorId="PartnerDetails" setId="PartnerDetails" Scope="atomicLinkType" dataType="string"> 
   <element elementId="PartnerName"/> 
</indicatorSet> 
                                        </elementAtomic> 
                                                       <elementAtomic dataType="string" id="OutcomeLevel"> 
<indicatorSet indicatorId="outcomeChristianAid" setId="outcomeChristianAid" Scope="currentUUID" dataType="string"> 
   <element elementId="Significance/Label"/> 
</indicatorSet> 
                                                       </elementAtomic> 
  
                                                   </xpathFunction> 
                                               </calculated> 
```

**9.​ ​Calculate duration between dates**

```XML
<calculated> 
                                                   <xpathFunction function="if(#plannedStartDate? ne '' and #plannedEndDate? ne 
'')then(days-from-duration(xs:date(concat(substring(#plannedEndDate?,7,4),'-',substring(#plannedEndDate?,4,2),'-',s
 
ubstring(#plannedEndDate?,1,2))) - 
xs:date(concat(substring(#plannedStartDate?,7,4),'-',substring(#plannedStartDate?,4,2),'-',substring(#plannedStartDa
te?,1,2)))))else('')"> 
                          <elementAtomic dataType="string" id="plannedStartDate"> 
<indicatorSet indicatorId="" setId="" Scope="currentUUID" dataType=""> 
                     <element elementId="plannedStartDate"/> 
</indicatorSet> 
                                                       </elementAtomic> 
          <elementAtomic dataType="string" id="plannedEndDate"> 
<indicatorSet indicatorId="" setId="" Scope="currentUUID" dataType=""> 
   <element elementId="plannedEndDate"/> 
</indicatorSet> 
                                                       </elementAtomic> 
                                                   </xpathFunction> 
                                               </calculated> 
```
 
**10. ​Calculate Percentage using multiply and divide**

```XML
<calculated seq="1"> 
                                                   <xpathFunction function="(#from? * #by?) div 100"> 
                                      <elementAtomic dataType="integer" id="from"> 
<indicatorSet indicatorId="" setId="" Scope="currentUUID" dataType=""> 
                      <element elementId="percentageCompleted"/> 
</indicatorSet> 
                                                       </elementAtomic> 
                                                       <elementAtomic dataType="integer" id="by"> 
<indicatorSet indicatorId="" setId="" Scope="currentUUID" dataType=""> 
                                       <element elementId="percentageContributionCompletion"/> 
</indicatorSet> 
                                                       </elementAtomic> 
                                        </xpathFunction> 
                                               </calculated> 
```
 
**11.​   ​Calculate Unique ID**

```XML
<calculated type="init"> 
<xpathFunction function="(current-dateTime() - xs:dateTime('1970-01-01T00:00:00-00:00')) div 
xs:dayTimeDuration('PT0.001S')"/> 
</calculated> 
  
 ```
**12.​   ​Calculate Year from the date **
  
```XML
<calculated type="init"> 
                                                   <xpathFunction function="(substring-before(xs:string(current-date()),'-'))"/> 
                                               </calculated>
``` 
 
**13.​ ​Calculate Auto increment  number**

```XML
<calculated> 
   <xpathFunction function="/parent/*[_uuid eq /current/_uuid]/position()"/> 
                                                      </calculated> 
```
 
**14.​ ​Count number of repeat**

```XML
<calculated seq="1"> 
                         <xpathFunction 
function="count(model/customModel/IJRManualattendance/attendanceRepeat/attendancedef/attendanceData/Name)
"/> 
                       </calculated> 
 ```
 
**15.​ Conditional visibility**

```XML
<showIf operator="Equal" value="Informal Settlement Register /Upgrade" datatype="string"> 
<Element global="true" ElementID="ProjectType"/> 
                                                       </showIf>
```

**16.​   ​Multiple Conditional visibility (Join with And operator)**

```XML
<showIf  operator="Equal" value="Yes" datatype="string"> 
                                                       <Element  ElementID="Target"/> 
                                          </showIf> 
                                                   <showIf join="and" operator="Equal" value="Yes" datatype="string"> 
                                                       <Element  ElementID="Varification"/> 
                                                   </showIf> 
```

**17.​   ​Multiple Conditional visibility (Join with OR operator)**

```XML
<showIf  operator="Equal" value="Yes" datatype="string"> 
                                                       <Element  ElementID="Target"/> 
                                          </showIf> 
                                                   <showIf join="or" operator="Equal" value="Yes" datatype="string"> 
                                                       <Element  ElementID="Varification"/> 
                                                   </showIf> 
 
```
 
**18. Comparison different elements and generate certain thing based on the condition **

```XML
<calculated seq="1"> 
   <xpathFunction function="if(/current/levelEvs1 != '' and xs:integer(/current/levelEvs1) lt 24) then ('Level 
0') else if(/current/levelEvs1 != '' and xs:integer(/current/levelEvs1) ge 24 and  /current/SecondEvs != '' 
and xs:integer(/current/SecondEvs) lt 42)  then ('Level 1') else if(/current/levelEvs1 != '' and 
xs:integer(/current/levelEvs1) ge 24 and /current/SecondEvs != '' and xs:integer(/current/SecondEvs) ge 
42) then ('Level 2')   else ('')"/> 
</calculated> 
```

**19. Retrieve a value from a taxonomy / search after selecting the key in the `elSelect`.**

```XML
<calculated seq="1"> 
   <xpathFunction function="#external?/value[./documentId eq  
 /current/materialName/code]/numofItemsReceived"> 
       <elementAtomic dataType="element" id="external"> 
           <indicatorSet indicatorId="" setId="" Scope="linkType" dataType="string" 
SearchDataId="materialnamedoSearch"> 
               <xpath/> 
           </indicatorSet> 
       </elementAtomic> 
   </xpathFunction> 
</calculated> 
```
 
a. `<elementAtomic dataType="element" id="nameOfDoc">` points to the external file to be read.  `ElementAtomic` always returns a single result. The id is what is used to refer to it in the xpath statement. 
b. `<xpathFunction  function="xxx">` the xxx represents the xpath statement that will be executed when the calc is executed. 
c. `#external?/value[./documentId eq 
/current/materialName/code]/numofItemsReceived`
i. `#nameOfDoc` is the pointer to some single external document. It points to the id int the `elementAtomic` tag. 
ii. `?` points to the end of the document, and the referencing of its content. 
iii. `/value` points to a path in the document. (all the searches have a /value I think .. to be confirmed. 
iv. `[ ,,, ]` points to some filter condition in `expath`. Ie. return the value where the condition in the `[ ]` is true. 
v. `./documentId` is the pointer to the field `/documentId` in the external document. 
vi. `eq` is the operator that says is equal to in xpath 
vii. `/current` points the current data model, either the current row if you are in a table, or the datamodel below the `<setId>` 
viii. `materialName/code` is the xpath to the data in the current model to use in the comparison. 
ix. `numofItemsReceived` is the value in the #external object, filtered by the `[ x eq y ]` that will be returned. 
d. 
 
 
**20. ​Access the repeat column values**

```XML 
                                                           <calculated seq="1"> 
                                                               <xpathFunction 
function="if(/current/englishLevel1Score != '' and xs:integer(/current/englishLevel1Score) lt 5) 
then ('Level 0') else if(/current/englishLevel1Score != '' and 
xs:integer(/current/englishLevel1Score) ge 5 and /current/englishsecondLevelScore != '' and 
xs:integer(/current/englishsecondLevelScore) lt 12) then ('Level 1') else 
if(/current/englishLevel1Score != '' and xs:integer(/current/englishLevel1Score) ge 5 and 
/current/englishsecondLevelScore != '' and xs:integer(/current/englishsecondLevelScore) ge 12 
and /current/englishthirdLevelScore != '' and xs:integer(/current/englishthirdLevelScore) lt 22) 
then ('Level 2') else if(/current/englishLevel1Score != '' and 
xs:integer(/current/englishLevel1Score) ge 5 and /current/englishsecondLevelScore != '' and 
xs:integer(/current/englishsecondLevelScore) ge 12 and /current/englishthirdLevelScore != '' 
and xs:integer(/current/englishthirdLevelScore) ge 22) then ('Level 3') else ('')"/> 
                                                           </calculated> 
```
 
**21. Element atomic with the search**

```XML
                                                           <calculated> 
                                                               <xpathFunction function="#external?/value[./code eq 
/current/Title/code]/initial"> 
 
                                                                   <elementAtomic dataType="element" id="external"> 
                                                                       <indicatorSet indicatorId="" setId="" 
Scope="linkType" dataType="string" SearchDataId="beneficiarySearch"> 
                                                                           <xpath/> 
                                                                       </indicatorSet> 
                                                                   </elementAtomic> 
                                                               </xpathFunction> 
                                                           </calculated> 
```

**22. Finding the minimum date from a list of dates in a repeat**
 
The issue is that we need to convert the `date` or `dateTime` to "_date or dateTime value_" before we 
do the function. `xs:dateTime(xxxx)` will expect a single value of `xxxx`. If this reads from a repeat, 
then it will get a list of `xxxx` values. Then we need to tell it how to convert each `xxxx` to 
`dateTime`. This is done inside a for loop: 
 
`"min( for $i in <model with pointer to the field holding the date time> return 
xs:dateTime($i/date))"` 
Where: 
`$i` is a user chosen variable name 
 
```XML

                                                           <calculated seq="1" type="init"> 
                                                               <xpathFunction function="(current-dateTime() - 
xs:dateTime('1970-01-01T00:00:00-00:00')) div xs:dayTimeDuration('PT0.001S')"/> 
                                                           </calculated> 
```
 
**23. Using the current workflow process sequence or valid date in a form calculation**
 
To access this use: 
`/model/defaultModel/latestSeq 
/model/defaultModel/validDate`
 
Note that even while opening any older approved sequence this variable will bring latest pending seq. So it is recommended to use it with `"type"="init"` in the form in some other field to get its value once then do not change further. 
 
In order to get the latest value when initiating a form, we can do the following: when we open a new instance, we can use the workflow to set the current value to `""`. Then the form calculation will call with the latest sequence and lock it using the init attribute. 

Assigned to Hasan Abbas
Willem van der Westhuizen
Jan 4, 2018
