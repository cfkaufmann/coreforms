<cfcomponent>
     <cffunction name="getArt" access="remote" returntype="query">
	 	<cfargument name="sort" required="no">
		<cfargument name="direction" required="no">
		<cfargument name="search" required="no">
		<cfargument name="cfstartpointx" required="yes">
		<cfargument name="navigationrows" required="yes">
		
          <CFQUERY NAME="SampleQry" DATASOURCE="test5">
               Select ARTNAME,PRICE,DESCRIPTION,artist,listingdate
               From tblTestData
			   Where
			    <cfif isdefined('arguments.search') and len(trim(arguments.search)) gt 0>
					<cfloop list="#arguments.search#" index="si">
					artname like '%#si#%'
					</cfloop>
				<cfelse> 
					1=1
				</cfif>
				
			   	Order By
			   	<cfif isdefined('arguments.sort') and len(trim(arguments.sort)) gt 0>
			   		#arguments.sort# #arguments.direction#
			   	<cfelse>
			   		artname
			   	</cfif>
			   Limit #arguments.cfstartpointx#, #arguments.navigationrows#
          </CFQUERY>
		  
          <cfreturn SampleQry>
     </cffunction>
	 
	 <cffunction name="getArtTotal" access="remote" returntype="query">
	 	<cfargument name="search" required="no">
          <CFQUERY NAME="totalQry" DATASOURCE="test5">
               Select ARTNAME
               From tblTestData
			   Where
			    <cfif isdefined('arguments.search') and len(trim(arguments.search)) gt 0>
					<cfloop list="#arguments.search#" index="si">
					artname like '%#si#%'
					</cfloop>
				<cfelse> 
					1=1
				</cfif>
          </CFQUERY>
          <cfreturn totalQry>
     </cffunction>
	 
</cfcomponent>
