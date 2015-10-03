<cfinclude template="queries/get_colors.cfm">
<cfinclude template="queries/selected_colors.cfm">
<div align="center">
	[<a href="CheckBox.cfm">Re-Load</a>]
</div>
<h2>CheckBox Test Form</h2>
<cfmodule 
	template="#coreform#" 
	formname="form1" 
	maketable="Y">
	
	<cfmodule 
			template="#corefield#" 
			format="checkbox"
			fieldname="color2"
			required="N"
			queryname="get_colors"
			valuecolumn="hexcode"
			displaycolumn="color"
        	altselectedvalues="#valuelist(selected_colors.hexcode)#"
            altselectedvaluesdelimeter=","
			multiple="Y"
            caption="A Color"
            dynamicselectfield="FFFF00"
			blankselection="- Select One -" />
	
	<cfmodule template="#corefield#" 
			format="submit"
			fieldname="Save"
			Value="Save" />
</cfmodule>

<cfif isdefined('form.coreformaction') and request.isformvalid eq "OK">
	<h1 align="center" style="background-color:#FFCC66">Yes</h1>
	<cfdump var="#form#">
</cfif>
