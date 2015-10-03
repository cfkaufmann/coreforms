<html>
<head>
	<title>coreforms Help</title>
	<style type="text/css">
	body { margin:0px; font-family: arial; font-size: .9em; }
	.mainTable { width:100%; }
	.mainTable td { padding:4px; }
	.innertable { width:100%; border:1px solid #000; background:#fff; font-size:.9em; }
	.innertable td, .innertable th { padding: 2px; border-bottom: 1px solid #666; border-right: 1px solid #666; }
	.innertable th { background-color: #fdf075;  }
	.maintableside {background-color: #aefa98;  }
	
	</style>
</head>


</html>

<cfparam name="url.request" default="">
<cfparam name="url.format" default="">

<h1>CoreForms Help</h1>


<table cellspacing="0" class="mainTable">
<tr valign="top">
	<td class="maintableside" width="120">
	Menu<br>
	<a href="index.cfm?request=coreform">coreform</a><br>
	<a href="index.cfm?request=corefield">corefield</a><br>
	<a href="index.cfm?request=coredirections">coredirections</a><br>
	<a href="index.cfm?request=corerule">corerule</a><br>
	<a href="index.cfm?request=coretable">coretable</a><br>
	</td>
	<td>
	
	<cfswitch expression="#url.request#">
	<cfcase value="coreform">
		<cfinclude template="coreform_help.cfm"></cfcase>
	<cfcase value="corefield">
		<cfinclude template="corefield_help.cfm"></cfcase>
	<cfcase value="coredirections">
		<cfinclude template="coredirections_help.cfm"></cfcase>
	<cfcase value="corerule">
		<cfinclude template="corerule_help.cfm"></cfcase>
	<cfcase value="coretable">
		<cfinclude template="coretable_help.cfm"></cfcase>
	<cfdefaultcase>
		<cfinclude template="default.cfm">
	</cfdefaultcase>
	</cfswitch>
	
	
	
	
	
	</td>
</tr>
</table>