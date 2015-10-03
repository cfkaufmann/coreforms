<!---  
 *  Copyright Charles Kaufmann, 2008  |  http://www.compositeweb.com
 * ---------------------------------------------------------------------------
 * Details and latest version at:
 * http://www.compositeweb.com
 *
 *   coreForms - a set of Coldfusion custom tags that make the creation of forms easy
 *   Copyright (C) 2008 Charles Kaufmann
 *
 *   This library is free software; you can redistribute it and/or
 *   modify it under the terms of the GNU Lesser General Public
 *   License as published by the Free Software Foundation; either
 *   version 2.1 of the License, or (at your option) any later version.
 *
 *   This library is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *   Lesser General Public License for more details.
 *
 *   You should have received a copy of the GNU Lesser General Public
 *   License along with this library; if not, write to the Free Software
 *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 --->

<!--- CHECK SOME OF THE ATTRIBUTES FOR ERRORS --->
<cfset moduleerror = 0>
<cfif not isdefined('attributes.columnnames')>
	<cfoutput><h4>You need to specify the Column Names</h4></cfoutput>
	<cfset moduleerror = 1>
</cfif>
<cfif not isdefined('attributes.valuefield')>
	<cfoutput><h4>You need to specify the Field Names</h4></cfoutput>
	<cfset moduleerror = 1>
</cfif>
<cfif not isdefined('attributes.queryname')>
	<cfoutput><h4>You need to specify the Queryname</h4></cfoutput>
	<cfset moduleerror = 1>
</cfif>
<cfif isdefined('attributes.linkfields')>
	<cfif listlen(attributes.linkfields) neq listlen(attributes.columnnames)>
		<cfoutput><h4>The Number of LinkFields does not equal the number of columnnames</h4></cfoutput>
		<cfset moduleerror = 1>
	</cfif>
</cfif>

<cfif moduleerror NEQ 0>   <!--- MODULE ERROR TRAPPING IF STATEMENT --->
<cfabort>
</cfif>   <!--- MODULE ERROR TRAPPING IF STATEMENT --->


<cfparam name="attributes.includebottomspace" default="Y">
<cfparam name="attributes.addnavigation" default="N">
<cfparam name="attributes.includesearch" default="N">


<cfparam name="caller.coreformstyle" default="default">
<cfsavecontent variable="corejavascript">
<cfoutput> 
<link href="#caller.coreformbasepath#style/#caller.coreformstyle#/coreform_style.css" rel="stylesheet" type="text/css" />
<script src='#caller.coreformbasepath#javascript/popup.js'></script>
</cfoutput>
</cfsavecontent>
<cfhtmlhead text="#corejavascript#">

<cfif attributes.includesearch eq 'Y'>
	<cfset additionalquerystring = ''>
	<cfif isdefined('url.sort')>
			<cfset additionalquerystring = '&amp;sort=' & #url.sort# & '&amp;direction=' & #url.direction#>
	</cfif>
	<cfif isdefined('url.start')>
			<cfset additionalquerystring = additionalquerystring & '&amp;start=' & #url.start#>
	</cfif>

<table align="center" style="background:#666666;font-family:Arial, Helvetica, sans-serif;" cellpadding="2" cellspacing="1" border="0" <cfif isdefined('attributes.searchtablewidth')>width="<cfoutput>#attributes.searchtablewidth#</cfoutput>"</cfif>>
<form action="<cfoutput>#caller.cgi.script_name#?#additionalquerystring#</cfoutput>" method="get">
	<tr class="coretabletoprow">
		<td><cfoutput>#request.coreFormLanguage.coreform_search#:
		<input type="text" name="search" class="corefield_text" />
		<input type="submit" value="#request.coreFormLanguage.coreform_search#" name="Go" class="corefield_button" /></cfoutput>
		</td>
	</tr>
</form>
</table>
<br />
</cfif>

<!--- START THE TABLE BUILDING --->
<cfset rowcounter=1>

<table align="center" class="coretablestyle" cellspacing="1" <cfif isdefined('attributes.tablewidth')>width="<cfoutput>#attributes.tablewidth#</cfoutput>"</cfif>>

