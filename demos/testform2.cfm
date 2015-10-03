<cfinclude template="queries/get_colors.cfm">
<div align="center">
	[<a href="testform2.cfm">Re-Load</a>]
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
	

		<cfmodule template="#corefield#" 
			format="text"
			fieldname="lastname"
			required="Y"
			Caption="Lastname"
			size="30"
			maxlength="30"
			helpmsg="Enter your legal last name into this text input box" />
		<cfmodule template="#corefield#" 
			format="file"
			fieldname="file"
			required="N"
			Caption="Your File"
			size="30"
			standalone="N"
			 />
		<cfmodule template="#corefield#" 
			format="text"
			fieldname="firstname"
			caption="First Name"
			required="N"
			size="30"
			maxlength="30" />
		<cfmodule template="#corefield#" 
			format="date"
			fieldname="dob"
			required="N"
			caption="Date of Birth"
			size="20"
			maxvalue="#lsdateformat(now())#"
			showtip="yes" />
		<cfmodule template="#corefield#"
			format="time"
			fieldname="TimeOfBirth"
			caption="Time Of Birth"
			required="Y"
			/>
		<cfmodule template="#corefield#" 
			format="calendar"
			fieldname="date2"
			required="N"
			caption="Calendar Test"
			size="20"
			minvalue="1-1-2005"
			maxvalue="12-31-2008"
			showtip="Yes"
			 />
		<cfmodule 
			template="#corefield#" 
			format="email"
			fieldname="email"
			caption="Email"
			required="N"
			size="30" />
		<cfmodule 
			template="#corefield#" 
			format="int"
			fieldname="employeeid"
			required="N"
			size="10"
			caption="Person ID"
			minvalue="1"
			maxvalue="10000" />
		<cfmodule 
			template="#corefield#" 
			format="radio"
			fieldname="color"
			required="N"
			valuelist="Red,Blue,Green"
			displaylist="Color Red,Color Blue,Color Green"
			caption="Favorite Color" />
		<cfmodule 
			template="#corefield#" 
			format="select"
			fieldname="color2"
			required="N"
			valuelist="1,2,3"
			displaylist="red,white,blue"
			caption="Another Color"
			blankselection="- Select One -" />
	
	<cfmodule template="#corefield#"
		format="checkbox"
		fieldname="group"
		required="Y"
		queryname="get_colors"
		valuecolumn="hexcode"
		displaycolumn="color"
		caption="More Colors"
		/>

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


<p>&lt;cfmodule <br />
template=&quot;#coreform#&quot; <br />
formname=&quot;form1&quot; <br />
maketable=&quot;Y&quot;<br />
allowfile=&quot;Y&quot;<br />
debug=&quot;no&quot;<br />
forminfo=&quot;This form is meant to test out a lot of the capabilities of the coreforms.&quot;&gt;<br />
</p>
<p> &lt;cfmodule template=&quot;#corefield#&quot; <br />
  format=&quot;text&quot;<br />
  fieldname=&quot;lastname&quot;<br />
  required=&quot;Y&quot;<br />
  Caption=&quot;Lastname&quot;<br />
  size=&quot;30&quot;<br />
  maxlength=&quot;30&quot;<br />
  helpmsg=&quot;Enter your legal last name into this text input box&quot; /&gt;<br />
  </p>
<p>&lt;cfmodule template=&quot;#corefield#&quot; <br />
  format=&quot;file&quot;<br />
  fieldname=&quot;file&quot;<br />
  required=&quot;N&quot;<br />
  Caption=&quot;Your File&quot;<br />
  size=&quot;30&quot;<br />
  standalone=&quot;N&quot;
  /&gt;<br />
</p>
<p>&lt;cfmodule template=&quot;#corefield#&quot; <br />
  format=&quot;text&quot;<br />
  fieldname=&quot;firstname&quot;<br />
  caption=&quot;First Name&quot;<br />
  required=&quot;N&quot;<br />
  size=&quot;30&quot;<br />
  maxlength=&quot;30&quot; /&gt;<br />
