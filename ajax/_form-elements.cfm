
<ul>
	<li>
		<select id="artist" name="artist">
			<cfloop query="artists">
				<cfoutput><option value="#id#">#fname# #lname#</option></cfoutput>
			</cfloop>
		</select>
	</li>
	<li>
		<select id="art" name="art">
		</select>
	</li>
</ul>