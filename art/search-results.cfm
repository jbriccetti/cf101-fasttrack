<!--- validate the input parameters --->
<cfparam name="form.artname" default="" />
<cfparam name="form.price" default="" />

<cfif NOT isnumeric(form.price)>
	<cfset form.price = "" />
</cfif>

<cfquery name="results" datasource="cfartgallery" result="info">
SELECT *
FROM art
WHERE 1=1
<cfif LEN (TRIM(form.artname)) GT 0>
	AND artname LIKE '#form.artname#%'
</cfif>

<cfif isNumeric(form.price)>
	AND price <= #form.price#
</cfif>

<cfif NOT isDefined("form.issold")>
	AND isSold = 0
</cfif>

</cfquery>


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
  <cfdump var="#results#" />
  <cfdump var="#info#" />

</div>
</body>
</html>