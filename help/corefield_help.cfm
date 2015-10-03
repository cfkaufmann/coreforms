<h2>corefield</h2>
<cfinclude template="getAttributes.cfm">
<cfinclude template="getformat.cfm">

<table cellspacing="0" width="100%">
<tr valign="top">
	<td width="100">
		<strong>Formats:</strong><br>
		<cfoutput query="get_format_2">
		<div <cfif url.format eq name>style="background-color:##ffbc00;padding-left:5px;"</cfif>><a href="index.cfm?request=corefield&format=#name#" style="text-decoration:none;">#name#</a></div>
		</cfoutput>
	</td>
	<td>
	<cfquery name="getformat" dbtype="query">
		select *
		from get_format
		where name = '#url.format#'
	</cfquery>
	<cfquery name="getattributes" dbtype="query">
		select *
		from get_attributes
		where scope='A' or id in(#getformat.attributes#)
		order by required desc, attributename
	</cfquery>
	<!--- <cfdump var="#getattributes#"> --->
	<h3><cfoutput>#url.format#</cfoutput></h3>
	<p><strong>Description:</strong> <cfoutput>#getformat.description#</cfoutput></p>
	<table cellspacing="0" class="innertable">
		<tr>
	        <th>Attribute</th>
	        <th>Required?</th>
	        <th>Description</th>
	    </tr>
	    <cfoutput query="getattributes">
		    <tr>
			<td>#attributename#</td>
			<td>#required#</td>
			<td>#description#</td>
			</tr>
		</cfoutput>
	</table>
	</td>
</tr>
