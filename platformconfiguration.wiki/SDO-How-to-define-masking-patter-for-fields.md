
# Sample Config:

`<elField id="documentName">`
`<displays>                  `                           
 `<display show="true" mode="edit" widget="mask" maskFormat="(999)-000-0000" hidePromptOnLeave="true">`
    
                                               
 `<label show="true">`
                      
                                
  `<i18n xml:lang="en">Document name</i18n>`
                       
                              
   `<i18n xml:lang="pt">Document name</i18n>`
                   
                               
  `</label>`
                                                  
  `<style width="90%"/>`
                                            
   ` </display>`
                                               
 `<display show="true" mode="readonly" widget="label">`
                                              
  `    <label show="true">`
             
                                         
  `<i18n xml:lang="en">Document name</i18n>`
            
                                        
  `  <i18n xml:lang="pt">Document name</i18n>`
              
                                  
   ` </label>`
   
`<style width="90%"/>`

`</display>`
    
`</displays>`
   
 `<fieldData dataType="string"/>`
                                         
  ` <validations>`
                                             
 `  <validation seq="1">`
                                                  
 ` <simple type="required" dataType="boolean" value="true"/>`
                                                
  `  <errorMessage>`
                                                   
   `  <i18n xml:lang="en">Please enter Document name</i18n>`
                                                    
   ` <i18n xml:lang="pt">Please enter Document name</i18n>`
                                               
  `   </errorMessage>`
                                            
  `  </validation>`
                                       
   `  </validations>`
                                      
 ` </elField>`



