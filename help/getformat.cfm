<cfset get_format = queryNew("name,description,status,attributes")>

<cfset queryAddRow(get_format)>
<cfset querySetCell(get_format,"name","text")>
<cfset querySetCell(get_format,"description","General text field, same features as an html text field")>
<cfset querySetCell(get_format,"status","A")>
<cfset querySetCell(get_format,"attributes","1,3,11,13,14,27,2,10,8,9")>
<cfset queryAddRow(get_format)>
<cfset querySetCell(get_format,"name","radio")>
<cfset querySetCell(get_format,"description","General radio field, same features as an html radio field, you can specify the values in the list of checkboxes via a query or a delimeted list.")>
<cfset querySetCell(get_format,"status","A")>
<cfset querySetCell(get_format,"attributes","1,16,17,18,19,20,27,2,10,8,9")>
<cfset queryAddRow(get_format)>
<cfset querySetCell(get_format,"name","select")>
<cfset querySetCell(get_format,"description","General select field, same features as an html select field, you can specify the values in the drop down list via a query or a delimeted list.")>
<cfset querySetCell(get_format,"status","A")>
<cfset querySetCell(get_format,"attributes","1,16,17,18,19,20,21,27,2,10,8,9,29,30,31,32")>
<cfset queryAddRow(get_format)>
<cfset querySetCell(get_format,"name","checkbox")>
<cfset querySetCell(get_format,"description","General checkbox field, same features as an html checkbox field, you can specify the values in the list of checkboxes via a query or a delimeted list.")>
<cfset querySetCell(get_format,"status","A")>
<cfset querySetCell(get_format,"attributes","1,16,17,18,19,20,27,2,10,8,9,31,32")>
<cfset queryAddRow(get_format)>
<cfset querySetCell(get_format,"name","textarea")>
<cfset querySetCell(get_format,"description","General textarea field, same features as an html text field")>
<cfset querySetCell(get_format,"status","A")>
<cfset querySetCell(get_format,"attributes","1,4,3,7,13,14,22,23,27,2,10,8,9")>

<cfset queryAddRow(get_format)>
<cfset querySetCell(get_format,"name","date")>
<cfset querySetCell(get_format,"description","Standard text field that validates that the information entered is a date.  If you need a calendar selector use calendar format instead.")>
<cfset querySetCell(get_format,"status","A")>
<cfset querySetCell(get_format,"attributes","1,3,6,11,15,27,2,10,8,9")>

<cfset queryAddRow(get_format)>
<cfset querySetCell(get_format,"name","calendar")>
<cfset querySetCell(get_format,"description","Text field with a calendar popup that validates to make sure whatever was entered is a date.")>
<cfset querySetCell(get_format,"status","A")>
<cfset querySetCell(get_format,"attributes","1,3,6,11,15,27,2,10,8,9")>

<cfset queryAddRow(get_format)>
<cfset querySetCell(get_format,"name","time")>
<cfset querySetCell(get_format,"description","Places three select fields on the form, one for hour, one for minute and the other for AM or PM.  Upon submitting the form all three select boxes are combined into the time field.")>
<cfset querySetCell(get_format,"status","A")>
<cfset querySetCell(get_format,"attributes","1,3,5,27,2,10,8,9")>

<cfset queryAddRow(get_format)>
<cfset querySetCell(get_format,"name","int")>
<cfset querySetCell(get_format,"description","Standard html text input field that validates the input is a number")>
<cfset querySetCell(get_format,"status","A")>
<cfset querySetCell(get_format,"attributes","1,3,6,11,27,2,10,8,9")>

<cfset queryAddRow(get_format)>
<cfset querySetCell(get_format,"name","email")>
<cfset querySetCell(get_format,"description","Checks to see if the input has a '@' symbol in it at the text after the @ has at least one period")>
<cfset querySetCell(get_format,"status","A")>
<cfset querySetCell(get_format,"attributes","1,3,6,11,13,14,27,2,10,8,9")>

