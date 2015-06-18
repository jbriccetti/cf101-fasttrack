<cfcomponent extends="cf101.Application">
	<cffunction name="onRequestStart" access="public" returntype="boolean">
		<cfargument name="thePage" type="string" required="yes">
		<cfset super.onRequestStart(thePage) />
		<h1>dude im in the decendent class</h1>		

		<cfreturn true>
	</cffunction>

</cfcomponent>