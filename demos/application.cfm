<cfapplication name="coreFormTestArea" sessionmanagement="no" clientmanagement="no">

<!--- include the coreForm stuff --->
<cfset coreformstyle = "default">   <!--- OrangeBreeze, SkyBlue --->
<cfinclude template="/coreforms/coreFormIncludes.cfm">
<!--- include the coreForm stuff --->

<cfparam name="url.header"  default="Yes">

<cfif url.header eq 'Yes'>
	<cfinclude template="header.cfm">
	<div align="center">[<a href="index.cfm">Demo Home</a>]</div>
</cfif>

<cfinclude template="#cgi.SCRIPT_NAME#">


<cfif url.header eq 'Yes'>
	<cfinclude template="footer.cfm">
</cfif>


<cfabort>

