<h1>Format: Time</h1>
<p>Some things to note about the time format. It sets up 3 different fields 
automatically and on submit, checks to see if it is a time and puts 
the 3 fields together into the field you specified in the fieldname attribute (in 24 hour time format). </p>
<p>Here is a list of some of the tags you can use with <strong>time</strong>:</p>
<ul>
<li>fieldname - required</li>
<li>required - optional</li>
<li> minuteinterval - optional, allows you to specify the minute increments. Defaults to 5. </li>
<li>caption - optional</li>
<li>default - optional, you can specify a certain time or simply put in #now()# and it will show the current server time. </li>
</ul>
<p>Please note that if you do choose to use a default value and use Now(), make sure you set the minuteinterval to 1 or you will get some errors.</p>
<cfmodule
template="#coreform#"
formname="form1"
maketable="Y"
allowfile="Y">

<cfmodule template="#corefield#"
format="time"
fieldname="TimeOfDay"
caption="Time Of Day"
minuteinterval="1"
default="#now()#"
required="Y" />

<cfmodule template="#corefield#"
format="submit"
fieldname="Save"
Value="Save" />
</cfmodule>

<cfif isdefined('form.coreformaction') and request.isformvalid eq "OK">
<cfdump var="#form#">
</cfif>
<p>&nbsp;</p>
<fieldset>
<legend>Code:</legend>
<p>&lt;cfmodule<br>
  template=&quot;#coreform#&quot;<br>
  formname=&quot;form1&quot;<br>
  maketable=&quot;Y&quot;<br>
allowfile=&quot;Y&quot;&gt;</p>
<p>&lt;cfmodule template=&quot;#corefield#&quot;<br>
  format=&quot;time&quot;<br>
  fieldname=&quot;TimeOfDay&quot;<br>
  caption=&quot;Time Of Day&quot;<br>
  minuteinterval=&quot;1&quot;<br>
  default=&quot;#now()#&quot;<br>
  required=&quot;Y&quot; /&gt;</p>
<p>&lt;cfmodule template=&quot;#corefield#&quot;<br>
  format=&quot;submit&quot;<br>
  fieldname=&quot;Save&quot;<br>
  Value=&quot;Save&quot; /&gt;<br>
&lt;/cfmodule&gt;</p>
<p>&lt;cfif isdefined('form.coreformaction') and request.isformvalid eq &quot;OK&quot;&gt;<br>
&lt;cfdump var=&quot;#form#&quot;&gt;<br>
&lt;/cfif&gt;</p>
</fieldset>