<cfset queryAddRow(get_format)>
<cfset querySetCell(get_format,"name","usstates")>
<cfset querySetCell(get_format,"description","Gives you a select box with all the United States states in it.")>
<cfset querySetCell(get_format,"status","A")>
<cfset querySetCell(get_format,"attributes","1,3,27,2,10,8,9,29,21,30")>

<cfset queryAddRow(get_format)>
<cfset querySetCell(get_format,"name","countries")>
<cfset querySetCell(get_format,"description","Gives you a select box with all the countries in the world. Specifically, the country names (official short names in English) in alphabetical order as given in ISO 3166-1 and the corresponding ISO 3166-1-alpha-2 code elements.")>
<cfset querySetCell(get_format,"status","A")>
<cfset querySetCell(get_format,"attributes","1,3,27,2,10,8,9,29,21,30")>

<cfset queryAddRow(get_format)>
<cfset querySetCell(get_format,"name","savecancel")>
<cfset querySetCell(get_format,"description","Adds a save and cancel button in one call. When using this you also need to use the location tag to tell the browser where to go when clicked.")>
<cfset querySetCell(get_format,"status","A")>
<cfset querySetCell(get_format,"attributes","12")>

<cfset queryAddRow(get_format)>
<cfset querySetCell(get_format,"name","cancel")>
<cfset querySetCell(get_format,"description","Adds a cancel button. When using this you also need to use the location tag to tell the browser where to go when clicked.")>
<cfset querySetCell(get_format,"status","A")>
<cfset querySetCell(get_format,"attributes","1,12")>

<cfset queryAddRow(get_format)>
<cfset querySetCell(get_format,"name","submit")>
<cfset querySetCell(get_format,"description","Adds a submit button.")>
<cfset querySetCell(get_format,"status","A")>
<cfset querySetCell(get_format,"attributes","1,28")>

<cfset queryAddRow(get_format)>
<cfset querySetCell(get_format,"name","color")>
<cfset querySetCell(get_format,"description","Adds a standard text field with a color icon on the end.  When clicked the user is presented with a popup of the websafe colors to select from.")>
<cfset querySetCell(get_format,"status","A")>
<cfset querySetCell(get_format,"attributes","27,1,2,8,9,10,2,10,8,9")>

<cfset queryAddRow(get_format)>
<cfset querySetCell(get_format,"name","fckeditor")>
<cfset querySetCell(get_format,"description","If you have fckeditor installed correctly, it will load an instance of fckeditor.")>
<cfset querySetCell(get_format,"status","A")>
<cfset querySetCell(get_format,"attributes","1,24,25,27,26,2,10,8,9")>

<cfset queryAddRow(get_format)>
<cfset querySetCell(get_format,"name","hidden")>
<cfset querySetCell(get_format,"description","Adds a hidden field.")>
<cfset querySetCell(get_format,"status","A")>
<cfset querySetCell(get_format,"attributes","1,10")>

<cfset queryAddRow(get_format)>
<cfset querySetCell(get_format,"name","password")>
<cfset querySetCell(get_format,"description","Adds a password field.")>
<cfset querySetCell(get_format,"status","A")>
<cfset querySetCell(get_format,"attributes","1,13,14,11,27")>

<cfset queryAddRow(get_format)>
<cfset querySetCell(get_format,"name","file")>
<cfset querySetCell(get_format,"description","Adds a file field. If you need to upload a file, you also need to specify allowfile='Y' in the coreform attributes.")>
<cfset querySetCell(get_format,"status","A")>
<cfset querySetCell(get_format,"attributes","1,8,11,27")>

<cfset queryAddRow(get_format)>
<cfset querySetCell(get_format,"name","likert")>
<cfset querySetCell(get_format,"description","A Likert scale measures the extent to which a person agrees or disagrees with the question. You need to specify what type of likert scale you want.")>
<cfset querySetCell(get_format,"status","A")>
<cfset querySetCell(get_format,"attributes","1,8,27,33,34,35")>

<cfquery name="get_format_2" dbtype="query">
Select *
From get_format
order by name
</cfquery> 

