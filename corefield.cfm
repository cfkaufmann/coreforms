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
	<cfthrow message="#request.coreFormLanguage.coreform_endTagError#">
</cfif>

<cfif thisTag.ExecutionMode IS "Start">


<cfparam name="attributes.title" default="Untitled">
<cfparam name="attributes.values" default="">
<cfparam name="attributes.size" default="20">
<cfparam name="attributes.maxlength" default="">
<cfparam name="attributes.minlength" default="">
<cfparam name="attributes.class" default="">
<cfparam name="attributes.caption" default="">
<cfparam name="attributes.cols" default="50">
<cfparam name="attributes.rows" default="10">
<cfparam name="attributes.required" default="N">
<cfparam name="attributes.width" default="100%">
<cfparam name="attributes.height" default="300">
<cfparam name="attributes.toolbar" default="Default">
<cfparam name="attributes.standalone" default="N">
<cfparam name="attributes.helpmsg" default="">
<cfparam name="attributes.minuteinterval" default="5">
<cfparam name="attributes.highlight" default="N">
<cfparam name="attributes.altselectedvaluesdelimeter" default=",">
<cfparam name="attributes.columns" default="2">
<cfparam name="attributes.likerttype" default="agreement">
<cfparam name="attributes.likertframe" default="full">
<cfparam name="attributes.noopinion" default="N">

