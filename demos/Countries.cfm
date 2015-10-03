<cfinclude template="queries/get_colors.cfm">
<div align="center">
	[<a href="Countries.cfm">Re-Load</a>]
</div>

<cfmodule 
	template="#coreform#" 
	formname="form1" 
	maketable="Y">
<cfmodule template="#corefield#" 
	format="countries"
	fieldname="country"
	required="Y"
	Caption="Country"
	size="30"
	maxlength="30"
	helpmsg="Please choose your favorite country"
	blankselection="- Select a Country -" />
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
   format=&quot;countries&quot;
   fieldname=&quot;country&quot;
   required=&quot;Y&quot;
   Caption=&quot;Country&quot;
   size=&quot;30&quot;
   maxlength=&quot;30&quot;
   blankselection=&quot;- Select a Country -&quot;
   helpmsg=&quot;Please choose your favorite country&quot; /&gt;
 &lt;cfmodule template=&quot;#corefield#&quot; 
   format=&quot;submit&quot;
   fieldname=&quot;Save&quot;
   Value=&quot;Save&quot; /&gt;
 &lt;/cfmodule&gt;</pre>
</fieldset>