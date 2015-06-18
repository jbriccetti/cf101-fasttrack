<cfscript>
	cars = ArrayNew(1);
	cars[1] = "chevy";
	arrayAppend(cars,"pontiac");
	arrayAppend(cars,"buick");
	arrayAppend(cars,"oldsmobile");
	arrayAppend(cars,"ford");
	arrayAppend(cars,"dodge");
	
	writedump(cars);
</cfscript>

<cfloop from="1" to="#arraylen(cars)#" index="i">
	<cfoutput>for #i#th item in the array is: #cars[i]#</cfoutput><br>
</cfloop>

<cfloop array="#cars#" index="i">
	<cfoutput>#i#</cfoutput><br>
</cfloop>