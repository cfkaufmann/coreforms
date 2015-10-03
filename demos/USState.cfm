<cfinclude template="queries/get_colors.cfm">
<div align="center">
	[<a href="testform2.cfm">Re-Load</a>]
</div>

<cfmodule 
	template="#coreform#" 
	formname="form1" 
	maketable="Y">
<cfmodule template="#corefield#" 
	format="usstates"
	fieldname="state"
	required="Y"
	Caption="US State"
	size="30"
	maxlength="30"
	helpmsg="Enter your State into this text input box" />
<cfmodule template="#corefield#" 
	format="submit"
	fieldname="Save"
	Value="Save" />
</cfmodule>

<cfif isdefined('form.coreformaction') and request.isformvalid eq "OK">
	<h1 align="center" style="background-color:#FFCC66">Yes</h1>
	<cfdump var="#form#">
</cfif>

<fieldset>
	<legend>Code:</legend>
	


    <pre>&lt;cfmodule 
   template=&quot;#coreform#&quot; 
   formname=&quot;form1&quot; 
   maketable=&quot;Y&quot;&gt;
 &lt;cfmodule template=&quot;#corefield#&quot; 
   format=&quot;usstates&quot;
   fieldname=&quot;state&quot;
   required=&quot;Y&quot;
   Caption=&quot;US State&quot;
   size=&quot;30&quot;
   maxlength=&quot;30&quot;
   helpmsg=&quot;Enter your State into this text input box&quot; /&gt;
 &lt;cfmodule template=&quot;#corefield#&quot; 
   format=&quot;submit&quot;
   fieldname=&quot;Save&quot;
   Value=&quot;Save&quot; /&gt;
 &lt;/cfmodule&gt;</pre>
</fieldset>