<cfset errorfields = "">
<cfset errormessage = "">
<cfset fielderrors = 0>




		<cfset formfield = "caller.form." & #attributes.fieldname#>
		<cfoutput>
		<!--- VALIDATION --->
		<cfif isdefined('caller.form.coreformaction') and not isdefined('caller.form.cancel')>
			
			<!--- Check if it is REQUIRED --->
			<cfif attributes.format eq 'radio' or attributes.format eq 'checkbox' or attributes.format eq 'likert'>
				<cfif attributes.required eq 'Y' or attributes.required eq 'Yes'>
					<cfif isdefined('form.#attributes.fieldname#')>
						<cfset fieldok = 'Yes'>
					<cfelse>
						<cfset fielderrors = 1>
						<cfif isdefined('request.coreerrormessage')>	
							<cfset request.coreerrormessage = request.coreerrormessage & #iif(attributes.caption neq '',DE(attributes.caption), DE(attributes.fieldname))# & ' #request.coreFormLanguage.coreform_reqField#<br />'>
						<cfelse>
							<cfset request.coreerrormessage = #iif(attributes.caption neq '',DE(attributes.caption), DE(attributes.fieldname))# & ' #request.coreFormLanguage.coreform_reqField#<br />'>
						</cfif>
					</cfif>
				</cfif>
			<cfelseif attributes.format eq 'time'>
				<cfif attributes.required eq 'Y' or attributes.required eq 'Yes'>
					<cfif len(trim(evaluate('caller.form.hour_' & attributes.fieldname))) eq 0 or  len(trim(evaluate('caller.form.minute_' & attributes.fieldname))) eq 0>
						<cfset fielderrors = 1>
						<cfif isdefined('request.coreerrormessage')>	
							<cfset request.coreerrormessage = request.coreerrormessage & #iif(attributes.caption neq '',DE(attributes.caption), DE(attributes.fieldname))# & ' #request.coreFormLanguage.coreform_reqField#<br />'>
						<cfelse>
							<cfset request.coreerrormessage = #iif(attributes.caption neq '',DE(attributes.caption), DE(attributes.fieldname))# & ' #request.coreFormLanguage.coreform_reqField#<br />'>
						</cfif>
					</cfif>
				</cfif>
			<cfelse>
				<cfif attributes.required eq 'Y' or attributes.required eq 'Yes'>
					<cfif len(trim(form["#attributes.fieldname#"])) eq 0>
						<cfset fielderrors = 1>
						<cfif isdefined('request.coreerrormessage')>	
							<cfset request.coreerrormessage = request.coreerrormessage & #iif(attributes.caption neq '',DE(attributes.caption), DE(attributes.fieldname))# & ' #request.coreFormLanguage.coreform_reqField#<br />'>
						<cfelse>
							<cfset request.coreerrormessage = #iif(attributes.caption neq '',DE(attributes.caption), DE(attributes.fieldname))# & ' #request.coreFormLanguage.coreform_reqField#<br />'>
						</cfif>
					</cfif>
				</cfif>
			</cfif>
			
			
			<!--- Check to see if it is an Integer --->
			<cfif attributes.format eq 'Int' and len(trim(evaluate(variables.formfield))) gt 0>
				<cfif not isnumeric(form["#attributes.fieldname#"])>
					<cfset fielderrors = 1>
					<cfif isdefined('request.coreerrormessage')>	
						<cfset request.coreerrormessage = request.coreerrormessage & #iif(attributes.caption neq '',DE(attributes.caption), DE(attributes.fieldname))# & ' #request.coreFormLanguage.coreform_numField#<br />'>
					<cfelse>
						<cfset request.coreerrormessage = #iif(attributes.caption neq '',DE(attributes.caption), DE(attributes.fieldname))# & ' #request.coreFormLanguage.coreform_numField#<br />'>
					</cfif>
				</cfif>
				<!--- Check MINVALUE --->
				<cfif isdefined("attributes.minvalue") and evaluate(variables.formfield) lt attributes.minvalue>
					<cfset fielderrors = 1>
					<cfif isdefined('request.coreerrormessage')>	
						<cfset request.coreerrormessage = request.coreerrormessage & #iif(attributes.caption neq '',DE(attributes.caption), DE(attributes.fieldname))# & ' #request.coreFormLanguage.coreform_minField# (' & #attributes.minvalue# & ')<br />'>
					<cfelse>
						<cfset request.coreerrormessage = #iif(attributes.caption neq '',DE(attributes.caption), DE(attributes.fieldname))# & ' #request.coreFormLanguage.coreform_minField# (' & #attributes.minvalue# & ')<br />'>
					</cfif>
				</cfif>
				<!--- Check MAXVALUE --->
				<cfif isdefined("attributes.maxvalue") and evaluate(variables.formfield) gt attributes.maxvalue>
					<cfset fielderrors = 1>
					<cfif isdefined('request.coreerrormessage')>	
						<cfset request.coreerrormessage = request.coreerrormessage & #iif(attributes.caption neq '',DE(attributes.caption), DE(attributes.fieldname))# & ' #request.coreFormLanguage.coreform_maxField# (' & #attributes.maxvalue# & ')<br />'>
					<cfelse>
						<cfset request.coreerrormessage = #iif(attributes.caption neq '',DE(attributes.caption), DE(attributes.fieldname))# & ' #request.coreFormLanguage.coreform_maxField# (' & #attributes.maxvalue# & ')<br />'>
					</cfif>
				</cfif>
			</cfif>
			<!--- Check to see if it is a DATE --->
			<cfif (attributes.format eq 'date' or attributes.format eq 'calendar') and len(trim(evaluate(variables.formfield))) gt 0>
				<cfif not isdate(form["#attributes.fieldname#"])>
					<cfset fielderrors = 1>
					<cfif isdefined('request.coreerrormessage')>	
						<cfset request.coreerrormessage = request.coreerrormessage & #iif(attributes.caption neq '',DE(attributes.caption), DE(attributes.fieldname))# & ' #request.coreFormLanguage.coreform_dateField#<br />'>
					<cfelse>
						<cfset request.coreerrormessage = #iif(attributes.caption neq '',DE(attributes.caption), DE(attributes.fieldname))# & ' #request.coreFormLanguage.coreform_dateField#<br />'>
					</cfif>
				</cfif>
				<!--- Check MINVALUE --->
				<cfif isdefined("attributes.minvalue") and evaluate(variables.formfield) lt attributes.minvalue>
					<cfset fielderrors = 1>
					<cfif isdefined('request.coreerrormessage')>	
						<cfset request.coreerrormessage = request.coreerrormessage & #iif(attributes.caption neq '',DE(attributes.caption), DE(attributes.fieldname))# & ' #request.coreFormLanguage.coreform_minField# (' & #attributes.minvalue# & ')<br />'>
					<cfelse>
						<cfset request.coreerrormessage = #iif(attributes.caption neq '',DE(attributes.caption), DE(attributes.fieldname))# & ' #request.coreFormLanguage.coreform_minField# (' & #attributes.minvalue# & ')<br />'>
					</cfif>
				</cfif>
				<!--- Check MAXVALUE --->
				<cfif isdefined("attributes.maxvalue") and evaluate(variables.formfield) gt attributes.maxvalue>
					<cfset fielderrors = 1>
					<cfif isdefined('request.coreerrormessage')>	
						<cfset request.coreerrormessage = request.coreerrormessage & #iif(attributes.caption neq '',DE(attributes.caption), DE(attributes.fieldname))# & ' #request.coreFormLanguage.coreform_maxField# (' & #attributes.maxvalue# & ')<br />'>
					<cfelse>
						<cfset request.coreerrormessage = #iif(attributes.caption neq '',DE(attributes.caption), DE(attributes.fieldname))# & ' #request.coreFormLanguage.coreform_maxField# (' & #attributes.maxvalue# & ')<br />'>
					</cfif>
				</cfif>
			</cfif>
			
			<!--- Check to see if it is an EMail --->
			<cfif attributes.format eq 'email' and len(trim(evaluate(variables.formfield))) gt 0>
				<cfif find("@",form["#attributes.fieldname#"]) eq 0 or find(".",listlast(evaluate(variables.formfield),"@")) eq 0>
					<cfset fielderrors = 1>
					<cfif isdefined('request.coreerrormessage')>	
						<cfset request.coreerrormessage = request.coreerrormessage & #iif(attributes.caption neq '',DE(attributes.caption), DE(attributes.fieldname))# & ' #request.coreFormLanguage.coreform_emailField#<br />'>
					<cfelse>
						<cfset request.coreerrormessage = #iif(attributes.caption neq '',DE(attributes.caption), DE(attributes.fieldname))# & ' #request.coreFormLanguage.coreform_emailField#<br />'>
					</cfif>
				</cfif>
			</cfif>
			<!--- Check the MAXLENGTH --->
			<cfif attributes.maxlength neq ''>
				<cfif len(trim(form["#attributes.fieldname#"])) gt attributes.maxlength>
					<cfset fielderrors = 1>
					<cfif isdefined('request.coreerrormessage')>	
						<cfset request.coreerrormessage = request.coreerrormessage & #iif(attributes.caption neq '',DE(attributes.caption), DE(attributes.fieldname))# & ' #request.coreFormLanguage.coreform_maxcharField#<br />'>
					<cfelse>
						<cfset request.coreerrormessage = #iif(attributes.caption neq '',DE(attributes.caption), DE(attributes.fieldname))# & ' #request.coreFormLanguage.coreform_maxcharField#<br />'>
					</cfif>
				</cfif>
			</cfif>
			<!--- Check the MINLENGTH --->
			<cfif attributes.minlength neq ''>
				<cfif len(trim(form["#attributes.fieldname#"])) lt attributes.minlength>
					<cfset fielderrors = 1>
					<cfif isdefined('request.coreerrormessage')>	
						<cfset request.coreerrormessage = request.coreerrormessage & #iif(attributes.caption neq '',DE(attributes.caption), DE(attributes.fieldname))# & ' #request.coreFormLanguage.coreform_mincharField#<br />'>
					<cfelse>
						<cfset request.coreerrormessage = #iif(attributes.caption neq '',DE(attributes.caption), DE(attributes.fieldname))# & ' #request.coreFormLanguage.coreform_mincharField#<br />'>
					</cfif>
				</cfif>
			</cfif>
		</cfif>
		<!--- END VALIDATION --->
		
		
