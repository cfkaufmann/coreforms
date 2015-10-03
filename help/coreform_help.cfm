<h2>coreform:</h2>
<p>The custom tag wrapped around everything. </p>
<table cellspacing="0" class="innertable">
	<tr>
        <th>Attribute</th>
        <th>Required?</th>
        <th>Description</th>
    </tr>
	<tr>
        <td>formname</td>
        <td>required</td>
        <td>name of form </td>
    </tr>
    <tr>
        <td>template</td>
        <td>required</td>
        <td>If you are using cfmodule syntax. </td>
    </tr>
    <tr>
        <td>maketable</td>
        <td>optional</td>
        <td>defaulted to No (N), select Yes (Y) if you want the tag to automatically generate a table for your form. </td>
    </tr>
    <tr>
        <td>debug</td>
        <td>optional</td>
        <td>defaulted to No (N). Select if you want debuging information shown at the bottom of the form. </td>
    </tr>
    <tr>
        <td>queryinput</td>
        <td>optional </td>
        <td>Use this tag if you want to automatically insert values into your fields, like if you wanted to edit an existing record. It would be the name of the Query called on the page. </td>
    </tr>
    <tr>
        <td>allowfile</td>
        <td>optional</td>
        <td>Use this tag if you are going to do file uploads. It adds the attribute 'enctype=&quot;multipart/form-data&quot;' to the form tag. </td>
    </tr>
    <tr>
      <td>wysiwygeditor</td>
      <td>optional</td>
      <td>Use this tag if you want to convert all of your textarea fields into WYSIWYG fields. This pulls <a href="http://tinymce.moxiecode.com/">TinyMCE</a> onto your forms. If you want to change the buttons that <a href="http://tinymce.moxiecode.com/">TinyMCE</a> shows, you have to change the config files of <a href="http://tinymce.moxiecode.com/">TinyMCE</a>.</td>
    </tr>
</table>