<cfcomponent>
	<cffunction name="create" access="public" returntype="boolean">
		<cfargument name="data" type="struct" required="yes" />
		<cfquery name="local.q" datasource="cfartgallery">
    	<!--- INSERT INTO table_name (column1,column2,column3,...)
			VALUES (value1,value2,value3,...); --->
    	INSERT INTO art (artname,price)
      VALUES ('#data.artname#',#data.price#)
    </cfquery>

		<cfreturn true>
	</cffunction>

	<cffunction name="update" access="public" returntype="boolean">
		<cfargument name="data" type="struct" required="yes" />
		<cfquery name="local.q" datasource="cfartgallery">
    	<!--- UPDATE table_name
SET column1=value1,column2=value2,...
WHERE some_column=some_value; --->
    	UPDATE art 
      SET artname = '#data.artname#'
      ,price = #data.price#
      WHERE artid = #data.artid#
      
    </cfquery>

		<cfreturn true>
	</cffunction>

    <cffunction name="getByID" returntype="any">
      <cfargument name="id" required="yes">
      <cfargument name="returnas" required="no" default="struct">
      <cfquery name="local.result" datasource="cfartgallery">
        SELECT * FROM art 
        WHERE artid = <cfqueryparam cfsqltype="cf_sql_integer" value="#id#" />
 			</cfquery>     
      <cfif returnas EQ "struct">
				<cfset local.result = queryRowToSTruct(local.result) />

			</cfif>
    <cfreturn local.result />
    </cffunction>
    <cffunction name="deletebyid">
      <cfargument name="id" required="yes">
		  <cfquery datasource="cfartgallery">
	      DELETE FROM ART
        WHERE artid = <cfqueryparam cfsqltype="cf_sql_integer" value="#id#" />
      </cfquery>
      <cfreturn />
		</cffunction>

    
    
		<cfscript>
    /**
 * Makes a row of a query into a structure.
 * 
 * @param query 	 The query to work with. 
 * @param row 	 Row number to check. Defaults to row 1. 
 * @return Returns a structure. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, December 11, 2001 
 */
function queryRowToStruct(query){
	//by default, do this to the first row of the query
	var row = 1;
	//a var for looping
	var ii = 1;
	//the cols to loop over
	var cols = listToArray(query.columnList);
	//the struct to return
	var stReturn = structnew();
	//if there is a second argument, use that for the row number
	if(arrayLen(arguments) GT 1)
		row = arguments[2];
	//loop over the cols and build the struct from the query row	
	for(ii = 1; ii lte arraylen(cols); ii = ii + 1){
		stReturn[cols[ii]] = query[cols[ii]][row];
	}		
	//return the struct
	return stReturn;
}
    </cfscript>
 	</cfcomponent>