<!--- START THE NAVIGATION PART IF NEEDED --->
<cfif attributes.addnavigation eq 'Y'>
	<tr class="coretabletoprow">
	<cfset totalnumberofcolumns = #listlen(attributes.columnnames)#>
	<cfif isdefined('attributes.editlinks') or isdefined('attributes.actionlinks')>
		<cfset totalnumberofcolumns = totalnumberofcolumns + 1>
	</cfif> 
	<td colspan="<cfoutput>#totalnumberofcolumns#</cfoutput>">
	
		
		<cfparam name="caller.url.start" default="0">
		
		<cfset totalrows = #evaluate('caller.' & #attributes.totalrowsqueryname# & '.recordcount')#>
		
		<cfset cfstartpoint = #caller.url.start#>
				  
		<cfset next = #cfstartpoint# + #caller.navigationrows#>
		<cfset previous = #cfstartpoint# - #caller.navigationrows#>
		<cfset endcount = #cfstartpoint# + (#caller.navigationrows# - 1)>
			
		<cfoutput>
		
		<!--- find any other query paramaters on the url string --->
		<cfset additionalquerystring = ''>
		<cfif isdefined('url.sort')>
			<cfset additionalquerystring = '&amp;sort=' & #url.sort# & '&amp;direction=' & #url.direction#>
		</cfif>
		<!--- Previous arrow --->
		<cfif cfstartpoint neq 1>
			[<a href="#cgi.SCRIPT_NAME#?start=#previous##additionalquerystring#" style="color:red;">&lt;&lt;</a>]
		<cfelse>
			<span style="color:##999999;">[&lt;&lt;]</span>
		</cfif>
		<cfset quicklinkcounter = 1>
		<cfloop from="1" to="#totalrows#" step="#caller.navigationrows#" index="jjj">
			<cfif url.start eq jjj>
				<span style="background-color:##FFFF66;">#quicklinkcounter#</span>
			<cfelse>
				<a href="#cgi.SCRIPT_NAME#?start=#jjj##additionalquerystring#">#quicklinkcounter#</a>
			</cfif>
			<cfif (jjj + caller.navigationrows) lte totalrows> | </cfif>
			<cfset quicklinkcounter = quicklinkcounter + 1>
		</cfloop>
		
		<!--- Next arrow --->
		<cfif endcount lt totalrows>
			[<a href="#cgi.SCRIPT_NAME#?start=#next##additionalquerystring#" style="color:red;">&gt;&gt;</a>]
		<cfelse>
			<span style="color:##999999;">[&gt;&gt;]</span>
		</cfif> 
		&nbsp; #request.coreFormLanguage.coreform_total#: #totalrows# 
		(#request.coreFormLanguage.coreform_showing# #cfstartpoint# - <cfif endcount lt totalrows>#endcount#<cfelse>#totalrows#</cfif>)
				
			
		<!--- </cfif> --->
		
		</cfoutput>

	</td>
	</tr>
</cfif>
<!--- END THE NAVIGATION PART IF NEEDED --->



<tr class="coretabletoprow">
	<cfset columncounter = 1>
	<cfloop list="#attributes.columnnames#" index="cn">
		<cfif isdefined('attributes.columnPercentWidths')>
			<cfset theColumnWidth = listgetat(attributes.columnPercentWidths, columncounter)>
			<th width="<cfoutput>#theColumnWidth#</cfoutput>%">
		<cfelse>
			<th>
		</cfif>
		
		<!--- HERE IS ALL THE FIELD SORT LINK STUFF.  MOST OF IT IS STRIPPING ANY 
		PREVIOUS SORTING OUT OF THE URL --->
		<cfif isdefined('attributes.fieldsort')>
			<cfif listgetat(attributes.fieldsort, columncounter) eq 'Y'>
				<cfset urlstringstuff = "?">
				<cfif caller.cgi.QUERY_STRING neq ''>
					<!--- strip the existing sorts out of there --->
					
					<cfloop list="#caller.cgi.QUERY_STRING#" index="kk" delimiters="&">
						<cfif listfirst(kk,"=") neq 'sort' and listfirst(kk,"=") neq 'direction'>
							<cfset urlstringstuff = listappend(urlstringstuff,kk,"&amp;")>
						</cfif>
					</cfloop>
				</cfif>
				<cfif isdefined('caller.url.direction')>
					<cfif caller.url.direction eq 'asc'>
						<cfset sortorder = 'direction=desc'>
					<cfelse>
						<cfset sortorder = 'direction=asc'>
					</cfif>
				<cfelse>
					<cfset sortorder = 'direction=asc'>
				</cfif>
				
			<cfoutput>
			<a href="#caller.cgi.SCRIPT_NAME##urlstringstuff#&amp;sort=#listgetat(attributes.valuefield, columncounter)#&amp;#sortorder#" target="_self">
			#cn#</a></cfoutput>
			<cfelse>
				<cfoutput>#cn#</cfoutput>
			</cfif>
		<cfelse>
			<cfoutput>#cn#</cfoutput>
		</cfif>
		</th>
		
		<cfset columncounter = columncounter + 1>
	</cfloop>
	<cfif isdefined('attributes.editlinks') or isdefined('attributes.actionlinks')>
		<th>
			Action
		</th>
	</cfif>
</tr>

<cfset xqueryname = "caller." & #attributes.queryname#>

<!--- <cfif attributes.addnavigation eq 'Y'>
 	<cfoutput query="#xqueryname#" startrow="#cfstartpointx#" maxrows="#listincrement#">
<cfelse>
	<cfoutput query="#xqueryname#">
</cfif>  --->

<cfoutput query="#xqueryname#">
   <tr <cfif (currentrow mod 2) is 1>class="corefirstrow"<cfelse>class="coresecondrow"</cfif>>
   	<cfset columncounter = 1>
	<cfloop list="#attributes.valuefield#" index="jj">
		<td>
		<!--- check to see if you need to create a link on the field --->
		<cfif isdefined('attributes.linkfields')>
			<cfif listgetat(attributes.linkfields,columncounter) eq 'Y'>
				<cfset querystring = ''>
				<cfloop list="#attributes.linkurlvalues#" index="tlist">
					<cfset querystring = querystring & #tlist# & '=' & #evaluate(tlist)# & '&'>
				</cfloop>
				
				<a href="#listgetat(attributes.linkurls,variables.columncounter)#?#querystring#" target="_self">
				<cfif isdefined('attributes.columnValueFormat')>
					<cfif listgetat(attributes.columnValueFormat,columncounter) neq 'N'>
						<cfset theFormat = listgetat(attributes.columnValueFormat,columncounter)>
						<cfif theFormat eq 'currency'>
							#lscurrencyformat(evaluate(jj))#
						<cfelseif theFormat eq 'date'>
							#lsdateformat(evaluate(jj))#
						<cfelse>
							#evaluate(jj)#
						</cfif>
					<cfelse>
						#evaluate(jj)#
					</cfif>
				<cfelse>
					#evaluate(jj)#
				</cfif>
				</a>
			<cfelse> <!--- This field does not need a link --->
				<cfif isdefined('attributes.columnValueFormat')>
					<cfif listgetat(attributes.columnValueFormat,columncounter) neq 'N'>
						<cfset theFormat = listgetat(attributes.columnValueFormat,columncounter)>
						<cfif theFormat eq 'currency'>
							#lscurrencyformat(evaluate(jj))#
						<cfelseif theFormat eq 'date'>
							#lsdateformat(evaluate(jj))#
						<cfelse>
							#evaluate(jj)#
						</cfif>
					<cfelse>
						#evaluate(jj)#
					</cfif>
				<cfelse>
					#evaluate(jj)#
				</cfif>
			</cfif>
		<cfelse> <!--- there are no linked fields --->
			<cfif isdefined('attributes.columnvalueformat')>
				<cfif listgetat(attributes.columnValueFormat,columncounter) neq 'N'>
					<cfset theFormat = listgetat(attributes.columnValueFormat,columncounter)>
					<cfif theFormat eq 'currency'>
						#lscurrencyformat(evaluate(jj))#
					<cfelseif theFormat eq 'date'>
						#lsdateformat(evaluate(jj))#
					<cfelse>
						#evaluate(jj)#
					</cfif>
				<cfelse>
					#evaluate(jj)#
				</cfif>
			<cfelse>
				#evaluate(jj)#
			</cfif> 
		</cfif>
		</td>

		<cfset columncounter = columncounter + 1>
	</cfloop>
	<cfif isdefined('attributes.editlinks')>
		<td>
			<cfif attributes.editlinks eq 'editdelete'>
				<cfif isdefined('caller.isuseradmin')>
					<cfif caller.isuseradmin eq 'Y'>
						[<a href="#attributes.editlinkurl#?action=edit&amp;#attributes.linkurlvalues#=#evaluate(attributes.linkurlvalues)#" target="_self">Edit</a>] &nbsp;
						[<a href="#attributes.editlinkurl#?action=delete&amp;#attributes.linkurlvalues#=#evaluate(attributes.linkurlvalues)#" target="_self">Delete</a>]
					<cfelse>
						<span style="color:##999999">
							[Edit] &nbsp; [Delete]
						</span>
					</cfif>
				<cfelse>
				[<a href="#attributes.editlinkurl#?action=edit&amp;#attributes.linkurlvalues#=#evaluate(attributes.linkurlvalues)#" target="_self">Edit</a>] &nbsp;
				[<a href="#attributes.editlinkurl#?action=delete&amp;#attributes.linkurlvalues#=#evaluate(attributes.linkurlvalues)#" target="_self">Delete</a>]
				</cfif>
			<cfelse>
				<cfif isdefined('caller.isuseradmin')>
					<cfif caller.isuseradmin eq 'Y'>
						[<a href="#attributes.editlinkurl#?action=edit&amp;#attributes.linkurlvalues#=#evaluate(attributes.linkurlvalues)#" target="_self">Edit</a>] &nbsp;
					<cfelse>
						<span style="color:##999999">
							[Edit]
						</span>
					</cfif>
				<cfelse>
				
				<cfset theQueryString = ''>
				<cfloop list="#attributes.linkurlvalues#" index="aa">
					<cfset theQueryString = theQueryString & '&#aa#=' &  #evaluate(aa)#>
				</cfloop>
				
				[<a href="#attributes.editlinkurl#?action=edit#theQueryString#" target="_self">Edit</a>] &nbsp;
				</cfif>
			</cfif>
		</td>
	</cfif>
	
	<cfif isdefined('attributes.actionlinks')>
		<td>
			<cfloop from="1" to="#listlen(attributes.linkurlvalues)#" index="aa">
				<cfset theQueryString = '#aa#=' &  #evaluate(aa)#>
				
			</cfloop>
			<cfif isdefined('caller.isuseradmin')>
				<cfif caller.isuseradmin eq 'Y'>
					<cfset alloopcounter = 1>
					<cfloop list="#attributes.actionlinks#" index="AL">
						[<a href="#AL#?#theQueryString#" target="_self"<cfif Listgetat(attributes.actionlinknames,alloopcounter) eq 'delete'>onclick="return confirm('Do you really want to Delete this?')"</cfif>>#Listgetat(attributes.actionlinknames,alloopcounter)#</a>] &nbsp;
						<cfset alloopcounter = alloopcounter + 1>
					</cfloop>
				<cfelse>
					<span style="color:##999999">
					<cfset alloopcounter = 1>
					<cfloop list="#attributes.actionlinks#" index="AL">
						[#Listgetat(attributes.actionlinknames,alloopcounter)#] &nbsp;
						<cfset alloopcounter = alloopcounter + 1>
					</cfloop>
					</span>
				</cfif>
			<cfelse>
				
				<cfset alloopcounter = 1>
				<cfloop list="#attributes.actionlinks#" index="AL">
					[<a href="#AL#?#theQueryString#" target="_self" <cfif Listgetat(attributes.actionlinknames,alloopcounter) eq 'delete'>onclick="return confirm('Do you really want to Delete this?')"</cfif>>#Listgetat(attributes.actionlinknames,alloopcounter)#</a>] &nbsp;
					<cfset alloopcounter = alloopcounter + 1>
				</cfloop>
			</cfif>
		</td>
	</cfif>
	
   </tr>
   <cfset rowcounter = rowcounter + 1>
</cfoutput>

</table>

<cfif attributes.includebottomspace eq 'Y'>
	<p>&nbsp;</p>
</cfif>