<!--- figure out what the value of the form should be,
but first look to see if it is the submit button. --->
<cfif attributes.format neq 'submit' and attributes.format neq 'cancel' and attributes.format neq 'savecancel' and attributes.standalone neq 'Y' and attributes.format neq 'time'>
	<!--- form has been submitted --->
	<cfif  isdefined('form.coreformaction')>
		<cfif attributes.format neq 'radio' and attributes.format neq 'checkbox' and attributes.format neq 'likert'>
			<cfset currentfieldvalue = form["#attributes.fieldname#"]>
		<cfelse>
			<cfif isdefined(evaluate('variables.formfield'))> <!--- added for radio field --->
				<cfset currentfieldvalue = form["#attributes.fieldname#"]>
			<cfelse>
				<cfset currentfieldvalue = "">
			</cfif>
		</cfif>
	<!--- not submitted, check for query --->	
	<cfelseif isdefined('request.queryinput') 
		and #evaluate('caller.' & request.queryinput & '.' & attributes.fieldname)# eq '' 
		and isdefined('attributes.default')>
		<cfset currentfieldvalue ="#attributes.default#">
	<cfelseif isdefined('request.queryinput')>
		<cfset currentfieldvalue ="#evaluate('caller.' & request.queryinput & '.' & attributes.fieldname)#">
	<!--- nothing yet set to space --->
	<cfelseif isdefined('attributes.default')>
		<cfset currentfieldvalue ="#attributes.default#">
	<cfelse>
		<cfset currentfieldvalue = "">
	</cfif>

<cfelseif attributes.format eq 'time'>

	<cfif isdefined('form.coreformaction')><!--- THE FORM HAS BEEN SUBMITTED --->
		<cfif evaluate('caller.form.hour_' & attributes.fieldname) neq '' and 
			evaluate('caller.form.minute_' & attributes.fieldname) neq ''>
			<!--- Convert it to 24 hour format --->
			<cfif evaluate('caller.form.ampm_' & attributes.fieldname) eq 'PM'>
				<cfif evaluate('caller.form.hour_' & attributes.fieldname) eq 12>
					<cfset thehour = 12>
				<cfelse>
					<cfset thehour = evaluate('caller.form.hour_' & attributes.fieldname) + 12>
				</cfif>
			<cfelseif evaluate('caller.form.ampm_' & attributes.fieldname) eq 'AM' and evaluate('caller.form.hour_' & attributes.fieldname) eq 12>
				<cfset thehour = 0>
			<cfelse>
				<cfset thehour = evaluate('caller.form.hour_' & attributes.fieldname)>
			</cfif>
			<cfset currentfieldvalue = createtime(thehour,evaluate('caller.form.minute_' & attributes.fieldname),00)>
		<cfelse>
			<cfset currentfieldvalue = "">
		</cfif>
	<cfelseif isdefined('attributes.default')>
		<cfset currentfieldvalue ="#attributes.default#">
	<cfelseif isdefined('request.queryinput') 
		and #evaluate('caller.' & request.queryinput & '.' & attributes.fieldname)# eq '' 
		and isdefined('attributes.default')>
		<cfset currentfieldvalue ="#attributes.default#">
	<cfelseif isdefined('request.queryinput')>
		<cfset currentfieldvalue ="#evaluate('caller.' & request.queryinput & '.' & attributes.fieldname)#">
	<cfelse>
		<cfset currentfieldvalue = "">
	</cfif>
	
<cfelse>
	<cfif isdefined('form.coreformaction') and attributes.format neq 'submit' and attributes.format neq 'cancel' and attributes.format neq 'savecancel'>
		<cfset currentfieldvalue = form["#attributes.fieldname#"]>
	<cfelseif isdefined('attributes.default')>
		<cfset currentfieldvalue ="#attributes.default#">
	<cfelse>
		<cfset currentfieldvalue = "">
	</cfif>
</cfif>

<!--- If CoreForms is making the table you can highlight the caption on error --->
<cfif request.maketable eq 'Y' or request.maketable eq 'yes'>
	<cfif attributes.caption eq '' and (attributes.format neq 'submit' and attributes.format neq 'cancel' and attributes.format neq 'hidden' and attributes.format neq 'savecancel')>
	<tr><th><span style="color:red;">#request.coreFormLanguage.coreform_needCaption#</span></th><td>
	<cfelse>
		<tr><th align="right" <cfif attributes.highlight eq 'Y'> style="background-color:##CC3333;"</cfif>>
		<cfif variables.fielderrors eq 1>
			<span class="errorMsg"><label for="#attributes.fieldname#">#attributes.caption#</label></span>
		<cfelse>
			<label for="#attributes.fieldname#">#attributes.caption#</label>
		</cfif>
	</th><td<cfif attributes.highlight eq 'Y'> style="background-color:##CC3333;"</cfif> align="left">
	</cfif>
<cfelseif request.maketable eq 'css'>
	
	<cfif attributes.caption eq '' and (attributes.format neq 'submit' and attributes.format neq 'cancel' and attributes.format neq 'hidden')>
		<span style="color:red;">#request.coreFormLanguage.coreform_needCaption#</span>
	<cfelse>
		<cfif variables.fielderrors eq 1>
			<span class="errorMsg"><label for="#attributes.fieldname#">#attributes.caption#</label></span>
		<cfelse>
			<label for="#attributes.fieldname#">#attributes.caption#</label>
		</cfif>
	</cfif>
	
</cfif>
		
