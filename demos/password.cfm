<h2>Change Your Password</h2>
<p>This form uses the coreRule feature.</p>
<cfmodule 
	template="#coreform#" 
	formname="form1" 
	debug="N"
    maketable="Y">
		<cfmodule template="#corefield#"
			format="password"
			required="yes"
			fieldname="password1"
			minlength="8"
            caption="New Password:"
			/>
		<cfmodule template="#corefield#"
			format="password"
			required="yes"
			fieldname="password2"
			minlength="8"
            caption="Retype Password:"
			/>
	<cfmodule template="#corefield#" 
			format="submit"
			fieldname="Save"
			Value="Save" />
<cfmodule 
	template="#corerule#"
	rule="password1 neq password2"
	caption="Both Passwords have to be the Same" />
</cfmodule>

<cfif isdefined('form.coreformaction') and request.isformvalid eq "OK">
	<h1 align="center" style="background-color:#FFCC66">Yes</h1>
	<cfdump var="#form#">
</cfif>

<fieldset>
<legend>Code:</legend>

<p>&lt;cfmodule <br />
template=&quot;#coreform#&quot; <br />
formname=&quot;form1&quot; <br />
debug=&quot;N&quot;<br />
maketable=&quot;Y&quot;&gt;<br />
</p>
<p>&lt;cfmodule template=&quot;#corefield#&quot;<br />
  format=&quot;password&quot;<br />
  required=&quot;yes&quot;<br />
  fieldname=&quot;password1&quot;<br />
  minlength=&quot;8&quot;<br />
  caption=&quot;New Password:&quot;
  /&gt;<br />
</p>
<p>&lt;cfmodule template=&quot;#corefield#&quot;<br />
  format=&quot;password&quot;<br />
  required=&quot;yes&quot;<br />
  fieldname=&quot;password2&quot;<br />
  minlength=&quot;8&quot;<br />
  caption=&quot;Retype Password:&quot;
/&gt;<br />
</p>
<p>&lt;cfmodule template=&quot;#corefield#&quot; <br />
  format=&quot;submit&quot;<br />
  fieldname=&quot;Save&quot;<br />
  Value=&quot;Save&quot; /&gt;<br />
</p>
<p>&lt;cfmodule <br />
  template=&quot;#corerule#&quot;<br />
  rule=&quot;password1 neq password2&quot;<br />
  caption=&quot;Both Passwords have to be the Same&quot; /&gt;<br />
&lt;/cfmodule&gt;</p>
<p>&lt;cfif isdefined('form.coreformaction') and request.isformvalid eq &quot;OK&quot;&gt;<br />
  &lt;h1 align=&quot;center&quot; style=&quot;background-color:#FFCC66&quot;&gt;Yes&lt;/h1&gt;<br />
  &lt;cfdump var=&quot;#form#&quot;&gt;<br />
  &lt;/cfif&gt;</p>
</fieldset>

