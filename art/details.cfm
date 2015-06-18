<!--- check to make sure an artid parameter was passed on the url and is "valid". if not there or not valid, redirect user to the art list page (index.cfm)--->
<Cfparam name="url.artid" default="0" />
<!--- use a query to select the art record using the art id --->
<cfquery name="qdetails" datasource="cfartgallery">
SELECT a.artname,a.description,ar.lastname,a.price, m.mediatype
from ART a 
JOIN artists ar ON (a.artistid = ar.artistid)
JOIN media m ON (a.mediaid = m.mediaid)
WHERE artid = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.artid#" />
</cfquery>

<!--- check if any records matched? if not, redirect user to the list view (index.cfm) --->
<cfif NOT qdetails.recordcount>
	<cflocation addtoken="no" url="index.cfm" />
</cfif>
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
	<!--- output the results of the search query. --->	
  <!--- for each item list the artname, the description and the price and if it is sold or not --->
	<cfoutput>
		<cfloop list="#qdetails.columnlist#" index="i">
    	#i#:#qdetails[i][1]#<br>
    </cfloop>
	</cfoutput>
  <cfdump var="#qdetails#" />
  <!--- bonus points if you display the artists name --->
  <!--- double bonus points if you display the media type  --->

</div>
</body>
</html>