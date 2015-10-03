<cfset selected_colors = queryNew("hexcode,color")>
<cfset queryAddRow(selected_colors)>
<cfset querySetCell(selected_colors,"hexcode","000000")>
<cfset querySetCell(selected_colors,"color","Black")>
<cfset queryAddRow(selected_colors)>
<cfset querySetCell(selected_colors,"hexcode","009900")>
<cfset querySetCell(selected_colors,"color","Green")>