<cfcomponent>

	<cffunction name="getart" access="remote" returntype="array" returnformat="json">
		<cfargument name="artistid" type="numeric" required="yes">
		<cfscript>
			local["result"]=[];
		</cfscript>
		<cfquery name="local.tmp" datasource="cfartgallery">
			SELECT artname as name,artid as id, largeimage as src, description from art
			WHERE artistid = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.artistid#" />
		</cfquery>
		<cfloop query="local.tmp">
			<cfset arrayAppend(local.result,queryRowToStruct(local.tmp,currentrow)) />
		</cfloop>

		<cfreturn result />
	</cffunction>


<cffunction name="queryRowToStruct" returntype="struct" hint="pass me a query and a row specification and i'll slice it up into a struct">
	<cfargument name="query" type="query" required="yes" hint="the reference to the query object you want me to grab the row from" />
	<cfargument name="row" default="1" required="no" hint="the row you want me to grab the data from" />
	<cfset local.cols = listToArray(query.columnlist) />
	<cfset local.stReturn = structNew() />
	<cfscript>
	for(local.ii = 1; ii lte arraylen(cols); ii = ii + 1){
		stReturn[cols[ii]] = arguments.query[cols[ii]][row];
	}		
	</cfscript>	
	<cfreturn stReturn />		
</cffunction>

</cfcomponent>