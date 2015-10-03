<h1>Format: Likert</h1>
<p>The Likert format creates a likert scale for your questions.</p>
<p>Below is an example of the likert format</p>
<cfmodule
template="#coreform#"
formname="form1"
maketable="Y"
allowfile="N">

<cfmodule template="#corefield#"
format="likert"
fieldname="question1"
caption="I like coreforms."
required="Y"
noopinion="Y" />

<cfmodule template="#corefield#"
format="likert"
likerttype="importance"				
fieldname="question2"
caption="How important do you feel coreforms is."
required="Y"
noopinion="Y" />


<cfmodule template="#corefield#"
	fieldname="savecancel"
	format="savecancel"
	location="index.cfm" />
</cfmodule>

<cfif isdefined('form.coreformaction') and request.isformvalid eq "OK">
<cfdump var="#form#">
</cfif>