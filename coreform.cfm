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
<cfswitch expression="#ThisTag.ExecutionMode#">
	<cfcase value="start">

		<cfparam name="attributes.allowfile" default="N">
		<cfparam name="attributes.maketable" default="N">
        <cfparam name="attributes.wysiwygEditor" default="N">
		<cfset request.maketable = attributes.maketable>
		<cfset request.showCalendarPopup = 0>
		<cfset request.showHelpPopup = 0>
		<cfset request.coreFormInfoArray = arraynew(1)>
		
		<!--- CHECK FOR FORMNAME --->
		<cfif not isdefined('attributes.formname')>
			<cfoutput>You need to specify a formname in the Form Wrapper attributes.</cfoutput>
			<cfabort>
		<cfelse>
			<cfset request.formname = #attributes.formname#>
		</cfif>
		
		<!--- check to see if the end tag was supplied --->
		<cfif not thistag.hasEndTag>
			<cfthrow message="You need to have an end tag for CoreForm">
		</cfif>
		
				
		<cfif isdefined('attributes.queryinput')>
			<cfset request.queryinput = #attributes.queryinput#>
		</cfif>
		 
		<cfparam name="caller.coreformstyle" default="default">
		<cfsavecontent variable="corejavascript">
			<cfoutput> 
			<link href="#request.coreFormWebRootPath#style/#caller.coreformstyle#/coreform_style.css" rel="stylesheet" type="text/css" />
			<script src='#request.coreFormWebRootPath#javascript/popup.js'></script>
			</cfoutput>
		</cfsavecontent>
		<cfhtmlhead text="#corejavascript#">

		
		<cfoutput>
			<form action="#cgi.script_name#<cfif cgi.QUERY_STRING neq ''>?#cgi.QUERY_STRING#</cfif>" 	
				method="post"
				name="#attributes.formname#" 
				<cfif attributes.allowfile eq 'Y' or attributes.allowfile eq 'yes'> enctype="multipart/form-data"</cfif>>
		<cfif attributes.maketable eq 'Y' or attributes.maketable eq 'yes'>
			<div align="center">
			<table align="center" cellspacing="0" class="coreformtablestyle">
		</cfif>
		
		</cfoutput>
			
	</cfcase>

	<!--- Now the bottom part of the form --->
	<cfcase value="end">
				<cfoutput>
			    <cfif attributes.maketable eq 'Y' or attributes.maketable eq 'yes'>
					</table>
					</div>
				</cfif>
					<input type="hidden" name="coreformaction" value="verify" />
			    	</form>
			    </cfoutput>
			    
			    <!--- REQUIRED FIELD DESCRIPTIVE NOTICE --->
			    <cfif isdefined("request.coreformrequired")>
				    <div align="center"><span class="errorMsg">*</span> 
				    <span class="coreformtext">
					<cfoutput>#request.coreFormLanguage.coreform_briefError2#</cfoutput></span>
					</div>
				</cfif>
				
				<!--- BRIEF ERROR MESSAGE --->
			    <cfif isdefined("request.coreformerrors")>
				    <div align="center"><span class="errorMsg"><cfoutput>( #request.coreFormLanguage.coreform_error# )</span> 
				    <span class="coreformtext">#request.coreFormLanguage.coreform_briefError#</span></cfoutput></div>
				    	<cfset request.isformvalid = 'NO'> <!--- USED FOR ACTION PART OF PAGE --->
				<cfelse>
					<cfset request.isformvalid = 'OK'> <!--- USED FOR ACTION PART OF PAGE --->
				</cfif>
				
				<!--- DESCRIPTIVE ERROR MESSAGES --->
			    <cfif isdefined("request.coreerrormessage")>
				    <div id="coreerrormessage" align="center" style="border:1px dashed grey;margin-right:100px;margin-left:100px;"> 
						<cfoutput>
						<span class="errorMsg">( #request.coreFormLanguage.coreform_error# )</span><br />
				    	<span class="coreformtext">#request.coreerrormessage#</span>
						</cfoutput>
				    </div>
					<p>&nbsp;</p>
				</cfif>
				
				<!--- Set all the stuff in the header for the popup calendar --->
				<cfif request.showCalendarPopup eq 1>
					<cfsavecontent variable="theVariable2">
						<!-- calendar stylesheet -->
  						<link rel="stylesheet" type="text/css" media="all" href="<cfoutput>#request.coreFormWebRootPath#</cfoutput>calendar/calendar-system.css" title="blue" />
					 	<!-- main calendar program -->
  						<script type="text/javascript" src="<cfoutput>#request.coreFormWebRootPath#</cfoutput>calendar/calendar.js"></script>
  						<!-- language for the calendar -->
  						<script type="text/javascript" src="<cfoutput>#request.coreFormWebRootPath#</cfoutput>calendar/lang/calendar-en.js"></script>
  						<script type="text/javascript" src="<cfoutput>#request.coreFormWebRootPath#</cfoutput>calendar/calendar-setup.js"></script>

					</cfsavecontent>
					<cfhtmlhead text="#theVariable2#">
				</cfif>
                
                <!--- Put the Javascript in the head for TinyMCE --->
				<cfif attributes.wysiwygeditor eq 'Y'>
                <cfsavecontent variable="theVariable3">
                <!-- TinyMCE -->
					<script type="text/javascript" src="<cfoutput>#request.coreFormWebRootPath#</cfoutput>tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
					<script type="text/javascript">
						tinyMCE.init({
						mode : "textareas",
						theme : "simple"
						});
					</script>
				<!-- /TinyMCE -->
                </cfsavecontent>
                <cfhtmlhead text="#theVariable3#">
                </cfif>
                
				<!--- Set the javascript for the popup help message --->
			    <cfif request.showHelpPopup eq 1>	
					<script src="<cfoutput>#request.coreFormWebRootPath#</cfoutput>javascript/boxover.js"></script>
				</cfif>
				
			  	<!--- DEBUG AREA --->
			    <cfif isdefined('attributes.debug') and attributes.debug eq 'Y'>
			    <cfdump var="#form#">
			     <br />
			    <cfdump var="#url#">
			     <br />
			    <cfdump var="#variables#">
			    </cfif>
			  	<!--- END DEBUG AREA ---> 
			  
			  	<!--- FORM DOCUMENTATION --->
			  	<cfif isdefined('url.showCoreFormInfo')>
				<div style="font-family:Arial, Helvetica, sans-serif; font-size:80%;">
				<h2>Core Form Documentation:</h2>
				<cfoutput>
				<cfif isdefined('attributes.forminfo')>
					<strong>Form Information:</strong><br />
					<cfif isdefined('attributes.forminfo')><p>#attributes.forminfo#</p></cfif>
					<strong>Page Name:</strong> #cgi.SCRIPT_NAME#<br />
					<br />
				</cfif>
				<table cellpadding="2" width="80%">
				<cfloop from="1" to="#arraylen(request.coreFormInfoArray)#" index="jkl">
					<tr>
					<td colspan="2">
					<h3 style="background-color:##999999; margin:2px; padding:2px;">Field: #request.coreFormInfoArray[jkl].field#</h3>
					</td>
					</tr>
					<cfif len(trim(request.coreFormInfoArray[jkl].caption))gt 0>
					<tr><th align="right">Caption:</th><td>#request.coreFormInfoArray[jkl].caption#</td></tr>
					</cfif>
					<tr><th align="right">Format:</th><td>#request.coreFormInfoArray[jkl].format#</td></tr>
					<tr><th align="right">Required:</th><td>#request.coreFormInfoArray[jkl].required#</td></tr>
					<cfif len(trim(request.coreFormInfoArray[jkl].helpmsg))gt 0>
					<tr><th align="right">Help Message:</th><td>#request.coreFormInfoArray[jkl].helpmsg#</td></tr>
					</cfif>
				</cfloop>
					</table>
					</cfoutput>
					</div>
					<p>&nbsp;</p>
				</cfif>
				<!--- END FORM DOCUMENTATION --->
          <p>&nbsp;</p>
	</cfcase>
</cfswitch>
