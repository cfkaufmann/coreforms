<cfif isdefined("url.color")>
	<cfoutput>
		<script type="text/javascript" language="JavaScript"> 
		   window.opener.document.getElementById('#url.fieldname#').value='###url.color#';
		</script> 
	</cfoutput>
    	<script type="text/javascript" language="JavaScript">
	     	window.close()
	</script> 
<cfelse>
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>Color Selector</title>
	<style type="text/css">
<!--
body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 0.7em;
}
-->
    </style>
	</head>
	<body style="background-color:#000000; margin:0px;">
	<cfset hex="00,33,66,CC,FF">
	<table width="100%" height="100%" cellpadding="0" cellspacing="2" border="0">
	<!--- start rr loop --->
	<cfloop index="red" list="#hex#">
		<!--- start gg loop --->
		<cfloop index="green" list="#hex#">
			<tr>
			<!--- start bb loop --->
			<cfloop index="blue" list="#hex#">
			<cfset rgb=red&green&blue>
			<cfoutput>
			<td bgcolor="###rgb#"><a href="Color_Popup.cfm?fieldname=#url.fieldname#&color=#rgb#&header=N"><img src="../images/shim.gif" height="12" width="32" border="0" alt="#rgb#" title="#rgb#" style="color:black;" /></a></td>
			</cfoutput>
			</cfloop>
			</tr>
		</cfloop>
	</cfloop>
	</table>
	</body>
	</html>
</cfif>
