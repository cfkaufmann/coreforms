<cfinclude template="queries/get_colors.cfm">
<div align="center">
	[<a href="select.cfm">Re-Load</a>]
</div>
<h2>Test Form 2</h2>
<cfmodule 
	template="#coreform#" 
	formname="form1" 
	maketable="Y"
	allowfile="Y"
	debug="N"
    wysiwygeditor="N"
	forminfo="This form is meant to test out a lot of the capabilities of the coreforms.">
	
		<cfmodule 
			template="#corefield#" 
			format="select"
			fieldname="color2"
			required="N"
			queryname="get_colors"
			valuecolumn="hexcode"
			displaycolumn="color"
        	altselectedvalues="FFFFFF,FFFF00"
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
