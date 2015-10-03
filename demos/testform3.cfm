
<div align="center">
	[<a href="testform3.cfm">Re-Load</a>]
</div>

<cfmodule 
	template="#coreform#" 
	formname="form1" 
	maketable="Y"
	debug="no">
	
	<cfmodule template="#corefield#" 
			format="text"
			fieldname="lastname"
			required="Y"
			Caption="Lastname"
			size="30"
			maxlength="30"
			helpmsg="Please enter you last name" />
	<cfmodule template="#corefield#" 
			format="color"
			fieldname="color1"
			required="Y"
			Caption="Color"
			helpmsg="Please select a color" />
	<cfmodule 
			template="#corefield#" 
			format="textarea"
			fieldname="note"
			required="Y"
			rows="6"
			cols="30"
			helpmsg="Please enter a note or something"
			caption="Note"
			maxlength="250"
			/>
	
	<cfmodule template="#corefield#" 
			format="submit"
			fieldname="Save"
			Value="Save" />
</cfmodule>

<cfif isdefined('form.coreformaction') and request.isformvalid eq "OK">
	<h1 align="center" style="background-color:#FFCC66">Yes</h1>
	<cfdump var="#form#">	
</cfif>


