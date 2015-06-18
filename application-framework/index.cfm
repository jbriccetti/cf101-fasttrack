<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>

<body>

<cfdump var="#session#" />

<!--- <cflock scope="server" type="exclusive" timeout="10">
  <cfquery name="server.artists" datasource="cfartgallery">
    SELECT * from artists

  </cfquery>
</cflock>


<cflock scope="server" type="readonly" timeout="10">
	<cfdump var="#server#" />
</cflock> --->

</body>
</html>