<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
</head>

<body>
<cfscript>
	strLib = createObject("component","string");
</cfscript>

<cfoutput>#strLib.breadcrumb()#</cfoutput>

<cfdump var="#strLib#" /> 

<cfset inputString = "This is a string that has a URL in it, http://www.cflib.org/ so we want that URL to be a link">

<cfinvoke component="#strlib#" method="activateURL" returnvariable="newstring">
	<cfinvokeargument name="string" value="#inputString#" />
</cfinvoke>
<cfoutput>#newString#</cfoutput>

<cfoutput>#strLib.ActivateURL(inputString)#</cfoutput>

<cfoutput>
  #strLib.calcNewSalary(20000)#<br>
  #strLib.calcNewSalary(20000,1.05)#<br>
  #strLib.calcNewSalary(currentpay=20000)#<br>
  #strLib.calcNewSalary(currentpay=20000,rate=1.3)#<br>
</cfoutput>

</body>
</html>