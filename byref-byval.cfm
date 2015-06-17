<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>

<body>
<cfscript>
	data = {id=4,name="jon"};
	data2 = data;
	data2.name = "ed";
writedump(variables);
</cfscript>
</body>
</html>