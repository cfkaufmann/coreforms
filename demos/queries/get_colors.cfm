<cfset get_colors = queryNew("hexcode,color")>

<cfset queryAddRow(get_colors)>
<cfset querySetCell(get_colors,"hexcode","FFFFFF")>
<cfset querySetCell(get_colors,"color","White")>
<cfset queryAddRow(get_colors)>
<cfset querySetCell(get_colors,"hexcode","000000")>
<cfset querySetCell(get_colors,"color","Black")>
<cfset queryAddRow(get_colors)>
<cfset querySetCell(get_colors,"hexcode","FFFF00")>
<cfset querySetCell(get_colors,"color","Red")>
<cfset queryAddRow(get_colors)>
<cfset querySetCell(get_colors,"hexcode","009900")>
<cfset querySetCell(get_colors,"color","Green")>
<cfset queryAddRow(get_colors)>
<cfset querySetCell(get_colors,"hexcode","993399")>
<cfset querySetCell(get_colors,"color","Violet")>

