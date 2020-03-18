There are cases where you may need to generate a unique identifier for each row or column in a repeat.  This is useful if you need to search on this repeat in another data object.  To do this set the name of the element as _uuid

Please refer to the example below.

```
<repeatColumn columnOrder="1" seq="1" width="20%">
                                               <repeatHeader span="1" labelsFromData="No">
                                                   <label>
                                                       <i18n xml:lang="en">Row ID</i18n>
                                                   </label>
                                               </repeatHeader>
                                               <repeatData span="1">
                                                   <elField id="_uuid">
                                                       <displays>
                                                           <display show="true" mode="edit" widget="label">
                                                               <label show="true">
                                                                   <i18n xml:lang="en">Row ID</i18n>
                                                               </label>
                                                               <style width="50%"/>
                                                           </display>
                                                           <display show="true" mode="readonly" widget="label">
                                                               <label show="true">
                                                                   <i18n xml:lang="en">Row ID</i18n>
                                                               </label>
                                                               <style width="50%"/>
                                                           </display>
                                                       </displays>
                                                       <fieldData dataType="string">
                                                           <!--<calculated seq="1" type="init">
                                                               <xpathFunction function="concat(current-date(),'-' ,/parent/*[_uuid eq /current/_uuid]/position())"/>
                                                           </calculated>-->
                                                           <!--<calculated seq="1" >
                                                               <xpathFunction function="count(model/customModel/SDOPlannedOutputs/deliverableRepeat/repeatDef/data)"/>
                                                           </calculated>-->
<!--                                                           <calculated seq="1" type="init">-->
<!--                                                               <xpathFunction function="/current/_uuid"/>-->
<!--                                                           </calculated>-->
                                                       </fieldData>
                                                   </elField>
                                               </repeatData>
                                           </repeatColumn>
```