</p>
<p>&lt;cfmodule template=&quot;#corefield#&quot; <br />
  format=&quot;date&quot;<br />
  fieldname=&quot;dob&quot;<br />
  required=&quot;N&quot;<br />
  caption=&quot;Date of Birth&quot;<br />
  size=&quot;20&quot;<br />
  maxvalue=&quot;#lsdateformat(now())#&quot;<br />
  showtip=&quot;yes&quot; /&gt;<br />
</p>
<p>&lt;cfmodule template=&quot;#corefield#&quot;<br />
  format=&quot;time&quot;<br />
  fieldname=&quot;TimeOfBirth&quot;<br />
  caption=&quot;Time Of Birth&quot;
  /&gt;<br />
</p>
<p>&lt;cfmodule template=&quot;#corefield#&quot; <br />
  format=&quot;calendar&quot;<br />
  fieldname=&quot;date2&quot;<br />
  required=&quot;N&quot;<br />
  caption=&quot;Calendar Test&quot;<br />
  size=&quot;20&quot;<br />
  minvalue=&quot;1-1-2005&quot;<br />
  maxvalue=&quot;12-31-2008&quot;<br />
  showtip=&quot;Yes&quot;
  /&gt;<br />
</p>
<p>&lt;cfmodule <br />
  template=&quot;#corefield#&quot; <br />
  format=&quot;email&quot;<br />
  fieldname=&quot;email&quot;<br />
  caption=&quot;Email&quot;<br />
  required=&quot;N&quot;<br />
  size=&quot;30&quot; /&gt;<br />
</p>
<p>&lt;cfmodule <br />
  template=&quot;#corefield#&quot; <br />
  format=&quot;int&quot;<br />
  fieldname=&quot;employeeid&quot;<br />
  required=&quot;N&quot;<br />
  size=&quot;10&quot;<br />
  caption=&quot;Person ID&quot;<br />
  minvalue=&quot;1&quot;<br />
  maxvalue=&quot;10000&quot; /&gt;<br />
</p>
<p>&lt;cfmodule <br />
  template=&quot;#corefield#&quot; <br />
  format=&quot;radio&quot;<br />
  fieldname=&quot;color&quot;<br />
  required=&quot;N&quot;<br />
  valuelist=&quot;Red,Blue,Green&quot;<br />
  displaylist=&quot;Color Red,Color Blue,Color Green&quot;<br />
  caption=&quot;Favorite Color&quot; /&gt;<br />
</p>
<p>&lt;cfmodule <br />
  template=&quot;#corefield#&quot; <br />
  format=&quot;select&quot;<br />
  fieldname=&quot;color2&quot;<br />
  required=&quot;N&quot;<br />
  valuelist=&quot;1,2,3&quot;<br />
  displaylist=&quot;red,white,blue&quot;<br />
  caption=&quot;Another Color&quot;<br />
  blankselection=&quot;- Select One -&quot; /&gt;<br />
  <br />
&lt;cfmodule template=&quot;#corefield#&quot;<br />
format=&quot;checkbox&quot;<br />
fieldname=&quot;group&quot;<br />
required=&quot;N&quot;<br />
queryname=&quot;get_colors&quot;<br />
valuecolumn=&quot;hexcode&quot;<br />
displaycolumn=&quot;color&quot;<br />
caption=&quot;More Colors&quot;
/&gt;</p>
<p> &lt;cfmodule <br />
  template=&quot;#corefield#&quot; <br />
  format=&quot;textarea&quot;<br />
  fieldname=&quot;note&quot;<br />
  required=&quot;N&quot;<br />
  rows=&quot;6&quot;<br />
  cols=&quot;30&quot;<br />
  caption=&quot;Note&quot;<br />
  maxlength=&quot;250&quot;
  /&gt;<br />
  <br />
&lt;cfmodule template=&quot;#corefield#&quot; <br />
format=&quot;submit&quot;<br />
fieldname=&quot;Save&quot;<br />
Value=&quot;Save&quot; /&gt;<br />
&lt;/cfmodule&gt;</p>
<p>&lt;cfif isdefined('form.coreformaction') and request.isformvalid eq &quot;OK&quot;&gt;<br />
  &lt;h1 align=&quot;center&quot; style=&quot;background-color:#FFCC66&quot;&gt;Yes&lt;/h1&gt;<br />
  &lt;cfdump var=&quot;#form#&quot;&gt;<br />
  &lt;/cfif&gt;</p>
</fieldset>
