<h1>Test Form 4</h1>
<p>In order to implement TinyMCE on your forms for all your textarea elements, just include this attribute "wysiwygEditor" within the cfform tag and set it to "Y".</p>


<cfmodule 
	template="#coreform#" 
	formname="form1" 
	maketable="Y"
    wysiwygeditor="Y"
	>
	<cfmodule 
			template="#corefield#" 
			format="textarea"
			fieldname="note"
			required="N"
			rows="10"
			cols="40"
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

<fieldset>
<legend>Code:</legend>

<p>&lt;cfmodule <br>
template=&quot;#coreform#&quot; <br>
formname=&quot;form1&quot; <br>
maketable=&quot;Y&quot;<br>
wysiwygeditor=&quot;Y&quot;<br>
&gt;<br>
&lt;cfmodule <br>
template=&quot;#corefield#&quot; <br>
format=&quot;textarea&quot;<br>
fieldname=&quot;note&quot;<br>
required=&quot;N&quot;<br>
rows=&quot;10&quot;<br>
cols=&quot;40&quot;<br>
caption=&quot;Note&quot;<br>
maxlength=&quot;250&quot;<br>
/&gt;<br>
<br>
&lt;cfmodule template=&quot;#corefield#&quot; <br>
format=&quot;submit&quot;<br>
fieldname=&quot;Save&quot;<br>
Value=&quot;Save&quot; /&gt;<br>
&lt;/cfmodule&gt;<br>
</p>
</fieldset>