<cfswitch expression="#attributes.format#">
	
	<!--- TEXTAREA --->
	<cfcase value="textarea">
	
		<label for="#attributes.fieldname#">
		<textarea 
			id="#attributes.fieldname#"
			name="#attributes.fieldname#" 
			cols="#attributes.cols#"
			class="corefield_textarea"
			rows="#attributes.rows#">#currentfieldvalue#</textarea>
		</label>
		
	</cfcase>
	
		
	<!--- OTHERS --->
	<cfcase value="text,int,email,date,calendar,password,hidden,file,color">
				
		<label for="#attributes.fieldname#">
		<input 
			type="<cfif attributes.format eq 'password'>password<cfelseif attributes.format eq 'hidden'>hidden<cfelseif attributes.format eq 'file'>file<cfelse>text</cfif>" 
			id="#attributes.fieldname#"
			name="#attributes.fieldname#" 
			size="#attributes.size#"
            <cfif len(trim(attributes.maxlength)) gt 0>
			maxlength="#attributes.maxlength#"
            </cfif>
			<cfif attributes.format eq 'date' or attributes.format eq 'calendar'>
			value="#caller.viewdate(currentfieldvalue)#"
			<cfelse>
			value="#currentfieldvalue#"
			</cfif>
			class="corefield_text"
			 />
			
		</label>
		<cfif isdefined('attributes.showvalue')>
			#currentfieldvalue#
		</cfif>
	</cfcase>

	<!--- FILEX --->
	<cfcase value="filex">
				
		<label for="#attributes.fieldname#">
		<cfif currentfieldvalue neq ''>Current Value: <strong>#currentfieldvalue#</strong><br /></cfif>
		<input 
			type="file" 
			id="#attributes.fieldname#"
			name="#attributes.fieldname#" 
			size="#attributes.size#"
			class="corefield_text"
			 />
		</label>
		
	</cfcase>


	<!--- RADIO --->
	<cfcase value="radio">
		<cfset columnLoopCount = 0>		
		<cfset loopcount = 1>
		
		<cfloop list="#attributes.valuelist#" index="corei" delimiters="#attributes.altselectedvaluesdelimeter#">
			
			<label for="#attributes.fieldname#">
			<cfif isnumeric(corei)>
				<cfset loopvar = corei>
			<cfelse>
				<cfset loopvar = "'" & #corei# & "'">
			</cfif>
			
			<input type="radio"
					name="#attributes.fieldname#" 
				value="#corei#"
				<cfif currentfieldvalue eq evaluate(loopvar)> checked="checked"</cfif>
				class="corefield_radio"				
				/></label>
			<cfif isdefined('attributes.displaylist')>
				#listgetat(attributes.displaylist,loopcount,attributes.altselectedvaluesdelimeter)#
			<cfelse>
				#corei#
			</cfif>
			<cfset loopcount = loopcount + 1>
			<cfset columnLoopCount = columnLoopCount + 1>
			<cfif columnLoopCount eq listlen(attributes.valuelist)>
			       &nbsp;	
			<cfelseif columnLoopCount eq attributes.columns>
				<br><cfset columnLoopCount = 0>	
			</cfif>	
		</cfloop>	
	</cfcase>
	
	
	<!--- LIKERT --->
	<cfcase value="likert">
		<cfif attributes.likertframe eq 'full'>
		<table cellspacing="0" class="fibreLikertTable" align="left">
		<tr>
			<cfif attributes.likerttype eq "agreement">
				<td>Strongly<br>Disagree</td><td>Disagree</td><td>Not Sure</td><td>Agree</td><td>Strongly<br>Agree</td>
				<cfif attributes.noopinion eq 'Y'><td>No Opinion</td></cfif>
			<cfelseif attributes.likerttype eq "quality">
				<td>Extremely<br>Poor</td><td>Below<br>Average</td><td>Average</td>
				<td>Above<br>Average</td><cfif attributes.noopinion eq 'Y'><td>No Opinion</td></cfif>
			<cfelseif attributes.likerttype eq "importance">
				<td>Unimportant</td><td>Of Little<br>Importance</td><td>Moderately<br>Important</td>
				<td>Important</td><td>Very Important</td><cfif attributes.noopinion eq 'Y'><td>No Opinion</td></cfif>
			<cfelseif attributes.likerttype eq "frequency">
				<td>Never</td><td>Seldom</td><td>About Half<br>the Time</td>
				<td>Usually</td><td>Always</td><cfif attributes.noopinion eq 'Y'><td>No Opinion</td></cfif>
			<cfelseif attributes.likerttype eq "enjoyment">
				<td>Extremely<br>Unenjoyable</td><td>Unenjoyable</td><td>Indifferent</td><td>Enjoyable</td><td>Extremely<br>Enjoyable</td>
				<cfif attributes.noopinion eq 'Y'><td>No Opinion</td></cfif>
			<cfelse>
				<td>Strongly<br>Disagree</td><td>Disagree</td><td>Not Sure</td>
				<td>Agree</td><td>Strongly<br>Agree</td><cfif attributes.noopinion eq 'Y'><td>No Opinion</td></cfif>
			</cfif>
		</tr>
		    
		<tr>
		</cfif>	
		<cfif attributes.noopinion eq 'Y'>
			<cfset theLoopList = "1,2,3,4,5,9">
		<cfelse>
			<cfset theLoopList = "1,2,3,4,5">
		</cfif>
		<cfloop list="#theLoopList#" index="corei">
			<td align="center">
				<label for="#attributes.fieldname#">
					<input type="radio"
						name="#attributes.fieldname#" 
						value="#corei#"
						<cfif currentfieldvalue eq corei> checked="checked"</cfif>
						class="corefield_radio"				
						/>
					</label>
			</td>
		</cfloop>	
		<cfif attributes.likertframe eq 'full'>
		</tr>
		</table>
		</cfif>
	</cfcase>
	
	<!--- TIME --->
	
	<cfcase value="time">
		
		<cfif currentfieldvalue neq ''>
			<cfset hourvalue = timeformat(currentfieldvalue, "h")>
			<cfset minutevalue = timeformat(currentfieldvalue, "m")>
			<cfset ampmvalue = timeformat(currentfieldvalue,"tt")>
		<cfelse>
			<cfset hourvalue = ''>
			<cfset minutevalue = ''>
			<cfset ampmvalue = ''>
		</cfif>
		<!--- #hourvalue# #minutevalue# #ampmvalue# - #currentfieldvalue# - #thehour# --->
		<select name="hour_#attributes.fieldname#" class="corefield_select">
			<option value="">H</option>
			<cfloop from="1" to="12" index="h">
			<option value="#h#" <cfif hourvalue eq h>selected="selected"</cfif>>#h#</option>
			</cfloop>
		</select>
		<select name="minute_#attributes.fieldname#" class="corefield_select">
			<option value="">M</option>
			<cfloop from="0" to="59" step="#attributes.minuteinterval#" index="m">
			<option value="#m#" <cfif minutevalue eq m>selected="selected"</cfif>><cfif len(m) is 1>0</cfif>#m#</option>	
			</cfloop>
		</select>
		<select name="ampm_#attributes.fieldname#" class="corefield_select">
			<option value="AM" <cfif ampmvalue eq 'AM'>selected="selected"</cfif>>AM</option>
			<option value="PM" <cfif ampmvalue eq 'PM'>selected="selected"</cfif>>PM</option>
		</select>
		
		<cfif isdefined('caller.form.coreformaction')>
		<cfif len(trim(evaluate('caller.form.hour_' & attributes.fieldname))) neq 0 or  len(trim(evaluate('caller.form.minute_' & attributes.fieldname))) neq 0>
			<cfset theformfieldname = 'form.' & #attributes.fieldname#>
			<!--- <cfoutput>#theformfieldname#</cfoutput> --->
			<!--- <cfset "#theformfieldname#" = #timeformat(currentfieldvalue, "HH:MM:00tt")#> --->
			<cfset "#theformfieldname#" = #timeformat(currentfieldvalue, "HH:MM:00")#>
		</cfif>
		<!--- <cfoutput>#evaluate(theformfieldname)# - </cfoutput> --->
		</cfif>
		
	</cfcase>
	
	
	<!--- CHECKBOX --->
	<cfcase value="checkbox">
	
		<cfset thedisplaylist = "">
		<cfset thevaluelist = "">
		
		<cfif isdefined('attributes.queryname')>
			
			<cfloop from="1" to="#evaluate('caller.' & attributes.queryname & '.recordcount')#" index="i">
				<cfif isdefined('attributes.displaycolumn')>
					<cfset thedisplaylist = #listappend(thedisplaylist,evaluate('caller.' & attributes.queryname & '.' & attributes.displaycolumn & '[' & i & ']'),",")#>
					<cfset thevaluelist = #listappend(thevaluelist,evaluate('caller.' & attributes.queryname & '.' & attributes.valuecolumn & '[' & i & ']'),",")#>
				<cfelse>
					<cfset thedisplaylist = #listappend(thedisplaylist,evaluate('caller.' & attributes.queryname & '.' & attributes.displaycolumn & '[' & i & ']'),",")#>
					<cfset thevaluelist = #listappend(thevaluelist,evaluate('caller.' & attributes.queryname & '.' & attributes.valuecolumn & '[' & i & ']'),",")#>
				</cfif>
			</cfloop>
			
		<cfelse>
		
			<cfif isdefined('attributes.displaylist')>
				<cfset thedisplaylist = #attributes.displaylist#>
				<cfset thevaluelist = #attributes.valuelist#>
			<cfelse>
				<cfset thedisplaylist = #attributes.valuelist#>
				<cfset thevaluelist = #attributes.valuelist#>
			</cfif>
			
		 </cfif>				
		 <cfset columnLoopCount = 0>		
		<cfset loopcount = 1>
		<label for="#attributes.fieldname#">
		<cfloop list="#thevaluelist#" index="corei">
			<input type="checkbox"
				name="#attributes.fieldname#" 
				value="#corei#" 
				<cfif  isdefined('fieldok') or isdefined('form.coreformaction')>
					<cfif listfind(currentfieldvalue,"#corei#") gt 0> checked="checked"</cfif>
               	<cfelseif isdefined('attributes.altselectedvalues')>
	                <cfif listfind(attributes.altselectedvalues,"#corei#",attributes.altselectedvaluesdelimeter) gt 0> checked="checked"</cfif>
				</cfif>					
				> #listgetat(thedisplaylist,loopcount)#
				
			<cfset loopcount = loopcount + 1>
			<cfset columnLoopCount = columnLoopCount + 1>
			<cfif columnLoopCount eq listlen(thevaluelist)>
			       &nbsp;	 &nbsp;	 &nbsp;	
			<cfelseif columnLoopCount eq attributes.columns>
				<br><cfset columnLoopCount = 0>	
			</cfif>	
		</cfloop>	
		</label>
		
	</cfcase>
	
	<!--- SELECT --->
	<cfcase value="select">
		
		
			
		<cfset thedisplaylist = "">
		<cfset thevaluelist = "">
		<cfset thedynamicvaluelist = "">
		
		<cfif isdefined('attributes.queryname')>
			
			<cfloop from="1" to="#evaluate('caller.' & attributes.queryname & '.recordcount')#" index="i">
				<cfif isdefined('attributes.displaycolumn')>
					<cfset thedisplaylist = #listappend(thedisplaylist,evaluate('caller.' & attributes.queryname & '.' & attributes.displaycolumn & '[' & i & ']'),",")#>
					<cfset thevaluelist = #listappend(thevaluelist,evaluate('caller.' & attributes.queryname & '.' & attributes.valuecolumn & '[' & i & ']'),",")#>
				<cfelse>
					<cfset thedisplaylist = #listappend(thedisplaylist,evaluate('caller.' & attributes.queryname & '.' & attributes.displaycolumn & '[' & i & ']'),",")#>
					<cfset thevaluelist = #listappend(thevaluelist,evaluate('caller.' & attributes.queryname & '.' & attributes.valuecolumn & '[' & i & ']'),",")#>
				</cfif>
				<cfif isdefined('attributes.dynamicselect')>
					<cfset thedynamicvaluelist = #listappend(thedynamicvaluelist,evaluate('caller.' & attributes.queryname & '.' & attributes.dynamicselectfield & '[' & i & ']'),",")#>
				</cfif>
			</cfloop>
			
		<cfelse>
		
			<cfif isdefined('attributes.displaylist')>
				<cfset thedisplaylist = #attributes.displaylist#>
				<cfset thevaluelist = #attributes.valuelist#>
			<cfelse>
				<cfset thedisplaylist = #attributes.valuelist#>
				<cfset thevaluelist = #attributes.valuelist#>
			</cfif>
			
		 </cfif>
			
		<cfset loopcount = 1>
		
		<select 
			id="#attributes.fieldname#"
			name="#attributes.fieldname#"
			<cfif isdefined('attributes.multiple') and attributes.multiple eq 'Y'>
				multiple="multiple" 
			</cfif>
			<cfif isdefined('attributes.selectsize')>
				size="#attributes.selectsize#"
			</cfif>
				class="corefield_select">
			<cfif isdefined('attributes.blankselection')>
				<option value="">#attributes.blankselection#</option>
			</cfif>
			
			<cfloop delimiters="," list="#thevaluelist#" index="ii">
            	<!--- This section is just for the evaluation of the value below to see if selected --->
				<cfif isnumeric(#ii#)>
					<cfset loopvar = #ii#>
				<cfelse>
					<cfset loopvar = "'" & #ii# & "'">
				</cfif>	
				<option value="#ii#" 
				<cfif currentfieldvalue eq evaluate(loopvar)> selected="selected"
                <cfelseif isdefined('attributes.multiple') and attributes.multiple eq 'Y'>
               		<cfif isdefined('form.coreformaction')> <!--- The form has been submitted, use the selected values --->
                		<cfif listfindnocase(currentfieldvalue,ii) gt 0>
                     		selected="selected"
                    	</cfif>
					<cfelseif isdefined('attributes.altselectedvalues')>
                		<cfif listfindnocase(attributes.altselectedvalues,ii,attributes.altselectedvaluesdelimeter) gt 0>
                     		selected="selected"
                    	</cfif>
					<cfelse>
						<cfif listfindnocase(currentfieldvalue,ii) gt 0>
                     		selected="selected"
                    	</cfif>
                    </cfif>
                </cfif>>#listgetat(thedisplaylist,loopcount)#</option>
				<cfset loopcount = loopcount + 1>
			</cfloop>
   		</select>
		
	</cfcase>
	
	<!--- USStates --->
	<cfcase value="usstates">
		<cfset thedisplaylist = "Alabama,Alaska,American Samoa,Arizona,Arkansas,California,Colorado,Connecticut,Delaware,District of Columbia,Federated States of Micronesia,Florida,Georgia,Guam,Hawaii,Idaho,Illinois,Indiana,Iowa,Kansas,Kentucky,Louisiana,Maine,Marshall Islands,Maryland,Massachusetts,Michigan,Minnesota,Mississippi,Missouri,Montana,Nebraska,Nevada,New Hampshire,New Jersey,New Mexico,New York,North Carolina,North Dakota,Northern Mariana Islands,Ohio,Oklahoma,Oregon,Palau,Pennsylvania,Puerto Rico,Rhode Island,South Carolina,South Dakota,Tennessee,Texas,Utah,Vermont,Virgin Islands,Virginia,Washington,West Virginia,Wisconsin,Wyoming">
		<cfset thevaluelist = "AL,AK,AS,AZ,AR,CA,CO,CT,DE,DC,FM,FL,GA,GU,HI,ID,IL,IN,IA,KS,KY,LA,ME,MH,MD,MA,MI,MN,MS,MO,MT,NE,NV,NH,NJ,NM,NY,NC,ND,MP,OH,OK,OR,PW,PA,PR,RI,SC,SD,TN,TX,UT,VT,VI,VA,WA,WV,WI,WY">
		<cfset loopcount = 1>
		<select 
			id="#attributes.fieldname#"
			name="#attributes.fieldname#"
			<cfif isdefined('attributes.multiple') and attributes.multiple eq 'Y'>
				multiple="multiple" 
			</cfif>
			<cfif isdefined('attributes.selectsize')>
				size="#attributes.selectsize#"
			</cfif>
				class="corefield_select">
			<cfif isdefined('attributes.blankselection')>
				<option value="">#attributes.blankselection#</option>
			</cfif>
			
			<cfloop delimiters="," list="#thevaluelist#" index="ii">
				<cfif isnumeric(#ii#)>
					<cfset loopvar = #ii#>
				<cfelse>
					<cfset loopvar = "'" & #ii# & "'">
				</cfif>	
				<option value="#ii#" <cfif currentfieldvalue eq evaluate(loopvar)> selected="selected"</cfif><cfif isdefined('attributes.dynamicselect')>class="#listgetat(thedynamicvaluelist,loopcount)#"</cfif>>#listgetat(thedisplaylist,loopcount)#</option>
				<cfset loopcount = loopcount + 1>
			</cfloop>
		</select>
		
	</cfcase>
	<!--- Countries --->
	<cfcase value="countries">
		<cfset thedisplaylist = "AFGHANISTAN~ALAND ISLANDS~ALBANIA~ALGERIA~AMERICAN SAMOA~ANDORRA~ANGOLA~ANGUILLA~ANTARCTICA~ANTIGUA AND BARBUDA~ARGENTINA~
		ARMENIA~ARUBA~AUSTRALIA~AUSTRIA~AZERBAIJAN~BAHAMAS~BAHRAIN~BANGLADESH~BARBADOS~BELARUS~BELGIUM~BELIZE~BENIN~BERMUDA~BHUTAN~BOLIVIA~BOSNIA AND HERZEGOVINA~
		BOTSWANA~BOUVET ISLAND~BRAZIL~BRITISH INDIAN OCEAN TERRITORY~BRUNEI DARUSSALAM~BULGARIA~BURKINA FASO~BURUNDI~CAMBODIA~CAMEROON~CANADA~
		CAPE VERDE~CAYMAN ISLANDS~CENTRAL AFRICAN REPUBLIC~CHAD~CHILE~CHINA~CHRISTMAS ISLAND~COCOS (KEELING) ISLANDS~COLOMBIA~COMOROS~CONGO~
		CONGO, THE DEMOCRATIC REPUBLIC OF THE~COOK ISLANDS~COSTA RICA~CÔTE D'IVOIRE~CROATIA~CUBA~CYPRUS~CZECH REPUBLIC~DENMARK~DJIBOUTI~DOMINICA~
		DOMINICAN REPUBLIC~ECUADOR~EGYPT~EL SALVADOR~EQUATORIAL GUINEA~ERITREA~ESTONIA~ETHIOPIA~FALKLAND ISLANDS (MALVINAS)~FAROE ISLANDS~FIJI~
		FINLAND~FRANCE~FRENCH GUIANA~FRENCH POLYNESIA~FRENCH SOUTHERN TERRITORIES~GABON~GAMBIA~GEORGIA~GERMANY~GHANA~GIBRALTAR~GREECE~GREENLAND~
		GRENADA~GUADELOUPE~GUAM~GUATEMALA~GUERNSEY~GUINEA~GUINEA-BISSAU~GUYANA~HAITI~HEARD ISLAND AND MCDONALD ISLANDS~HOLY SEE (VATICAN CITY STATE)~
		HONDURAS~HONG KONG~HUNGARY~ICELAND~INDIA~INDONESIA~IRAN, ISLAMIC REPUBLIC OF~IRAQ~IRELAND~ISLE OF MAN~ISRAEL~ITALY~JAMAICA~JAPAN~JERSEY~
		JORDAN~KAZAKHSTAN~KENYA~KIRIBATI~KOREA, DEMOCRATIC PEOPLE'S REPUBLIC OF~KOREA, REPUBLIC OF~KUWAIT~KYRGYZSTAN~LAO PEOPLE'S DEMOCRATIC REPUBLIC~
		LATVIA~LEBANON~LESOTHO~LIBERIA~LIBYAN ARAB JAMAHIRIYA~LIECHTENSTEIN~LITHUANIA~LUXEMBOURG~MACAO~MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF~
		MADAGASCAR~MALAWI~MALAYSIA~MALDIVES~MALI~MALTA~MARSHALL ISLANDS~MARTINIQUE~MAURITANIA~MAURITIUS~MAYOTTE~MEXICO~MICRONESIA, FEDERATED STATES OF~
		MOLDOVA~MONACO~MONGOLIA~MONTENEGRO~MONTSERRAT~MOROCCO~MOZAMBIQUE~MYANMAR~NAMIBIA~NAURU~NEPAL~NETHERLANDS~NETHERLANDS ANTILLES~NEW CALEDONIA~
		NEW ZEALAND~NICARAGUA~NIGER~NIGERIA~NIUE~NORFOLK ISLAND~NORTHERN MARIANA ISLANDS~NORWAY~OMAN~PAKISTAN~PALAU~PALESTINIAN TERRITORY, OCCUPIED~
		PANAMA~PAPUA NEW GUINEA~PARAGUAY~PERU~PHILIPPINES~PITCAIRN~POLAND~PORTUGAL~PUERTO RICO~QATAR~RÉUNION~ROMANIA~RUSSIAN FEDERATION~RWANDA~SAINT BARTHELEMY~
		SAINT HELENA~SAINT KITTS AND NEVIS~SAINT LUCIA~SAINT MARTIN~SAINT PIERRE AND MIQUELON~SAINT VINCENT AND THE GRENADINES~SAMOA~SAN MARINO~
		SAO TOME AND PRINCIPE~SAUDI ARABIA~SENEGAL~SERBIA~SEYCHELLES~SIERRA LEONE~SINGAPORE~SLOVAKIA~SLOVENIA~SOLOMON ISLANDS~SOMALIA~SOUTH AFRICA~
		SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS~SPAIN~SRI LANKA~SUDAN~SURINAME~SVALBARD AND JAN MAYEN~SWAZILAND~SWEDEN~SWITZERLAND~
		SYRIAN ARAB REPUBLIC~TAIWAN, PROVINCE OF CHINA~TAJIKISTAN~TANZANIA, UNITED REPUBLIC OF~THAILAND~TIMOR-LESTE~TOGO~TOKELAU~TONGA~TRINIDAD AND TOBAGO~
		TUNISIA~TURKEY~TURKMENISTAN~TURKS AND CAICOS ISLANDS~TUVALU~UGANDA~UKRAINE~UNITED ARAB EMIRATES~UNITED KINGDOM~UNITED STATES~
		UNITED STATES MINOR OUTLYING ISLANDS~URUGUAY~UZBEKISTAN~VANUATU~VENEZUELA~VIET NAM~VIRGIN ISLANDS, BRITISH~VIRGIN ISLANDS, U.S.~WALLIS AND FUTUNA~
		WESTERN SAHARA~YEMEN~ZAMBIA~ZIMBABWE">
		<cfset thevaluelist = "AF~AX~AL~DZ~AS~AD~AO~AI~AQ~AG~AR~AM~AW~AU~AT~AZ~BS~BH~BD~BB~BY~BE~BZ~BJ~BM~BT~BO~BA~BW~BV~BR~IO~BN~BG~BF~BI~KH~CM~CA~CV~KY~CF~TD~CL~CN~CX~CC~CO~KM~CG~CD~CK~CR~CI~HR~CU~CY~CZ~DK~DJ~DM~DO~EC~EG~SV~GQ~ER~EE~ET~FK~FO~FJ~FI~FR~GF~PF~TF~GA~GM~GE~DE~GH~GI~GR~GL~GD~GP~GU~GT~GG~GN~GW~GY~HT~HM~VA~HN~HK~HU~IS~IN~ID~IR~IQ~IE~IM~IL~IT~JM~JP~JE~JO~KZ~KE~KI~KP~KR~KW~KG~LA~LV~LB~LS~LR~LY~LI~LT~LU~MO~MK~MG~MW~MY~MV~ML~MT~MH~MQ~MR~MU~YT~MX~FM~MD~MC~MN~ME~MS~MA~MZ~MM~NA~NR~NP~NL~AN~NC~NZ~NI~NE~NG~NU~NF~MP~NO~OM~PK~PW~PS~PA~PG~PY~PE~PH~PN~PL~PT~PR~QA~RE~RO~RU~RW~BL~SH~KN~LC~MF~PM~VC~WS~SM~ST~SA~SN~RS~SC~SL~SG~SK~SI~SB~SO~ZA~GS~ES~LK~SD~SR~SJ~SZ~SE~CH~SY~TW~TJ~TZ~TH~TL~TG~TK~TO~TT~TN~TR~TM~TC~TV~UG~UA~AE~GB~US~UM~UY~UZ~VU~VE~VN~VG~VI~WF~EH~YE~ZM~ZW">
		<cfset loopcount = 1>
		<select 
			id="#attributes.fieldname#"
			name="#attributes.fieldname#"
			<cfif isdefined('attributes.multiple') and attributes.multiple eq 'Y'>
				multiple="multiple" 
			</cfif>
			<cfif isdefined('attributes.selectsize')>
				size="#attributes.selectsize#"
			</cfif>
				class="corefield_select">
			<cfif isdefined('attributes.blankselection')>
				<option value="">#attributes.blankselection#</option>
			</cfif>
			
			<cfloop delimiters="~" list="#thevaluelist#" index="ii">
				<cfif isnumeric(#ii#)>
					<cfset loopvar = #ii#>
				<cfelse>
					<cfset loopvar = "'" & #ii# & "'">
				</cfif>	
				<option value="#ii#" <cfif currentfieldvalue eq evaluate(loopvar)> selected="selected"</cfif><cfif isdefined('attributes.dynamicselect')>class="#listgetat(thedynamicvaluelist,loopcount)#"</cfif>>#listgetat(thedisplaylist,loopcount,"~")#</option>
				<cfset loopcount = loopcount + 1>
			</cfloop>
		</select>
		
	</cfcase>


	<!--- SUBMIT BUTTON --->
	<cfcase value="submit">
		<cfoutput>
		
		<label for="#attributes.fieldname#">
		<input type="Submit" 
			id="#attributes.fieldname#"
			name="#attributes.fieldname#"
			<!--- onClick="this.disabled=true; this.value='Saving...'; this.form.submit();" --->
			<cfif not isdefined('attributes.value')>
			value=" Save "
			<cfelse>
			value="   #attributes.value#   "
			</cfif>
			class="corefield_button" />
		</label>
		
		</cfoutput>
	</cfcase>

	<!--- CANCEL BUTTON --->
	<cfcase value="cancel">
		<cfoutput>
		<label for="Cancel">
		<input type="Submit" 
			id="Cancel"
			name="Cancel"
			value="  Cancel  " 
			class="corefield_button" />
			
		
		</label>
		</cfoutput>
		<!--- THE FORM HAS BEEN CANCELLED SEND IT TO THE LOCATION ATTRIBUTE --->
		<cfif isdefined('caller.form.cancel')>
			<cflocation addtoken="no" url="#attributes.location#">
		</cfif>
		
	</cfcase>
	
	<!--- SUBMIT AND CANCEL BUTTON --->
	<cfcase value="savecancel">
		<cfoutput>
		<label for="save">
		<input type="Submit" 
			id="Save"
			name="Save"
			value="   Save   "
			class="corefield_button" />
		</label>	
		&nbsp; &nbsp;
		<label for="Cancel">
		<input type="Submit" 
			id="Cancel"
			name="Cancel"
			value="  Cancel  " 
			class="corefield_button" />
		</label>
		</cfoutput>
		<!--- THE FORM HAS BEEN CANCELLED SEND IT TO THE LOCATION ATTRIBUTE --->
		<cfif isdefined('caller.form.cancel')>
			<cflocation addtoken="no" url="#attributes.location#">
		</cfif>
		
	</cfcase>
	
	<!--- FCKEditor --->
	<cfcase value="fckeditor">
		<cfmodule 
			template="/FibreFiles/Fibre_fckeditor/fckeditor.cfm"
			basePath="/FibreFiles/Fibre_fckeditor/"
			instanceName="#attributes.fieldname#"
			toolbarset="#attributes.toolbar#"
			value="#currentfieldvalue#"
			width="#attributes.width#"
			height="#attributes.height#"
				>
	</cfcase>
</cfswitch>
		
		
		
	<!--- CALENDAR BUTTON --->
	<cfif attributes.format eq 'calendar'>
		<cfset request.showCalendarPopup = 1>
		<img 
			src="#caller.coreformimages#Calendar2.png"
			alt="Calendar Popup Selector" 
			width="19" height="20"
			align="absmiddle"
			title="Calendar Popup Selector"
			id="#attributes.fieldname#_trigger"
			/>
		
		<script type="text/javascript">
    	Calendar.setup({
        inputField     :    "#attributes.fieldname#",     // id of the input field
        ifFormat       :    "%m/%d/%Y",      // format of the input field
        button         :    "#attributes.fieldname#_trigger",  // trigger for the calendar (button ID)
        align          :    "Bl",           // alignment (defaults to "Bl")
        singleClick    :    true
   		 });
		</script>
		
	</cfif>
	
	<!--- COLOR BUTTON --->
	<cfif attributes.format eq 'color'>
	<img 
			src="#caller.coreformimages#Color.png"
			alt="Color Popup Selector" 
			width="20" height="20"
			align="absmiddle"
			title="Calendar Popup Selector"
			onclick="window.open('#caller.coreformpopups#Color_Popup.cfm?header=N&formname=#request.formname#&fieldname=#attributes.fieldname#&startdate=#currentfieldvalue#','Color','width=250,height=420,menubar=no,status=no,location=no,toolbar=no,scrollbars=no,left=515,top=412')"
		 	 />
	</cfif>
	
	<!--- HELP BUTTON --->
	<cfif attributes.helpmsg neq ''>
		 <span title="cssbody=[corefield_popupbody] cssheader=[corefield_popupheader] header=[Help:] body=[#attributes.helpmsg#]">
		 <img src="#caller.coreformimages#help.png"
			alt="Help"
			width="15" height="20"
			align="absmiddle"
			border="0"
			 /></span>
		<cfset request.showHelpPopup = 1>
	</cfif>

	<!--- SHOWTIP --->
	<cfif isdefined('attributes.showtip')>
		<cfif (attributes.format eq 'calendar' or  attributes.format eq 'date') and attributes.showtip eq 'Y'>
			(m/d/yyyy)
		</cfif>
		<cfif isdefined('attributes.minvalue')>(min: #attributes.minvalue#)</cfif>
		<cfif isdefined('attributes.maxvalue')>(max: #attributes.maxvalue#)</cfif>
	</cfif>
				
	<!--- REQUIRED FLAG --->
	<cfif attributes.required eq 'Y' or attributes.required eq 'Yes'>
		<span  class="errorMsg" title="Required">*</span>
		<cfset request.coreformrequired = "Yes">
	</cfif>	
		
	<!--- ERROR FLAG --->
	<cfif variables.fielderrors eq 1>
		<span class="errorMsg" title="Error">( #request.coreFormLanguage.coreform_error# )</span>
		<cfset request.coreformerrors = "Yes">
	</cfif>
	
	
	<cfif request.maketable eq 'Y' or request.maketable eq 'yes'>
		</td></tr>
	<cfelseif request.maketable eq 'css'>
		<br>
	</cfif>
	
	<cfset newStructRow = structnew()>
	<cfset newStructRow.field = attributes.fieldname>
	<cfset newStructRow.format = attributes.format>
	<cfset newStructRow.required = attributes.required>
	<cfset newStructRow.caption = attributes.caption>
	<cfset newStructRow.helpmsg = attributes.helpmsg>
	<cfset newArrayRow = arraylen(request.coreFormInfoArray) + 1>
	<cfset request.coreFormInfoArray[#newArrayRow#] = newStructRow>
	
	</cfoutput>	

</cfif>
</cfprocessingdirective>