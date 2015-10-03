<cfinclude template="get_people.cfm">

<cfquery name="get_person" dbtype="query">
	select *
	from get_people
	Where id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#">
</cfquery>
