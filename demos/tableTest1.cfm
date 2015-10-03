<cfinclude template="queries/get_people.cfm">

<h2>A List of People</h2>

<cfmodule template="#coretable#"
	queryname="get_people"
	columnnames="Last Name,First Name,Title"
	valuefield="lastname,firstname,title" 
	Editlinks="edit"
	editlinkurl="testform.cfm"
	linkurlvalues="id,lastname"
	>
	
<fieldset>
<legend>Code:</legend>
<p>&lt;cfinclude template=&quot;queries/get_people.cfm&quot;&gt;</p>
<p>&lt;h2&gt;A List of People&lt;/h2&gt;</p>
<p>&lt;cfmodule template=&quot;#coretable#&quot;<br />
  &nbsp;&nbsp;&nbsp;queryname=&quot;get_people&quot;<br />
  &nbsp;&nbsp;&nbsp;columnnames=&quot;Last Name,First Name,Title&quot;<br />
  &nbsp;&nbsp;&nbsp;valuefield=&quot;lastname,firstname,title&quot; <br />
  &nbsp;&nbsp;&nbsp;editlinks=&quot;edit&quot;<br />
  &nbsp;&nbsp;&nbsp;editlinkurl=&quot;testform.cfm&quot;<br />
  &nbsp;&nbsp;&nbsp;linkurlvalues=&quot;id,lastname&quot;<br />
  &nbsp;&nbsp;&nbsp;&gt;</p>
</fieldset>
<p>&nbsp;</p>
