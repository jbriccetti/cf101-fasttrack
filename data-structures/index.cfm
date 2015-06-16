<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Basic Data Structures</title>
<cfinclude template="../includes/head.cfm" />
</head>

<body>
<cfinclude template="../includes/nav.cfm" />
<cfparam name="url.show" default="" />
<cfset examples = "lists,arrays,structures,queries" />
<cfif NOT listFindNoCase(examples,url.show)>
	<cfset url.show = "" />
</cfif>
<cfif len(trim(url.show)) GT 0>
	<cftry>
		<cfinclude template="#url.show#.cfm" />
		<cfcatch>
    	<cfif cfcatch.Message CONTAINS "Could not find the included template">
				<cffile action="write" file="#expandPath('./')##url.show#.cfm" output="file created #now()#" />
        <cfinclude template="#url.show#.cfm" />
			</cfif>	
    </cfcatch>
  </cftry>
<cfelse>
  <ul>
    <cfloop list="#examples#" index="i">
	    <cfoutput>
      	<li><a href="index.cfm?show=#i#">#i#</a></li>
			</cfoutput>
    </cfloop>
  </ul>
	<cfscript>
    name = "Jon";
    age = 47;
    dob = createDate(1967,10,1);
    isAwesome = true;
    writeDump(variables,"simple data type examples");
  </cfscript>

</cfif>


</body>
</html>