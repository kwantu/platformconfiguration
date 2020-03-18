When configuring a date element in a data object you and use the 'today()' function to set the date as today's date.  This will return a value in the “DD/MM/YYYY” format.

Following is an example of the configuration:

```
<fieldData dataType="string">
      <default>
              <calculated>
                 <xpathFunction function="today()">
                 </xpathFunction>
           </calculated>
     </default>
</fieldData>
```