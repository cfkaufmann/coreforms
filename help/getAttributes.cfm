<!--- id number~ attribute name ~ required ~ description ~ Active/Inactive ~ For All/Single --->
<cfsavecontent variable="theData">
1~fieldname~Yes~put the name of the query field~A~S
2~required~No~enter a Y if you need the field filled out~A~S
3~maxvalue~No~Only for use when the format is set to Int, Date or Calendar. Validation checking for the Int to see if the value entered is larger than the value specified in this attribute. For the Date or Calendar, it checks to see if the date entered is larger than the value specified in this attribute.~A~S
4~cols~No~enter the number of columns for a textarea field just like the html attribute~A~S
5~minutinterval~No~enter the number interval that the minutes will increment so if you put 5 then the form field will go from 5 to 10 to 15 etc.~A~S
6~minvalue~No~Only for use when the format is set to Int, Date or Calendar. Validation checking for the Int to see if the value entered is smaller than the value specified in this attribute. For the Date or Calendar, it checks to see if the date entered is smaller than the value specified in this attribute.~A~S
7~rows~No~enter the number of columns for a textarea field just like the html attribute~A~S
8~caption~No~Provides a way of naming the field more easily in the error statement.<br><b>If you are using the MAKETABLE option of coreform, this field is required.</b>~A~S
9~standalone~No~If you are specifying a queryinput, all the fields look for a field in the query. If you specify Y for this attribute it will stop the tag looking for a field.~A~S
10~default~No~Sets a default value to a field.~A~S
11~size~No~This is the same as the size attribute in the html input tag. It changes the default length of the input field size.~A~S 
12~location~Yes~add this attribute when adding a cancel button.  It is the relative url for the page (ie. 'index.cfm').~A~S
13~minlength~No~For all string values (text, textarea, email, fckeditor), checks to see if the character count is greater than the value specified in this attribute.~A~S
14~maxlength~No~For all string values (text, textarea, email, fckeditor), checks to see if the character count is smaller than the value specified in this attribute.~A~S
15~showtip~No~if you select Yes, it shows you the proper date format.~A~S
16~valuelist~No~For use with Radio, Select and Checkbox. Allows you to provide a list of values.~A~S
17~displaylist~No~For use with Radio, Select and Checkbox. Allows you to provide labels to the values. If you use the Valuelist and not the displaylist, it shows the valuelist values as the labels.~A~S
18~queryname~No~Allows you to use the values of a query for the values and display values.~A~S
19~valuecolumn~No~Specify the name of the column in the query you specified in the queryname attribute to be used as the value.~A~S
20~displaycolumn~No~Specify the name of the column in the query you specified in the queryname attribute to be used as the display value.~A~S
21~blankselection~No~For use with select box only. Provides a default selection with no value, you can enter information like " - select one -".~A~S
22~rows~No~Same as html textarea attribute. Default is 50.~A~S
23~cols~No~Same as html textarea attribute. Default is 10.~A~S
24~height~No~Default is 300~A~S
25~width~No~Default is 100%~A~S
26~toolbar~No~Allows you to select the toolbar you want to use with the FCKeditor.  The default is 'default'.~A~S
27~helpmsg~No~Enter the text in this attribute that you would like to add to the field. It is presented as a mouseover popup.~A~S
28~value~No~Used to add text to a submit button~A~S
29~multiple~No~For select boxes to allow users to select multiple values~A~S
30~selectsize~No~For specifying the size attribute of the html select attribute.~A~S
31~altselectedvalues~No~It allows you to specify preselected values from a different query or list.  It accepts a delimeted list.~A~S
32~altselectedvaluesdelimeter~No~For use with the altselectedvalues attribute. Default is a ','~A~S
33~likerttype~No~The different types or likert questions are 'agreement', 'quality', 'enjoyment', 'importance', and 'frequency'. The default is agreement.~A~S
34~noopinion~No~Adds a 'no opinion' radio button for the likert scale. The default is 'N'.~A~S
35~likertframe~No~When it is set to full, it shows the likert scale above the radio buttons. When set to 'min' it only includes part of the table which allows you to put it together with multiple likert scale questions. The default is 'full'.~A~S


</cfsavecontent>

<cfset theFields = "id,attributename,required,description,status,scope">

<cfset get_attributes = queryNew("#theFields#")>

<cfloop list="#theData#" delimiters="#chr(10)##chr(13)#" index="ii">
<cfset queryAddRow(get_attributes)>
	<cfset loopcounter = 1>
	<cfloop list="#thefields#" index="jj" delimiters=",">
		<cfset querySetCell(get_attributes,"#jj#","#listgetat(ii,#loopcounter#,"~")#")>
		<cfset loopcounter = loopcounter + 1>
	</cfloop>
</cfloop>