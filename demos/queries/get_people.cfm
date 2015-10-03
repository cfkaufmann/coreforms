<cfset get_people = queryNew("id,firstname,lastname,title,status,dob,color")>

<cfset queryAddRow(get_people)>
<cfset querySetCell(get_people,"id","1")>
<cfset querySetCell(get_people,"firstname","John")>
<cfset querySetCell(get_people,"lastname","Wayne")>
<cfset querySetCell(get_people,"title","Actor")>
<cfset querySetCell(get_people,"status","A")>
<cfset querySetCell(get_people,"dob","1945-02-23")>

<cfset queryAddRow(get_people)>
<cfset querySetCell(get_people,"id","2")>
<cfset querySetCell(get_people,"firstname","Neil")>
<cfset querySetCell(get_people,"lastname","Armstrong")>
<cfset querySetCell(get_people,"title","Astronat")>
<cfset querySetCell(get_people,"status","A")>
<cfset querySetCell(get_people,"dob","1945-02-23")>

<cfset queryAddRow(get_people)>
<cfset querySetCell(get_people,"id","3")>
<cfset querySetCell(get_people,"firstname","Jimmy")>
<cfset querySetCell(get_people,"lastname","Carter")>
<cfset querySetCell(get_people,"title","President")>
<cfset querySetCell(get_people,"status","A")>
<cfset querySetCell(get_people,"dob","1945-02-23")>

<cfset queryAddRow(get_people)>
<cfset querySetCell(get_people,"id","4")>
<cfset querySetCell(get_people,"firstname","James")>
<cfset querySetCell(get_people,"lastname","Bond")>
<cfset querySetCell(get_people,"title","Secret Agent")>
<cfset querySetCell(get_people,"status","A")>
<cfset querySetCell(get_people,"dob","1945-02-22")>

<cfset queryAddRow(get_people)>
<cfset querySetCell(get_people,"id","5")>
<cfset querySetCell(get_people,"firstname","John")>
<cfset querySetCell(get_people,"lastname","Denver")>
<cfset querySetCell(get_people,"title","Singer")>
<cfset querySetCell(get_people,"status","A")>
<cfset querySetCell(get_people,"dob","1945-02-21")>

<cfset queryAddRow(get_people)>
<cfset querySetCell(get_people,"id","6")>
<cfset querySetCell(get_people,"firstname","Jimmy")>
<cfset querySetCell(get_people,"lastname","Dean")>
<cfset querySetCell(get_people,"title","Cook")>
<cfset querySetCell(get_people,"status","A")>
<cfset querySetCell(get_people,"dob","1945-02-12")>