<div id="i-remarks-section-content" class="i-section-content" style="display: block;"><p>The property can be a string composed of one or more of the masking elements as shown in the following table.</p>
<table>
<tbody>
<tr>
<th>Masking Element</th>
<th>Description</th></tr>
<tr>
<td>0</td>
<td>Digit, required. This element will accept any single digit between 0 and 9.</td></tr>
<tr>
<td>9</td>
<td>Digit or space, optional.</td></tr>
<tr>
<td>#</td>
<td>Digit or space, optional. Plus (+) and minus (-) signs are allowed.</td></tr>
<tr>
<td>L</td>
<td>Letter, required. Restricts input to the ASCII letters a-z and A-Z.&nbsp;Valid letters are members of the following categories in UnicodeCategory: UppercaseLetter, LowercaseLetter, TitlecaseLetter, ModifierLetter, and OtherLetter.</td></tr>
<tr>
<td>?</td>
<td>Letter, optional. Restricts input to the ASCII letters a-z and A-Z. This mask element is equivalent to [a-zA-Z]? in regular expressions.</td></tr>
<tr>
<td>&amp;</td>
<td>Character, required.</td></tr>
<tr>
<td>C</td>
<td>Character, optional. Any non-control character.</td></tr>
<tr>
<td>A</td>
<td>Alphanumeric, optional.</td></tr>
<tr>
<td>a</td>
<td>Alphanumeric, optional.</td></tr>
<tr>
<td>.</td>
<td>Decimal placeholder. The actual display character used will be the decimal placeholder appropriate to the culture option.</td></tr>
<tr>
<td>,</td>
<td>Thousands placeholder. The actual display character used will be the thousands placeholder appropriate to the culture option.</td></tr>
<tr>
<td>:</td>
<td>Time separator. The actual display character used will be the time placeholder appropriate to the culture option.</td></tr>
<tr>
<td>/</td>
<td>Date separator. The actual display character used will be the date placeholder appropriate to the culture option.</td></tr>
<tr>
<td>$</td>
<td>Currency symbol. The actual character displayed will be the currency symbol appropriate to the culture option.</td></tr>
<tr>
<td>&lt;</td>
<td>Shift down. Converts all characters that follow to lowercase.</td></tr>
<tr>
<td>&gt;</td>
<td>Shift up. Converts all characters that follow to uppercase.</td></tr>
<tr>
<td>|</td>
<td>Disable a previous shift up or shift down.</td></tr>
<tr>
<td>H</td>
<td>All SBCS characters.</td></tr>
<tr>
<td>K</td>
<td>SBCS Katakana.</td></tr>
<tr>
<td>９</td>
<td>DBCS Digit</td></tr>
<tr>
<td>Ｋ</td>
<td>DBCS Katakana</td></tr>
<tr>
<td>Ｊ</td>
<td>Hiragana</td></tr>
<tr>
<td>Ｚ</td>
<td>All DBCS characters.</td></tr>
<tr>
<td>N</td>
<td>All SBCS big Katakana.</td></tr>
<tr>
<td>Ｎ</td>
<td>Matches DBCS big Katakana.</td></tr>
<tr>
<td>Ｇ</td>
<td>Matches DBCS big Hiragana.</td></tr>
<tr>
<td>\\</td>
<td>Escape. Escapes a mask character, turning it into a literal. The escape sequence for a backslash is: <a>\\\\</a></td></tr>
<tr>
<td>All other characters, Literals.</td>
<td>All non-mask elements appear as themselves within wijinputmask.<br>Literals always occupy a static position in the mask at run time, and cannot be moved or deleted by the user.</td></tr></tbody></table>
<p>The following table shows example masks.</p>
<table>
<tbody>
<tr>
<th>Example Mask</th>
<th>Description</th></tr>
<tr>
<td>00/00/0000</td>
<td>A date (day, numeric month, year) in international date format. The "/" character is a logical date separator, and will appear to the user as the date separator appropriate to the application's current culture.</td></tr>
<tr>
<td>00-&gt;L&lt;LL-0000</td>
<td>A date (day, month abbreviation, and year) in United States format in which the three-letter month abbreviation is displayed with an initial uppercase letter followed by two lowercase letters.</td></tr>
<tr>
<td>(999)-000-0000</td>
<td>United States phone number, area code optional. If users do not want to enter the optional characters, they can either enter spaces or place the mouse pointer directly at the position in the mask represented by the first 0. For example:&nbsp;<br>
<div class="i-filtered-content-Javascript" data-title="Javascript" data-itemid="Javascript"><pre>$(<span style="COLOR: #800000">".selector"</span>).wijinputmask({
     maskFormat: <span style="COLOR: #800000">"(999)-000-0000 "</span>
});</pre></div></td></tr>
<tr>
<td>$999,999.00</td>
<td>A currency value in the range of 0 to 999999. The currency, thousandth, and decimal characters will be replaced at run time with their culture-specific equivalents.</td></tr></tbody></table>
<h3>RegEx</h3>
<p>The maskFormat value can also take the form of a regular expression. For example:&nbsp;</p>
<p>\D{3}-\D{4} yields a Zip Code like this: (012-3456)</p>
<p>℡ \D{2,4}-\D{2,4}-\D{4}/ yields a phone number like: (℡ 012-345-6789)</p>
<p>\D{2,4}-\D{2,4}-\D{4} yields a phone number like: ( 012-345-6789)</p>
<div class="i-box i-box-note"><strong>Important</strong>: Only the following RegEx key words are supported. </div> 
<table>
<tbody>
<tr>
<th>Key Word</th>
<th>Description</th></tr>
<tr>
<td>\A</td>
<td>Matches any upper case alphabet [A-Z].</td></tr>
<tr>
<td>\a</td>
<td>Matches any lower case alphabet [a-z].</td></tr>
<tr>
<td>\D</td>
<td>Matches any decimal digit. Same as [0-9].</td></tr>
<tr>
<td>\W</td>
<td>Matches any word character. It is same as [a-zA-Z_0-9].</td></tr>
<tr>
<td>\K</td>
<td>Matches SBCS Katakana.</td></tr>
<tr>
<td>\H</td>
<td>Matches all SBCS characters.</td></tr>
<tr>
<td>\A</td>
<td>Matches any upper case DBCS alphabet [Ａ-Ｚ].</td></tr>
<tr>
<td>\a</td>
<td>Matches any lower case DBCS alphabet [ａ-ｚ].</td></tr>
<tr>
<td>\D</td>
<td>Matches any DBCS decimal digit. Same as [０-９].</td></tr>
<tr>
<td>\W</td>
<td>Matches any DBCS word character. It is same as [ａ-ｚＡ-Ｚ＿０-９].</td></tr>
<tr>
<td>\K</td>
<td>DBCS Katakana</td></tr>
<tr>
<td>\J</td>
<td>Hiragana</td></tr>
<tr>
<td>\Z</td>
<td>All DBCS characters.</td></tr>
<tr>
<td>\N</td>
<td>Matches all SBCS big Katakana.</td></tr>
<tr>
<td>\Ｎ</td>
<td>Matches DBCS big Katakana.</td></tr>
<tr>
<td>\Ｇ</td>
<td>Matches DBCS big Hiragana.</td></tr>
<tr>
<td>\Ｔ</td>
<td>Matches surrogate character.</td></tr>
<tr>
<td>[]</td>
<td>Used to define a combination character subset.</td></tr>
<tr>
<td>[^]</td>
<td>Used to express an exclude subset.</td></tr>
<tr>
<td>-</td>
<td>Used to define a contiguous character range.</td></tr>
<tr>
<td>{}</td>
<td>Specifies a pattern.</td></tr>
<tr>
<td>*</td>
<td>The short expression of {0,}.</td></tr>
<tr>
<td>+</td>
<td>The short expression of {1,}.</td></tr>
<tr>
<td>?</td>
<td>The short expression of {0,1}.</td></tr></tbody></table></div>
