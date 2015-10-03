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
<cfprocessingdirective suppresswhitespace="Yes">

<cfif not thistag.hasEndTag>
	<cfthrow message="You need to have an end tag for CoreRule">
</cfif>

<!--- 
CORERULE
Developer has to provide the rule that they are trying to prevent.
i.e. to verify 2 fields are the same  rule="field1 neq field2"

 --->


<cfif thisTag.ExecutionMode IS "Start">

	<cfif isdefined('caller.form.coreformaction')>
	<cfif evaluate(attributes.rule)>
		
		<cfif isdefined('request.coreerrormessage')>	
			<cfset request.coreerrormessage = request.coreerrormessage & #attributes.caption# & '<br />'>
		<cfelse>
			<cfset request.coreerrormessage = #attributes.caption# & '<br />'>
		</cfif>
		<cfset request.coreformerrors = "Yes">
			
	</cfif>
	</cfif>
</cfif>

</cfprocessingdirective>
