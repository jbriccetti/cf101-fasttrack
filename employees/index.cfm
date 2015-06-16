<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Employee List</title>
</head>

<body>
<cfinclude template="../includes/nav.cfm" />




<cfquery name="q" datasource="#dsn#">
	SELECT *  
  FROM employees 
  ORDER BY LAST_NAME,FIRST_NAME ASC
  LIMIT 100
</cfquery>

<ol>
<cfoutput query="q">
	<li>
  	<a href="details.cfm?emp_no=#emp_no#">
	    #last_name#, #first_name#
  	</a>
  </li>
</cfoutput>
</ol>



</body>
</html>