<h2>CoreTable:</h2>
<p>The custom tag that creates a data table.</p>
<table cellspacing="0" class="innertable">
	<tr> 
        <th>Attribute</th>
        <th>Required?</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>template</td>
        <td>required</td>
        <td>If you are using cfmodule syntax. </td>
    </tr>
    <tr>
        <td>queryname</td>
        <td>required</td>
        <td>Use this tag to specify the name of the query that contains the data for the table.</td>
    </tr>
    <tr>
        <td>columnnames</td>
        <td>required</td>
        <td>Specify the names for the columns in the table. </td>
    </tr>
    <tr>
        <td>valuefield</td>
        <td>required</td>
        <td>Specify the names of the fieldnames contained in the Query that will be in the columns.</td>
    </tr>
    <tr>
        <td>includebottomspace</td>
        <td>optional </td>
        <td>Default is Yes. Provides a space below the table. </td>
    </tr>
    <tr>
        <td>addnavigation</td>
        <td>optional</td>
        <td>Default is No. Adds the navigation to the table allowing you to break up the output to multiple views. </td>
    </tr>
    <tr>
        <td>includesearch</td>
        <td>optional</td>
        <td>Default is No. Puts a search box at the top of the page. </td>
    </tr>
    <tr>
        <td>tablewidth</td>
        <td>optional</td>
        <td>Specifies the table width of the main table. If not specified it will be as wide as it needs to be.  Can be either pixels or percentage. </td>
    </tr>
    <tr>
        <td>editlinks</td>
        <td>optional</td>
        <td>Creates quick edit links to the table. </td>
    </tr>
    <tr>
        <td>linkurlvalues</td>
        <td>optional</td>
        <td>Specify the field name you need to add to the url. Required if you are using the <strong>Linkfields</strong> <strong>ActionLinks</strong>, or <strong>Editlinks</strong> </td>
    </tr>
    <tr>
        <td>totalrowsqueryname</td>
        <td>optional</td>
        <td>Use this tag to specify the query name of the query that generates a total record count.</td>
    </tr>
    <tr>
        <td>searchtablewidth</td>
        <td>optional</td>
        <td>Use this tag to specify the table width of the search box. If not specified it will be as wide as it needs to be. Can be either pixels or percentage. </td>
    </tr>
    <tr>
        <td>fieldsort</td>
        <td>optional</td>
        <td>Allows you to sort on the column. The number of elements in this has to match the number of columns specified in <strong>columnnames. </strong>(ex. &quot;Y,Y,N&quot;) </td>
    </tr>
    <tr>
        <td>linkfields</td>
        <td>optional</td>
        <td>Allows you to link from the element in this column to a different page. The number of elements in this has to match the number of columns specified in <strong>columnnames. </strong>(ex. &quot;Y,Y,N&quot;) </td>
    </tr>
    <tr>
        <td>linkurls</td>
        <td>optional</td>
        <td><p><strong>Required</strong> if you are using the <strong>Linkfields</strong>. Specify the URL of the page you are trying to link to. The number of elements in this has to match the number of columns specified in <strong>columnnames.</strong> (ex. &quot;Home.cfm,Index.cfm,About.cfm&quot;) </p>        </td>
    </tr>
    <tr>
        <td>actionlinks</td>
        <td>optional</td>
        <td>Use this to create any links in the last action column. Specify the URL's of the links you want to create. (ex &quot;home.cfm,about.cfm&quot;) </td>
    </tr>
    <tr>
        <td>actionlinknames</td>
        <td>optional</td>
        <td>Required if you are using the above Actionlinks. Specify the names of the links. If you specify &quot;delete&quot;, it will automatically insert the confirmation javascript. </td>
    </tr>
    <tr>
      <td>columnvalueformat</td>
      <td>optional</td>
      <td>Will format a field in the table. The only two formats available are 'Currency' and 'Date'. The number of elements in this has to match the number of columns specified in <strong>columnnames. </strong>(ex. &quot;N,N,Currency&quot;) </td>
    </tr>
</table>
<h2>Initial Setup:</h2>
<p>There is no initial setup unless you are using <strong>fieldsort,</strong> <strong>includesearch</strong> or <strong>addnavigation</strong>.</p>
<p>You just need to specify the <strong>queryname</strong>, <strong>columnnames</strong>, and <strong>valuefield</strong> to get a basic table. </p>
<p><strong>fieldsort: </strong></p>
<p> &lt;cfif isdefined('url.sort')&gt;<br />
#url.sort# #url.direction#<br />
&lt;cfelse&gt;<br />
fullname<br />
&lt;/cfif&gt;</p>
<p><strong>includesearch</strong> (include as many fields as you want to search) </p>
<p>&lt;cfif isdefined('url.search')&gt;<br />
Where <br />
&lt;cfloop list=&quot;#url.search#&quot; index=&quot;si&quot;&gt;<br />
lastname like '%#si#%' or firstname like '%#si#%' or email like '%#si#%'<br />
&lt;/cfloop&gt;<br />
&lt;/cfif&gt;</p>
<p><strong>addnavigation</strong></p>
<p>Include this within your main query at the bottom: &nbsp;&nbsp;&nbsp;&nbsp;Limit #cfstartpointx#,#navigationrows#</p>
<p>You need to have a separate query whose sole purpose is to get a total recordcount (include the name in the <strong>totalrowsqueryname</strong> attribute) </p>
<p>Iinclude this above the queries:</p>
<p>&lt;cfparam name=&quot;url.start&quot; default=&quot;1&quot;&gt;<br />
    &lt;cfset navigationrows = 3&gt;<br />
    &lt;cfset cfstartpointx = #url.start# - 1&gt;<br /> 
    <br />
    <br />
</p>
</body>
</html>

