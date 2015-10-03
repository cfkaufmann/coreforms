<cfinclude template="get_people.cfm">

<cfquery name="get_people2" dbtype="query">
Select id,firstname,lastname,title,status
from get_people
order by
<cfif isdefined('url.sort')>
	#url.sort# #url.direction#
<cfelse>
	<!--- The default sort order --->
	lastname
</cfif>
</cfquery>
