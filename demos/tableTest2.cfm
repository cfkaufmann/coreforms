<cfinclude template="queries/get_people_sort.cfm">

<h2>A List of People</h2>

<cfmodule template="#coretable#"
	queryname="get_people2"
	columnnames="Last Name,First Name,Title"
	valuefield="lastname,firstname,title" 
	Editlinks="edit"
	editlinkurl="testform.cfm"
	linkurlvalues="id,lastname"
	fieldsort="Y,Y,Y"
	>
	
<fieldset>
<legend>Code:</legend>
<p>&lt;cfinclude template=&quot;queries/get_people_sort.cfm&quot;&gt;</p>
<p>&lt;h2&gt;A List of People&lt;/h2&gt;</p>
<p><code>&lt;cfmodule template=&quot;#coretable#&quot;<br />
  queryname=&quot;get_people2&quot;<br />
  columnnames=&quot;Last Name,First Name,Title&quot;<br />
  valuefield=&quot;lastname,firstname,title&quot; <br />
  Editlinks=&quot;edit&quot;<br />
  editlinkurl=&quot;testform.cfm&quot;<br />
  linkurlvalues=&quot;id,lastname&quot;<br />
  fieldsort=&quot;Y,Y,Y&quot;<br />
  &gt;<br />
</code></p>
</fieldset>
<p>&nbsp;</p>
