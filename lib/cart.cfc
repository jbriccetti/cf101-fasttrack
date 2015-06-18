<cfcomponent accessors="true">
	<cfproperty name="items" type="array" hint="the items in the cart" />
	<cfproperty name="name" type="string" hint="credits" />
  
  <cffunction name="init" output="true" access="public" returntype="any" hint="HINT">
		<cfset variables.items = [] />
		<cfset variables.name = "jon's awesome cart object" />
		<cfreturn this />
	</cffunction>


	<!--- <cffunction name="getItems" access="public" returntype="array" >
		<cfreturn variables.items />
	</cffunction> --->
<cffunction name="setname">
	<cfargument name="newname" type="string" required="yes">
	<cfif newname DOES NOT CONTAIN "len">
		<cfset variables.name = newname />
	</cfif>
</cffunction>


	<cffunction name="display" access="public" returntype="void">
  	<h2><cfoutput>#variables.name#</cfoutput></h2>
		<cfdump var="#items#" />
		<cfreturn >
	</cffunction>
	
	<cffunction name="add" output="false" access="public" returntype="void" hint="HINT">
		<cfargument name="what" type="any" required="yes" hint="something to stick int he cart" />
		<cfif arraylen(items) LT 10>
			<cfset arrayAppend(getItems(),what) />
		</cfif>		
		<cfreturn />
	</cffunction>

	<cffunction name="delete" output="false" access="public" returntype="any" hint="HINT">
		<cfargument name="which" type="numeric" required="yes" hint="the item in the cart to erase (by index)" />
		<cfreturn arrayDeleteAt(getitems(),which)/>
	</cffunction>


</cfcomponent>