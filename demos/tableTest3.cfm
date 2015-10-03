
<!--- SET ALL THE DEFAULTS --->
<cfobject name="artgallery" component="artgallery">
<cfparam name="url.sort" default="">
<cfparam name="url.direction" default="asc">
<cfparam name="url.search" default="">

<cfparam name="url.start" default="1">
<cfset navigationrows = 5>
<cfset cfstartpointx = #url.start# - 1>

<!--- QUERY THE DATABASE --->
<cfinvoke
   component = "#artgallery#"
   method = "getArt"
   returnVariable = "getArt">
   <cfinvokeargument name="sort" value="#url.sort#">
   <cfinvokeargument name="direction" value="#url.direction#">
   <cfinvokeargument name="search" value="#url.search#">
   <cfinvokeargument name="navigationrows" value="#navigationrows#">
   <cfinvokeargument name="cfstartpointx" value="#cfstartpointx#">
</cfinvoke>
<!--- GET THE TOTAL NUMBER OF RECORDS --->
<cfinvoke
   component = "#artgallery#"
   method = "getArtTotal"
   returnVariable = "totalQry">
   <cfinvokeargument name="search" value="#url.search#">
   </cfinvoke>
   
<h2>A List of People</h2>
<h3>Requires the CFartgallery datasource</h3>

<!--- MAKE THE TABLE --->
<cfmodule template="#coretable#"
	queryname="getArt"
	columnnames="Name,Price,Description,Artist,Date"
	valuefield="artname,price,description,artist,listingdate" 
	fieldsort="Y,Y,Y,N,Y"
	includesearch="Y"
	addnavigation="Y"
	totalrowsqueryname="totalQry"
	tablewidth="600"
	columnvalueformat="N,Currency,N,N,Date"
	columnPercentWidths="25,20,15,20,20"
	>
	

	<fieldset>
	<legend>Code:</legend>
	<p>&lt;!--- SET ALL THE DEFAULTS ---&gt;<br />
	  &lt;cfobject name=&quot;artgallery&quot; component=&quot;artgallery&quot;&gt;<br />
	  &lt;cfparam name=&quot;url.sort&quot; default=&quot;&quot;&gt;<br />
	  &lt;cfparam name=&quot;url.direction&quot; default=&quot;asc&quot;&gt;<br />
    &lt;cfparam name=&quot;url.search&quot; default=&quot;&quot;&gt;</p>
	<p>&lt;cfparam name=&quot;url.start&quot; default=&quot;1&quot;&gt;<br />
	  &lt;cfset navigationrows = 5&gt;<br />
	  &lt;cfset cfstartpointx = #url.start# - 1&gt;</p>
	<p>&lt;!--- QUERY THE DATABASE ---&gt;<br />
	  &lt;cfinvoke<br />
	  &nbsp;&nbsp;component = &quot;#artgallery#&quot;<br />
	  &nbsp;&nbsp;method = &quot;getArt&quot;<br />
	  &nbsp;&nbsp;returnVariable = &quot;getArt&quot;&gt;<br />
  &lt;cfinvokeargument name=&quot;sort&quot; value=&quot;#url.sort#&quot;&gt;<br />
  &lt;cfinvokeargument name=&quot;direction&quot; value=&quot;#url.direction#&quot;&gt;<br />
  &lt;cfinvokeargument name=&quot;search&quot; value=&quot;#url.search#&quot;&gt;<br />
  &lt;cfinvokeargument name=&quot;navigationrows&quot; value=&quot;#navigationrows#&quot;&gt;<br />
  &lt;cfinvokeargument name=&quot;cfstartpointx&quot; value=&quot;#cfstartpointx#&quot;&gt;<br />
  &lt;/cfinvoke&gt;</p>
	<p><br />
  &lt;!--- GET THE TOTAL NUMBER OF RECORDS ---&gt;<br />
  &lt;cfinvoke<br />
	  &nbsp;&nbsp;component = &quot;#artgallery#&quot;<br />
	  &nbsp;&nbsp;method = &quot;getArtTotal&quot;<br />
	  &nbsp;&nbsp;returnVariable = &quot;totalQry&quot; /&gt;<br />
	  <br />
  &lt;h2&gt;A List of People&lt;/h2&gt;<br />
  &lt;h3&gt;Requires the CFartgallery datasource&lt;/h3&gt;</p>
	<p>&lt;!--- MAKE THE TABLE ---&gt;<br />
	  &lt;cfmodule template=&quot;#coretable#&quot;<br />
queryname=&quot;getArt&quot;<br />
columnnames=&quot;Name,Price,Description,Artist,Date&quot;<br />
valuefield=&quot;artname,price,description,artist,listingdate&quot; <br />
fieldsort=&quot;Y,Y,Y,N,Y&quot;<br />
includesearch=&quot;Y&quot;<br />
addnavigation=&quot;Y&quot;<br />
totalrowsqueryname=&quot;totalQry&quot;<br />
tablewidth=&quot;600&quot;<br />
columnvalueformat=&quot;N,Currency,N,N,Date&quot;<br />
columnPercentWidths=&quot;25,20,15,20,20&quot;<br />
&gt;<br />
	</p>
	</fieldset>
	
<cfdump var="#getart#">	
