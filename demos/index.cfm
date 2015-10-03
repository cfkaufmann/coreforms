<h1>Welcome to the coreForms demo</h1>
<h2>Examples:</h2>
<p>Please select the links below to view the functionality and see the code.</p>

<ul> 
	<li><a href="testform.cfm">Test Form 1</a></li>
	
	<li><a href="testform2.cfm">Test Form 2</a></li>
	<li><a href="testform3.cfm">Test Form 3</a></li>
    <li><a href="testform4.cfm">Test Form 4</a> this simple form shows the built in support of <a href="http://tinymce.moxiecode.com/">TinyMCE</a>.</li>
  	<li><a href="password.cfm">Test Password Form</a></li>
    <li><a href="tableTest1.cfm">Table Test 1</a></li>
	<li><a href="tableTest2.cfm">Table Test 2</a> (with field sort)</li>
	<li><a href="tableTest3.cfm">Table Test 3</a> This has all the features available but also requires a test datasource configured to run it. You can not use the default installed Apache Derby database (Adobe Coldfusion 8) because it does not support the limit function.</li>
</ul>
[<a href="../help/index.cfm">Core Form and Field Help</a>] <br />
[<a href="../help/index.cfm">Core Table Help</a>] 
<h2>Format Focus</h2>
<ul>
	<li><a href="likert.cfm">likert</li>
	<li><a href="time.cfm">time</a></li>
	<li><a href="Countries.cfm">countries</a></li>
	<li><a href="USState.cfm">US States</a></li>
</ul>
<h2>Quick Install:</h2>
<p>Unzip the files to the root of your webserver.  Open up "coreformIncludes.cfm" and modify the &lt;cfset coreFormBasePath = "/coreform/"> 
to whatever path you unzipped the files to. Then in your Application.cfm or cfc file that controls the area you want to use the forms in, insert the following code.</p>
<p> &lt;cfset coreformstyle = "SkyBlue"&gt; &lt;!--- OrangeBreeze, SkyBlue ---&gt;<br>
&lt;cfinclude template="/coreforms/coreFormIncludes.cfm"&gt;</p>
<p>The first line is optional. There is a default skin that is applied if none is specified. </p>
<h2>Credits:</h2>
<p>The help message mouseover popup was created by Oliver Bryant and can be found at <a href="http://boxover.swazz.org/">this site</a>.<br />
  The calendar was created by Mihai Bazon at <a href="http://www.dynarch.com/projects/calendar/">Dynarch.com</a>.<br />
<a href="http://tinymce.moxiecode.com/">TinyMCE</a> is created by <a href="http://www.moxiecode.com/">Moxiecode</a> systems.</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
