<cfif isdefined("url.send")>

	<cfoutput>
		<script type="text/javascript" language="JavaScript"> 
		   window.opener.document.getElementById('#url.fieldname#').value='#url.day#';
		</script> 
	</cfoutput>
	
    	<script type="text/javascript" language="JavaScript">
	     	window.close()
	</script> 
	
<cfelse>
		
		<cfset formname = '#url.formname#'>
		<cfset fieldname = '#url.fieldname#'>
		<cfset startyear = year(now()) - 10>
		<cfset endyear = year(now()) + 10>
		

		<CFHEADER NAME = "Expires" VALUE = "#Now()#">
		
		<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
		<HTML>
		<HEAD>
			<TITLE>Calendar</TITLE>
		    <style type="text/css">
		<!--
		body {
			font-family: "Times New Roman", Times, serif;
			background-color: #CCCCCC;
			margin: 0px;
			border: 0px;
			font-size:.9em;
		}
		td {
			font-size:.9em;
		}
		-->
		    </style>
		</HEAD>
		<BODY>
			
		<!--- Set the month and year parameters to equal the current values if they do not exist. --->	
		<!--- <SCRIPT LANGUAGE = "JavaScript">
		eval("self.opener.document." + FormName + "." + FieldName + ".value = DateToShow");
		</SCRIPT> --->
		<!---  <cfoutput>#url.StartDate#</cfoutput> --->  
		<cfif ParameterExists(url.StartDate) and IsDate(url.StartDate)>
				<CFPARAM NAME = "month" DEFAULT = "#DatePart('m', url.StartDate)#">
				<CFPARAM NAME = "year" DEFAULT = "#DatePart('yyyy', url.StartDate)#">
		<cfelse>
				<CFPARAM NAME = "month" DEFAULT = "#DatePart('m', Now())#">
				<CFPARAM NAME = "year" DEFAULT = "#DatePart('yyyy', Now())#">
		</cfif>  		
		
		
		<!--- Set the requested (or current) month/year date and determine the number of days in the month. --->
		<CFSET ThisMonthYear = CreateDate(year, month, '1')>
		<CFSET Days = DaysInMonth(ThisMonthYear)>
		
		<!--- Set the values for the previous and next months for the back/next links. --->
		<CFSET LastMonthYear = DateAdd('m', -1, ThisMonthYear)>
		<CFSET LastMonth = DatePart('m', LastMonthYear)>
		<CFSET LastYear = DatePart('yyyy', LastMonthYear)>
		
		<CFSET NextMonthYear = DateAdd('m', 1, ThisMonthYear)>
		<CFSET NextMonth = DatePart('m', NextMonthYear)>
		<CFSET NextYear = DatePart('yyyy', NextMonthYear)>
		
		<TABLE BORDER = "0" align="center" width="100%" cellpadding="1" cellspacing="1" bgcolor="#000000">
			<TR bgcolor="#96A3D6">
			<form action="#cgi.script_name#" method="get">
				<TD ALIGN = "center">
					<!--- Display the current month/year as well as the back/next links. --->
					<CFOUTPUT>
						<SPAN>
							<NOBR>
							<A HREF = "#cgi.script_name#?month=#LastMonth#&year=#LastYear#&FormName=#FormName#&FieldName=#FieldName#&header=No">
							&lt;&lt;</A>&nbsp;&nbsp;
							
							<!--- #MonthAsString(month)# --->
							
							
							
							
							<select name="month" onChange="this.form.submit()">
								<option value="1"<cfif month eq 1> SELECTED</cfif>>Jan</option>
								<option value="2"<cfif month eq 2> SELECTED</cfif>>Feb</option>
								<option value="3"<cfif month eq 3> SELECTED</cfif>>Mar</option>
								<option value="4"<cfif month eq 4> SELECTED</cfif>>Apr</option>
								<option value="5"<cfif month eq 5> SELECTED</cfif>>May</option>
								<option value="6"<cfif month eq 6> SELECTED</cfif>>June</option>
								<option value="7"<cfif month eq 7> SELECTED</cfif>>July</option>
								<option value="8"<cfif month eq 8> SELECTED</cfif>>Aug</option>
								<option value="9"<cfif month eq 9> SELECTED</cfif>>Sept</option>
								<option value="10"<cfif month eq 10> SELECTED</cfif>>Oct</option>
								<option value="11"<cfif month eq 11> SELECTED</cfif>>Nov</option>
								<option value="12"<cfif month eq 12> SELECTED</cfif>>Dec</option>
							</select>
							<select name="year" onChange="this.form.submit()">
								<cfloop from="#startyear#" to="#endyear#" index="y">
									<option value="#Y#"<cfif y eq Year> SELECTED</cfif>>#Y#</option>
								</cfloop>
							</select>
							<input type="Hidden" name="header" value="No" />
							<!--- <input type="Hidden" name="month" value="#month#" /> --->
							<input type="Hidden" name="FormName" value="#FormName#" />
							<input type="Hidden" name="FieldName" value="#FieldName#" />
							
							&nbsp;&nbsp;
							<A HREF = "#cgi.script_name#?month=#NextMonth#&year=#NextYear#&FormName=#FormName#&FieldName=#FieldName#&header=No">
							&gt;&gt;</A>
							
						</SPAN>
					</CFOUTPUT>
					</td></form></tr>
					<tr><td>
					<TABLE BORDER = "0" align="center" width="100%" cellpadding="2" cellspacing="1" bgcolor="#000000">
						<!--- Display the day of week headers.  I've truncated the values to display only the first three letters  --->
						<!--- of each day of the week.  --->
						<TR bgcolor="#cccccc">
							<CFLOOP FROM = "1" TO = "7" INDEX = "LoopDay">
								<CFOUTPUT>
									<TD ALIGN = "center">#Left(DayOfWeekAsString(LoopDay), 1)#</TD>
								</CFOUTPUT>
							</CFLOOP>
						</TR>
						
						<!--- Set the ThisDay variable to 0.  This value will remain 0 until the day of the week on which the --->
						<!--- first day of the month falls on is reached. --->
						<CFSET ThisDay = 0>
						
						<!--- Loop through until the number of days in the month is reached.  --->
						<CFLOOP CONDITION = "ThisDay LTE Days">
							<TR bgcolor="#ffffff">
							<!--- Loop through each day of the week. --->
							<CFLOOP FROM = "1" TO = "7" INDEX = "LoopDay">
								<!--- If ThisDay is still 0, check to see if the current day of the week in the loop --->
								<!--- matches the day of the week for the first day of the month. --->
								<!--- If the values match, set ThisDay to 1. --->
								<!--- Otherwise, the value will remain 0 until the correct day of the week is found. --->
								<CFIF ThisDay IS 0>
									<CFIF DayOfWeek(ThisMonthYear) IS LoopDay>
										<CFSET ThisDay = 1>
									</CFIF>
								</CFIF>
								<!--- If the ThisDay value is still 0, or it is greater than the number of days in the month, --->
								<!--- display nothing in the column. --->
								<!--- Otherwise, display the day of the month and increment the value. --->
								<CFIF (ThisDay IS NOT 0) AND (ThisDay LTE Days)>
									<CFOUTPUT>
										<cfset thecurrentdate = #createdate(year, month,ThisDay)#>
										<TD ALIGN="center" <cfif dateformat(thecurrentdate) eq dateformat(now())>bgcolor="##9999ff"<cfelseif DayOfWeek(thecurrentdate) is 1 or DayOfWeek(thecurrentdate) is 7>bgcolor="##ffffcc"</cfif>>
											<A HREF="#cgi.script_name#?header=no&send=Yes&day=#month#/#ThisDay#/#year#&FormName=#FormName#&FieldName=#FieldName#" target="_self">#ThisDay#</A>
										</TD>
									</CFOUTPUT>
									<CFSET ThisDay = ThisDay + 1>
								<CFELSE>
									<TD>&nbsp;</TD>
								</CFIF>
							</CFLOOP>
							</TR>
						</CFLOOP>
					</TABLE>
				</TD>
			</TR>
		</TABLE>
		</BODY>
		</HTML>
</cfif>
<div align="center">
<cfoutput><A HREF="#cgi.script_name#?header=no&month=#month(now())#&year=#year(now())#&FormName=#FormName#&FieldName=#FieldName#">Current Month</A></cfoutput></div>

