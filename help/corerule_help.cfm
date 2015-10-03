<h2>corerule</h2>
<table cellspacing="0" class="innertable">
	<tr>
        <th>Attribute</th>
        <th>Required?</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>template</td>
        <td>required </td>
        <td>If you are using cfmodule syntax. </td>
    </tr>
    <tr>
        <td>rule</td>
        <td>required</td>
        <td>specify the rule you would need to generate an error. An example would be if you were verifying the user entered the same thing in two different text boxes (password verification when changing), you would specify &quot;password1 neq password2&quot;. If this were true it would generate an error. </td>
    </tr>
    <tr>
        <td>caption</td>
        <td>required</td>
        <td>The error message you want displayed when an error has been generated. </td>
    </tr>
</table>