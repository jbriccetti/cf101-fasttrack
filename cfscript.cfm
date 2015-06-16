<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Using CF Script</title>
</head>

<body>
<!--- cfscript, writeoutput(), variables scope, basic if statement --->

<cfset name = "Jon" />
<cfscript>
	age = "27";
	writeoutput("send this out to the page please<br>");
	  
	if(age < 40){
		// something
		writeoutput(name & " you are a giant liar");
	}else{
		// something else
		writeoutput("finally, someone who tells the truth");
	}
</cfscript>
<cfdump var="#variables#" />

<cfif age LT 40 >
	You are a giant liar
<cfelse>
	Finally someone who tells the truth
</cfif>

<cfoutput>#variables.name#</cfoutput>




</body>
</html>