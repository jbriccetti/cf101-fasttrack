<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Employee List</title>
<cfinclude template="../includes/head.cfm" />
</head>

<body>
<cfinclude template="../includes/nav.cfm" />




<cfquery name="q" datasource="#dsn#">
	SELECT EMP_NO,FIRST_NAME,GENDER,HIRE_DATE,LAST_NAME,BIRTH_DATE
  FROM employees 
  ORDER BY LAST_NAME,FIRST_NAME ASC
  LIMIT 100
</cfquery>
<cfoutput>#q.columnlist#</cfoutput>

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