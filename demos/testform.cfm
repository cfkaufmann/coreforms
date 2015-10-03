<cfparam name="url.id" default="0">
<cfinclude template="queries/get_person.cfm">


<div align="center">
	[<a href="testform.cfm">Re-Load</a>]
</div>
<h1>Test Form 1</h1>
<p>This is a simple form that does not use the automatic table building.</p>
<p>Notice how easy it is to include existing data. Just specify the query name 
in the coreForm tag (queryinput attribute) and make sure all your fields are named 
the same as the fields in the query. That's it! Creating new records and editing 
existing ones becomes a simple task. View <a href="tableTest1.cfm">Test Table 1</a> to try it.</p>
<cfmodule 
	template="#coreform#" 
	formname="form1" 
	queryinput="get_person" 
	debug="no"
    >
<table align="center" border="0" style="border:1px solid black; background-color:#99CC66;">
<tr>
	<th>Last Name:</th>
	<td><cfmodule template="#corefield#" 
			format="text"
			fieldname="lastname"
			required="Y"
			Caption="Lastname"
			size="30"
			maxlength="30" />
	</td>
</tr>
<tr>
	<th>First Name:</th>
	<td><cfmodule template="#corefield#" 
			format="text"
			fieldname="firstname"
			required="N"
			size="30"
			maxlength="30" />
	</td>
</tr>
<tr>
	<th>DOB:</th>
	<td><cfmodule template="#corefield#" 
			format="date"
			fieldname="dob"
			required="Y"
			size="20"
			maxvalue="#lsdateformat(now())#"
			showtip="yes"
			 />
	</td>
</tr>
<tr>
	<th>Calendar Test:</th>
	<td><cfmodule template="#corefield#" 
			format="calendar"
			fieldname="date2"
			required="N"
			caption="Calendar Test"
			size="20"
			minvalue="12-25-2005"
			maxvalue="12-31-2005"
			showtip="Yes"
			standalone="Y"
			 />
	</td>
</tr>
<tr>
	<th colspan="2">
		<cfmodule template="#corefield#" 
			format="submit"
			fieldname="Save"
			Value="Save" />
	</th>
</tr>
</table>
</cfmodule>

<cfif isdefined('form.coreformaction') and request.isformvalid eq "OK">
	<h1 align="center" style="background-color:#FFCC66">Update Query Goes Here</h1>
</cfif>

<fieldset>
<legend>Code:</legend>

<p>&lt;cfmodule <br>
template=&quot;#coreform#&quot; <br>
formname=&quot;form1&quot; <br>
queryinput=&quot;get_person&quot; <br>
debug=&quot;no&quot;<br>
&gt;<br>
&lt;table align=&quot;center&quot; border=&quot;0&quot; bgcolor=&quot;#ccccCC&quot;&gt;<br>
&lt;tr&gt;<br>
&lt;th&gt;Last Name:&lt;/th&gt;<br>
&lt;td&gt;&lt;cfmodule template=&quot;#corefield#&quot; <br>
format=&quot;text&quot;<br>
fieldname=&quot;lastname&quot;<br>
required=&quot;Y&quot;<br>
Caption=&quot;Lastname&quot;<br>
size=&quot;30&quot;<br>
maxlength=&quot;30&quot; /&gt;<br>
&lt;/td&gt;<br>
&lt;/tr&gt;<br>
&lt;tr&gt;<br>
&lt;th&gt;First Name:&lt;/th&gt;<br>
&lt;td&gt;&lt;cfmodule template=&quot;#corefield#&quot; <br>
format=&quot;text&quot;<br>
fieldname=&quot;firstname&quot;<br>
required=&quot;N&quot;<br>
size=&quot;30&quot;<br>
maxlength=&quot;30&quot; /&gt;<br>
&lt;/td&gt;<br>
&lt;/tr&gt;<br>
&lt;tr&gt;<br>
&lt;th&gt;DOB:&lt;/th&gt;<br>
&lt;td&gt;&lt;cfmodule template=&quot;#corefield#&quot; <br>
format=&quot;date&quot;<br>
fieldname=&quot;dob&quot;<br>
required=&quot;Y&quot;<br>
size=&quot;20&quot;<br>
maxvalue=&quot;#lsdateformat(now())#&quot;<br>
showtip=&quot;yes&quot;<br>
/&gt;<br>
&lt;/td&gt;<br>
&lt;/tr&gt;<br>
&lt;tr&gt;<br>
&lt;th&gt;Calendar Test:&lt;/th&gt;<br>
&lt;td&gt;&lt;cfmodule template=&quot;#corefield#&quot; <br>
format=&quot;calendar&quot;<br>
fieldname=&quot;date2&quot;<br>
required=&quot;N&quot;<br>
caption=&quot;Calendar Test&quot;<br>
size=&quot;20&quot;<br>
minvalue=&quot;12-25-2005&quot;<br>
maxvalue=&quot;12-31-2005&quot;<br>
showtip=&quot;Yes&quot;<br>
standalone=&quot;Y&quot;<br>
/&gt;<br>
&lt;/td&gt;<br>
&lt;/tr&gt;<br>
&lt;tr&gt;<br>
&lt;th colspan=&quot;2&quot;&gt;<br>
&lt;cfmodule template=&quot;#corefield#&quot; <br>
format=&quot;submit&quot;<br>
fieldname=&quot;Save&quot;<br>
Value=&quot;Save&quot; /&gt;<br>
&lt;/th&gt;<br>
&lt;/tr&gt;<br>
&lt;/table&gt;<br>
&lt;/cfmodule&gt;</p>
<p>&lt;cfif isdefined('form.coreformaction') and request.isformvalid eq &quot;OK&quot;&gt;<br>
&lt;h1 align=&quot;center&quot; style=&quot;background-color:#FFCC66&quot;&gt;Update Query Goes Here&lt;/h1&gt;<br>
&lt;/cfif&gt;<br>
</p>
</fieldset>
