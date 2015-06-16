<cfscript>
	data = queryNew("id,first_name,last_name","integer,varchar,varchar");
	queryAddRow(data);
	querySetCell(data,"id","1");
	querySetCell(data,"first_name","jon");
	querySetCell(data,"last_name","briccetti");
	
	writeDump(data);
</cfscript>


<!--- places you might wind up with "query" data (besides <cfquery> --->
<cfhttp url="http://localhost:8500/cf101/data-structures/data.txt" name="data" />
<cfdump var="#data#" />

<cfdirectory action="list" name="files" directory="#expandpath('../')#" recurse="no" />
<cfdump var="#files#" />

<cfquery name="filtered" dbtype="query">
	SELECT * from files
  WHERE type = 'Dir'
  ORDER BY name DESC
</cfquery>
<cfdump var="#filtered#" />


<cfdump var="#files#" />

