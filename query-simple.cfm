<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>ColdFusion Queries</title>
<cfinclude template="includes/head.cfm" />
</head>

<body>
<cfinclude template="includes/nav.cfm" />
<cfset cols = "ARTISTID,CITY,EMAIL,FIRSTNAME,LASTNAME,PHONE,POSTALCODE,STATE,THEPASSWORD" />
<CFQUERY NAME="q" DATASOURCE="cfartgallery">
  SELECT #variables.cols#
  FROM ARTISTS 
</CFQUERY>

<cfset ids = valueList(q.artistid) />
<cfoutput>#ids#</cfoutput> 
<br>

<table class="table table-striped table-condensed">
<cfoutput query="q">
  <tr>
  <cfloop list="#q.columnlist#" index="i">
  	<td>#q[i][q.currentrow]#</td>
  </cfloop>
	</tr>
</cfoutput>
</table>


<!--- option 1
<CFQUERY NAME="q" DATASOURCE="cfartgallery">
  SELECT * 
  FROM ARTISTS 
</CFQUERY>

<cfoutput query="q">
	<h1>#lastname# #firstname#</h1>
	<cfquery name="art" datasource="cfartgallery">
  	SELECT * from ART where artistid = #q.artistid#
  </cfquery>
	<cfdump var="#art#" />
</cfoutput> --->


</body>
</html>