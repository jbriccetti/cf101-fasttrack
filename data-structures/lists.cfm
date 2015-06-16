<cfscript>
	data = "A,B,C";
	data = ListAppend(data,"D");
	data = listInsertAt(data,3,"C++");
	str = "WHERE CODE IN (#listQualify(data,"'")#)";
	// checkout the list functions here:
	// http://help.adobe.com/en_US/ColdFusion/9.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec1a60c-7ffc.html#WSc3ff6d0ea77859461172e0811cbec22c24-6a42
	converted = listToArray(data);
	writedump(variables);
</cfscript>

<cfloop list="#data#" delimiters="," index="i">
	<cfoutput>#i#</cfoutput><br>
</cfloop>
