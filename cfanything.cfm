<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Make anything Dynamic with CFM</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">
<!-- HTML COMMENT CREATED NOW: <cfoutput>#now()#</cfoutput>-->
<!--- CFML COMMENT --->

<!--- YOU CAN CREATE CSS INSTRUCTIONS --->
<cfset color = "Blue" />
<style>
	h1 {color:<cfoutput>#color#</cfoutput>}
</style>

<cfset name = "Jon" />
<!--- YOU CAN CREATE DYNAMIC JS CODE --->
<script>
	alert('<cfoutput>#name#</cfoutput>');
</script>

</head>

<body>



<!--- AND OF COURSE YOU CAN MAKE HTML CONTENT --->
<cfoutput><h1>#name#</h1></cfoutput> 
<h2>checkout uncle sam</h2>
<img src="img/unclesam.jpeg" width="650" height="780">


<!--- <cfdump var="#cgi#" /> --->


</body>
</html>