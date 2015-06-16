<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>ColdFusion Queries</title>
</head>

<body>
<CFQUERY NAME="q" DATASOURCE="cfartgallery">
  SELECT *  
  FROM ARTISTS 
  JOIN ART ON ARTISTS.ARTISTID = ART.ARTISTID
  ORDER BY lastname, firstname, ARTISTS.ARTISTID
</CFQUERY>

<cfoutput query="q" group="lastname">
	<h1>#lastname#</h1>
  <cfoutput group="firstname">
		<h2>#firstname#</h2>
		<cfoutput>#artname#<br></cfoutput>
	</cfoutput>
</cfoutput>

<cfdump var="#q#" />
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