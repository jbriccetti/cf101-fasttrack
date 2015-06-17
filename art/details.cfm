<!--- check to make sure an artid parameter was passed on the url and is "valid". if not there or not valid, redirect user to the art list page (index.cfm)--->

<!--- use a query to select the art record using the art id --->

<!--- check if any records matched? if not, redirect user to the list view (index.cfm) --->

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
  
  <!--- bonus points if you display the artists name --->
  <!--- double bonus points if you display the media type  --->

</div>
</body>
</html>