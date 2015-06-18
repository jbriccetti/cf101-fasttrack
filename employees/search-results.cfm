<!--- validate parameters --->
<cfparam name="form.first_name" default="" />
<cfparam name="form.last_name" default="" />

<cfif NOT len(trim(form.last_name)) GTE 3>
	<cflocation addtoken="no" url="search.cfm?err=last_name" /> 
</cfif>

<!--- query the database using passed search terms --->
<cfquery name="q" datasource="#request.vars.dsn#" result="info">
	SELECT *  
  FROM employees 
	<!--- add where clause based on passed params --->
  WHERE first_name LIKE '#form.first_name#%'
  AND last_name LIKE '#form.last_name#%'
</cfquery>
<!--- did we get any hits? --->

<!--- if no, display "sorry dude" --->

<!--- if yes, display search results --->

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>cf101</title>
<cfinclude template="../includes/head.cfm" />
</head>

<body>
<cfinclude template="../includes/nav.cfm" />
<div class="container">
	<cfdump var="#form#" />
	<ol class="list-group">
	<cfoutput query="q" maxrows="100">
	<li class="list-group-item"><a href="details.cfm?emp_no=#q.emp_no#">#last_name#, #first_name#</a></li>
	</cfoutput>
  </ol>
  <cfdump var="#info#" />
</div>
</body>
</html>