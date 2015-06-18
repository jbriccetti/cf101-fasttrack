<cfcomponent accessors="true">
	<cfproperty name="items" type="array" hint="the items in the cart" />

  <cffunction name="init" output="true" access="public" returntype="any" hint="HINT">
		<cfset variables.items = [] />
		<cfreturn this />
	</cffunction>


	<!--- <cffunction name="getItems" access="public" returntype="array" >
		<cfreturn variables.items />
	</cffunction> --->



	<cffunction name="display" access="public" returntype="void">
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
		<cfreturn arrayDeleteAt(getItems(),which)/>
	</cffunction>


</cfcomponent>